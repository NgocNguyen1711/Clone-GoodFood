using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Controllers
{
    [ApiController]
    [Route("/[controller]")]
    public class DanhSachYeuThichController : ControllerBase
    {
        private readonly IDanhSachYeuThichRepository _danhSachYeuThichRepository;
        private readonly IBaiVietRepository _baiVietRepository;
        private readonly IQuanAnRepository _quanAnRepository;
        private readonly IMapper _mapper;

        public DanhSachYeuThichController(IDanhSachYeuThichRepository danhSachYeuThichRepository,
                                          IBaiVietRepository baiVietRepository,
                                          IQuanAnRepository quanAnRepository,
                                          IMapper mapper)
        {
            _danhSachYeuThichRepository = danhSachYeuThichRepository;
            _baiVietRepository = baiVietRepository;
            _quanAnRepository = quanAnRepository;
            _mapper = mapper;
        }

        [HttpGet]
        [Authorize(Roles = "0,1")]
        public DanhSachYeuThichDTO Get()
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var userFavList = _danhSachYeuThichRepository.GetAll()
                .Include(x => x.IdBaiViets)
                .Include(x => x.IdQuanAns)
                .ThenInclude(x => x.IdDiaChiNavigation)
                .Include(x => x.IdQuanAns)
                .ThenInclude(x => x.IdTheLoais)
                .SingleOrDefault(x => x.IdNguoiDung.Equals(currentUser.Id));
            if (userFavList == null)
            {
                int favListId = _danhSachYeuThichRepository.AddWithIdResult(
                    new DanhSachYeuThich()
                    {
                        IdNguoiDung = currentUser.Id
                    });
                _danhSachYeuThichRepository.SaveChange();
                DanhSachYeuThich newFavList = _danhSachYeuThichRepository.Get(favListId);
                return _mapper.Map<DanhSachYeuThichDTO>(newFavList);
            }
            var favListDTO = new DanhSachYeuThichDTO()
            {
                Id = userFavList.Id,
                IdNguoiDung = userFavList.IdNguoiDung,
                BaiViet = _mapper.Map<List<BaiVietDTO>>(userFavList.IdBaiViets.AsEnumerable()),
            };
            foreach (var quanAn in userFavList.IdQuanAns)
            {
                var restaurantDTO = new QuanAnDetailDTO()
                {
                    IdQuanAn = quanAn.Id,
                    ChatLuong = quanAn.ChatLuong ?? string.Empty,
                    DiaChi = quanAn.IdDiaChiNavigation.MoTa ?? string.Empty,
                    GioMoCua = quanAn.ThoiGianHoatDong.Split(' ')[0],
                    GioDongCua = quanAn.ThoiGianHoatDong.Split(' ')[2],
                    IdHinhAnh = quanAn.IdHinhAnh,
                    IdNguoiSoHuu = quanAn.IdNguoiSoHuu,
                    PlaceId = quanAn.IdDiaChiNavigation.PlaceId ?? string.Empty,
                    SoDienThoai = quanAn.SoDienThoai,
                    TenQuanAn = quanAn.TenQuanAn,
                    TheLoai = _mapper.Map<List<TheLoaiDTO>>(quanAn.IdTheLoais)
                };
                favListDTO.QuanAn.Add(restaurantDTO);
            }
            return favListDTO;
        }

        [HttpPost("AddPost/{postId}")]
        [Authorize(Roles = "0,1")]
        public DanhSachYeuThichDTO AddPost(int postId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var post = _baiVietRepository.Get(postId);
            var favList = _danhSachYeuThichRepository.GetAll()
                .Include(x => x.IdBaiViets)
                .Single(x => x.IdNguoiDung.Equals(currentUser.Id));
            if (favList.IdBaiViets.Contains(post))
                return _mapper.Map<DanhSachYeuThichDTO>(favList);
            favList.IdBaiViets.Add(post);
            _danhSachYeuThichRepository.Update(favList);
            _danhSachYeuThichRepository.SaveChange();
            return _mapper.Map<DanhSachYeuThichDTO>(favList);
        }

        [HttpPost("AddRestaurant/{restaurantId}")]
        [Authorize(Roles = "0,1")]
        public DanhSachYeuThichDTO AddRestaurant(int restaurantId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var restaurant = _quanAnRepository.Get(restaurantId);
            var favList = _danhSachYeuThichRepository.GetAll()
                .Include(x => x.IdQuanAns)
                .Single(x => x.IdNguoiDung.Equals(currentUser.Id));
            if (favList.IdQuanAns.Contains(restaurant))
                return _mapper.Map<DanhSachYeuThichDTO>(favList);
            favList.IdQuanAns.Add(restaurant);
            _danhSachYeuThichRepository.Update(favList);
            _danhSachYeuThichRepository.SaveChange();
            return _mapper.Map<DanhSachYeuThichDTO>(favList);
        }

        [HttpDelete("DeletePost/{postId}")]
        [Authorize(Roles = "0,1")]
        public DanhSachYeuThichDTO DeletePost(int postId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var post = _baiVietRepository.Get(postId);
            var favList = _danhSachYeuThichRepository.GetAll()
                .Include(x => x.IdBaiViets)
                .Single(x => x.IdNguoiDung.Equals(currentUser.Id));
            if (favList.IdBaiViets.Contains(post))
            {
                favList.IdBaiViets.Remove(post);
                _danhSachYeuThichRepository.Update(favList);
                _danhSachYeuThichRepository.SaveChange();
                return _mapper.Map<DanhSachYeuThichDTO>(favList);
            }
            return _mapper.Map<DanhSachYeuThichDTO>(favList);
        }

        [HttpDelete("DeleteRestaurant/{restaurantId}")]
        [Authorize(Roles = "0,1")]
        public DanhSachYeuThich DeleteRestaurant(int restaurantId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var restaurant = _quanAnRepository.Get(restaurantId);
            var favList = _danhSachYeuThichRepository.GetAll()
                .Include(x => x.IdQuanAns)
                .Single(x => x.IdNguoiDung.Equals(currentUser.Id));
            if (favList.IdQuanAns.Contains(restaurant))
            {
                favList.IdQuanAns.Remove(restaurant);
                _danhSachYeuThichRepository.Update(favList);
                _danhSachYeuThichRepository.SaveChange();
                return favList;
            }
            return favList;
        }
    }
}
