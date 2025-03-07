USE MASTER 
GO
CREATE DATABASE Qlybanhang123
ON PRIMARY
( NAME = 'QuanlyBH1', FILENAME = 'D:\CSDL\quanlybanhang.mdf' , SIZE = 4048KB , MAXSIZE =
10240KB , FILEGROWTH = 20%)
LOG ON
( NAME = 'Qlybanhang123_log', FILENAME = 'D:\CSDL\quanlybanhang_log1.ldf' , SIZE = 1024KB , MAXSIZE =
10240KB , FILEGROWTH = 10%)
GO

use Qlybanhang123
GO
CREATE TABLE NhomSanPham (
 [MaNhom] [int] PRIMARY KEY,
 [TenNhom] [nvarchar](15) NULL )
GO
GO
CREATE TABLE [dbo].[Nhanvien](
 [MaNV] [nchar](5) PRIMARY KEY,
 [TenNV] [nvarchar](40) NOT NULL,
 [DiaChi] [nvarchar](60) NULL,
 [Dienthoai] [nvarchar](24) NULL )
GO

GO
CREATE TABLE [dbo].[NhaCungCap](
 [MaNCC] [int] NOT NULL,
 [TenNcc] [nvarchar](40) NOT NULL,
 [Diachi] [nvarchar](60) NULL,
 [Phone] [nvarchar](24) NULL,
 [SoFax] [nvarchar](24) NULL,
 [DCMail] [nvarchar](50) NULL,
PRIMARY KEY ( [MaNCC]) )
GO

GO
CREATE TABLE [dbo].[KhachHang](
 [MaKh] [nchar](5) NOT NULL,
 [TenKh] [nvarchar](40) NOT NULL,
 [LoaiKh] [nvarchar](3) NULL,
 [DiaChi] [nvarchar](60) NULL,
 [Phone] [nvarchar](24) NULL,
PRIMARY KEY ([MaKh]) ) 
GO
ALTER TABLE KhachHang ADD SoFax Nvarchar(24)
ALTER TABLE KhachHang ADD DCMail Nvarchar(50)
CREATE TABLE [dbo].[SanPham](
 [MaSp] [int] NOT NULL,
 [TenSp] [nvarchar](40) NOT NULL,
 [MaNCC] [int] NULL,
 [MoTa] [nvarchar](50) NULL,
 [MaNhom] [int] NULL,
 [Đonvitinh] [nvarchar](20) NULL,
 [GiaGoc] [money] NULL,
 [SLTON] [int] NULL,
PRIMARY KEY ([MaSp]) )
GO

CREATE TABLE [dbo].[HoaDon](
 [MaHD] [int] NOT NULL,
 [NgayLapHD] [datetime] NULL,
 [NgayGiao] [datetime] NULL,
 [Noichuyen] [nvarchar](60) NOT NULL,
 [MaNV] [nchar](5) NULL,
 [MaKh] [nchar](5) NULL,
PRIMARY KEY ([MaHD]) )
GO

