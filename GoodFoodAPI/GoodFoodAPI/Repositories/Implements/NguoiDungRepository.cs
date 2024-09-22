using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Repositories.Implements
{
    public class NguoiDungRepository : BaseRepository<NguoiDung>, INguoiDungRepository
    {
        public NguoiDungRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
