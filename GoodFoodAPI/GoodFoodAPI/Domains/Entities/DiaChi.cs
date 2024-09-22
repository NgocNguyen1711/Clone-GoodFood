using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class DiaChi : BaseEntity
{
    public override int Id { get; set; }

    public string? MoTa { get; set; }

    public string? PlaceId { get; set; }

    public virtual ICollection<QuanAn> QuanAns { get; } = new List<QuanAn>();
}
