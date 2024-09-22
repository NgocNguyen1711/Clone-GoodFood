namespace GoodFoodAPI.DTOs
{
    public class QuanAnDetailDTO
    {
        public int IdQuanAn { get; set; }
        public string TenQuanAn { get; set; } = string.Empty;
        public string GioMoCua { get; set; } = string.Empty;
        public string GioDongCua { get; set; } = string.Empty;
        public string SoDienThoai { get; set; } = string.Empty;
        public int IdHinhAnh { get; set; }
        public byte[] HinhAnh { get; set; } = Array.Empty<byte>();
        public string DiaChi { get; set; } = string.Empty;
        public string PlaceId { get; set; } = string.Empty;
        public int IdNguoiSoHuu { get; set; } = 0;
        public string ChatLuong { get; set; } = string.Empty;
        public List<TheLoaiDTO> TheLoai { get; set; } = new List<TheLoaiDTO>();
    }
}
