using AutoMapper;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Services;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class TheLoaiController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly ITheLoaiService _theLoaiService;

        public TheLoaiController(ITheLoaiService theLoaiService, IMapper mapper)
        {
            _mapper = mapper;
            _theLoaiService = theLoaiService;
        }
        
        [HttpGet("{id}")]
        public TheLoaiDTO GetTheLoai(int id)
        {
            return _mapper.Map<TheLoaiDTO>(_theLoaiService.Get(id));
        }

        [HttpGet("All")]
        public TheLoaiDTO[] GetAllTheLoai()
        {
            return _mapper.Map<TheLoaiDTO[]>(_theLoaiService.GetAll());
        }
    }
}
