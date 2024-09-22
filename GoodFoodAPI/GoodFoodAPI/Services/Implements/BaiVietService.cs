using AutoMapper;
using GoodFoodAPI.Common;
using GoodFoodAPI.Database;
using GoodFoodAPI.Domains;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using GoodFoodAPI.Repositories.Implements;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using Nest;

namespace GoodFoodAPI.Services.Implements
{
    public class BaiVietService : IBaiVietService
    {
        private readonly IBaiVietRepository _baiVietRepository;
        private readonly INguoiDungRepository _nguoiDungRepository;
        private readonly IBinhLuanRepository _binhLuanRepository;
        private readonly IQuanAnService _quanAnService;
        private readonly IMonAnRepository _monAnRepository;
        private readonly IMapper _mapper;
        private readonly ImageHelper _imageHelper;
        private readonly IHinhAnhRepository _hinhAnhRepository;

        public BaiVietService(IBaiVietRepository baiVietRepository,
                              INguoiDungRepository nguoiDungRepository,
                              IBinhLuanRepository binhLuanRepository,
                              IQuanAnService quanAnService,
                              IMonAnRepository monAnRepository,
                              ImageHelper imageHelper,
                              IHinhAnhRepository hinhAnhRepository,
                              IMapper mapper
                             )
        {
            _baiVietRepository = baiVietRepository;
            _nguoiDungRepository = nguoiDungRepository;
            _binhLuanRepository = binhLuanRepository;
            _quanAnService = quanAnService;
            _monAnRepository = monAnRepository;
            _mapper = mapper;
            _hinhAnhRepository = hinhAnhRepository;
            _imageHelper = imageHelper;
        }

        public BaiViet Get(int id)
        {
            return _baiVietRepository.Get(id);
        }
        public IQueryable<BaiViet> GetAll()
        {
            return _baiVietRepository.GetAll();
        }

        public async Task<IEnumerable<PostOverview>> GetPostOverviews()
        {
            List<PostOverview> postOverViews = new();
            List<BaiViet> BaiViets = await _baiVietRepository.GetBaiViets();
            foreach (var baiViet in BaiViets)
            {
                var user = _nguoiDungRepository.Get(baiViet.IdNguoiDung);
                postOverViews.Add(new PostOverview
                {
                    Id = baiViet.Id,
                    Username = user.HoVaTen ?? string.Empty,
                    UserId = user.Id,
                    Avatar = baiViet.IdNguoiDungNavigation.IdHinhAnh ?? 0,
                    TieuDe = baiViet.TieuDe,
                    NhanXet = baiViet.NhanXet,
                    ThoiGian = baiViet.ThoiGian,
                    Image = baiViet.IdHinhAnhQuanAn,
                    Like = baiViet.IdNguoiDungsLike.Count,
                    Comment = _binhLuanRepository.CountByBaiVietId(baiViet.Id),
                    Favorite = 0
                });
            }
            return postOverViews.AsEnumerable();
        }

        public async Task<List<PostOverview>> SearchByRestaurant(string keyword)
        {
            var baiViets = await _baiVietRepository.GetAll()
                .Include(x => x.IdNguoiDungNavigation)
                .Include(x => x.IdNguoiDungsLike)
                .Include(x => x.IdQuanAnNavigation)
                .Where(x => x.IdQuanAnNavigation.TenQuanAn.Contains(keyword))
                .ToListAsync();
            List<PostOverview> postOverViews = new();
            foreach (var baiViet in baiViets)
            {
                var user = _nguoiDungRepository.Get(baiViet.IdNguoiDung);
                postOverViews.Add(new PostOverview
                {
                    Id = baiViet.Id,
                    Username = user.HoVaTen ?? string.Empty,
                    UserId = user.Id,
                    Avatar = baiViet.IdNguoiDungNavigation.IdHinhAnh ?? 0,
                    TieuDe = baiViet.TieuDe,
                    NhanXet = baiViet.NhanXet,
                    ThoiGian = baiViet.ThoiGian,
                    Image = baiViet.IdHinhAnhQuanAn,
                    Like = baiViet.IdNguoiDungsLike.Count,
                    Comment = _binhLuanRepository.CountByBaiVietId(baiViet.Id),
                    Favorite = 0
                });
            }
            return postOverViews;
        }

        public async Task<List<PostOverview>> SearchPost(string keyword)
        {
            var baiViets = await _baiVietRepository.GetAll()
                .Include(x => x.IdNguoiDungNavigation)
                .Include(x => x.IdNguoiDungsLike)
                .Where(x => x.TieuDe.ToLower().Contains(keyword)
                         || x.NhanXet.ToLower().Contains(keyword))
                .OrderBy(x => x.ThoiGian)
                .Reverse()
                .ToListAsync();

            List<PostOverview> postOverViews = new();
            foreach (var baiViet in baiViets)
            {
                var user = _nguoiDungRepository.Get(baiViet.IdNguoiDung);
                postOverViews.Add(new PostOverview
                {
                    Id = baiViet.Id,
                    Username = user.HoVaTen ?? string.Empty,
                    UserId = user.Id,
                    Avatar = baiViet.IdNguoiDungNavigation.IdHinhAnh ?? 0,
                    TieuDe = baiViet.TieuDe,
                    NhanXet = baiViet.NhanXet,
                    ThoiGian = baiViet.ThoiGian,
                    Image = baiViet.IdHinhAnhQuanAn,
                    Like = baiViet.IdNguoiDungsLike.Count,
                    Comment = _binhLuanRepository.CountByBaiVietId(baiViet.Id),
                    Favorite = 0
                });
            }
            return postOverViews;
        }

