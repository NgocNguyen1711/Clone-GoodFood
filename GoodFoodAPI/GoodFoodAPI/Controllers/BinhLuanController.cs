using GoodFoodAPI.Common;
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
    public class BinhLuanController : ControllerBase
    {
        private readonly IBinhLuanService _binhLuanService;
        private readonly IThongBaoService _thongBaoService;
        private readonly IBaiVietRepository _baiVietRepository;

        public BinhLuanController(IBinhLuanService binhLuanService,
                                  IThongBaoService thongBaoService,
                                  IBaiVietRepository baiVietRepository)
        {
            _binhLuanService = binhLuanService;
            _thongBaoService = thongBaoService;
            _baiVietRepository = baiVietRepository;
        }

        [HttpGet("{postId}")]
        [Authorize(Roles = "0,1")]
        public List<BinhLuanDTO> GetBinhLuans(int postId)
        {
            var user = UserHelper.GetCurrentUser(this.HttpContext)!;
            return _binhLuanService.GetByPostId(postId, user.Id);
        }

        [HttpPost("Add/{postId}")]
        [Authorize(Roles = "0,1")]
        public BinhLuanDTO AddBinhLuan(int postId, string comment)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var receivedUserId = _baiVietRepository.Get(postId).IdNguoiDung;

            string? notiMessage;
            if (!currentUser.HoVaTen.IsNullOrEmpty())
            {
                notiMessage = $"{currentUser.HoVaTen} đã bình luận về bài viết của bạn";
            }
            else
            {
                notiMessage = $"user{currentUser.Id} đã bình luận về bài viết của bạn";
            }

            var notification = new ThongBao()
            {
                IdNguoiDung = receivedUserId,
                LoaiThongBao = ((int)LoaiThongBao.CommentPost),
                NoiDung = notiMessage,
                ThoiGian = DateTime.Now,
                PostId = postId,
            };

            _thongBaoService.PushNotification(notification,
                                              userId: currentUser.Id,
                                              postId: postId);
            return _binhLuanService.AddComment(postId,
                                               currentUser.Id,
                                               comment);
        }

        [HttpDelete("Delete/{commentId}")]
        [Authorize(Roles = "0,1")]
        public IActionResult DeleteBinhLuan(int commentId)
        {
            _binhLuanService.DeleteComment(commentId);
            return Ok();
        }
    }
}
