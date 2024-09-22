using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class MonAnRepository : BaseRepository<MonAn>, IMonAnRepository
    {
        public MonAnRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
