using AutoMapper;
using GoodFoodAPI.Domains;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class PostOverviewMappingProfile : Profile
    {
        public PostOverviewMappingProfile() : base(nameof(PostOverviewMappingProfile))
        {
            CreateMap<PostOverview, PostOverviewDTO>().ReverseMap();
        }
    }
}
