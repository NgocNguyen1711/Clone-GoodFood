using GoodFoodAPI.Common;
namespace GoodFoodAPI.Helpers
{
    public class ImageHelper
    {
        private readonly IWebHostEnvironment _webHostEnvironment;
        public ImageHelper(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        public async Task<string> SaveImage(IFormFile formFile, LoaiHinhAnh loaiHinhAnh)
        {
            string dirPath = _webHostEnvironment.WebRootPath + "/" + loaiHinhAnh;
            string fileName = formFile.FileName;
            FileInfo fileInfo = new(fileName);
            string guidName = Guid.NewGuid().ToString() + fileInfo.Extension;

            if (!Directory.Exists(dirPath))
            {
                Directory.CreateDirectory(dirPath);
            }
            string imagePath = Path.Combine(dirPath, guidName);
            if (File.Exists(imagePath))
            {
                File.Delete(imagePath);
            }
            using FileStream fileStream = File.Create(imagePath);
            await formFile.CopyToAsync(fileStream);
            return imagePath.Replace(_webHostEnvironment.WebRootPath, "");
        }

        public async Task<byte[]> GetImage(string path)
        {
            string filePath = _webHostEnvironment.WebRootPath + path;
            return await File.ReadAllBytesAsync(filePath);
        }

        public void DeleteImage(string path)
        {
            string filePath = _webHostEnvironment.WebRootPath + path;
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }
    }
}
