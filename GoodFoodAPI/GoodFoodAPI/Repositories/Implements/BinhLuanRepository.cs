using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class BinhLuanRepository : BaseRepository<BinhLuan>, IBinhLuanRepository
    {
        public BinhLuanRepository(GoodFoodContext context) : base(context)
        {
        }

        public int CountByBaiVietId(int baiVietId)
        {
            return _dbSet.Where(x => x.IdBaiViet.Equals(baiVietId)).Count();
        }
    }
}
