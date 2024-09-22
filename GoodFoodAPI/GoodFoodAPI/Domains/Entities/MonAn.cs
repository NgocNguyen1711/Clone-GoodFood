using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class MonAn : BaseEntity
{
    public override int Id { get; set; }

    public string TenMon { get; set; } = null!;

    public int GiaTien { get; set; }

    public int IdQuanAn { get; set; }

    public int IdHinhAnh { get; set; }

    public virtual ICollection<BaiVietCoMonAn> BaiVietCoMonAns { get; } = new List<BaiVietCoMonAn>();

    public virtual HinhAnh IdHinhAnhNavigation { get; set; } = null!;

    public virtual QuanAn IdQuanAnNavigation { get; set; } = null!;
}
