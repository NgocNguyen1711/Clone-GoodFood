using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class BaiVietMappingProfile : Profile
    {
        public BaiVietMappingProfile() : base(nameof(BaiVietMappingProfile))
        {
            CreateMap<BaiViet, BaiVietDTO>().ReverseMap();
        }
    }
}
