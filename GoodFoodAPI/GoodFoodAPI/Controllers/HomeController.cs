using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using GoodFoodAPI.Common;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using GoodFoodAPI.Repositories.Implements;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly IWebHostEnvironment _webhostEnvironment;
        private readonly ImageHelper _imageHelper;
        private readonly IHinhAnhRepository _hinhAnhRepository;
        private readonly FirebaseApp _firebaseApp;

        public HomeController(
            IWebHostEnvironment webHostEnvironment,
            ImageHelper imageHelper,
            IHinhAnhRepository hinhAnhRepository,
            FirebaseApp firebaseApp
            )
        {
            _webhostEnvironment = webHostEnvironment;
            _imageHelper = imageHelper;
            _firebaseApp = firebaseApp;
            _hinhAnhRepository = hinhAnhRepository;
        }
        // GET: /Home
        [HttpGet]
        public string Get()
        {
            return "Hello World from Get";
        }

        [HttpPost("uploadImage")]
        public async Task<string> PostImage([FromForm] ImageClass imageClass)
        {
            var uploadFile = imageClass.Image!;
            var path = await _imageHelper.SaveImage(uploadFile, LoaiHinhAnh.Restaurant);
            _hinhAnhRepository.Add(new HinhAnh { Context = path });
            _hinhAnhRepository.SaveChange();
            return path;
        }

        [HttpGet("downloadImage")]
        public async Task<byte[]> DownloadImage()
        {
            string path = _webhostEnvironment.WebRootPath + "//download.jpg";
            byte[] imageByte = await System.IO.File.ReadAllBytesAsync(path);
            return imageByte;
        }

        [HttpPost]
        public async void SendNoti(string message, string token)
        {
            var mess = new Message()
            {
                Token = token,
                Data = new Dictionary<string, string>()
                {
                    {"type", "chat" }
                },
                Notification = new Notification()
                {
                    Body = message,
                    Title = message,
                }
            };
            await FirebaseMessaging.GetMessaging(_firebaseApp).SendAsync(mess);
        }
        //[HttpPost("signUp")]
        //public async Task SignUp()
        //{
        //    FirebaseAuth.GetAuth
        //}
    }

    public class ImageClass
    {
        public LoaiHinhAnh Type { get; set; }
        public IFormFile? Image { get; set; }
    }
}
