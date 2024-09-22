using AutoMapper;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class MonAnController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IMonAnService _monAnService;

        public MonAnController(IMapper mapper, IMonAnService monAnService)
        {
            _mapper = mapper;
            _monAnService = monAnService;
        }

        [HttpGet("{quanAnId}")]
        [Authorize(Roles = "0,1,2")]
        public List<MonAnDTO> GetMonAnByQuanAnId(int quanAnId)
        {
            return _mapper.Map<List<MonAnDTO>>(_monAnService.GetByQuanAnId(quanAnId));
        }

        [HttpGet("Search")]
        [Authorize(Roles = "0,1,2")]
        public async Task<List<MonAnDTO>> SearchDish(string keyword)
        {
            return _mapper.Map<List<MonAnDTO>>(await _monAnService.SearchDish(keyword));
        }
    }
}
