using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class HinhAnhRepository : BaseRepository<HinhAnh>, IHinhAnhRepository
    {
        public HinhAnhRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
