using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class DeviceToken : BaseEntity
{
    public override int Id { get; set; }

    public string Token { get; set; } = null!;

    public int UserId { get; set; }

    public virtual NguoiDung User { get; set; } = null!;
}
