using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class DanhSachYeuThichRepository : BaseRepository<DanhSachYeuThich>, IDanhSachYeuThichRepository
    {
        public DanhSachYeuThichRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
