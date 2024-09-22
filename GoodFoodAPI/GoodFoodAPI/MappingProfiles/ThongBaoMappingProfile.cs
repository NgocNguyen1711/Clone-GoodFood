using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class ThongBaoMappingProfile : Profile
    {
        public ThongBaoMappingProfile() : base(nameof(ThongBaoMappingProfile))
        {
            CreateMap<ThongBaoDTO, ThongBao>().ReverseMap();
        }
    }
}
