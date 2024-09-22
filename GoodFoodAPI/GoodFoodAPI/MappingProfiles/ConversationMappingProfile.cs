using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class ConversationMappingProfile : Profile
    {
        public ConversationMappingProfile() : base(nameof(ConversationMappingProfile))
        {
            CreateMap<ConversationDTO, Conversation>().ReverseMap();
        }
    }
}
