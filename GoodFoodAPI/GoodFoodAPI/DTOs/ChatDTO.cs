namespace GoodFoodAPI.DTOs
{
    public class ChatDTO
    {
        public int Id { get; set; }

        public int ConversationId { get; set; }

        public int SenderId { get; set; }

        public string Message { get; set; } = null!;

        public DateTime ThoiGian { get; set; }
        public NguoiDungDTO? Sender { get; set; }
        public bool IsRead { get; set; }
    }
}
