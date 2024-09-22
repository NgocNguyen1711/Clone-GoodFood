using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class DuLieuDeXuatRepository : BaseRepository<DuLieuDeXuat>, IDuLieuDeXuatRepository
    {
        public DuLieuDeXuatRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
