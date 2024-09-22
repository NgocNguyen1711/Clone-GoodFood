using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using GoodFoodAPI.Common;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Services.Implements
{
    public class ThongBaoService : BaseService<ThongBao>, IThongBaoService
    {
        private readonly FirebaseApp _firebaseApp;
        private readonly INguoiDungRepository _nguoiDungRepository;
        public ThongBaoService(IThongBaoRepository _thongBaoRepository,
                               FirebaseApp firebaseApp,
                               INguoiDungRepository nguoiDungRepository) : base(_thongBaoRepository)
        {
            _firebaseApp = firebaseApp;
            _nguoiDungRepository = nguoiDungRepository;
        }

        public async Task<List<ThongBao>> GetByUserId(int userId)
        {
            return await _repository.GetAll()
                .Where(x => x.IdNguoiDung.Equals(userId))
                .OrderBy(x => x.ThoiGian)
                .Reverse()
                .ToListAsync();
        }

        public int PushNotification(ThongBao thongBao, int userId = 0, int postId = 0)
        {
            var dataDictionary = new Dictionary<string, string>();
            switch (thongBao.LoaiThongBao)
            {
                case (int)LoaiThongBao.Follow:
                    dataDictionary.Add("type", nameof(LoaiThongBao.Follow));
                    dataDictionary.Add("userId", userId.ToString());
                    break;
                case (int)LoaiThongBao.LikePost:
                    dataDictionary.Add("type", nameof(LoaiThongBao.LikePost));
                    dataDictionary.Add("postId", postId.ToString());
                    break;
                case (int)LoaiThongBao.CommentPost:
                    dataDictionary.Add("type", nameof(LoaiThongBao.CommentPost));
                    dataDictionary.Add("postId", postId.ToString());
                    break;
                case (int)LoaiThongBao.ReviewRestaurant:
                    break;
                default:
                    break;
            }

            var dataType = thongBao.LoaiThongBao.ToString();
            var receivedUser = _nguoiDungRepository.GetAll()
                .Include(x => x.DeviceTokens)
                .Single(x => x.Id.Equals(thongBao.IdNguoiDung));

            List<Message> messages = new();
            if (receivedUser != null)
            {
                foreach (var device in receivedUser.DeviceTokens)
                {
                    messages.Add(new Message
                    {
                        Token = device.Token,
                        Data = dataDictionary,
                        Notification = new Notification()
                        {
                            Body = thongBao.NoiDung,
                            Title = "Bạn có thông báo mới",
                        }
                    });
                }
            }
            _repository.Add(thongBao);
            _repository.SaveChange();
            FirebaseMessaging.GetMessaging(_firebaseApp).SendAllAsync(messages);
            return thongBao.Id;
        }
        public int MarkAsRead(int notificationId)
        {
            var notification = _repository.Get(notificationId);
            if (notification != null)
            {
                notification.DaDoc = true;
                _repository.Update(notification);
                _repository.SaveChange();
            }
            return notificationId;
        }

        public int MarkAsUnRead(int notificationId)
        {
            var notification = _repository.Get(notificationId);
            if (notification != null)
            {
                notification.DaDoc = false;
                _repository.Update(notification);
                _repository.SaveChange();
            }
            return notificationId;
        }

        public void MarkAllAsRead(int userId)
        {
            var notifications = _repository.GetAll().Where(x => x.IdNguoiDung.Equals(userId));
            foreach (var notification in notifications)
            {
                notification.DaDoc = true;
                _repository.Update(notification); 
            }
            _repository.SaveChange();
        }
    }
}
