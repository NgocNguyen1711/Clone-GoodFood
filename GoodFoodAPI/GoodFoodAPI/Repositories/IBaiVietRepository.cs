using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories
{
    public interface IBaiVietRepository : IRepository<BaiViet>
    {
        public BaiViet GetByIdQuanAn(int id);
        public Task<List<BaiViet>> GetBaiViets();
        public BaiViet GetWithMonAn(int id);
        public BaiViet GetWithLike(int id);
    }
}
