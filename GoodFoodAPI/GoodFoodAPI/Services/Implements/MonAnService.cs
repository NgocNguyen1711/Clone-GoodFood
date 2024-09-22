using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Services.Implements
{
    public class MonAnService : BaseService<MonAn>, IMonAnService
    {
        public MonAnService(IMonAnRepository repository) : base(repository)
        {
        }

        public List<MonAn> GetByQuanAnId(int quanAnId)
        {
            return _repository.GetAll()
                .Where(x => x.IdQuanAn.Equals(quanAnId))
                .ToList();
        }

        public async Task<List<MonAn>> SearchDish(string keyword)
        {
            return await _repository.GetAll()
                .Include(x => x.BaiVietCoMonAns)
                .Where(x => x.TenMon.Contains(keyword))
                .OrderBy(x => x.TenMon)
                .ToListAsync();
        }
    }
}
