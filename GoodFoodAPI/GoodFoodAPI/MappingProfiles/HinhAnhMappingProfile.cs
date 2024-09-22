using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class HinhAnhMappingProfile : Profile
    {
        public HinhAnhMappingProfile() : base(nameof(HinhAnhMappingProfile))
        {
            CreateMap<HinhAnhDTO, HinhAnh>().ReverseMap();
        }
    }
}
