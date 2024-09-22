using GoodFoodAPI.Domains;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.Services
{
    public interface IBaiVietService
    {
        public BaiViet Get(int id);
        public IQueryable<BaiViet> GetAll();
        public Task<IEnumerable<PostOverview>> GetPostOverviews();
        public Task<PostDetailDTO> GetPostDetail(int postId, int userId);
        public void AddLike(int postId, int userId);
        public void RemoveLike(int postId, int userId);
        public Task<int> AddBaiViet(PostReviewDTO postReviewDTO, int userId);
        public Task<IEnumerable<PostOverviewDTO>> GetPostByUserId(int userId);
        public Task<List<PostOverview>> SearchPost(string keyword);
        public Task<List<PostOverview>> SearchByRestaurant(string keyword);

    }
}
