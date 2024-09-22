using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Common
{
    class CommonConstant
    {
        public enum LoaiNguoiDung
        {
            Admin,
            User,
            RestaurantOwner
        }
    }
    public enum LoaiHinhAnh
    {
        Avatar,
        Restaurant,
        Dish,
        Post
    }
    public enum LoaiNguoiDung
    {
        Admin,
        User,
        RestaurantOwner
    }
    public enum LoaiThongBao
    {
        LikePost,
        CommentPost,
        Follow,
        ReviewRestaurant,
    }
}
