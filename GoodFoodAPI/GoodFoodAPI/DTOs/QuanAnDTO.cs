namespace GoodFoodAPI.DTOs
{
    public class QuanAnDTO
    {
        public string TenQuanAn { get; set; } = string.Empty;
        public string ThoiGianHoatDong { get; set; } = string.Empty;
        public string SoDienThoai { get; set; } = string.Empty;
        public IFormFile? HinhAnh { get; set; }
        public string DiaChi { get; set; } = string.Empty;
        public string PlaceId { get; set; } = string.Empty;
        public int IdNguoiSoHuu { get; set; } = 0;
        public int[] TheLoai { get; set; } = Array.Empty<int>();
    }
}
