using GoodFoodAPI.Database;
using GoodFoodAPI.Domains.Entities;

namespace GoodFoodAPI.Repositories.Implements
{
    public class DeviceTokenRepository : BaseRepository<DeviceToken>, IDeviceTokenRepository
    {
        public DeviceTokenRepository(GoodFoodContext context) : base(context)
        {
        }
    }
}
