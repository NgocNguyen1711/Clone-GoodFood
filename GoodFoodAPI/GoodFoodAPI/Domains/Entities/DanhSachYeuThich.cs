using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class DanhSachYeuThich : BaseEntity
{
    public override int Id { get; set; }

    public int IdNguoiDung { get; set; }

    public virtual NguoiDung IdNguoiDungNavigation { get; set; } = null!;

    public virtual ICollection<BaiViet> IdBaiViets { get; } = new List<BaiViet>();

    public virtual ICollection<QuanAn> IdQuanAns { get; } = new List<QuanAn>();
}
