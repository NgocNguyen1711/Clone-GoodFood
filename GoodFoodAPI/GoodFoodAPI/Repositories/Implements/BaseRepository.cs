using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Repositories.Implements
{
    public abstract class BaseRepository<T> : IRepository<T> where T : BaseEntity
    {
        private readonly GoodFoodContext _context;
        protected readonly DbSet<T> _dbSet;

        protected BaseRepository(GoodFoodContext context)
        {
            _context = context;
            _dbSet = _context.Set<T>();
        }

        public T Get(int id)
        {
            return _dbSet.SingleOrDefault(x => x.Id == id)!;
        }

        public IQueryable<T> GetAll()
        {
            return _dbSet;
        }

        public void Add(params T[] items)
        {
            _dbSet.AddRange(items);
        }

        public int AddWithIdResult(T item)
        {
            _dbSet.Add(item);
            _context.SaveChanges();
            return item.Id;
        }
        public void Delete(params int[] ids)
        {
            _dbSet.RemoveRange(_dbSet.Where(x=> ids.Contains(x.Id)));
        }

        public void Delete(params T[] entities)
        {
            _dbSet.RemoveRange(entities);
        }

        public void Update(T entity)
        {
            _dbSet.Update(entity);
        }

        public void SaveChange()
        {
            _context.SaveChanges();
        }
    }
}
