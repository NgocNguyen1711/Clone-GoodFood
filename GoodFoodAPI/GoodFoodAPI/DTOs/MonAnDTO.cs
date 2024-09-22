namespace GoodFoodAPI.DTOs
{
    public class MonAnDTO
    {
        public int Id { get; set; }
        public string TenMon { get; set; } = string.Empty;
        public int GiaTien { get; set; }
        public int IdQuanAn { get; set; }
        public int IdHinhAnh { get; set; }
        public string NhanXet { get; set; } = string.Empty;
        public string ImagePath { get; set; } = string.Empty;
    }
}
