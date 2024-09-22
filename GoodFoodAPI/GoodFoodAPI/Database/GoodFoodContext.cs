using System;
using System.Collections.Generic;
using GoodFoodAPI.Domains.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoodFoodAPI.Database;

public partial class GoodFoodContext : DbContext
{
    public GoodFoodContext()
    {
    }

    public GoodFoodContext(DbContextOptions<GoodFoodContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BaiViet> BaiViets { get; set; }

    public virtual DbSet<BaiVietCoMonAn> BaiVietCoMonAns { get; set; }

    public virtual DbSet<BaoCao> BaoCaos { get; set; }

    public virtual DbSet<BinhLuan> BinhLuans { get; set; }

    public virtual DbSet<Chat> Chats { get; set; }

    public virtual DbSet<Conversation> Conversations { get; set; }

    public virtual DbSet<DanhSachYeuThich> DanhSachYeuThiches { get; set; }

    public virtual DbSet<DeviceToken> DeviceTokens { get; set; }

    public virtual DbSet<DiaChi> DiaChis { get; set; }

    public virtual DbSet<DuLieuDeXuat> DuLieuDeXuats { get; set; }

    public virtual DbSet<HinhAnh> HinhAnhs { get; set; }

    public virtual DbSet<MonAn> MonAns { get; set; }

    public virtual DbSet<NguoiDung> NguoiDungs { get; set; }

    public virtual DbSet<QuanAn> QuanAns { get; set; }

    public virtual DbSet<TheLoai> TheLoais { get; set; }

    public virtual DbSet<ThongBao> ThongBaos { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=GoodFoodConnection");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BaiViet>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BaiViet__3214EC0760894C29");

            entity.ToTable("BaiViet");

            entity.Property(e => e.GiaCa).HasDefaultValueSql("((0))");
            entity.Property(e => e.HuongVi).HasDefaultValueSql("((0))");
            entity.Property(e => e.KhongGian).HasDefaultValueSql("((0))");
            entity.Property(e => e.PhucVu).HasDefaultValueSql("((0))");
            entity.Property(e => e.ThoiGian).HasColumnType("datetime");
            entity.Property(e => e.VeSinh).HasDefaultValueSql("((0))");

            entity.HasOne(d => d.IdHinhAnhQuanAnNavigation).WithMany(p => p.BaiViets)
                .HasForeignKey(d => d.IdHinhAnhQuanAn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BaiViet__IdHinhA__31EC6D26");

            entity.HasOne(d => d.IdNguoiDungNavigation).WithMany(p => p.BaiViets)
                .HasForeignKey(d => d.IdNguoiDung)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BaiViet__IdNguoi__32E0915F");

            entity.HasOne(d => d.IdQuanAnNavigation).WithMany(p => p.BaiViets)
                .HasForeignKey(d => d.IdQuanAn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BaiViet__IdQuanA__30F848ED");

            entity.HasMany(d => d.IdDanhSaches).WithMany(p => p.IdBaiViets)
                .UsingEntity<Dictionary<string, object>>(
                    "BaiVietThuocDanhSachYeuThich",
                    r => r.HasOne<DanhSachYeuThich>().WithMany()
                        .HasForeignKey("IdDanhSach")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__BaiVietTh__IdDan__3C69FB99"),
                    l => l.HasOne<BaiViet>().WithMany()
                        .HasForeignKey("IdBaiViet")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__BaiVietTh__IdBai__3B75D760"),
                    j =>
                    {
                        j.HasKey("IdBaiViet", "IdDanhSach").HasName("PK__BaiVietT__FA4D3B9A4C48C1D6");
                        j.ToTable("BaiVietThuocDanhSachYeuThich");
                    });
        });

        modelBuilder.Entity<BaiVietCoMonAn>(entity =>
        {
            entity.HasKey(e => new { e.IdBaiViet, e.IdMonAn, e.IdHinhAnh }).HasName("PK__BaiVietC__90A66C2603F893CA");

            entity.ToTable("BaiVietCoMonAn");

            entity.HasOne(d => d.IdBaiVietNavigation).WithMany(p => p.BaiVietCoMonAns)
                .HasForeignKey(d => d.IdBaiViet)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BaiVietCo__IdBai__4D94879B");

            entity.HasOne(d => d.IdHinhAnhNavigation).WithMany(p => p.BaiVietCoMonAns)
                .HasForeignKey(d => d.IdHinhAnh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BaiVietCo__IdHin__4F7CD00D");

            entity.HasOne(d => d.IdMonAnNavigation).WithMany(p => p.BaiVietCoMonAns)
                .HasForeignKey(d => d.IdMonAn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BaiVietCo__IdMon__4E88ABD4");
        });

        modelBuilder.Entity<BaoCao>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BaoCao__3214EC07990AF354");

            entity.ToTable("BaoCao");

            entity.Property(e => e.LoaiBaoCao)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.IdBaiVietNavigation).WithMany(p => p.BaoCaos)
                .HasForeignKey(d => d.IdBaiViet)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BaoCao__IdBaiVie__35BCFE0A");
        });

