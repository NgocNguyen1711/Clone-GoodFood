namespace GoodFoodAPI.DTOs
{
    public class PostReviewDTO
    {
        public int RestaurantId { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Review { get; set; } = string.Empty;
        public int ImageId { get; set; }
        public double Hygiene { get; set; }
        public double Taste { get; set; }
        public double Space { get; set; }
        public double Price { get; set; }
        public double Service { get; set; }
        public List<DishReviewDTO> Dishes { get; set; } = Array.Empty<DishReviewDTO>()
                                                               .ToList();
    }
}
