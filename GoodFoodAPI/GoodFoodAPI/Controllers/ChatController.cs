using AutoMapper;
using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using GoodFoodAPI.Domains.Entities;
using GoodFoodAPI.DTOs;
using GoodFoodAPI.Helpers;
using GoodFoodAPI.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace GoodFoodAPI.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class ChatController : ControllerBase
    {
        private readonly IConversationRepository _conversationRepository;
        private readonly INguoiDungRepository _nguoiDungRepository;
        private readonly IMapper _mapper;
        private readonly FirebaseApp _firebaseApp;
        public ChatController(IConversationRepository conversationRepository,
                              INguoiDungRepository nguoiDungRepository,
                              IMapper mapper,
                              FirebaseApp firebaseApp)
        {
            _conversationRepository = conversationRepository;
            _nguoiDungRepository = nguoiDungRepository;
            _mapper = mapper;
            _firebaseApp = firebaseApp;
        }

        [HttpGet("Conversation")]
        [Authorize(Roles = "0,1,2")]
        public List<ConversationDTO> GetConversation()
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var user = _nguoiDungRepository.Get(currentUser.Id);
            if (user == null)
            {
                return new List<ConversationDTO>();
            }
            var conversations = _conversationRepository.GetAll()
                .Include(x => x.User1)
                .Include(x => x.User2)
                .Include(x => x.Chats.OrderByDescending(x => x.ThoiGian).Take(1))
                .Where(x => x.User1Id == currentUser.Id || x.User2Id == currentUser.Id)
                .ToList();
            conversations.RemoveAll(x => x.Chats.Count == 0);
            return _mapper.Map<List<ConversationDTO>>(conversations.ToList());
        }

        [HttpGet("Conversation/{conversationId}")]
        [Authorize(Roles = "0,1,2")]
        public ConversationDTO? GetConversation(int conversationId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext);
            if (currentUser == null)
            {
                return null;
            }

            var receiverUserId = int.Parse(conversationId.ToString().Replace(currentUser.Id.ToString(), ""));

            var conversation = _conversationRepository.GetAll()
                .Where(x => x.Id == conversationId)
                .Include(x => x.User1)
                .Include(x => x.User2)
                .Include(x => x.Chats)
                .ThenInclude(x => x.Sender)
                .FirstOrDefault();

            if (conversation == null)
            {
                conversation = new Conversation()
                {
                    Id = conversationId,
                    User1Id = Math.Min(currentUser.Id, receiverUserId),
                    User2Id = Math.Max(currentUser.Id, receiverUserId),
                };
                _conversationRepository.Add(conversation);
                _conversationRepository.SaveChange();
            }
            return _mapper.Map<ConversationDTO>(conversation);
        }

        [HttpPost("Send")]
        [Authorize(Roles = "0,1,2")]
        public ConversationDTO? SendMessage(MessageDTO message)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            var sender = _nguoiDungRepository.Get(currentUser.Id);
            var receiver = _nguoiDungRepository.GetAll()
                .Include(x => x.DeviceTokens)
                .SingleOrDefault(x => x.Id.Equals(message.ReceiverId));
            if (receiver == null || sender == null)
            {
                return null;
            }
            if (receiver.Id.Equals(currentUser.Id))
            {
                return null;
            }
            var conversationId = CreateConversationId(sender.Id, receiver.Id);
            var conversation = _conversationRepository.GetAll()
                .Include(x => x.Chats)
                .FirstOrDefault(x => x.Id.Equals(conversationId));

            var dataDictionary = new Dictionary<string, string>
                {
                    { "type", "Chat" },
                    { "conversationId", conversationId.ToString() }
                };
            List<Message> messages = new();
            foreach (var device in receiver.DeviceTokens)
            {
                messages.Add(new Message()
                {
                    Token = device.Token,
                    Data = dataDictionary,
                    Notification = new Notification()
                    {
                        Title = sender.HoVaTen.IsNullOrEmpty()
                                ? $"user{sender.Id} đã gửi tin nhắn cho bạn"
                                : $"{sender.HoVaTen} đã gửi tin nhắn cho bạn",
                        Body = message.Message
                    }
                });
            }
            if (conversation == null)
            {
                var newConversation = new Conversation()
                {
                    Id = conversationId,
                    User1Id = Math.Min(receiver.Id, sender.Id),
                    User2Id = Math.Max(receiver.Id, sender.Id),
                };
                newConversation.Chats.Add(new Chat()
                {
                    Message = message.Message,
                    SenderId = currentUser.Id,
                    ThoiGian = DateTime.Now
                });
                _conversationRepository.Add(newConversation);
                _conversationRepository.SaveChange();
                //Send firebase noti
                FirebaseMessaging.GetMessaging(_firebaseApp).SendAllAsync(messages);
                return _mapper.Map<ConversationDTO>(newConversation);
            }
            conversation.Chats.Add(new Chat()
            {
                Message = message.Message,
                SenderId = currentUser.Id,
                ThoiGian = DateTime.Now
            });
            _conversationRepository.Update(conversation);
            _conversationRepository.SaveChange();
            //Send firebase noti
            FirebaseMessaging.GetMessaging(_firebaseApp).SendAllAsync(messages);
            return _mapper.Map<ConversationDTO>(conversation);
        }

        [HttpPut("/MarkAsRead/{conversationId}")]
        [Authorize(Roles = "0,1,2")]
        public ConversationDTO? MarkAsRead(int conversationId)
        {
            var currentUser = UserHelper.GetCurrentUser(HttpContext)!;
            if (currentUser == null)
                return null;
            var conversation = _conversationRepository.GetAll()
                .Include(x => x.Chats.Where(x => x.IsRead == false))
                .FirstOrDefault(x => x.Id == conversationId);
            if (conversation == null)
                return null;
            for (int index = 0; index < conversation.Chats.Count; index++)
            {
                conversation.Chats.ToList()[index].IsRead = true;
            }
            _conversationRepository.Update(conversation);
            _conversationRepository.SaveChange();
            return _mapper.Map<ConversationDTO>(conversation);
        }

        private static int CreateConversationId(int user1Id, int user2Id)
        {
            string stringId;
            stringId = Math.Min(user1Id, user2Id).ToString() + Math.Max(user1Id, user2Id).ToString();
            return int.Parse(stringId);
        }
    }
}
