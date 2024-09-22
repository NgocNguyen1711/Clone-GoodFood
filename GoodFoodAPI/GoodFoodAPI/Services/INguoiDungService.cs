using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace GoodFoodAPI.Services
{
    public interface INguoiDungService : IService<NguoiDung>
    {
        public NguoiDungDTO? SignIn(UserLoginDTO userLogin);
        public string SignOut(int userId, string deviceToken);
        public bool SignUp(UserLoginDTO userLogin);
        public bool IsLoggedIn(NguoiDungDTO? nguoiDung);
        public void SetUserTags(int userId, List<int> tags);
        public bool UpdateUser(int userId, NguoiDungDTO nguoiDung);
        public UserStatisticsDTO GetUserStatistics(int userId);
        public bool CheckIsFollowing(int currentUserId, int userId);
        public bool Follow(int currentUserId, int userId);
        public bool Unfollow(int id, int userId);
        public Task<List<NguoiDung>> SearchUser(string keyword);
        public bool ChangePassword(int userId, ChangePasswordDTO password);
    }
}
