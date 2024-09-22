DECLARE @DatabaseName nvarchar(50)
SET @DatabaseName = N'GoodFood'

DECLARE @SQL varchar(max)

SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
FROM MASTER..SysProcesses
WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId

--SELECT @SQL 
EXEC(@SQL)

USE master;
GO
DROP DATABASE IF EXISTS GoodFood;
CREATE DATABASE GoodFood;
GO
USE GoodFood;
GO

-- Drop a table called 'HinhAnh' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[HinhAnh]', 'U') IS NOT NULL
DROP TABLE [dbo].[HinhAnh]
GO
CREATE TABLE HinhAnh
(
	Id INT NOT NULL IDENTITY(1,1),
	Context VARCHAR(MAX) NOT NULL,
	Extension VARCHAR(250) NOT NULL,
	PRIMARY KEY (Id),
);

-- Drop a table called 'NguoiDung' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[NguoiDung]', 'U') IS NOT NULL
DROP TABLE [dbo].[NguoiDung]
GO
-- select * from NguoiDung;
CREATE TABLE [dbo].[NguoiDung]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[HoVaTen] NVARCHAR (250) NULL,
	[SoDienThoai] VARCHAR (11) NULL,
	[NgaySinh] DATE NULL,
	[MatKhau] VARCHAR (250) NOT NULL,
	[Email] VARCHAR (250) UNIQUE NOT NULL,
	[GioiTinh] VARCHAR (1) NULL,
	[HinhAnhId] INT NULL,
	[LoaiNguoiDung] INT NOT NULL,
	--0: admin, 1: reviewer, 2: restaurant owner
	[DangNhap] BIT DEFAULT ((0)) NULL,
	[Salt] BINARY (64) NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC),
	FOREIGN KEY ([HinhAnhId]) REFERENCES [dbo].[HinhAnh] ([Id])
);

-- Drop a table called 'DiaChi' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[DiaChi]', 'U') IS NOT NULL
DROP TABLE [dbo].[DiaChi]
GO
CREATE TABLE DiaChi
(
	Id INT NOT NULL IDENTITY(1,1),
	MoTa NVARCHAR(MAX),
	PlaceId NVARCHAR(MAX),
	PRIMARY KEY (Id),
);

-- Drop a table called 'QuanAn' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[QuanAn]', 'U') IS NOT NULL
DROP TABLE [dbo].[QuanAn]
GO
CREATE TABLE QuanAn
(
	Id INT NOT NULL IDENTITY(1,1),
	TenQuanAn NVARCHAR(250) NOT NULL,
	ChatLuong VARCHAR(250) NOT NULL,
	[Open] TIME NOT NULL,
	[Close] TIME NOT NULL,
	SoDienThoai VARCHAR(11) NOT NULL,
	DiaChiId INT NOT NULL,
	HinhAnhId INT NOT NULL,
	DaDuyet BIT NOT NULL,
	NguoiSoHuuId INT NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (DiaChiId) REFERENCES DiaChi(Id),
	FOREIGN KEY (HinhAnhId) REFERENCES HinhAnh(Id),
	FOREIGN KEY (NguoiSoHuuId) REFERENCES NguoiDung(Id)
);

-- Drop a table called 'BaiViet' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[BaiViet]', 'U') IS NOT NULL
DROP TABLE [dbo].[BaiViet]
GO
CREATE TABLE BaiViet
(
	Id INT NOT NULL IDENTITY(1,1),
	TieuDe NTEXT NOT NULL,
	NhanXet NTEXT NOT NULL,
	ThoiGian DATETIME NOT NULL,
	QuanAnId INT NOT NULL,
	HinhAnhQuanAnId INT NOT NULL,
	NguoiDungId INT NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (QuanAnId) REFERENCES QuanAn(Id),
	FOREIGN KEY (HinhAnhQuanAnId) REFERENCES HinhAnh(Id),
	FOREIGN KEY (NguoiDungId) REFERENCES NguoiDung(Id)
);

-- Drop a table called 'DanhSachYeuThich' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[DanhSachYeuThich]', 'U') IS NOT NULL
DROP TABLE [dbo].[DanhSachYeuThich]
GO
CREATE TABLE DanhSachYeuThich
(
	Id INT NOT NULL IDENTITY(1,1),
	NguoiDungId INT NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (NguoiDungId) REFERENCES NguoiDung(Id),
);

