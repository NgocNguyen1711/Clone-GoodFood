using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Services
{
    public interface IThongBaoService : IService<ThongBao>
    {
        public Task<List<ThongBao>> GetByUserId(int userId);
        public int PushNotification(ThongBao thongBao, int userId = 0, int postId = 0);
        public int MarkAsRead(int notificationId);
        public int MarkAsUnRead(int notificationId);
        public void MarkAllAsRead(int userId);
    }
}
