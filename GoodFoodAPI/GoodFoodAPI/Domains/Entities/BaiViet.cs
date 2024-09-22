using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class BaiViet : BaseEntity
{
    public override int Id { get; set; }

    public string TieuDe { get; set; } = null!;

    public string NhanXet { get; set; } = null!;

    public DateTime ThoiGian { get; set; }

    public int IdQuanAn { get; set; }

    public int IdHinhAnhQuanAn { get; set; }

    public int IdNguoiDung { get; set; }

    public int Favorite { get; set; }

    public double? VeSinh { get; set; }

    public double? HuongVi { get; set; }

    public double? KhongGian { get; set; }

    public double? PhucVu { get; set; }

    public double? GiaCa { get; set; }

    public virtual ICollection<BaiVietCoMonAn> BaiVietCoMonAns { get; } = new List<BaiVietCoMonAn>();

    public virtual ICollection<BaoCao> BaoCaos { get; } = new List<BaoCao>();

    public virtual ICollection<BinhLuan> BinhLuans { get; } = new List<BinhLuan>();

    public virtual HinhAnh IdHinhAnhQuanAnNavigation { get; set; } = null!;

    public virtual NguoiDung IdNguoiDungNavigation { get; set; } = null!;

    public virtual QuanAn IdQuanAnNavigation { get; set; } = null!;

    public virtual ICollection<DanhSachYeuThich> IdDanhSaches { get; } = new List<DanhSachYeuThich>();

    public virtual ICollection<NguoiDung> IdNguoiDungsLike { get; } = new List<NguoiDung>();
}
