using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories
{
    public interface IRepository<T> where T : BaseEntity
    {
        T Get(int id);
         
        IQueryable<T> GetAll();

        void Add(params T[] entities);
        
        int AddWithIdResult(T entity);

        void Delete(params int[] ids);

        void Delete(params T[] entities);

        void Update(T entity);

        void SaveChange();
    }

}
