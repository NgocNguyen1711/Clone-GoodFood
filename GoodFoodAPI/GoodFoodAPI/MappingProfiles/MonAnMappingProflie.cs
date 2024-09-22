using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class MonAnMappingProflie : Profile
    {
        public MonAnMappingProflie() : base(nameof(MonAnMappingProflie))
        {
            CreateMap<MonAnDTO, MonAn>().ReverseMap();
        }
    }
}
