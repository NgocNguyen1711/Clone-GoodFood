using AutoMapper;
using GoodFoodAPI.Common;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using GoodFoodAPI.Repositories.Implements;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Services.Implements
{
    public class QuanAnService : BaseService<QuanAn>, IQuanAnService
    {
        private readonly IHinhAnhRepository _hinhAnhRepository;
        private readonly IQuanAnRepository _quanAnRepository;
        private readonly IDiaChiRepository _diaChiRepository;
        private readonly ITheLoaiRepository _theloaiRepository;
        private readonly ImageHelper _imageHelper;
        private readonly IMapper _mapper;
        public QuanAnService(IHinhAnhRepository hinhAnhRepository,
                             IQuanAnRepository quanAnRepository,
                             IDiaChiRepository diaChiRepository,
                             ITheLoaiRepository theloaiRepository,
                             ImageHelper imageHelper,
                             IMapper mapper) : base(quanAnRepository)
        {
            _diaChiRepository = diaChiRepository;
            _hinhAnhRepository = hinhAnhRepository;
            _quanAnRepository = quanAnRepository;
            _theloaiRepository = theloaiRepository;
            _imageHelper = imageHelper;
            _mapper = mapper;
        }

        public async Task AddQuanAn(QuanAnDTO quanAnDTO)
        {
            var imagePath = await _imageHelper.
                SaveImage(quanAnDTO.HinhAnh!,
                          LoaiHinhAnh.Restaurant);
            HinhAnh hinhAnh = new() { Context = imagePath };
            _hinhAnhRepository.Add(hinhAnh);
            _hinhAnhRepository.SaveChange();

            DiaChi diaChi = new()
            {
                MoTa = quanAnDTO.DiaChi!,
                PlaceId = quanAnDTO.PlaceId,
            };
            _diaChiRepository.Add(diaChi);
            _diaChiRepository.SaveChange();

            QuanAn quanAn = new()
            {
                TenQuanAn = quanAnDTO.TenQuanAn,
                ThoiGianHoatDong = quanAnDTO.ThoiGianHoatDong,
                SoDienThoai = quanAnDTO.SoDienThoai,
                IdDiaChi = diaChi.Id,
                IdHinhAnh = hinhAnh.Id,
                DaDuyet = true,
                IdNguoiSoHuu = 1,
            };

            quanAn.IdTheLoais.ToList().AddRange(_theloaiRepository.GetAll()
                                 .Where(x => quanAnDTO.TheLoai
                                 .Contains(x.Id))
                                 .ToList());

            _quanAnRepository.Add(quanAn);
            try
            {
                _quanAnRepository.SaveChange();
            }
            catch (Exception)
            {
                _imageHelper.DeleteImage(hinhAnh.Context);
                _hinhAnhRepository.Delete(hinhAnh);
                _diaChiRepository.Delete(diaChi);
                _hinhAnhRepository.SaveChange();
                _diaChiRepository.SaveChange();
            }
        }

        public async Task<List<QuanAnDetailDTO>> GetQuanAnByUserId(int userId)
        {
            var quanAns = await _quanAnRepository.GetByUserId(userId);
            List<QuanAnDetailDTO> quanAnDTOs = new();
            for (int i = 0; i < quanAns.Count; i++)
            {
                QuanAn quanAn = quanAns[i];
                var diaChi = _diaChiRepository.Get(quanAn.IdDiaChi);
                List<TheLoaiDTO> theLoaiDTOs = new();
                foreach (var item in quanAn.IdTheLoais.ToList())
                {
                    theLoaiDTOs.Add(new TheLoaiDTO
                    {
                        Id = item.Id,
                        TenTheLoai = item.TenTheLoai,
                    });
                }
                quanAnDTOs.Add(new QuanAnDetailDTO
                {
                    IdQuanAn = quanAn.Id,
                    TenQuanAn = quanAn.TenQuanAn,
                    GioMoCua = quanAn.ThoiGianHoatDong.Split(" ")[0],
                    GioDongCua = quanAn.ThoiGianHoatDong.Split(' ')[2],
                    SoDienThoai = quanAn.SoDienThoai,
                    ChatLuong = quanAn.ChatLuong ?? "",
                    DiaChi = diaChi.MoTa ?? "",
                    PlaceId = diaChi.PlaceId ?? "",
                    IdHinhAnh = quanAn.IdHinhAnh,
                    IdNguoiSoHuu = quanAn.IdNguoiSoHuu,
                    TheLoai = theLoaiDTOs,
                });
            }
            return quanAnDTOs;
        }

        public async Task<QuanAnDetailDTO> GetQuanAnById(int quanAnId)
        {
            var quanAn = await _quanAnRepository.GetWithTheLoai(quanAnId);
            var diaChi = _diaChiRepository.Get(quanAn.IdDiaChi);
            List<TheLoaiDTO> theLoaiDTOs = new();
            foreach (var item in quanAn.IdTheLoais.ToList())
            {
                theLoaiDTOs.Add(new TheLoaiDTO
                {
                    Id = item.Id,
                    TenTheLoai = item.TenTheLoai,
                });
            }
            return new QuanAnDetailDTO
            {
                IdQuanAn = quanAn.Id,
                TenQuanAn = quanAn.TenQuanAn,
                GioMoCua = quanAn.ThoiGianHoatDong.Split(" ")[0],
                GioDongCua = quanAn.ThoiGianHoatDong.Split(' ')[2],
                SoDienThoai = quanAn.SoDienThoai,
                ChatLuong = quanAn.ChatLuong ?? "",
                DiaChi = diaChi.MoTa ?? "",
                PlaceId = diaChi.PlaceId ?? "",
                IdHinhAnh = quanAn.IdHinhAnh,
                IdNguoiSoHuu = quanAn.IdNguoiSoHuu,
                TheLoai = theLoaiDTOs,
            };
        }

        public List<QuanAnDetailDTO> GetQuanAn(string searchString)
        {
            var list = _quanAnRepository.GetAll()
                .Include(x => x.IdDiaChiNavigation)
                .Include(x => x.IdTheLoais)
                .Where(x => x.TenQuanAn.Contains(searchString))
                .OrderBy(x => x.TenQuanAn)
                .ToList();
            List<QuanAnDetailDTO> quanAns = new();
            foreach (var quanAn in list)
            {
                quanAns.Add(new QuanAnDetailDTO
                {
                    IdQuanAn = quanAn.Id,
                    ChatLuong = quanAn.ChatLuong ?? string.Empty,
                    DiaChi = quanAn.IdDiaChiNavigation.MoTa ?? string.Empty,
                    PlaceId = quanAn.IdDiaChiNavigation.PlaceId ?? string.Empty,
                    TenQuanAn = quanAn.TenQuanAn,
                    IdHinhAnh = quanAn.IdHinhAnh,
                    TheLoai = _mapper.Map<List<TheLoaiDTO>>(quanAn.IdTheLoais),
                    GioMoCua = quanAn.ThoiGianHoatDong.Split(' ')[0],
                    GioDongCua = quanAn.ThoiGianHoatDong.Split(' ')[2],
                    SoDienThoai = quanAn.SoDienThoai
                });
            };
            return quanAns;
        }
        public async Task UpdateRating(int restaurantId)
        {
            var restaurant = await _quanAnRepository.GetAll()
                .Include(x => x.BaiViets)
                .FirstOrDefaultAsync(x => x.Id.Equals(restaurantId));
            if (restaurant != null)
            {
                double totalRating = 0.0;
                foreach (var post in restaurant.BaiViets)
                {
                    totalRating += post.HuongVi ?? 0.0;
                    totalRating += post.PhucVu ?? 0.0;
                    totalRating += post.GiaCa ?? 0.0;
                    totalRating += post.KhongGian ?? 0.0;
                    totalRating += post.VeSinh ?? 0.0;
                }
                totalRating /= (restaurant.BaiViets.Count * 5);
                restaurant.ChatLuong = string.Format("{0:0.0}", totalRating);
                _quanAnRepository.Update(restaurant);
                _quanAnRepository.SaveChange();
            }
        }
    }
}
