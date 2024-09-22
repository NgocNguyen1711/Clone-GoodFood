namespace GoodFoodAPI.DTOs
{
    public partial class PostOverviewDTO
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public int UserId { get; set; }
        public int Avatar { get; set; }
        public string TieuDe { get; set; } = string.Empty;
        public string NhanXet { get; set; } = string.Empty;
        public DateTime ThoiGian { get; set; }
        public int Image { get; set; }
        public int Like { get; set; }
        public int Comment { get; set; }
        public int Favorite { get; set; }
    }
}