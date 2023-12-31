-- 1.	Vi?t l?nh SQL �? t?o b?ng Khoa: Khoa(M?Khoa(Char,4), T�nKhoa(NVarChar,20, not null), 
-- Ng�yTh�nhL?p(Date), N?iDung��oT?o(NVarChar, 200), GhiCh�(NvarChar(Max)) ) 
CREATE TABLE Khoa (
MaKhoa CHAR (4), 
TenKhoa NVARCHAR (20) NOT NULL, 
NgayThanhLap DATE, 
NoiDungDaoTao NVARCHAR (200), 
GhiChu NVARCHAR( MAX ),
PRIMARY KEY (MaKhoa)
);

--2.	Vi?t l?nh SQL �? t?o b?ng L?p: M?Khoa l� kho� ngo?i tham kh?o �?n Khoa.M?Khoa. 
--L?p(M?L?p(Char, 6), T�nL?p(NVarChar, 20, not null), 
--Kh�aH?c(NVarChar, 4), GVCN(NVarChar, 50), M?Khoa(Char, 4), GhiCh�(NvarChar(Max)) ) 

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

-- 3.	Vi?t l?nh SQL �? t?o b?ng SinhVi�n: M?L?p l� kho� ngo?i tham kh?o �?n Lop.MaLop. 
--SinhVi�n(M?SV(Char, 8), H?SV(NVarChar, 50, not null),T�nSV(Short 
--Text, 20, not null), Gi?iT�nh(NVarChar, 4), Ng�ySinh(Date), Qu�Qu�n(NVarChar, 200), �?aCh?(NVarChar, 100), M?L?p(Char, 6), GhiCh�(NvarChar(Max)) ) 

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

-- 4.	Vi?t l?nh SQL �? t?o b?ng M�n h?c: M?Khoa l� kho� ngo?i tham kh?o �?n Khoa.M?Khoa. 
--M�nH?c(M?MH(Auto number), T�nMH(NVarChar,20, not null), 
--N?iDungMH(NVarChar, 200), M?Khoa(Char, 4), S?T�nCh?(int), S?T�?t(int), GhiCh�(NvarChar(Max)) ) 

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

--5.	Vi?t l?nh SQL �? t?o b?ng H?c: M?SV  l� kho� ngo?i tham kh?o �?n SinhVien.MaSV, M?MH l� kho� ngo?i tham kh?o �?n MonHoc.MaMH. 
--H?c(M?SV(Char, 8), M?MH(int), Ng�y��ngK?(Date), 
--Ng�yThi(Date), �i?mTrungB?nh(decimal(8,2)), GhiCh�(NvarChar(Max)) ) 

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

-- 6.	Vi?t l?nh SQL �? th�m c?t CMND (VarChar, 9) v�o b?ng SinhVi�n. 
ALTER TABLE SinhVien
ADD CMND VARCHAR(9)

--7.	Vi?t l?nh SQL �? th�m c?t DTDD (VarChar, 10) v�o b?ng SinhVi�n. 
ALTER TABLE SinhVien
ADD DTDD VARCHAR(10)

-- 8.	Vi?t l?nh SQL �? s?a thi?t k? c?t DTDD th�nh (VarChar, 12) c?a b?ng SinhVi�n. 
ALTER TABLE SINHVIEN
ALTER COLUMN DTDD VARCHAR(12)

-- 9.	Vi?t l?nh SQL �? xo� c?t DTDD c?a b?ng SinhVi�n. 
ALTER TABLE SinhVien
DROP COLUMN DTDD

-- 10.	Vi?t l?nh SQL �? t?o index idxT�nSV trong b?ng SinhVi�n. 
CREATE INDEX idxTenSV
ON SinhVien (TenSV)

-- 11.	Vi?t l?nh SQL �? t?o index idxSoCMND (index kh�ng tr�ng d? li?u) trong b?ng SinhVi�n. 
CREATE UNIQUE INDEX idxSoCMND
ON SinhVien (CMND)

--12.	T?o c�c query d�ng INSERT�VALUES� �? th�m th�ng tin v�o c�c b?ng d? li?u v? c� nh�n m?nh, 
--l?p, khoa, m�n h?c, h?c. Ch� ? c�c thu?c t�nh not null v� th? t? ch?y c�c c�u query n�y. 
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
-- 13.	Vi?t l?nh SQL �? x�a index idxT�nSV trong b?ng SinhVi�n. 
DROP INDEX idxTenSV 
ON SinhVien                                                                                                               

--14.	T?o c�c query d�ng DROP TABLE �? xo� c�c b?ng SinhVi�n, 
--L?p, Khoa, M�nH?c,H?c. Ch� ? th? t? th?c hi?n c�u l?nh v� c�c r�ng bu?c khi xo� b?ng
DROP TABLE IF EXISTS Hoc
DROP TABLE IF EXISTS MonHoc
DROP TABLE IF EXISTS SinhVien
DROP TABLE IF EXISTS Lop
DROP TABLE IF EXISTS Khoa
