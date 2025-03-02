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

SELECT * FROM dbo.KhachHang;
GO