using AutoMapper;
using GoodFoodAPI.MappingProfiles;

namespace GoodFoodAPI.Configurations
{
    public static class MapperFactory
    {
        private static readonly object s_lock = new();
        private static IMapper? _mapper;

        public static IMapper GetMapper()
        {
            if (_mapper == null)
            {
                lock (s_lock)
                {
                    {
                        var config =
                            new MapperConfiguration(x =>
                            {
                                x.AddProfiles(new Profile[]
                                {
                                    new BaiVietMappingProfile(),
                                    new TheLoaiMappingProfile(),
                                    new PostOverviewMappingProfile(),
                                    new NguoiDungMappingProfile(),
                                    new HinhAnhMappingProfile(),
                                    new MonAnMappingProflie(),
                                    new BinhLuanMappingProfile(),
                                    new ThongBaoMappingProfile(),
                                    new DanhSachYeuThichMappingProfile(),
                                    new ConversationMappingProfile(),
                                    new ChatMappingProfile(),
                                });
                            });
                        _mapper = config.CreateMapper();
                    }
                }
            }

            return _mapper;
        }
    }
}
