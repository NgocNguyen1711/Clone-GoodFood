using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Domains
{
    public class PostOverview
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public int UserId { get; set; }
        public int Avatar { get; set; }
        public string TieuDe { get; set; } = string.Empty;
        public string NhanXet { get; set; } = string.Empty;
        public DateTime ThoiGian { get; set; } = DateTime.MinValue;
        public int Image { get; set; }
        public int Like { get; set; } = default;
        public int Comment { get; set; } = default;
        public int Favorite { get; set; } = default;
    }
}
