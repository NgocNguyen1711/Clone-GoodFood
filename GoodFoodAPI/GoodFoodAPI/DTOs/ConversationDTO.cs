using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.DTOs
{
    public class ConversationDTO
    {
        public int Id { get; set; }

        public int User1Id { get; set; }

        public int User2Id { get; set; }

        public NguoiDungDTO? User1 { get; set; }
        
        public NguoiDungDTO? User2 { get; set; }

        public virtual ICollection<ChatDTO> Chats { get; } = new List<ChatDTO>();
    }
}
