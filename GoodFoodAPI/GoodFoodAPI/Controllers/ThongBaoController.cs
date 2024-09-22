using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class ThongBaoController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IThongBaoService _thongBaoService;

        public ThongBaoController(IMapper mapper, IThongBaoService thongBaoService)
        {
            _mapper = mapper;
            _thongBaoService = thongBaoService;
        }

        [HttpGet("All")]
        [Authorize(Roles = "0,1,2")]
        public async Task<List<ThongBaoDTO>> GetNotification()
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext);
            return _mapper.Map<List<ThongBaoDTO>>(await _thongBaoService.GetByUserId(currentUser!.Id));
        }

        [HttpPost("PushNotification")]
        [Authorize(Roles = "0,1,2")]
        public int PushNotification(ThongBaoDTO notification)
        {
            return _thongBaoService.PushNotification(_mapper.Map<ThongBao>(notification));
        }

        [HttpPut("MarkAsRead/{notificationId}")]
        [Authorize(Roles = "0,1,2")]
        public int MarkAsRead(int notificationId)
        {
            return _thongBaoService.MarkAsRead(notificationId);
        }

        [HttpPut("MarkAsUnRead/{notificationId}")]
        [Authorize(Roles = "0,1,2")]
        public int MarkAsUnRead(int notificationId)
        {
            return _thongBaoService.MarkAsUnRead(notificationId);
        }

        [HttpPut("MarkAllAsRead")]
        [Authorize(Roles = "0,1,2")]
        public void MarkAllAsRead()
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext);
            _thongBaoService.MarkAllAsRead(currentUser!.Id);
        }
    }
}
