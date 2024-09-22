using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class DiaChiRepository : BaseRepository<DiaChi>, IDiaChiRepository
    {
        public DiaChiRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
