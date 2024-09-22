using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Services
{
    public interface ITheLoaiService
    {
        public TheLoai Get(int id);
        public IQueryable<TheLoai> GetAll();
    }
}