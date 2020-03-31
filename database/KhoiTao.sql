Use master
go
drop database QLKho_TTN
Create database QLKho_TTN

Use QLkho_TTN
go
Create table Kho(
	MaKho varchar(10) not null,
	DiaChi nvarchar(50),
	SDT varchar(10)
)
alter table Kho add primary key (MaKho)

go
Create table Loai(
	MaLoai varchar(10) not null,
	TenLoai nvarchar(50)
)
alter table Loai add primary key (MaLoai)

go
Create table SanPham(
	MaSP varchar(10) not null,
	MaLoai varchar(10),
	MaKho varchar(10),
	MoTa nvarchar(50),
	SoLuong int
)
alter table SanPham add primary key (MaSP)
alter table SanPham add foreign key (MaLoai) references Loai (MaLoai)
alter table SanPham add foreign key (MaKho) references Kho (MaKho)

go
Create table NhaCungCap (
	MaNCC varchar(10) not null,
	TenNCC nvarchar(50),
	DiaChiNCC nvarchar(50),
	SDT varchar(10),
)
alter table NhaCungCap add primary key (MaNCC)

go
Create table NhanVien(
	MaNV varchar(10) not null,
	TenNV nvarchar(20),
	GT nvarchar(5),
	DiaChiNV nvarchar(50),
	SDT varchar(10)
)
alter table NhanVien add primary key (MaNV)

go
Create table KhachHang(
	MaKH varchar(10) not null,
	TenKH nvarchar(20),
	GT nvarchar(5),
	DiaChi nvarchar(50),
	SDT varchar(10)
)
alter table KhachHang add primary key (MaKH)

go
Create table PhieuNhap(
	MaPN varchar(10) not null,
	NgayNhap date,
	MaNCC varchar(10),
	MaNV varchar(10),
	TongTien int,
)
alter table PhieuNhap add primary key (MaPN)
alter table PhieuNhap add foreign key (MaNCC) references NhaCungCap(MaNCC)
alter table PhieuNhap add foreign key (MaNV) references NhanVien(MaNV)

go
Create table ChiTietPN(
	MaPN varchar(10),
	MaSP varchar(10),
	SoLuong int,
	DonGia int
)
alter table ChiTietPN add foreign key (MaPN) references PhieuNhap (MaPN)
alter table ChiTietPN add foreign key (MaSP) references SanPham (MaSP)

go
Create table PhieuTra(
	MaPT varchar(10) not null,
	NgayTra date,
	MaNCC varchar(10),
	MaNV varchar(10),
	TongTien int,
)
alter table PhieuTra add primary key (MaPT)
alter table PhieuTra add foreign key (MaNCC) references NhaCungCap(MaNCC)
alter table PhieuTra add foreign key (MaNV) references NhanVien(MaNV)

go
Create table ChiTietPT(
	MaPT varchar(10),
	MaSP varchar(10),
	SoLuong int,
	DonGia int
)
alter table ChiTietPT add foreign key (MaPT) references PhieuTra (MaPT)
alter table ChiTietPT add foreign key (MaSP) references SanPham (MaSP)

go
Create table HoaDon(
	MaHD varchar(10) not null,
	NgayNhapHD date,
	MaKH varchar(10),
	MaNV varchar(10),
	TongTien int,
)
alter table HoaDon add primary key (MaHD)
alter table HoaDon add foreign key (MaKH) references KhachHang(MaKH)
alter table HoaDon add foreign key (MaNV) references NhanVien(MaNV)

go
Create table ChiTietHD(
	MaHD varchar(10),
	MaSP varchar(10),
	SoLuong int,
	DonGia int
)
alter table ChiTietHD add foreign key (MaHD) references HoaDon (MaHD)
alter table ChiTietHD add foreign key (MaSP) references SanPham (MaSP)

go
Create table NhapLai(
	MaNL varchar(10) not null,
	NgayNL date,
	MaKH varchar(10),
	MaNV varchar(10),
	TongTien int,
)
alter table NhapLai add primary key (MaNL)
alter table NhapLai add foreign key (MaKH) references KhachHang(MaKH)
alter table NhapLai add foreign key (MaNV) references NhanVien(MaNV)

go
Create table ChiTietNL(
	MaNL varchar(10),
	MaSP varchar(10),
	SoLuong int,
	DonGia int
)
alter table ChiTietNL add foreign key (MaNL) references NhapLai(MaNL)
alter table ChiTietNL add foreign key (MaSP) references SanPham (MaSP)

Select Top(5) * from SanPham
order by SoLuong asc;











