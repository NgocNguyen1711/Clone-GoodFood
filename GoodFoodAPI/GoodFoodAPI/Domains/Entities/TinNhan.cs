using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class TinNhan : BaseEntity
{
    public override int Id { get; set; }

    public int IdCuocTroChuyen { get; set; }

    public DateTime ThoiGian { get; set; }

    public string NoiDung { get; set; } = null!;

    public bool CuaUserNao { get; set; }

    public virtual CuocTroChuyen IdCuocTroChuyenNavigation { get; set; } = null!;
}
