-- 1.	Vi?t l?nh SQL ð? t?o b?ng Khoa: Khoa(M?Khoa(Char,4), TênKhoa(NVarChar,20, not null), 
-- NgàyThànhL?p(Date), N?iDungÐàoT?o(NVarChar, 200), GhiChú(NvarChar(Max)) ) 
CREATE TABLE Khoa (
MaKhoa CHAR (4), 
TenKhoa NVARCHAR (20) NOT NULL, 
NgayThanhLap DATE, 
NoiDungDaoTao NVARCHAR (200), 
GhiChu NVARCHAR( MAX ),
PRIMARY KEY (MaKhoa)
);

--2.	Vi?t l?nh SQL ð? t?o b?ng L?p: M?Khoa là khoá ngo?i tham kh?o ð?n Khoa.M?Khoa. 
--L?p(M?L?p(Char, 6), TênL?p(NVarChar, 20, not null), 
--KhóaH?c(NVarChar, 4), GVCN(NVarChar, 50), M?Khoa(Char, 4), GhiChú(NvarChar(Max)) ) 

CREATE TABLE Lop (
MaLop CHAR ( 6 ), 
TenLop NVARCHAR (20) NOT NULL ,
KhoaHoc NVARCHAR (4), 
GVCN NVARCHAR (50),
MaKhoa CHAR(4), 
GhiChu NVARCHAR(MAX),
PRIMARY KEY (MaLop),
FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa),
); 

-- 3.	Vi?t l?nh SQL ð? t?o b?ng SinhViên: M?L?p là khoá ngo?i tham kh?o ð?n Lop.MaLop. 
--SinhViên(M?SV(Char, 8), H?SV(NVarChar, 50, not null),TênSV(Short 
--Text, 20, not null), Gi?iTính(NVarChar, 4), NgàySinh(Date), QuêQuán(NVarChar, 200), Ð?aCh?(NVarChar, 100), M?L?p(Char, 6), GhiChú(NvarChar(Max)) ) 

CREATE TABLE SinhVien (
MaSV  CHAR (8),
HoSV NVARCHAR ( 50)  NOT NULL,
TenSV NVARCHAR ( 20) NOT NULL,
GioiTinh NVARCHAR (4), 
NgaySinh DATE, 
QueQuan NVARCHAR (200), 
DiaChi NVARCHAR (100), 
MaLop CHAR( 6), 
GhiChu NVARCHAR(MAX) 
PRIMARY KEY (MaSV) 
FOREIGN KEY (MaLop) REFERENCES LOP(MaLop),
);

-- 4.	Vi?t l?nh SQL ð? t?o b?ng Môn h?c: M?Khoa là khoá ngo?i tham kh?o ð?n Khoa.M?Khoa. 
--MônH?c(M?MH(Auto number), TênMH(NVarChar,20, not null), 
--N?iDungMH(NVarChar, 200), M?Khoa(Char, 4), S?TínCh?(int), S?Tí?t(int), GhiChú(NvarChar(Max)) ) 

CREATE TABLE MonHoc (
MaMH INT IDENTITY(1,1),
TenMH NVARCHAR(20) NOT NULL, 
NoiDungMH NVARCHAR (200), 
MaKhoa CHAR (4), 
SoTinChi INT, 
SoTiet INT, 
GhiChu NVARCHAR(MAX)
PRIMARY KEY (MaMH)
FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa),
);

--5.	Vi?t l?nh SQL ð? t?o b?ng H?c: M?SV  là khoá ngo?i tham kh?o ð?n SinhVien.MaSV, M?MH là khoá ngo?i tham kh?o ð?n MonHoc.MaMH. 
--H?c(M?SV(Char, 8), M?MH(int), NgàyÐãngK?(Date), 
--NgàyThi(Date), Ði?mTrungB?nh(decimal(8,2)), GhiChú(NvarChar(Max)) ) 

CREATE TABLE Hoc(
	MaSV CHAR(8),
	MaMH INT,
	NgayDangKy DATE,
	NgayThi DATE,
	DiemTrungBinh DECIMAL(8,2),
	GhiChu NVARCHAR(MAX),
	PRIMARY KEY (MaSV,MaMH),
	FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
	FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH),
);

-- 6.	Vi?t l?nh SQL ð? thêm c?t CMND (VarChar, 9) vào b?ng SinhViên. 
ALTER TABLE SinhVien
ADD CMND VARCHAR(9)

--7.	Vi?t l?nh SQL ð? thêm c?t DTDD (VarChar, 10) vào b?ng SinhViên. 
ALTER TABLE SinhVien
ADD DTDD VARCHAR(10)

