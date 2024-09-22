namespace GoodFoodAPI.DTOs
{
    public class PostDetailDTO
    {
        public BaiVietDTO BaiViet { get; set; } = new BaiVietDTO();
        public QuanAnDetailDTO QuanAnDetail { get; set; } = new QuanAnDetailDTO();
        public NguoiDungDTO NguoiDung { get; set; } = new NguoiDungDTO();
        public List<MonAnDTO> MonAn { get; set; } = new List<MonAnDTO> { };
        public bool IsLiked { get; set; } = false;
    }
}
