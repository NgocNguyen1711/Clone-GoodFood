using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Repositories;

namespace GoodFoodAPI.Services.Implements
{
    public class TheLoaiService : ITheLoaiService
    {
        private readonly ITheLoaiRepository _theLoaiRepository;

        public TheLoaiService(ITheLoaiRepository theLoaiRepository)
        {
            _theLoaiRepository = theLoaiRepository;
        }

        public TheLoai Get(int id)
        {
            return _theLoaiRepository.Get(id);
        }
        public IQueryable<TheLoai> GetAll()
        {
            return _theLoaiRepository.GetAll();
        }
    }
}