-- Drop a table called 'BaiVietThuocDanhSachYeuThich' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[BaiVietThuocDanhSachYeuThich]', 'U') IS NOT NULL
DROP TABLE [dbo].[BaiVietThuocDanhSachYeuThich]
GO
CREATE TABLE BaiVietThuocDanhSachYeuThich
(
	BaiVietId INT,
	DanhSachId INT,
	PRIMARY KEY (BaiVietId, DanhSachId),
	FOREIGN KEY (BaiVietId) REFERENCES BaiViet(Id),
	FOREIGN KEY (DanhSachId) REFERENCES DanhSachYeuThich(Id)
);

-- Drop a table called 'QuanAnThuocDanhSachYeuThich' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[QuanAnThuocDanhSachYeuThich]', 'U') IS NOT NULL
DROP TABLE [dbo].[QuanAnThuocDanhSachYeuThich]
GO
CREATE TABLE QuanAnThuocDanhSachYeuThich
(
	QuanAnId INT,
	DanhSachId INT,
	PRIMARY KEY (QuanAnId, DanhSachId),
	FOREIGN KEY (QuanAnId) REFERENCES QuanAn(Id),
	FOREIGN KEY (DanhSachId) REFERENCES DanhSachYeuThich(Id)
);

-- Drop a table called 'ThongBao' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ThongBao]', 'U') IS NOT NULL
DROP TABLE [dbo].[ThongBao]
GO
CREATE TABLE ThongBao
(
	Id INT NOT NULL IDENTITY(1,1),
	ThoiGian DATETIME NOT NULL,
	NoiDung NVARCHAR(250) NOT NULL,
	NguoiDungId INT NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (NguoiDungId) REFERENCES NguoiDung(Id)
);

-- Drop a table called 'TheoDoi' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TheoDoi]', 'U') IS NOT NULL
DROP TABLE [dbo].[TheoDoi]
GO
CREATE TABLE TheoDoi
(
	NguoiDungTheoDoiId INT,
	NguoiDungDuocTheoDoiId INT,
	PRIMARY KEY (NguoiDungTheoDoiId, NguoiDungDuocTheoDoiId),
	FOREIGN KEY (NguoiDungTheoDoiId) REFERENCES NguoiDung(Id),
	FOREIGN KEY (NguoiDungDuocTheoDoiId) REFERENCES NguoiDung(Id)
);

-- Drop a table called 'MonAn' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[MonAn]', 'U') IS NOT NULL
DROP TABLE [dbo].[MonAn]
GO

CREATE TABLE MonAn
(
	Id INT NOT NULL IDENTITY(1,1),
	TenMon NVARCHAR(250) NOT NULL,
	GiaTien INT NOT NULL,
	QuanAnId INT NOT NULL,
	HinhAnhId INT NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (QuanAnId) REFERENCES QuanAn(Id),
	FOREIGN KEY (HinhAnhId) REFERENCES HinhAnh(Id)
);

-- Drop a table called 'BaiVietCoMonAn' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[BaiVietCoMonAn]', 'U') IS NOT NULL
DROP TABLE [dbo].[BaiVietCoMonAn]
GO

CREATE TABLE BaiVietCoMonAn
(
	BaiVietId INT NOT NULL,
	MonAnId INT NOT NULL,
	HinhAnhId INT NOT NULL,
	NhanXet NVARCHAR(MAX),
	PRIMARY KEY (BaiVietId, MonAnId, HinhAnhId),
	FOREIGN KEY (BaiVietId) REFERENCES BaiViet(Id),
	FOREIGN KEY (MonAnId) REFERENCES MonAn(Id),
	FOREIGN KEY (HinhAnhId) REFERENCES HinhAnh(Id)
);

-- Drop a table called 'BinhLuan' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[BinhLuan]', 'U') IS NOT NULL
DROP TABLE [dbo].[BinhLuan]
GO
CREATE TABLE BinhLuan
(
	Id INT NOT NULL IDENTITY(1,1),
	ThoiGian DATETIME NOT NULL,
	NoiDung NVARCHAR(250) NOT NULL,
	BaiVietId INT NOT NULL,
	NguoiDungId INT NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (BaiVietId) REFERENCES BaiViet(Id),
	FOREIGN KEY (NguoiDungId) REFERENCES NguoiDung(Id),
);