GO
CREATE TABLE [dbo].[CT_HoaDon](
 [MaHD] [int] NOT NULL,
 [MaSp] [int] NOT NULL,
 [Soluong] [smallint] NULL,
 [Dongia] [money] NULL,
 [ChietKhau] [money] NULL,
PRIMARY KEY CLUSTERED
(
 [MaHD] ASC,
 [MaSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HoaDon] ADD CONSTRAINT [HD_df] DEFAULT (getdate()) FOR
[NgayLapHD]
GO

ALTER TABLE [dbo].[KhachHang] WITH CHECK ADD CONSTRAINT [kh_ck] CHECK 
(([LoaiKH]='VL' OR [LoaiKH]='TV' OR [LoaiKH]='VIP'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [kh_ck]
GO

ALTER TABLE [dbo].[SanPham] WITH CHECK ADD CONSTRAINT [Sanpham_ck1] CHECK 
(([slton]>(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [Sanpham_ck1]
GO

ALTER TABLE [dbo].[SanPham] WITH CHECK ADD CONSTRAINT [sp_ck] CHECK (([SlTon]>(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [sp_ck]
GO

ALTER TABLE [dbo].[HoaDon] WITH CHECK ADD CONSTRAINT [HD_ck] CHECK 
(([NgayLapHD]>=getdate()))
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [HD_ck]
GO

ALTER TABLE [dbo].[CT_HoaDon] WITH CHECK ADD CHECK (([chietkhau]>=(0)))
GO

ALTER TABLE [dbo].[CT_HoaDon] WITH CHECK ADD CHECK (([soluong]>(0)))
GO

ALTER TABLE [dbo].[SanPham] WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO

ALTER TABLE [dbo].[SanPham] WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomSanPham] ([MaNhom])
GO

ALTER TABLE [dbo].[HoaDon] WITH CHECK ADD FOREIGN KEY([MaKh])
REFERENCES [dbo].[KhachHang] ([MaKh])
GO

ALTER TABLE [dbo].[HoaDon] WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
GO

ALTER TABLE [dbo].[CT_HoaDon] WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO

ALTER TABLE [dbo].[CT_HoaDon] WITH CHECK ADD FOREIGN KEY([MaSp])
REFERENCES [dbo].[SanPham] ([MaSp])
GO
USE Master 
USE Qlybanhang123
GO
INSERT INTO KhachHang (MaKh, TenKh, LoaiKh, DiaChi, Phone, SoFax, DCMail)
VALUES 
    ('KH001', 'Che quang quoc bao', 'VL', 'Ho Chi Minh', '0969048021', '0241234567', 'bcquocquoc0506@gmail.com'),
    ('KH002', 'Ha Thi Thanh Hoa', 'TV', 'Ho Chi Minh', '0976720266', '0287654321', 'Hathithanhhoa@gmail.com'),
    ('KH003', 'Che Quang Bao', 'VIP', 'Hue', '0969377052', '0234567890', 'chebao0506@gmai.com');

USE Qlybanhang123
GO
SELECT * FROM KhachHang;
SELECT * FROM Nhanvien;
SELECT * FROM NhaCungCap;
SELECT * FROM NhomSanPham;
SELECT * FROM SanPham;
SELECT * FROM HoaDon;
SELECT * FROM CT_HoaDon;
SELECT * FROM dbo.KhachHang;
GO
SELECT * FROM sys.tables WHERE name = 'HoaDon';


USE Qlybanhang123
ALTER TABLE HoaDon ADD MaNV NCHAR(5);
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_Nhanvien FOREIGN KEY (MaNV) REFERENCES Nhanvien(MaNV);
INSERT INTO Nhanvien (MaNV, TenNV, DiaChi, Dienthoai)
VALUES ('NV001', 'NGUYEN VAN A', 'GO VAP', '0946456746');
INSERT INTO Nhanvien (MaNV, TenNV, DiaChi, Dienthoai)
VALUES ('NV011', 'NGUYEN THI HOA', 'HOC MON', '094567462');
INSERT INTO Nhanvien (MaNV, TenNV, DiaChi, Dienthoai)
VALUES ('NV016', 'NGUYEN XUAN CON', 'CU CHI', '0969048021');
GO
INSERT INTO NhaCungCap (MaNCC, TenNcc, Diachi, Phone, SoFax, DCMail)
VALUES (00001, 'CONG TY TNHH BAODZ', 'QUANG TRUNG - GO VAP', '0969048021', '159753', 'baodz@gmail.com');
INSERT INTO NhaCungCap (MaNCC, TenNcc, Diachi, Phone, SoFax, DCMail)
VALUES (00002, 'CONG TY TNHH BAONE', 'NGUYEN VAN LUONG - GO VAP', '0969048021', '357951', 'baone56@gmail.com');
INSERT INTO NhaCungCap (MaNCC, TenNcc, Diachi, Phone, SoFax, DCMail)
VALUES (00003, 'CONG TY TNHH BAOGIOI', 'LE THI HA - HOC MON', '0969048021', '123654', 'baogioi56@gmail.com');
INSERT INTO NhomSanPham (MANHOM, TenNhom)
VALUES (1, 'DIENTHOAI');
INSERT INTO NhomSanPham (MANHOM, TenNhom)
VALUES (2, 'PHUKIEN');
INSERT INTO NhomSanPham (MANHOM, TenNhom)
VALUES (3, 'KHAC');
INSERT INTO SanPham (MaSp, TenSp, Đonvitinh, GiaGoc, SLTON, MaNhom, MaNCC, MoTa)
VALUES (1, 'DIENTHOAI IPHONE', 'CAI',23500000, 200, 1, 00001, 'IPHONE  17');
INSERT INTO SanPham (MaSp, TenSp,Đonvitinh, GiaGoc, SLTON, MaNhom, MaNCC, MoTa)
VALUES (10, 'TAI NGHE', 'CAI',500000, 100, 1, 00001, 'TAI NGHE IPHONE');
INSERT INTO SanPham (MaSp, TenSp,Đonvitinh, GiaGoc, SLTON, MaNhom, MaNCC, MoTa)
VALUES (2, 'DIENTHOAI SAMSUNG', 'CAI',14900000, 50, 1, 00002, 'DIEN THOAI SAMSUNGS23');
INSERT INTO HoaDon (MaHD, NgayLapHD, MaKh, NgayGiao, Noichuyen)
VALUES (1, '06-03-2025', 'KH001', '08-03-2025', 'DANG THUC VINH, THOI TAM THON, HOCMON');
INSERT INTO HoaDon (MaHD, NgayLapHD, MaKh, NgayGiao, Noichuyen)
VALUES (2, '06-03-2025', 'KH002', '10-03-2025', 'LE THI HA, THOI TAM THON, HOCMON');
INSERT INTO HoaDon (MaHD, NgayLapHD, MaKh, NgayGiao, Noichuyen)
VALUES (3, '06-03-2025', 'KH001', '08-03-2025', 'LY THUONG KIET, TAM DONG, HOCMON');
INSERT INTO CT_HoaDon (MaHD, MaSp, Dongia, Soluong)
VALUES (1, 1, 25000000, 5);
INSERT INTO CT_HoaDon (MaHD, MaSp, Dongia, Soluong)
VALUES (2, 2, 15000000, 10);
INSERT INTO CT_HoaDon (MaHD, MaSp, Dongia, Soluong)
VALUES (3, 10, 450000, 5);