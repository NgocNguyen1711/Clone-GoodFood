using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class NguoiDungMappingProfile : Profile
    {
        public NguoiDungMappingProfile() : base(nameof(NguoiDungMappingProfile))
        {
            CreateMap<NguoiDungDTO, NguoiDung>().ReverseMap();
        }
    }
}
