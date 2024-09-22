using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Repositories.Implements
{
    public class TheLoaiRepository : BaseRepository<TheLoai>, ITheLoaiRepository
    {
        public TheLoaiRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
