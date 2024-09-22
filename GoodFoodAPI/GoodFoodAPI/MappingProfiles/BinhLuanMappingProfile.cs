using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class BinhLuanMappingProfile : Profile
    {
        public BinhLuanMappingProfile() : base(nameof(BinhLuanMappingProfile))
        {
            CreateMap<BinhLuanDTO, BinhLuan>().ReverseMap();
        }
    }
}