-- Drop a table called 'TheLoai' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TheLoai]', 'U') IS NOT NULL
DROP TABLE [dbo].[TheLoai]
GO
CREATE TABLE TheLoai
(
	Id INT NOT NULL IDENTITY(1,1),
	TenTheLoai NVARCHAR(250) NOT NULL,
	PRIMARY KEY (Id),
);

-- Drop a table called 'DuLieuDeXuat' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[DuLieuDeXuat]', 'U') IS NOT NULL
DROP TABLE [dbo].[DuLieuDeXuat]
GO
CREATE TABLE DuLieuDeXuat
(
	Id INT NOT NULL IDENTITY(1,1),
	IdNguoiDung INT,
	IdTheLoai INT,
	MocThoiGian VARCHAR(250),
	PRIMARY KEY (Id),
	FOREIGN KEY (IdNguoiDung) REFERENCES NguoiDung(Id),
	FOREIGN KEY (IdTheLoai) REFERENCES TheLoai(Id),
);

ALTER TABLE BaiViet
ADD [Favorite] INT NOT NULL DEFAULT 0;

-- Drop '[EXTENSION]' from table '[HinhAnh]' in schema '[dbo]'
ALTER TABLE [dbo].[HinhAnh]
	DROP COLUMN [Extension]
GO

ALTER TABLE [dbo].[QuanAn]
	ALTER COLUMN [ChatLuong] VARCHAR(250)
GO

-- Drop a table called 'TheLoaiQuanAn' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TheLoaiQuanAn]', 'U') IS NOT NULL
DROP TABLE [dbo].[TheLoaiQuanAn]
GO

-- Create the table in the specified schema
CREATE TABLE [dbo].[TheLoaiQuanAn]
(
	[QuanAnId] INT NOT NULL,
	[TheLoaiId] INT NOT NULL,
	CONSTRAINT [PkTheLoaiQuanAn] PRIMARY KEY ([QuanAnId],[TheLoaiId]),
	CONSTRAINT [FkTheLoaiQuanAnQuanAn] FOREIGN KEY ([QuanAnId]) REFERENCES QuanAn([Id]),
	CONSTRAINT [FkTheLoaiQuanAnTheLoai] FOREIGN KEY ([TheLoaiId]) REFERENCES TheLoai([Id]),
);
GO

ALTER TABLE [dbo].[BaiViet]
ADD
	[VeSinh] FLOAT DEFAULT 0,
	[HuongVi] FLOAT DEFAULT 0,
	[KhongGian] FLOAT DEFAULT 0,
	[PhucVu] FLOAT DEFAULT 0,
	[GiaCa] FLOAT DEFAULT 0;
GO


ALTER TABLE [dbo].[NguoiDung]
ADD [SetTag] BIT NOT NULL DEFAULT 0
GO

-- Create a new table called '[Like]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Like]', 'U') IS NOT NULL
DROP TABLE [dbo].[Like]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Like]
(
	[NguoiDungId] INT NOT NULL,
	[BaiVietId] INT NOT NULL,
	CONSTRAINT [PkLike] PRIMARY KEY ([NguoiDungId],[BaiVietId]),
	CONSTRAINT [FkLikeNguoiDung] FOREIGN KEY ([NguoiDungId]) REFERENCES NguoiDung([Id]),
	CONSTRAINT [FkLikeBaiViet] FOREIGN KEY ([BaiVietId]) REFERENCES BaiViet([Id]),
);
GO

ALTER TABLE [dbo].[BaiViet]
ALTER COLUMN NhanXet NVARCHAR(MAX) NOT NULL
ALTER TABLE [dbo].[BaiViet]
ALTER COLUMN TieuDe NVARCHAR(MAX) NOT NULL
ALTER TABLE [dbo].[BaiVietCoMonAn]
ALTER COLUMN NhanXet NVARCHAR(MAX) NOT NULL

ALTER TABLE [dbo].[ThongBao]
ADD DaDoc BIT DEFAULT 0 NOT NULL
GO

-- Create a new table called '[DeviceToken]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[DeviceToken]', 'U') IS NOT NULL
DROP TABLE [dbo].[DeviceToken]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[DeviceToken]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	-- Primary Key column
	[Token] NVARCHAR(MAX) NOT NULL,
	[UserId] INT NOT NULL,
	CONSTRAINT [FKUserDeviceToken] FOREIGN KEY ([UserId]) REFERENCES NguoiDung([Id]),
);
GO

