using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.Services
{
    public interface IQuanAnService
    {
        public Task AddQuanAn(QuanAnDTO quanAnDTO);
        public Task<List<QuanAnDetailDTO>> GetQuanAnByUserId(int userId);
        public Task<QuanAnDetailDTO> GetQuanAnById(int quanAnId);
        public List<QuanAnDetailDTO> GetQuanAn(string searchString);
        public Task UpdateRating(int restaurantId);
    }
}
