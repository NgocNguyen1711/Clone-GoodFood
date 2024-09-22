using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.Repositories;

namespace GoodFoodAPI.Services.Implements
{
    public abstract class BaseService<T>: IService<T> where T : BaseEntity
    {
        protected readonly IRepository<T> _repository;
        protected BaseService(IRepository<T> repository)
        {
            _repository = repository;
        }
        public T Get(int id)
        {
            return _repository.Get(id);
        }
    }
}
