using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace GoodFoodAPI.Services.Implements
{
    public class NguoiDungService : BaseService<NguoiDung>, INguoiDungService
    {
        private readonly IConfiguration _configuration;
        private readonly INguoiDungRepository _nguoiDungRepository;
        private readonly IDuLieuDeXuatRepository _duLieuDeXuatRepository;
        private readonly IDeviceTokenRepository _deviceTokenRepository;
        const int iterations = 3;

        public NguoiDungService(
            IDuLieuDeXuatRepository duLieuDeXuatRepository,
            INguoiDungRepository repository,
            IConfiguration configuration,
            INguoiDungRepository nguoiDungRepository,
            IDeviceTokenRepository deviceTokenRepository) : base(repository)
        {
            _configuration = configuration;
            _nguoiDungRepository = nguoiDungRepository;
            _duLieuDeXuatRepository = duLieuDeXuatRepository;
            _deviceTokenRepository = deviceTokenRepository;
        }

        public async Task<List<NguoiDung>> SearchUser(string keyword)
        {
            var users = await _nguoiDungRepository.GetAll()
                .Where(x => x.HoVaTen.Contains(keyword)
                            || x.TenDangNhap.Contains(keyword)
                            || x.Id.ToString().Contains(keyword))
                .ToListAsync();
            return users;
        }

        public void SetUserTags(int userId, List<int> tags)
        {
            var user = _nguoiDungRepository.Get(userId) ?? throw new Exception("Invalid user");
            foreach (var tag in tags)
            {
                _duLieuDeXuatRepository.Add(new DuLieuDeXuat
                {
                    IdNguoiDung = userId,
                    IdTheLoai = tag,
                    MocThoiGian = DateTime.Now.ToString()
                });
            }
            user.SetTag = true;
            _nguoiDungRepository.Update(user);
            _nguoiDungRepository.SaveChange();
            _duLieuDeXuatRepository.SaveChange();
        }

        public bool SignUp(UserLoginDTO userLogin)
        {
            var checkuser = _nguoiDungRepository.GetAll()
                                          .FirstOrDefault(u => u.TenDangNhap == userLogin.Username
                                                               && u.LoaiNguoiDung == userLogin.Role);
            if (checkuser != null)
            {
                return false;
            }
            var user = new NguoiDung
            {
                TenDangNhap = userLogin.Username,
                Salt = PasswordHelper.GenerateSalt(),
                LoaiNguoiDung = userLogin.Role
            };
            user.MatKhau = PasswordHelper.ComputeHash(userLogin.Password,
                                                      Convert.ToBase64String(user.Salt),
                                                      iterations);
            _nguoiDungRepository.Add(user);
            _nguoiDungRepository.SaveChange();
            return true;
        }

        public NguoiDungDTO? SignIn(UserLoginDTO userLogin)
        {
            var user = Authenticate(userLogin);
            try
            {
                if (user != null)
                {
                    var token = Generate(user);
                    user.DangNhap = true;
                    user.DeviceTokens.Add(new DeviceToken
                    {
                        Token = userLogin.DeviceToken,
                        User = user
                    });
                    _nguoiDungRepository.Update(user);
                    _nguoiDungRepository.SaveChange();
                    return new NguoiDungDTO
                    {
                        Id = user.Id,
                        GioiTinh = user.GioiTinh,
                        NgaySinh = user.NgaySinh,
                        SoDienThoai = user.SoDienThoai,
                        HoVaTen = user.HoVaTen ?? string.Empty,
                        Email = user.Email ?? string.Empty,
                        IdHinhAnh = user.IdHinhAnh ?? 0,
                        LoaiNguoiDung = user.LoaiNguoiDung,
                        SetTag = user.SetTag,
                        Token = token,
                    };
                }
                return null;
            }
            catch
            {
                throw;
            }
        }

        public string SignOut(int userId, string deviceToken)
        {
            var nguoiDung = _nguoiDungRepository.GetAll()
                .Include(x => x.DeviceTokens)
                .Single(x => x.Id.Equals(userId));
            if (nguoiDung != null)
            {
                nguoiDung.DangNhap = false;
                var devices = nguoiDung.DeviceTokens.Where(x => x.UserId.Equals(userId)
                && x.Token.Equals(deviceToken))
                    .ToArray();
                if (devices != null)
                {
                    _deviceTokenRepository.Delete(devices);
                    _deviceTokenRepository.SaveChange();
                    foreach (var device in devices)
                    {
                        nguoiDung.DeviceTokens.Remove(device);
                    }
                }
                _nguoiDungRepository.Update(nguoiDung);
                _nguoiDungRepository.SaveChange();
                return "Sign out successfully";
            }
            return "User has not logged in";
        }

        public bool IsLoggedIn(NguoiDungDTO? nguoiDung)
        {
            if (nguoiDung == null)
            {
                return false;
            }

            var queryUser = _nguoiDungRepository.GetAll()
                                          .FirstOrDefault(u => u.Id == nguoiDung.Id
                                                               && u.LoaiNguoiDung == nguoiDung.LoaiNguoiDung);
            if (queryUser != null)
            {
                return queryUser.DangNhap ?? false;
            }
            return false;
        }

        public bool UpdateUser(int userId, NguoiDungDTO nguoiDung)
        {
            var user = _nguoiDungRepository.Get(userId);
            user.HoVaTen = nguoiDung.HoVaTen;
            user.SoDienThoai = nguoiDung.SoDienThoai;
            user.NgaySinh = nguoiDung.NgaySinh;
            user.Email = nguoiDung.Email;
            user.GioiTinh = nguoiDung.GioiTinh;
            user.IdHinhAnh = nguoiDung.IdHinhAnh;
            try
            {
                _nguoiDungRepository.Update(user);
                _nguoiDungRepository.SaveChange();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public UserStatisticsDTO GetUserStatistics(int userId)
        {
            var user = _nguoiDungRepository.GetAll()
                .Include(x => x.IdNguoiDungTheoDois)
                .Include(x => x.IdNguoiDungDuocTheoDois)
                .Include(x => x.BaiViets)
                .Single(x => x.Id.Equals(userId));
            UserStatisticsDTO userStatistics = new()
            {
                UserId = userId,
                Following = user.IdNguoiDungDuocTheoDois.Count,
                Followed = user.IdNguoiDungTheoDois.Count,
                PostCount = user.BaiViets.Count,
            };
            return userStatistics;
        }

        public bool CheckIsFollowing(int currentUserId, int userId)
        {
            var currentUser = _nguoiDungRepository.GetAll()
                .Include(x => x.IdNguoiDungDuocTheoDois)
                .Single(x => x.Id.Equals(currentUserId));
            return currentUser.IdNguoiDungDuocTheoDois.Any(x => x.Id.Equals(userId));
        }

        public bool Follow(int currentUserId, int userId)
        {
            try
            {
                var currentUser = _nguoiDungRepository.GetAll()
                    .Include(x => x.IdNguoiDungDuocTheoDois)
                    .Single(x => x.Id.Equals(currentUserId));
                var user = _nguoiDungRepository.Get(userId);
                currentUser.IdNguoiDungDuocTheoDois.Add(user);
                _nguoiDungRepository.Update(currentUser);
                _nguoiDungRepository.SaveChange();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Unfollow(int currentUserId, int userId)
        {
            try
            {
                var currentUser = _nguoiDungRepository.GetAll()
                    .Include(x => x.IdNguoiDungDuocTheoDois)
                    .Single(x => x.Id.Equals(currentUserId));
                var user = _nguoiDungRepository.Get(userId);
                currentUser.IdNguoiDungDuocTheoDois.Remove(user);
                _nguoiDungRepository.Update(currentUser);
                _nguoiDungRepository.SaveChange();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        private string Generate(NguoiDung user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]!));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(ClaimTypes.Name,user.HoVaTen??string.Empty),
                new Claim(ClaimTypes.Email,user.Email??string.Empty),
                new Claim(ClaimTypes.Role,user.LoaiNguoiDung.ToString())
            };
            var token = new JwtSecurityToken(_configuration["Jwt:Issuer"],
                                             _configuration["Jwt:Audience"],
                                             claims,
                                             expires: DateTime.Now.AddDays(60),
                                             signingCredentials: credentials);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        public bool ChangePassword(int userId, ChangePasswordDTO password)
        {
            var user = _nguoiDungRepository.Get(userId);
            if (user == null)
            {
                return false;
            }
            if (user.MatKhau != PasswordHelper.ComputeHash(password.CurrentPassword,
                                          Convert.ToBase64String(user.Salt!),
                                          iterations))
            {
                return false;
            }
            var newSalt = PasswordHelper.GenerateSalt();
            var newPassword = PasswordHelper.ComputeHash(password.NewPassword,
                                                         Convert.ToBase64String(newSalt),
                                                         iterations);
            user.MatKhau = newPassword;
            user.Salt = newSalt;
            _nguoiDungRepository.Update(user);
            _nguoiDungRepository.SaveChange();
            return true;
        }


        private NguoiDung? Authenticate(UserLoginDTO userLogin)
        {
            var user = _nguoiDungRepository.GetAll()
                                           .FirstOrDefault(u => u.TenDangNhap == userLogin.Username
                                                                && u.LoaiNguoiDung == userLogin.Role);
            if (user == null)
            {
                throw new Exception("Username or password did not match");
            }
            //else if (user.DangNhap != null && user.DangNhap == true)
            //{
            //    throw new Exception("User already logged in");
            //}
            else
            {
                var pw = PasswordHelper.ComputeHash(userLogin.Password,
                                          Convert.ToBase64String(user.Salt!),
                                          iterations);
                if (user.MatKhau != pw)
                {
                    throw new Exception("Username or password did not match");
                }
            }
            return user;
        }
    }
}