ALTER TABLE [dbo].[ThongBao]
ADD LoaiThongBao INT NOT NULL
GO

ALTER TABLE [dbo].[ThongBao]
ADD UserId INT NOT NULL DEFAULT 0
GO
ALTER TABLE [dbo].[ThongBao]
ADD PostId INT NOT NULL DEFAULT 0
GO

-- Create a new table called '[Conversation]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Conversation]', 'U') IS NOT NULL
DROP TABLE [dbo].[Conversation]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Conversation]
(
	[ID] INT NOT NULL,
	[User1Id] INT NOT NULL,
	[User2Id] INT NOT NULL,
	CONSTRAINT [PkConversation] PRIMARY KEY ([ID]),
	CONSTRAINT [FkSenderUser] FOREIGN KEY ([User1Id]) REFERENCES NguoiDung([Id]),
	CONSTRAINT [FkReceiverUser] FOREIGN KEY ([User2Id]) REFERENCES NguoiDung([Id])
);
GO

-- Create a new table called '[Chat]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Chat]', 'U') IS NOT NULL
DROP TABLE [dbo].[Chat]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Chat]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	[ConversationId] INT NOT NULL,
	[SenderId] INT NOT NULL,
	[IsRead] BIT NOT NULL DEFAULT 0,
	[Message] NVARCHAR(MAX) NOT NULL,
	[ThoiGian] DATETIME NOT NULL,
	CONSTRAINT [PkMessage] PRIMARY KEY ([ID]),
	CONSTRAINT [FkMessageConversation] FOREIGN KEY ([ConversationId]) REFERENCES [Conversation]([Id]),
	CONSTRAINT [FkMessageUser] FOREIGN KEY ([SenderId]) REFERENCES NguoiDung([Id])
);
GO

-- Add a new column '[NewColumnName]' to table '[TableName]' in schema '[dbo]'
ALTER TABLE [dbo].[BaiViet]
	ADD [IsDeleted] BIT NOT NULL DEFAULT 0
GO

ALTER TABLE [dbo].[QuanAn]
	ADD [IsDeleted] BIT NOT NULL DEFAULT 0
GO

ALTER TABLE [dbo].[MonAn]
	ADD [IsDeleted] BIT NOT NULL DEFAULT 0
GO

ALTER TABLE [dbo].[BinhLuan]
	ADD [IsDeleted] BIT NOT NULL DEFAULT 0
GO

-- Create a new table called '[ReportType]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ReportType]', 'U') IS NOT NULL
DROP TABLE [dbo].[ReportType]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[ReportType]
(
	[Id] INT NOT NULL PRIMARY KEY,
	-- Primary Key column
	[Type] NVARCHAR(MAX) NOT NULL,
	-- Specify more columns here
);
GO

-- Create a new table called '[Report]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Report]', 'U') IS NOT NULL
DROP TABLE [dbo].[Report]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Report]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	-- Primary Key column
	[ReportTypeId] INT NOT NULL,
	[ReporterId] INT NOT NULL,
	[ReportedPostId] INT,
	[ReportedRestaurantId] INT,
	[ReportedUserId] INT,
	[Description] NVARCHAR(MAX)
	CONSTRAINT [FkReportType] FOREIGN KEY ([ReportTypeId]) REFERENCES ReportType([Id]),
	CONSTRAINT [FkReportUser] FOREIGN KEY ([ReportedUserId]) REFERENCES NguoiDung([Id]),
	CONSTRAINT [FkReportPost] FOREIGN KEY ([ReportedPostId]) REFERENCES BaiViet([Id]),
	CONSTRAINT [FkReportRestaurant] FOREIGN KEY ([ReportedRestaurantId]) REFERENCES QuanAn([Id]),
);
GO

ALTER TABLE [dbo].[Report]
	ADD [IsDeleted] BIT NOT NULL DEFAULT 0
GO

ALTER TABLE [dbo].[Report]
	ADD [ThoiGian] DATETIME NOT NULL
GO

ALTER TABLE [dbo].[NguoiDung]
	ADD [IsBanned] BIT NOT NULL DEFAULT 0 
GO