        modelBuilder.Entity<BinhLuan>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BinhLuan__3214EC0792C1A975");

            entity.ToTable("BinhLuan");

            entity.Property(e => e.NoiDung).HasMaxLength(250);
            entity.Property(e => e.ThoiGian).HasColumnType("datetime");

            entity.HasOne(d => d.IdBaiVietNavigation).WithMany(p => p.BinhLuans)
                .HasForeignKey(d => d.IdBaiViet)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BinhLuan__IdBaiV__52593CB8");

            entity.HasOne(d => d.IdNguoiDungNavigation).WithMany(p => p.BinhLuans)
                .HasForeignKey(d => d.IdNguoiDung)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__BinhLuan__IdNguo__534D60F1");
        });

        modelBuilder.Entity<Chat>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PkMessage");

            entity.ToTable("Chat");

            entity.Property(e => e.ThoiGian).HasColumnType("datetime");

            entity.HasOne(d => d.Conversation).WithMany(p => p.Chats)
                .HasForeignKey(d => d.ConversationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FkMessageConversation");

            entity.HasOne(d => d.Sender).WithMany(p => p.Chats)
                .HasForeignKey(d => d.SenderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FkMessageUser");
        });

        modelBuilder.Entity<Conversation>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PkConversation");

            entity.ToTable("Conversation");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");

            entity.HasOne(d => d.User1).WithMany(p => p.ConversationUser1s)
                .HasForeignKey(d => d.User1Id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FkSenderUser");

            entity.HasOne(d => d.User2).WithMany(p => p.ConversationUser2s)
                .HasForeignKey(d => d.User2Id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FkReceiverUser");
        });

        modelBuilder.Entity<DanhSachYeuThich>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__DanhSach__3214EC0728C840F1");

            entity.ToTable("DanhSachYeuThich");

            entity.HasOne(d => d.IdNguoiDungNavigation).WithMany(p => p.DanhSachYeuThiches)
                .HasForeignKey(d => d.IdNguoiDung)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__DanhSachY__IdNgu__38996AB5");
        });

        modelBuilder.Entity<DeviceToken>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__DeviceTo__3214EC07C16D786E");

            entity.ToTable("DeviceToken");

            entity.HasOne(d => d.User).WithMany(p => p.DeviceTokens)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FKUserDeviceToken");
        });

        modelBuilder.Entity<DiaChi>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__DiaChi__3214EC0757F1C653");

            entity.ToTable("DiaChi");
        });

        modelBuilder.Entity<DuLieuDeXuat>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__DuLieuDe__3214EC07BC4C4EEC");

            entity.ToTable("DuLieuDeXuat");

            entity.Property(e => e.MocThoiGian)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.IdNguoiDungNavigation).WithMany(p => p.DuLieuDeXuats)
                .HasForeignKey(d => d.IdNguoiDung)
                .HasConstraintName("FK__DuLieuDeX__IdNgu__628FA481");

            entity.HasOne(d => d.IdTheLoaiNavigation).WithMany(p => p.DuLieuDeXuats)
                .HasForeignKey(d => d.IdTheLoai)
                .HasConstraintName("FK__DuLieuDeX__IdThe__6383C8BA");
        });

        modelBuilder.Entity<HinhAnh>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__HinhAnh__3214EC079D3A285F");

            entity.ToTable("HinhAnh");

            entity.Property(e => e.Context).IsUnicode(false);
        });

        modelBuilder.Entity<MonAn>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MonAn__3214EC072B4A18DB");

            entity.ToTable("MonAn");

            entity.Property(e => e.TenMon).HasMaxLength(250);

            entity.HasOne(d => d.IdHinhAnhNavigation).WithMany(p => p.MonAns)
                .HasForeignKey(d => d.IdHinhAnh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MonAn__IdHinhAnh__4AB81AF0");

            entity.HasOne(d => d.IdQuanAnNavigation).WithMany(p => p.MonAns)
                .HasForeignKey(d => d.IdQuanAn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MonAn__IdQuanAn__49C3F6B7");
        });

        modelBuilder.Entity<NguoiDung>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__NguoiDun__3214EC075304E46F");

            entity.ToTable("NguoiDung");

            entity.Property(e => e.DangNhap).HasDefaultValueSql("((0))");
            entity.Property(e => e.Email)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.GioiTinh)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.HoVaTen).HasMaxLength(250);
            entity.Property(e => e.MatKhau)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.NgaySinh).HasColumnType("date");
            entity.Property(e => e.Salt)
                .HasMaxLength(64)
                .IsFixedLength();
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.TenDangNhap)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.IdHinhAnhNavigation).WithMany(p => p.NguoiDungs)
                .HasForeignKey(d => d.IdHinhAnh)
                .HasConstraintName("FK__NguoiDung__IdHin__276EDEB3");

            entity.HasMany(d => d.IdBaiVietsLike).WithMany(p => p.IdNguoiDungsLike)
                .UsingEntity<Dictionary<string, object>>(
                    "Like",
                    r => r.HasOne<BaiViet>().WithMany()
                        .HasForeignKey("IdBaiViet")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FkLikeBaiViet"),
                    l => l.HasOne<NguoiDung>().WithMany()
                        .HasForeignKey("IdNguoiDung")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FkLikeNguoiDung"),
                    j =>
                    {
                        j.HasKey("IdNguoiDung", "IdBaiViet").HasName("PkLike");
                        j.ToTable("Like");
                    });

            entity.HasMany(d => d.IdNguoiDungDuocTheoDois).WithMany(p => p.IdNguoiDungTheoDois)
                .UsingEntity<Dictionary<string, object>>(
                    "TheoDoi",
                    r => r.HasOne<NguoiDung>().WithMany()
                        .HasForeignKey("IdNguoiDungDuocTheoDoi")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__TheoDoi__IdNguoi__46E78A0C"),
                    l => l.HasOne<NguoiDung>().WithMany()
                        .HasForeignKey("IdNguoiDungTheoDoi")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__TheoDoi__IdNguoi__45F365D3"),
                    j =>
                    {
                        j.HasKey("IdNguoiDungTheoDoi", "IdNguoiDungDuocTheoDoi").HasName("PK__TheoDoi__34AF8DF6EB4D478F");
                        j.ToTable("TheoDoi");
                    });

            entity.HasMany(d => d.IdNguoiDungTheoDois).WithMany(p => p.IdNguoiDungDuocTheoDois)
                .UsingEntity<Dictionary<string, object>>(
                    "TheoDoi",
                    r => r.HasOne<NguoiDung>().WithMany()
                        .HasForeignKey("IdNguoiDungTheoDoi")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__TheoDoi__IdNguoi__45F365D3"),
                    l => l.HasOne<NguoiDung>().WithMany()
                        .HasForeignKey("IdNguoiDungDuocTheoDoi")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__TheoDoi__IdNguoi__46E78A0C"),
                    j =>
                    {
                        j.HasKey("IdNguoiDungTheoDoi", "IdNguoiDungDuocTheoDoi").HasName("PK__TheoDoi__34AF8DF6EB4D478F");
                        j.ToTable("TheoDoi");
                    });
        });

        modelBuilder.Entity<QuanAn>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__QuanAn__3214EC070F6CA47E");

            entity.ToTable("QuanAn");

            entity.Property(e => e.ChatLuong)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(11)
                .IsUnicode(false);
            entity.Property(e => e.TenQuanAn).HasMaxLength(250);
            entity.Property(e => e.ThoiGianHoatDong)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.IdDiaChiNavigation).WithMany(p => p.QuanAns)
                .HasForeignKey(d => d.IdDiaChi)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__QuanAn__IdDiaChi__2C3393D0");

            entity.HasOne(d => d.IdHinhAnhNavigation).WithMany(p => p.QuanAns)
                .HasForeignKey(d => d.IdHinhAnh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__QuanAn__IdHinhAn__2D27B809");

            entity.HasOne(d => d.IdNguoiSoHuuNavigation).WithMany(p => p.QuanAns)
                .HasForeignKey(d => d.IdNguoiSoHuu)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__QuanAn__IdNguoiS__2E1BDC42");

            entity.HasMany(d => d.IdDanhSaches).WithMany(p => p.IdQuanAns)
                .UsingEntity<Dictionary<string, object>>(
                    "QuanAnThuocDanhSachYeuThich",
                    r => r.HasOne<DanhSachYeuThich>().WithMany()
                        .HasForeignKey("IdDanhSach")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__QuanAnThu__IdDan__403A8C7D"),
                    l => l.HasOne<QuanAn>().WithMany()
                        .HasForeignKey("IdQuanAn")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__QuanAnThu__IdQua__3F466844"),
                    j =>
                    {
                        j.HasKey("IdQuanAn", "IdDanhSach").HasName("PK__QuanAnTh__D0EAABB2BF3AFA4C");
                        j.ToTable("QuanAnThuocDanhSachYeuThich");
                    });

            entity.HasMany(d => d.IdTheLoais).WithMany(p => p.IdQuanAns)
                .UsingEntity<Dictionary<string, object>>(
                    "TheLoaiQuanAn",
                    r => r.HasOne<TheLoai>().WithMany()
                        .HasForeignKey("IdTheLoai")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FkTheLoaiQuanAnTheLoai"),
                    l => l.HasOne<QuanAn>().WithMany()
                        .HasForeignKey("IdQuanAn")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FkTheLoaiQuanAnQuanAn"),
                    j =>
                    {
                        j.HasKey("IdQuanAn", "IdTheLoai").HasName("PkTheLoaiQuanAn");
                        j.ToTable("TheLoaiQuanAn");
                    });
        });

        modelBuilder.Entity<TheLoai>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TheLoai__3214EC07967DD5B1");

            entity.ToTable("TheLoai");

            entity.Property(e => e.TenTheLoai).HasMaxLength(250);
        });

        modelBuilder.Entity<ThongBao>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ThongBao__3214EC071E14A50B");

            entity.ToTable("ThongBao");

            entity.Property(e => e.NoiDung).HasMaxLength(250);
            entity.Property(e => e.ThoiGian).HasColumnType("datetime");

            entity.HasOne(d => d.IdNguoiDungNavigation).WithMany(p => p.ThongBaos)
                .HasForeignKey(d => d.IdNguoiDung)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ThongBao__IdNguo__4316F928");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
