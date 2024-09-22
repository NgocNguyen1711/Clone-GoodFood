using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories
{
    public interface IBinhLuanRepository : IRepository<BinhLuan>
    {
        public int CountByBaiVietId(int baiVietId);
    }
}
