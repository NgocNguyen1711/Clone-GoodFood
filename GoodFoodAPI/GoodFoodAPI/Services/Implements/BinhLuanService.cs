using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Services.Implements
{
    public class BinhLuanService : BaseService<BinhLuan>, IBinhLuanService
    {
        private readonly IBinhLuanRepository _binhLuanRepository;
        private readonly INguoiDungRepository _nguoiDungRepository;
        private readonly IQuanAnRepository _quanAnRepository;
        private readonly IBaiVietRepository _baiVietRepository;
        private readonly IMapper _mapper;

        public BinhLuanService(IBinhLuanRepository binhLuanRepository,
                               IMapper mapper,
                               INguoiDungRepository nguoiDungRepository,
                               IQuanAnRepository quanAnRepository,
                               IBaiVietRepository baiVietRepository) : base(binhLuanRepository)
        {
            _binhLuanRepository = binhLuanRepository;
            _mapper = mapper;
            _nguoiDungRepository = nguoiDungRepository;
            _quanAnRepository = quanAnRepository;
            _baiVietRepository = baiVietRepository;
        }

        public List<BinhLuanDTO> GetByPostId(int postId, int userId)
        {
            var comments = _mapper.Map<List<BinhLuanDTO>>(_binhLuanRepository.GetAll()
                .Where(x => x.IdBaiViet.Equals(postId))
                .OrderBy(x => x.ThoiGian)
                .Reverse()
                .ToList());
            foreach (var comment in comments)
            {
                var userComment = _nguoiDungRepository.Get(comment.IdNguoiDung);
                comment.TenNguoiDung = userComment.HoVaTen ?? $"user{userComment.Id}";
                comment.IdHinhAnh = userComment.IdHinhAnh ?? 0;
                comment.IsOwnerComment = IsOwnerComment(comment.IdBaiViet,
                                                        comment.IdNguoiDung);
                if (comment.IdNguoiDung.Equals(userId))
                    comment.IsCommented = true;
            }
            return comments;
        }

        public BinhLuanDTO AddComment(int postId, int userId, string comment)
        {
            var binhLuan = new BinhLuan
            {
                IdBaiViet = postId,
                IdNguoiDung = userId,
                NoiDung = comment,
                ThoiGian = DateTime.Now,
            };
            _binhLuanRepository.Add(binhLuan);
            _binhLuanRepository.SaveChange();
            var dto = _mapper.Map<BinhLuanDTO>(binhLuan);
            dto.IsCommented = true;
            return dto;
        }

        private bool IsOwnerComment(int postId, int userId)
        {
            var baiViet = _baiVietRepository.Get(postId);
            var quanAn = _quanAnRepository.Get(baiViet.IdQuanAn);
            if (quanAn.IdNguoiSoHuu.Equals(userId))
                return true;
            return false;
        }

        public void DeleteComment(int commentId)
        {
            _binhLuanRepository.Delete(commentId);
            _binhLuanRepository.SaveChange();
        }
    }
}
