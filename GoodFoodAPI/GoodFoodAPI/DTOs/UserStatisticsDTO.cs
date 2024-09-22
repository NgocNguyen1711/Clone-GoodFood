namespace GoodFoodAPI.DTOs
{
    public class UserStatisticsDTO
    {
        public int UserId { get; set; }
        public int Following { get; set; }
        public int Followed { get; set; }
        public int PostCount { get; set; }
    }
}
