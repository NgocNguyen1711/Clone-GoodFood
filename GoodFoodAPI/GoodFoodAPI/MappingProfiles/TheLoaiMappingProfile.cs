using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class TheLoaiMappingProfile : Profile
    {
        public TheLoaiMappingProfile() : base(nameof(TheLoaiMappingProfile))
        {
            CreateMap<TheLoai, TheLoaiDTO>().ReverseMap();
        }
    }
}
