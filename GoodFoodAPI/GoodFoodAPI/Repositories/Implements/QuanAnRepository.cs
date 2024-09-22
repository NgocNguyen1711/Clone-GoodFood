using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Repositories.Implements
{
    public class QuanAnRepository : BaseRepository<QuanAn>, IQuanAnRepository
    {
        public QuanAnRepository(GoodFoodContext context) : base(context)
        {
        }

        public Task<List<QuanAn>> GetByUserId(int userId)
        {
            return _dbSet.Where(x => x.IdNguoiSoHuu.Equals(userId))
                         .Include(x => x.IdTheLoais)
                         .ToListAsync();
        }

        public Task<QuanAn> GetWithTheLoai(int id)
        {
            return _dbSet.Include(x => x.IdTheLoais)
                         .FirstAsync(x => x.Id.Equals(id));
        }
    }
}
