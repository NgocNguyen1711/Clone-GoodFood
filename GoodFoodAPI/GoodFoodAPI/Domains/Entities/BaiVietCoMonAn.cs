using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class BaiVietCoMonAn
{
    public int IdBaiViet { get; set; }

    public int IdMonAn { get; set; }

    public int IdHinhAnh { get; set; }

    public string NhanXet { get; set; } = null!;

    public virtual BaiViet IdBaiVietNavigation { get; set; } = null!;

    public virtual HinhAnh IdHinhAnhNavigation { get; set; } = null!;

    public virtual MonAn IdMonAnNavigation { get; set; } = null!;
}
