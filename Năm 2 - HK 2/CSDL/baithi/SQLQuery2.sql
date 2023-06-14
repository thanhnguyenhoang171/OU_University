--Câu 1:

create table ChiNhanh (
	MaSoChiNhanh int NOT NULL PRIMARY KEY,
	TenChiNhanh nvarchar(50) NOT NULL,
	DiaChi nvarchar (100),
);

create table PhongBan (
	MaSoPhongBan int NOT NULL PRIMARY KEY ,
	TenPhongBan nvarchar(50) NOT NULL,
	MaSoChiNhanh int FOREIGN KEY REFERENCES ChiNhanh (MaSoChiNhanh)
);

create table ViTriLamViec (
	 MaSoViTri int NOT NULL PRIMARY KEY,
	 TenViTri  nvarchar(50) NOT NULL,
	 MaSoPhongBan int FOREIGN KEY REFERENCES PhongBan(MaSoPhongBan)
);

create table NhanVien (
	MaSoNhanVien nvarchar(20) PRIMARY KEY NOT NULL,
	HoTenNhanVien nvarchar(50) NOT NULL,
	GioiTinh nvarchar(10),
	NgaySinh date,
	DiaChi nvarchar(100),
	QueQuan nvarchar(50),
	CMND nvarchar(20),
	SoDienThoai nvarChar(20),
	MaSoViTri int FOREIGN KEY REFERENCES ViTriLamViec(MaSoViTri),
	NgayBatDau date,
	NgayKetThuc date,
	MaSoChiNhanh int FOREIGN KEY REFERENCES ChiNhanh (MaSoChiNhanh)
);
create table MoRongChiNhanh (
	MaSoChiNhanh int FOREIGN KEY REFERENCES ChiNhanh (MaSoChiNhanh),
	TenChiNhanh nvarchar(50),
	DiaChi nvarchar(100)
);


INSERT INTO NhanVien (MaSoNhanVien, HoTenNhanVien, NgaySinh, DiaChi, QueQuan, CMND, SoDienThoai, MaSoViTri, NgayBatDau, NgayKetThuc, MaSoChiNhanh)
VALUES
('T00234', 'Nguyễn Văn A', '1990-01-01', '123 Nguyễn Văn A, Quận 1, TP.HCM', 'TP.HCM', '123456789', '22345766',2, '2022-01-01', '2023-03-04', 1),
('T00236', 'Trần Thị B', '1995-02-02', '456 Trần Thị B, Quận 2, TP.HCM', 'TP.HCM', '987654321', '22346323',3,  '2022-02-01', '2024-05-01', 1),
('T00237', 'Lê Văn C', '1992-03-03', '789 Lê Văn C, Quận 3, TP.HCM', 'TP.HCM', '456123789', '332462346',4,  '2022-03-01', '2025-04-10', 2),
('T00238', 'Phạm Thị D', '1993-04-04', '111 Phạm Thị D, Quận 4, TP.HCM', 'TP.HCM', '789456123', '43246326',2,   '2022-04-01', '2026-01-01', 2),
('T00239', 'Hoàng Văn E', '1994-05-05', '222 Hoàng Văn E, Quận 5, TP.HCM', 'TP.HCM', '369258147', '2234623',4,   '2022-05-01', '2023-04-03', 3),
('T00240', 'Trần Văn F', '1995-06-06', '333 Trần Văn F, Quận 6, TP.HCM', 'TP.HCM', '258369147', '33462332',3,  '2022-06-01', '2023-04-03', 3),
('T00241', 'Lê Thị G', '1996-07-07', '444 Lê Thị G, Quận 7, TP.HCM', 'TP.HCM', '123789456', '3234634',2,  '2022-07-01', '2023-04-03', 2),
('T00242', 'Trần Văn H', '1997-08-08', '555 Trần Văn H, Quận 8, TP.HCM', 'TP.HCM', '789456123', '43463426',4,  '2022-08-01', '2023-04-03', 3);


INSERT INTO ViTriLamViec(MaSoViTri, TenViTri, MaSoPhongBan)
VALUES 
(2, 'Trưởng phòng kế toán', 2),
(3, 'Trưởng phòng thiết kế',4),
(4, 'Trưởng phòng thi công',3);


INSERT INTO ChiNhanh (MaSoChiNhanh, TenChiNhanh, DiaChi)
VALUES (1, 'Sài Gòn', '123 Nguyễn Huệ, Quận 1, TP.HCM'),
(2, 'Đà Nẵng', '456 Trần Phú, Quận Hải Châu, TP.Đà Nẵng'),
(3, 'Hà Nội', '789 Trần Duy Hưng, Quận Cầu Giấy, TP.Hà Nội');

INSERT INTO PhongBan (MaSoPhongBan, TenPhongBan, MaSoChiNhanh)
VALUES (1, 'Phong Thiet Ke', 1),
(2, 'Phong Ke Toan', 1),
(3, 'Phong Thi Cong', 1),
(4, 'Phong Thiet Ke', 2),
(5, 'Phong Ke Toan', 2),
(6, 'Phong Thi Cong', 2),
(7, 'Phong Thiet Ke', 3),
(8, 'Phong Ke Toan', 3),
(9, 'Phong Thi Cong', 3);

select  * from NhanVien;
select * from ChiNhanh;
select * from PhongBan;
select * from ViTriLamViec;
select * from MoRongChiNhanh;

--DROP TABLE IF EXISTS MoRongChiNhanh;
--DROP TABLE IF EXISTS NhanVien;
--DROP TABLE IF EXISTS PhongBan;
--DROP TABLE IF EXISTS ChiNhanh;
--DROP TABLE IF EXISTS ViTriLamViec;

--Câu 2:
select n.HoTenNhanVien,p.TenPhongBan, v.TenViTri, c.TenChiNhanh, n.NgayBatDau, n.NgayKetThuc
from NhanVien n, PhongBan p, ChiNhanh c, ViTriLamViec v
join NhanVien n on n.MaSoNhanvien= 
where
	n.MaSoNhanVien='T00234'
order by
	n.NgayBatDau DESC;


