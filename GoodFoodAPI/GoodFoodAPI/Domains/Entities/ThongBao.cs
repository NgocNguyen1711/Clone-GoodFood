using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class ThongBao : BaseEntity
{
    public override int Id { get; set; }

    public DateTime ThoiGian { get; set; }

    public string NoiDung { get; set; } = null!;

    public int IdNguoiDung { get; set; }

    public bool DaDoc { get; set; }

    public int LoaiThongBao { get; set; }

    public int UserId { get; set; }

    public int PostId { get; set; }

    public virtual NguoiDung IdNguoiDungNavigation { get; set; } = null!;
}
