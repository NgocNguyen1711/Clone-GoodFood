using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Services
{
    public interface IService<T> where T : BaseEntity
    {
        T Get(int id);
    }
}
