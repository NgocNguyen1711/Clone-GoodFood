using System;
using System.Collections.Generic;

namespace GoodFoodAPI.Domains.Entities;

public partial class NguoiDung : BaseEntity
{
    public override int Id { get; set; }

    public string? HoVaTen { get; set; }

    public string TenDangNhap { get; set; } = null!;

    public string? SoDienThoai { get; set; }

    public DateTime? NgaySinh { get; set; }

    public string MatKhau { get; set; } = null!;

    public string? Email { get; set; }

    public string? GioiTinh { get; set; }

    public int? IdHinhAnh { get; set; }

    public int LoaiNguoiDung { get; set; }

    public bool? DangNhap { get; set; }

    public byte[]? Salt { get; set; }

    public bool SetTag { get; set; }

    public virtual ICollection<BaiViet> BaiViets { get; } = new List<BaiViet>();

    public virtual ICollection<BinhLuan> BinhLuans { get; } = new List<BinhLuan>();

    public virtual ICollection<Chat> Chats { get; } = new List<Chat>();

    public virtual ICollection<Conversation> ConversationUser1s { get; } = new List<Conversation>();

    public virtual ICollection<Conversation> ConversationUser2s { get; } = new List<Conversation>();

    public virtual ICollection<DanhSachYeuThich> DanhSachYeuThiches { get; } = new List<DanhSachYeuThich>();

    public virtual ICollection<DeviceToken> DeviceTokens { get; } = new List<DeviceToken>();

    public virtual ICollection<DuLieuDeXuat> DuLieuDeXuats { get; } = new List<DuLieuDeXuat>();

    public virtual HinhAnh? IdHinhAnhNavigation { get; set; }

    public virtual ICollection<QuanAn> QuanAns { get; } = new List<QuanAn>();

    public virtual ICollection<ThongBao> ThongBaos { get; } = new List<ThongBao>();

    public virtual ICollection<BaiViet> IdBaiVietsLike { get; } = new List<BaiViet>();

    public virtual ICollection<NguoiDung> IdNguoiDungDuocTheoDois { get; } = new List<NguoiDung>();

    public virtual ICollection<NguoiDung> IdNguoiDungTheoDois { get; } = new List<NguoiDung>();
}