        public async Task<PostDetailDTO> GetPostDetail(int postId, int userId)
        {

            PostDetailDTO post = new();

            var baiViet = _baiVietRepository.GetWithMonAn(postId);
            var nguoiDung = _nguoiDungRepository.Get(baiViet.IdNguoiDung);
            var quanAn = await _quanAnService.GetQuanAnById(baiViet.IdQuanAn);

            foreach (var baiVietMonAn in baiViet.BaiVietCoMonAns)
            {
                var monAn = _mapper.Map<MonAnDTO>(_monAnRepository.Get(baiVietMonAn.IdMonAn));
                monAn.NhanXet = baiVietMonAn.NhanXet ?? string.Empty;
                monAn.IdHinhAnh = baiVietMonAn.IdHinhAnh;
                post.MonAn.Add(monAn);
            }
            var likeBaiViet = _baiVietRepository.GetWithLike(postId);
            if (likeBaiViet.IdNguoiDungsLike.Any(x => x.Id == userId))
            {
                post.IsLiked = true;
            }
            post.BaiViet = _mapper.Map<BaiVietDTO>(baiViet);
            post.BaiViet.Like = likeBaiViet.IdNguoiDungsLike.Count;
            post.BaiViet.Comment = _binhLuanRepository.CountByBaiVietId(baiViet.Id);
            post.QuanAnDetail = quanAn;
            post.NguoiDung = new NguoiDungDTO
            {
                Email = nguoiDung.Email ?? string.Empty,
                HoVaTen = nguoiDung.HoVaTen ?? string.Empty,
                Id = nguoiDung.Id,
                IdHinhAnh = nguoiDung.IdHinhAnh ?? 0,
                LoaiNguoiDung = nguoiDung.LoaiNguoiDung,
                SetTag = nguoiDung.SetTag,
            };
            return post;
        }

        public void AddLike(int postId, int userId)
        {
            var post = _baiVietRepository.GetWithLike(postId);
            var user = _nguoiDungRepository.Get(userId);
            if (!post.IdNguoiDungsLike.Contains(user))
                post.IdNguoiDungsLike.Add(user);
            _baiVietRepository.Update(post);
            _baiVietRepository.SaveChange();
        }

        public void RemoveLike(int postId, int userId)
        {
            var post = _baiVietRepository.GetWithLike(postId);
            var user = _nguoiDungRepository.Get(userId);
            post.IdNguoiDungsLike.Remove(user);
            _baiVietRepository.Update(post);
            _baiVietRepository.SaveChange();
        }

        public async Task<int> AddBaiViet(PostReviewDTO postReviewDTO, int userId)
        {
            try
            {
                BaiViet baiViet = new()
                {
                    TieuDe = postReviewDTO.Title,
                    NhanXet = postReviewDTO.Review,
                    ThoiGian = DateTime.Now,
                    IdQuanAn = postReviewDTO.RestaurantId,
                    IdHinhAnhQuanAn = postReviewDTO.ImageId,
                    IdNguoiDung = userId,
                    VeSinh = postReviewDTO.Hygiene,
                    HuongVi = postReviewDTO.Taste,
                    KhongGian = postReviewDTO.Space,
                    PhucVu = postReviewDTO.Service,
                    GiaCa = postReviewDTO.Price,
                };
                foreach (var dish in postReviewDTO.Dishes)
                {
                    baiViet.BaiVietCoMonAns.Add(new BaiVietCoMonAn
                    {
                        NhanXet = dish.Review,
                        IdHinhAnh = dish.ImageId,
                        IdBaiVietNavigation = baiViet,
                        IdMonAn = dish.Id
                    });
                }
                _baiVietRepository.Add(baiViet);
                _baiVietRepository.SaveChange();
                await _quanAnService.UpdateRating(postReviewDTO.RestaurantId);
                return baiViet.Id;
            }
            catch (Exception)
            {
                var restaurantImage = _hinhAnhRepository.Get(postReviewDTO.ImageId);
                _imageHelper.DeleteImage(restaurantImage.Context);
                foreach (var dish in postReviewDTO.Dishes)
                {
                    var image = _hinhAnhRepository.Get(dish.ImageId);
                    _imageHelper.DeleteImage(image.Context);
                    _hinhAnhRepository.Delete(image);
                }
                _hinhAnhRepository.SaveChange();
                return -1;
            }
        }

        public async Task<IEnumerable<PostOverviewDTO>> GetPostByUserId(int userId)
        {
            var posts = await _baiVietRepository.GetAll()
                .Include(x => x.IdHinhAnhQuanAnNavigation)
                .Where(x => x.IdNguoiDung.Equals(userId))
                .OrderBy(x => x.ThoiGian)
                .Reverse()
                .ToListAsync();
            return posts.ConvertAll(new Converter<BaiViet, PostOverviewDTO>(ConvertPostOverviewDTO));
        }

        private PostOverviewDTO ConvertPostOverviewDTO(BaiViet baiViet)
        {
            return new PostOverviewDTO
            {
                Id = baiViet.Id,
                Image = baiViet.IdHinhAnhQuanAn,
                TieuDe = baiViet.TieuDe
            };
        }
    }
}
