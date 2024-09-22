namespace GoodFoodAPI.DTOs
{
    public partial class BaiVietDTO
    {
        public int Id { get; set; }
        public string? TieuDe { get; set; }
        public string? NhanXet { get; set; }
        public DateTime? ThoiGian { get; set; }
        public int? IdQuanAn { get; set; }
        public int? IdHinhAnhQuanAn { get; set; }
        public int? IdNguoiDung { get; set; }
        public int Like { get; set; }
        public int Comment { get; set; }
        public int Favorite { get; set; }
        public float? VeSinh { get; set; }
        public float? HuongVi { get; set; }
        public float? KhongGian { get; set; }
        public float? GiaCa { get; set; }
        public float? PhucVu { get; set; }
    }
}
