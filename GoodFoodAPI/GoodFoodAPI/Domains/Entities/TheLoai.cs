using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class TheLoai : BaseEntity
{
    public override int Id { get; set; }

    public string TenTheLoai { get; set; } = null!;

    public virtual ICollection<DuLieuDeXuat> DuLieuDeXuats { get; } = new List<DuLieuDeXuat>();

    public virtual ICollection<QuanAn> IdQuanAns { get; } = new List<QuanAn>();
}
