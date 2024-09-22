using AutoMapper;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class QuanAnController : ControllerBase
    {
        private readonly IQuanAnService _quanAnService;

        public QuanAnController(IQuanAnService quanAnService)
        {
            _quanAnService = quanAnService;
        }

        // POST: /QuanAn/Add
        [HttpPost("Add")]
        public async Task AddQuanAn([FromForm] QuanAnDTO quanAnDTO)
        {
            await _quanAnService.AddQuanAn(quanAnDTO);
        }

        // GET: /QuanAn/User/1
        [HttpGet("User/{IdUser}")]
        public async Task<List<QuanAnDetailDTO>> GetQuanAnByUserId(int IdUser)
        {
            return await _quanAnService.GetQuanAnByUserId(IdUser);
        }

        // GET: /QuanAn/1
        [HttpGet("{Id}")]
        public async Task<QuanAnDetailDTO> GetQuanAnById(int Id)
        {
            return await _quanAnService.GetQuanAnById(Id);
        }

        [HttpGet]
        [Authorize(Roles = "0,1")]
        public List<QuanAnDetailDTO> SearchQuanAn(string searchString)
        {
            return _quanAnService.GetQuanAn(searchString);
        }
    }
}
