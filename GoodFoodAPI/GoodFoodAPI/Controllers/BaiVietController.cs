using AutoMapper;
using GoodFoodAPI.Common;
using GoodFoodAPI.Domains;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using GoodFoodAPI.Services;
using GoodFoodAPI.Services.Implements;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class BaiVietController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IBaiVietService _baivietService;
        private readonly IBaiVietRepository _baiVietRepository;
        private readonly IThongBaoService _thongBaoService;

        public BaiVietController(IBaiVietService baivietService,
                                 IMapper mapper,
                                 IBaiVietRepository baiVietRepository,
                                 IThongBaoService thongBaoService)
        {
            _mapper = mapper;
            _baiVietRepository = baiVietRepository;
            _baivietService = baivietService;
            _thongBaoService = thongBaoService;
        }

        // GET: BaiViet/5
        [HttpGet("{id}")]
        public BaiVietDTO GetBaiViet(int id)
        {
            return _mapper.Map<BaiVietDTO>(_baivietService.Get(id));
        }

        [HttpGet("All")]
        public BaiVietDTO[] GetAllBaiViet()
        {
            return _mapper.Map<BaiVietDTO[]>(_baivietService.GetAll());
        }

        [HttpGet("Search")]
        [Authorize(Roles = "0,1")]
        public async Task<List<PostOverviewDTO>> SearchPost(string keyword)
        {
            return _mapper.Map<List<PostOverviewDTO>>(await _baivietService.SearchPost(keyword));
        }

        [HttpGet("SearchByRestaurant")]
        [Authorize(Roles = "0,1")]
        public async Task<List<PostOverviewDTO>> SearchPostByRestaurant(string keyword)
        {
            return _mapper.Map<List<PostOverviewDTO>>(await _baivietService.SearchByRestaurant(keyword));
        }

        [HttpGet("Overview")]
        [Authorize(Roles = "0,1")]
        public async Task<IEnumerable<PostOverviewDTO>> Overviews()
        {
            return _mapper.Map<IEnumerable<PostOverview>, IEnumerable<PostOverviewDTO>>(
                await _baivietService.GetPostOverviews()
                );
        }

        [HttpGet("Detail/{id}")]
        [Authorize(Roles = "0,1")]
        public async Task<PostDetailDTO> GetDetail(int id)
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext);
            return await _baivietService.GetPostDetail(id, user!.Id);
        }

        [HttpPost("Like/{postId}")]
        [Authorize(Roles = "0,1")]
        public void Like(int postId)
        {
            var currentUser = UserHelper.GetCurrentUser(this.HttpContext)!;
            var receivedUserId =  _baiVietRepository.Get(postId).IdNguoiDung;

            string? notiMessage;
            if (!currentUser.HoVaTen.IsNullOrEmpty())
            {
                notiMessage = $"{currentUser.HoVaTen} đã thích bài viết của bạn";
            }
            else
            {
                notiMessage = $"user{currentUser.Id} đã thích bài viết của bạn";
            }

            var notification = new ThongBao()
            {
                IdNguoiDung = receivedUserId,
                LoaiThongBao = ((int)LoaiThongBao.LikePost),
                NoiDung = notiMessage,
                ThoiGian = DateTime.Now,
                PostId = postId,
            };

            _thongBaoService.PushNotification(notification,
                                              userId: currentUser.Id,
                                              postId: postId);
            _baivietService.AddLike(postId, currentUser!.Id);
        }

        [HttpPost("Unlike/{postId}")]
        [Authorize(Roles = "0,1")]
        public void Unlike(int postId)
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext);
            _baivietService.RemoveLike(postId, user!.Id);
        }

        [HttpPost("Add")]
        [Authorize(Roles = "0,1")]
        public async Task<int> AddBaiViet(PostReviewDTO postReviewDTO)
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext);
            return await _baivietService.AddBaiViet(postReviewDTO, user!.Id);
        }

        [HttpGet("User/{userId}")]
        [Authorize(Roles = "0,1,2")]
        public async Task<IEnumerable<PostOverviewDTO>> GetPostByUserId(int userId)
        {
            return await _baivietService.GetPostByUserId(userId);
        }
    }
}