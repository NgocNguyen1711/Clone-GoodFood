using AutoMapper;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;

namespace GoodFoodAPI.MappingProfiles
{
    public class ChatMappingProfile : Profile
    {
        public ChatMappingProfile() : base(nameof(ChatMappingProfile))
        {
            CreateMap<ChatDTO, Chat>().ReverseMap();
        }
    }
}
