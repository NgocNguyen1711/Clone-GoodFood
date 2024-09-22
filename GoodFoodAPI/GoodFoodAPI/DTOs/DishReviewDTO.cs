namespace GoodFoodAPI.DTOs
{
    public class DishReviewDTO
    {
        public int Id { get; set; }
        public string Review { get; set; } = string.Empty;
        public int ImageId { get; set; }
    }
}
