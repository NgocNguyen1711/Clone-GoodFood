using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class ImageController : ControllerBase
    {
        private readonly IHinhAnhRepository _hinhAnhRepository;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly ImageHelper _imageHelper;

        public ImageController(IHinhAnhRepository hinhAnhRepository,
                               IWebHostEnvironment webHostEnvironment,
                               ImageHelper imageHelper)
        {
            _hinhAnhRepository = hinhAnhRepository;
            _webHostEnvironment = webHostEnvironment;
            _imageHelper = imageHelper;
        }

        [HttpGet("{imageId}")]
        public IActionResult Get(int imageId)
        {
            var path = _hinhAnhRepository.Get(imageId).Context;
            string imagePath = _webHostEnvironment.WebRootPath + path;
            var image = System.IO.File.OpenRead(imagePath);
            return File(image, "image/jpeg");
        }

        [HttpPost("Upload")]
        public async Task<int> UploadImage([FromForm] ImageClass image)
        {
            if (image.Image == null)
            {
                return 0;
            }
            try
            {
                var path = await _imageHelper.SaveImage(image.Image, image.Type);
                HinhAnh hinhAnh = new()
                {
                    Context = path
                };
                _hinhAnhRepository.Add(hinhAnh);
                _hinhAnhRepository.SaveChange();
                return hinhAnh.Id;
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}
