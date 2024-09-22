using GoodFoodAPI.DTOs;
using System.Security.Claims;

namespace GoodFoodAPI.Helpers
{
    public class UserHelper
    {
        static public NguoiDungDTO? GetCurrentUser(HttpContext httpContext)
        {
            var identity = httpContext.User.Identity as ClaimsIdentity;

            if (identity?.Claims.ToList().Count == 0)
                return null;

            var userClaims = identity!.Claims;

            return new NguoiDungDTO
            {
                Id = int.Parse(userClaims.FirstOrDefault(o => o.Type == ClaimTypes.NameIdentifier)?.Value!),
                Email = userClaims.FirstOrDefault(o => o.Type == ClaimTypes.Email)?.Value!,
                HoVaTen = userClaims.FirstOrDefault(o => o.Type == ClaimTypes.Name)?.Value!,
                LoaiNguoiDung = int.Parse(userClaims.FirstOrDefault(o => o.Type == ClaimTypes.Role)?.Value!)
            };
        }
    }
}

