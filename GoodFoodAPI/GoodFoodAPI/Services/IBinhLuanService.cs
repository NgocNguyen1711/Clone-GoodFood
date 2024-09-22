using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.Services
{
    public interface IBinhLuanService : IService<BinhLuan>
    {
        public BinhLuanDTO AddComment(int postId, int id, string comment);
        public List<BinhLuanDTO> GetByPostId(int postId, int userId);
        public void DeleteComment(int commentId);
    }
}
