using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class ChatRepository : BaseRepository<Chat>, IChatRepository
    {
        public ChatRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
