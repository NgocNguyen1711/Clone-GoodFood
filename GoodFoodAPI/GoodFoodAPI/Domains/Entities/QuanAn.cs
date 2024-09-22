using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class QuanAn : BaseEntity
{
    public override int Id { get; set; }

    public string TenQuanAn { get; set; } = null!;

    public string? ChatLuong { get; set; }

    public string ThoiGianHoatDong { get; set; } = null!;

    public string SoDienThoai { get; set; } = null!;

    public int IdDiaChi { get; set; }

    public int IdHinhAnh { get; set; }

    public bool DaDuyet { get; set; }

    public int IdNguoiSoHuu { get; set; }

    public virtual ICollection<BaiViet> BaiViets { get; } = new List<BaiViet>();

    public virtual DiaChi IdDiaChiNavigation { get; set; } = null!;

    public virtual HinhAnh IdHinhAnhNavigation { get; set; } = null!;

    public virtual NguoiDung IdNguoiSoHuuNavigation { get; set; } = null!;

    public virtual ICollection<MonAn> MonAns { get; } = new List<MonAn>();

    public virtual ICollection<DanhSachYeuThich> IdDanhSaches { get; } = new List<DanhSachYeuThich>();

    public virtual ICollection<TheLoai> IdTheLoais { get; } = new List<TheLoai>();
}
