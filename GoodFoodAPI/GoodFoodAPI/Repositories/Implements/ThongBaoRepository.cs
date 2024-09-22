using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class ThongBaoRepository : BaseRepository<ThongBao>, IThongBaoRepository
    {
        public ThongBaoRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
