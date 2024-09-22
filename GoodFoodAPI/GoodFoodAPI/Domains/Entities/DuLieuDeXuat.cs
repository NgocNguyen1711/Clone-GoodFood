using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class DuLieuDeXuat : BaseEntity
{
    public override int Id { get; set; }

    public int? IdNguoiDung { get; set; }

    public int? IdTheLoai { get; set; }

    public string? MocThoiGian { get; set; }

    public virtual NguoiDung? IdNguoiDungNavigation { get; set; }

    public virtual TheLoai? IdTheLoaiNavigation { get; set; }
}
