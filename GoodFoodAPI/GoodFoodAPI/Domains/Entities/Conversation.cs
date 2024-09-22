using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class Conversation : BaseEntity
{
    public override int Id { get; set; }

    public int User1Id { get; set; }

    public int User2Id { get; set; }

    public virtual ICollection<Chat> Chats { get; } = new List<Chat>();

    public virtual NguoiDung User1 { get; set; } = null!;

    public virtual NguoiDung User2 { get; set; } = null!;
}
