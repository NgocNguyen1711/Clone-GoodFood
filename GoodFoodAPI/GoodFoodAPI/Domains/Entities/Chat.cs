using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class Chat : BaseEntity
{
    public override int Id { get; set; }

    public int ConversationId { get; set; }

    public int SenderId { get; set; }

    public bool IsRead { get; set; }

    public string Message { get; set; } = null!;

    public DateTime ThoiGian { get; set; }

    public virtual Conversation Conversation { get; set; } = null!;

    public virtual NguoiDung Sender { get; set; } = null!;
}
