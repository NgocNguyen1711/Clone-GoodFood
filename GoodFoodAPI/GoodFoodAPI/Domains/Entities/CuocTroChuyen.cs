using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class CuocTroChuyen
{
    public int Id { get; set; }

    public int IdNguoiDung1 { get; set; }

    public int IdNguoiDung2 { get; set; }

    public bool? ThongBao { get; set; }

    public bool? Chan { get; set; }

    public virtual NguoiDung IdNguoiDung1Navigation { get; set; } = null!;

    public virtual NguoiDung IdNguoiDung2Navigation { get; set; } = null!;

    public virtual ICollection<TinNhan> TinNhans { get; } = new List<TinNhan>();
}
