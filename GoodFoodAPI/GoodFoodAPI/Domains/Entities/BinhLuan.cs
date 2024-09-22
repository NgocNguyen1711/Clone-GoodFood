using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class BinhLuan : BaseEntity
{
    public override int Id { get; set; }

    public DateTime ThoiGian { get; set; }

    public string NoiDung { get; set; } = null!;

    public int IdBaiViet { get; set; }

    public int IdNguoiDung { get; set; }

    public virtual BaiViet IdBaiVietNavigation { get; set; } = null!;

    public virtual NguoiDung IdNguoiDungNavigation { get; set; } = null!;
}
