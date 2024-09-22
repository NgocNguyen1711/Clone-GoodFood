using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Services
{
    public interface IMonAnService : IService<MonAn>
    {
        public List<MonAn> GetByQuanAnId(int quanAnId);
        public Task<List<MonAn>> SearchDish(string keyword);
    }
}
