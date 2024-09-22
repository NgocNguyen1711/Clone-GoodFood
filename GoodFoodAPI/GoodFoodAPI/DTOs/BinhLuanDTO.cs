namespace GoodFoodAPI.DTOs
{
    public class BinhLuanDTO
    {
        public int Id { get; set; }
        public DateTime ThoiGian { get; set; }
        public string NoiDung { get; set; } = string.Empty;
        public int IdBaiViet { get; set; }
        public int IdNguoiDung { get; set; }
        public string TenNguoiDung { get; set; } = string.Empty;
        public int IdHinhAnh { get; set; }
        public bool IsCommented { get; set; } = false;
        public bool IsOwnerComment { get; set; } = false;
    }
}
