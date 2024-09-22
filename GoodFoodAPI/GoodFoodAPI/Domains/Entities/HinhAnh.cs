using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class HinhAnh : BaseEntity
{
    public override int Id { get; set; }

    public string Context { get; set; } = null!;

    public virtual ICollection<BaiVietCoMonAn> BaiVietCoMonAns { get; } = new List<BaiVietCoMonAn>();

    public virtual ICollection<BaiViet> BaiViets { get; } = new List<BaiViet>();

    public virtual ICollection<MonAn> MonAns { get; } = new List<MonAn>();

    public virtual ICollection<NguoiDung> NguoiDungs { get; } = new List<NguoiDung>();

    public virtual ICollection<QuanAn> QuanAns { get; } = new List<QuanAn>();
}
