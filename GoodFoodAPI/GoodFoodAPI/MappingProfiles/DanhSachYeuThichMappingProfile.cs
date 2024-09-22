using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class DanhSachYeuThichMappingProfile : Profile
    {
        public DanhSachYeuThichMappingProfile() : base(nameof(DanhSachYeuThichMappingProfile))
        {
            CreateMap<DanhSachYeuThichDTO, DanhSachYeuThich>().ReverseMap();
        }
    }
}
