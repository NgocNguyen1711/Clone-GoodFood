using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class DanhGia
{
    public int Id { get; set; }

    public double? VeSinh { get; set; }

    public double? HuongVi { get; set; }

    public double? KhongGian { get; set; }

    public double? PhucVu { get; set; }

    public double? GiaCa { get; set; }

    public int? IdNguoiDung { get; set; }

    public int? IdBaiViet { get; set; }

    public DateTime? ThoiGian { get; set; }

    public virtual BaiViet? IdBaiVietNavigation { get; set; }

    public virtual NguoiDung? IdNguoiDungNavigation { get; set; }
}