-- 8.	Vi?t l?nh SQL ð? s?a thi?t k? c?t DTDD thành (VarChar, 12) c?a b?ng SinhViên. 
ALTER TABLE SINHVIEN
ALTER COLUMN DTDD VARCHAR(12)

-- 9.	Vi?t l?nh SQL ð? xoá c?t DTDD c?a b?ng SinhViên. 
ALTER TABLE SinhVien
DROP COLUMN DTDD

-- 10.	Vi?t l?nh SQL ð? t?o index idxTênSV trong b?ng SinhViên. 
CREATE INDEX idxTenSV
ON SinhVien (TenSV)

-- 11.	Vi?t l?nh SQL ð? t?o index idxSoCMND (index không trùng d? li?u) trong b?ng SinhViên. 
CREATE UNIQUE INDEX idxSoCMND
ON SinhVien (CMND)

--12.	T?o các query dùng INSERT…VALUES… ð? thêm thông tin vào các b?ng d? li?u v? cá nhân m?nh, 
--l?p, khoa, môn h?c, h?c. Chú ? các thu?c tính not null và th? t? ch?y các câu query này. 
--Table Khoa
INSERT INTO Khoa(MaKhoa, TenKhoa, NgayThanhLap, NoiDungDaoTao, GhiChu)
VALUES 
('QTKD' , 'QUAN TRI KINH DOANH', '2000-12-03', 'AA', ''),
('CNTT' , 'CONG NGHE THONG TIN', '2008-10-04', 'FF',''),
('NNA'  , 'NGON NGU ANH',        '2005-12-25', 'NONE', '')
select * from Khoa;
--TABLE LOP
INSERT INTO Lop(MaLop,TenLop, KhoaHoc, GVCN, MaKhoa, GhiChu)
VALUES
('QTKD01', 'QTKINHDOANH', 'KH21', 'NGUYEN VAN A', 'QTKD',''),
('IT02C', 'ITECH', 'KH21', 'VO THI HONG T', 'CNTT', 'HP'),
('NNA01C', 'NNANH', 'KH21', 'TRAN THI C', 'NNA', '');
select * from Lop;
-- TABLE SINHVIEN
INSERT INTO SinhVien (MaSV, HoSV, TenSV, GioiTinh, NgaySinh, QueQuan, DiaChi, MaLop, GhiChu, CMND)
VALUES
('K21IT01C', 'PHAN', 'D', 'NU', '2003-12-25', 'HO CHI MINH', '435 LE VAN SY', 'QTKD01', NULL, '210424525'),
('K21QT03', 'NGUYEN', 'E', 'NAM', '2003-11-22', 'DONG NAI', '21 VO VAN TAN', 'IT02C', NULL, '213452345'),
('K21NNA06', 'VO', 'G', 'NU', '2003-02-12', 'CA MAU', '57 NGUYEN SON', 'NNA01C', NULL, '221341234');
select * from SinhVien;

-- TABLE MONHOC
INSERT INTO MonHoc(TenMH, NoiDungMH, MaKhoa, SoTinChi, SoTiet, GhiChu)
VALUES
('KTLTRINH', 'aa', 'CNTT', 3, 40, ''),
('TRIETHOC', '', 'QTKD', 4, 40, ''),
('ADINTERPRETATION','', 'NNA', 4, 30, '');
select * from MonHoc;
-- TABLE HOC
INSERT INTO Hoc (MaSV,MaMH ,NgayDangKy ,NgayThi,DiemTrungBinh,GhiChu)
VALUES ('K21IT01C', 4, '2023-01-03', '2023-04-23', 8.2, NULL),
		('K21QT03', 5, '2023-01-12', '2023-04-25', 9.0, NULL),
		('K21NNA06', 6, '2023-01-08', '2023-05-06', 6.8,NULL);
select * from Hoc;
-- 13.	Vi?t l?nh SQL ð? xóa index idxTênSV trong b?ng SinhViên. 
DROP INDEX idxTenSV 
ON SinhVien                                                                                                               

--14.	T?o các query dùng DROP TABLE ð? xoá các b?ng SinhViên, 
--L?p, Khoa, MônH?c,H?c. Chú ? th? t? th?c hi?n câu l?nh và các ràng bu?c khi xoá b?ng
DROP TABLE IF EXISTS Hoc
DROP TABLE IF EXISTS MonHoc
DROP TABLE IF EXISTS SinhVien
DROP TABLE IF EXISTS Lop
DROP TABLE IF EXISTS Khoa
