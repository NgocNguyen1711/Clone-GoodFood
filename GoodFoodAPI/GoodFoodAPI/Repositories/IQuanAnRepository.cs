using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories
{
    public interface IQuanAnRepository:IRepository<QuanAn>
    {
        public Task<List<QuanAn>> GetByUserId(int userId);
        public Task<QuanAn> GetWithTheLoai(int id);
    }
}
