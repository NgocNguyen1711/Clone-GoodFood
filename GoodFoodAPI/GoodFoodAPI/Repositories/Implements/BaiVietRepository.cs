using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Repositories.Implements
{
    public class BaiVietRepository : BaseRepository<BaiViet>, IBaiVietRepository
    {
        public BaiVietRepository(GoodFoodContext context) : base(context)
        {
        }
        public BaiViet GetByIdQuanAn(int idQuanAn)
        {
            return _dbSet.SingleOrDefault(x => x.IdQuanAn == idQuanAn)!;
        }

        public async Task<List<BaiViet>> GetBaiViets()
        {
            return await _dbSet.Include(x => x.IdNguoiDungNavigation)
                               .Include(x=>x.IdNguoiDungsLike)
                               .ToListAsync();
        }

        public BaiViet GetWithMonAn(int id)
        {
            return _dbSet.Include(x => x.BaiVietCoMonAns)
                         .SingleOrDefault(x => x.Id == id)!;
        }
        public BaiViet GetWithLike(int id)
        {
            return _dbSet.Include(x=>x.IdNguoiDungsLike).Single(x=>x.Id == id);
        }
    }
}
