using AutoMapper;
using GoodFoodAPI.Common;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using GoodFoodAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class NguoiDungController : ControllerBase
    {
        private readonly INguoiDungService _nguoiDungService;
        private readonly IThongBaoService _thongBaoService;
        private readonly IMapper _mapper;
        public NguoiDungController(INguoiDungService nguoiDungService,
                                   IMapper mapper,
                                   IThongBaoService thongBaoService)
        {
            _nguoiDungService = nguoiDungService;
            _thongBaoService = thongBaoService;
            _mapper = mapper;
        }

        [HttpPost("SetUserTags")]
        [Authorize(Roles = "0,1")]
        public IActionResult SetUserTag(List<int> tags)
        {
            try
            {
                var user = UserHelper.GetCurrentUser(this.HttpContext);
                _nguoiDungService.SetUserTags(user!.Id, tags);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{IdNguoiDung}")]
        [Authorize(Roles = "0,1,2")]
        public IActionResult GetNguoiDung(int IdNguoiDung)
        {
            return Ok(_mapper.Map<NguoiDungDTO>(_nguoiDungService.Get(IdNguoiDung)));
        }

        [HttpPut("SignOut")]
        [Authorize(Roles = "0,1,2")]
        public IActionResult UserSignOut(string deviceToken)
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext);
            return Ok(_nguoiDungService.SignOut(user!.Id, deviceToken));
        }

        [AllowAnonymous]
        [HttpGet("SignIn")]
        public NguoiDungDTO? SignIn(UserLoginDTO userLogin)
        {
            return _nguoiDungService.SignIn(userLogin);
        }

        [AllowAnonymous]
        [HttpPost("SignUp")]
        public bool SignUp(UserLoginDTO userLogin)
        {
            return _nguoiDungService.SignUp(userLogin);
        }

        [AllowAnonymous]
        [HttpGet("IsLoggedIn")]
        public bool IsLoggedIn()
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext);
            return _nguoiDungService.IsLoggedIn(user);
        }

        [Authorize(Roles = "0,1,2")]
        [HttpGet]
        public IActionResult GetUser()
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext);
            var getUser = _nguoiDungService.Get(user!.Id);
            var userDTO = new NguoiDungDTO
            {
                Id = getUser.Id,
                HoVaTen = getUser.HoVaTen ?? string.Empty,
                SoDienThoai = getUser.SoDienThoai,
                NgaySinh = getUser.NgaySinh,
                GioiTinh = getUser.GioiTinh,
                IdHinhAnh = getUser.IdHinhAnh ?? 0,
                Email = getUser.Email ?? string.Empty,
                LoaiNguoiDung = getUser.LoaiNguoiDung,
                SetTag = getUser.SetTag,
                Token = ""
            };
            return Ok(userDTO);

        }

        [Authorize(Roles = "0,1,2")]
        [HttpPut("Update")]
        public bool UpdateUser(NguoiDungDTO userDTO)
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext);
            return _nguoiDungService.UpdateUser(user!.Id, userDTO);
        }

        [Authorize(Roles = "0,1,2")]
        [HttpGet("Statistics/{userId}")]
        public UserStatisticsDTO GetUserStatisicsByUserId(int userId)
        {
            return _nguoiDungService.GetUserStatistics(userId);
        }

        [Authorize(Roles = "0,1,2")]
        [HttpGet("IsFollowing/{userId}")]
        public bool CheckIsFollowing(int userId)
        {
            var user = UserHelper.GetCurrentUser(HttpContext);
            return _nguoiDungService.CheckIsFollowing(user!.Id, userId);
        }

        [Authorize(Roles = "0,1")]
        [HttpPost("Follow/{userId}")]
        public bool Follow(int userId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;

            string? notiMessage;
            if (!currentUser.HoVaTen.IsNullOrEmpty())
            {
                notiMessage = $"{currentUser.HoVaTen} đã theo dõi bạn";
            }
            else
            {
                notiMessage = $"user{currentUser.Id} đã theo dõi bạn";
            }

            var notification = new ThongBao()
            {
                IdNguoiDung = userId,
                LoaiThongBao = ((int)LoaiThongBao.Follow),
                NoiDung = notiMessage,
                ThoiGian = DateTime.Now,
                UserId = currentUser.Id,
            };

            _thongBaoService.PushNotification(notification, userId: currentUser.Id);
            return _nguoiDungService.Follow(currentUser!.Id, userId);
        }

        [Authorize(Roles = "0,1")]
        [HttpPost("Unfollow/{userId}")]
        public bool Unfollow(int userId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext);
            return _nguoiDungService.Unfollow(currentUser!.Id, userId);
        }

        [HttpGet("Search")]
        [Authorize(Roles = "0,1")]
        public async Task<List<NguoiDungDTO>> SearchUser(string keyword)
        {
            return _mapper.Map<List<NguoiDungDTO>>(await _nguoiDungService.SearchUser(keyword));
        }

        [HttpPost("ChangePassword")]
        [Authorize(Roles = "0,1,2")]
        public bool ChangePassword(ChangePasswordDTO password)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            return _nguoiDungService.ChangePassword(currentUser.Id, password);
        }
    }
}
