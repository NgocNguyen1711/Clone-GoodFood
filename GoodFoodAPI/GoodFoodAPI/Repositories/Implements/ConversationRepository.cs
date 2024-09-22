using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class ConversationRepository : BaseRepository<Conversation>, IConversationRepository
    {
        public ConversationRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
