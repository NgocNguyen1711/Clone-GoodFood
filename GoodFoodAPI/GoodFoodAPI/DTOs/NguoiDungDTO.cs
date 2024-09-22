namespace GoodFoodAPI.DTOs
{
    public class NguoiDungDTO
    {
        public int Id { get; set; }
        public string? HoVaTen { get; set; }
        public string? SoDienThoai { get; set; }
        public DateTime? NgaySinh { get; set; }
        public string? Email { get; set; }
        public string? GioiTinh { get; set; }
        public int IdHinhAnh { get; set; }
        public int LoaiNguoiDung { get; set; }
        public bool SetTag { get; set; }
        public string Token { get; set; } = string.Empty;
    }
}
