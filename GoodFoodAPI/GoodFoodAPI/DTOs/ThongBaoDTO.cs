namespace GoodFoodAPI.DTOs
{
    public class ThongBaoDTO
    {
        public int Id { get; set; }
        public DateTime ThoiGian { get; set; }
        public string NoiDung { get; set; } = null!;
        public int IdNguoiDung { get; set; }
        public int LoaiThongBao { get; set; }
        public bool DaDoc { get; set; }
        public int UserId { get; set; }
        public int PostId { get; set; }
    }
}
