use Northwind
--MAKE-TABLE QUERY 
-- 1.	Tạo một query đặt tên là TimKhachHangMy (tìm khách hàng Mỹ). Khi chạy,
-- query này sẽ tạo ra một table mới có tên CacKhachHangMy, lấy tất cả các field của bảng Customers.
SELECT *
INTO CacKhachHangMy
FROM Customers
WHERE Country = 'USA';
-- 2.	Tạo một query đặt tên là Tim5NhanVienGioi (tìm 5 nhân viên giỏi). Khi chạy, query này sẽ tạo ra một table mới có tên 5NhanVienGioi.
--Bảng này liệt kê danh sách 5 nhân viên phụ trách nhiều đơn đặt hàng nhất. Các thông tin gồm: mã nhân viên, họ và tên nhân viên (1 cột),
-- tổng số lượng các đơn đặt hàng đã phụ trách. Danh sách sắp xếp giảm dần theo cột tổng số lượng các đơn đặt hàng đã phụ trách. 
CREATE TABLE NamNhanVienGioi (
  MaNhanVien int,
  HoTen nvarchar(255),
  TongSoDonDatHang int
);

INSERT INTO NamNhanVienGioi (MaNhanVien, HoTen, TongSoDonDatHang)
SELECT TOP 5 
  Orders.EmployeeID AS MaNhanVien,
  Employees.LastName + ' ' + Employees.FirstName AS HoTen,
  COUNT(Orders.OrderID) AS TongSoDonDatHang
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.EmployeeID, Employees.LastName, Employees.FirstName
ORDER BY COUNT(Orders.OrderID) DESC;

SELECT * FROM NamNhanVienGioi;
-- 3.	Tạo một query đặt tên là Tim10KhachHang (tìm 10 khách hàng).
--Khi chạy, query này sẽ tạo ra một table mới có tên 10KhachHang.
--Bảng này liệt kê danh sách 10 khách hàng có nhiều đơn đặt hàng nhất. 
--Các thông tin gồm: mã khách hàng, tên công ty, địa chỉ đầy đủ (1 cột gồm địa chỉ, thành phố và quốc gia),
-- và tổng số lượng các đơn đặt hàng đã đặt. Danh sách sắp xếp giảm dần theo cột tổng số lượng các đơn đặt hàng đã đặt. 
SELECT TOP 10
	c.CustomerID,
	c.CompanyName,
	CONCAT (c.Address, ', ', c.City, ', ', c.Country) AS DiaChiDayDu,
	COUNT (o.OrderID) AS TongSoDonDatHang
INTO MuoiKhachHang
FROM Customers c
INNER JOIN Orders o ON o.CustomerID= c.CustomerID
GROUP BY c.CustomerID, c.CompanyName, CONCAT (c.Address, ', ', c.City, ', ', c.Country)
ORDER BY TongSoDonDatHang DESC;

-- 4.	Tạo một query đặt tên là TimTop5QGMuaHang (tìm top 5 quốc gia mua hàng). Khi chạy, query này sẽ tạo ra một table mới có tên Top5QGMuaHang.
-- Bảng này liệt kê danh sách top 5 quốc gia có khách hàng mua nhiều sản phẩm nhất. Gợi ý:  (Count(ProductID). 
SELECT TOP 5
	o.ShipCountry AS QuocGia,
	COUNT(od.ProductID) AS SoLuongSanPham
INTO Top5QGMuaHang
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID=od.OrderID
GROUP BY o.ShipCountry
ORDER BY SoLuongSanPham DESC;

-- 5.	Tạo một query đặt tên là Tim5QGItMuaHang (tìm 5 quốc gia ít mua hàng).
--Khi chạy, query này sẽ tạo ra một table mới có tên NamQGItMuaHang. Bảng này liệt kê danh sách 5 quốc gia có khách hàng mua ít sản phẩm nhất. Gợi ý: (Count(ProductID). 
SELECT TOP 5 
	o.ShipCountry AS QuocGia,
	COUNT (od.ProductID) AS SoLuongSanPham
INTO NamQGItMuaHang
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID=od.OrderID
GROUP BY o.ShipCountry
ORDER BY SoLuongSanPham ASC;

--SELECT TOP 5 Customers.Country, COUNT (OrderDetails.ProductID) AS SoLuongSanPham 
--INTO NamQGItMuaHang
--FROM Customers
--INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
--INNER JOIN OrderDetails ON Orders.OrderID=OrderDetails.OrderID
--GROUP BY Customers.Country
--ORDER BY SoLuongSanPham ASC;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE QUERY
-- 1.	Hãy tạo một query đặt tên là SuaTenQuocGia1 (sửa tên quốc gia) để khi chạy query này sẽ sửa lại tên quốc gia trong bảng CUSTOMERS: “USA” sửa thành “Mỹ”. 
-- Tên các quốc gia khác vẫn giữ nguyên. 
UPDATE Customers
SET Country = 'My'
WHERE Country = 'USA'

SELECT Country
FROM Customers

-- 2.	Hãy tạo một query đặt tên là SuaTenQuocGia2 (sửa tên quốc gia) để khi chạy query này
--sẽ sửa lại tên quốc gia trong bảng CUSTOMERS: “Germany” sửa thành “Đức” và “France” sửa thành “Pháp”. Tên các quốc gia khác vẫn giữ nguyên. 
UPDATE Customers 
SET Country =
	CASE 
		WHEN Country='Germany' THEN 'Duc'
		WHEN Country='France' THEN 'Phap'
		ELSE Country
	END;

SELECT Country FROM Customers

-- 3.	Hãy tạo một query đặt tên là SuaTenQuocGia3 (sửa tên quốc gia) để khi chạy query này sẽ sửa lại tên quốc gia trong 
-- 2 bảng CUSTOMERS và SUPPLIERS: “Germany” sửa thành “Đức” và “France” sửa thành “Pháp”. Tên các quốc gia khác vẫn giữ nguyên. 
UPDATE Customers 
SET Country =
	CASE 
		WHEN Country='Germany' THEN 'Duc'
		WHEN Country='France' THEN 'Phap'
		ELSE Country
	END;

SELECT Country FROM Customers

UPDATE Suppliers 
SET Country =
	CASE 
		WHEN Country='Germany' THEN 'Duc'
		WHEN Country='France' THEN 'Phap'
		ELSE Country
	END;

SELECT Country FROM Suppliers

-- 4.	Hãy tạo một query đặt tên là SuaTenLoaiSP (sửa tên loại sản phẩm) để khi chạy query này sẽ sửa tên loại sản phẩm trong bảng 
-- LOAISANPHAM: “Beverages” sửa thành “nước giải khát” và “Condiments” sửa thành “gia vị”. Tên các loại sản phẩm khác vẫn giữ nguyên. 
USE Northwind;

UPDATE LOAISANPHAM
SET TenLoaiSP = 
    CASE 
        WHEN TenLoaiSP = 'Beverages' THEN 'nước giải khát'
        WHEN TenLoaiSP = 'Condiments' THEN 'gia vị'
        ELSE TenLoaiSP
    END
WHERE TenLoaiSP IN ('Beverages', 'Condiments');

-- 5.	Hãy tạo một query đặt tên là SuaTenLoaiSP (sửa tên loại sản phẩm) để khi chạy query này sẽ sửa tên loại sản phẩm trong 
-- bảng LOAISANPHAM: “Confections” sửa thành “bánh kẹo” và “Seafood” sửa thành “hải sản”.
-- Tên các loại sản phẩm khác vẫn giữ nguyên. 
UPDATE LOAISANPHAM
SET TenLoaiSP =
	CASE 
		WHEN TenLoaiSP = 'Confections' THEN 'bánh kẹo'
		WHEN TenLoaiSP = 'Seafood' THEN 'hải sản'
		ELSE TenLoaiSP
	END
WHERE TenLoaiSP IN ('Confections', 'Seafood');
-- 6.	Hãy tạo một query đặt tên là SuaPostalCode (sửa mã bưu điện) để khi chạy query này sẽ sửa mã bưu điện của các 
-- khách hàng Germany: sửa 2 số đầu thành 18. Mã bưu điện của các khách hàng quốc gia khác giữ nguyên. use Northwind
--MAKE-TABLE QUERY 
-- 1.	Tạo một query đặt tên là TimKhachHangMy (tìm khách hàng Mỹ). Khi chạy,
-- query này sẽ tạo ra một table mới có tên CacKhachHangMy, lấy tất cả các field của bảng Customers.
SELECT *
INTO CacKhachHangMy
FROM Customers
WHERE Country = 'USA';
-- 2.	Tạo một query đặt tên là Tim5NhanVienGioi (tìm 5 nhân viên giỏi). Khi chạy, query này sẽ tạo ra một table mới có tên 5NhanVienGioi.
--Bảng này liệt kê danh sách 5 nhân viên phụ trách nhiều đơn đặt hàng nhất. Các thông tin gồm: mã nhân viên, họ và tên nhân viên (1 cột),
-- tổng số lượng các đơn đặt hàng đã phụ trách. Danh sách sắp xếp giảm dần theo cột tổng số lượng các đơn đặt hàng đã phụ trách. 
CREATE TABLE NamNhanVienGioi (
  MaNhanVien int,
  HoTen nvarchar(255),
  TongSoDonDatHang int
);

INSERT INTO NamNhanVienGioi (MaNhanVien, HoTen, TongSoDonDatHang)
SELECT TOP 5 
  Orders.EmployeeID AS MaNhanVien,
  Employees.LastName + ' ' + Employees.FirstName AS HoTen,
  COUNT(Orders.OrderID) AS TongSoDonDatHang
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.EmployeeID, Employees.LastName, Employees.FirstName
ORDER BY COUNT(Orders.OrderID) DESC;

SELECT * FROM NamNhanVienGioi;
-- 3.	Tạo một query đặt tên là Tim10KhachHang (tìm 10 khách hàng).
--Khi chạy, query này sẽ tạo ra một table mới có tên 10KhachHang.
--Bảng này liệt kê danh sách 10 khách hàng có nhiều đơn đặt hàng nhất. 
--Các thông tin gồm: mã khách hàng, tên công ty, địa chỉ đầy đủ (1 cột gồm địa chỉ, thành phố và quốc gia),
-- và tổng số lượng các đơn đặt hàng đã đặt. Danh sách sắp xếp giảm dần theo cột tổng số lượng các đơn đặt hàng đã đặt. 
SELECT TOP 10
	c.CustomerID,
	c.CompanyName,
	CONCAT (c.Address, ', ', c.City, ', ', c.Country) AS DiaChiDayDu,
	COUNT (o.OrderID) AS TongSoDonDatHang
INTO MuoiKhachHang
FROM Customers c
INNER JOIN Orders o ON o.CustomerID= c.CustomerID
GROUP BY c.CustomerID, c.CompanyName, CONCAT (c.Address, ', ', c.City, ', ', c.Country)
ORDER BY TongSoDonDatHang DESC;

-- 4.	Tạo một query đặt tên là TimTop5QGMuaHang (tìm top 5 quốc gia mua hàng). Khi chạy, query này sẽ tạo ra một table mới có tên Top5QGMuaHang.
-- Bảng này liệt kê danh sách top 5 quốc gia có khách hàng mua nhiều sản phẩm nhất. Gợi ý:  (Count(ProductID). 
SELECT TOP 5
	o.ShipCountry AS QuocGia,
	COUNT(od.ProductID) AS SoLuongSanPham
INTO Top5QGMuaHang
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID=od.OrderID
GROUP BY o.ShipCountry
ORDER BY SoLuongSanPham DESC;

-- 5.	Tạo một query đặt tên là Tim5QGItMuaHang (tìm 5 quốc gia ít mua hàng).
--Khi chạy, query này sẽ tạo ra một table mới có tên NamQGItMuaHang. Bảng này liệt kê danh sách 5 quốc gia có khách hàng mua ít sản phẩm nhất. Gợi ý: (Count(ProductID). 
SELECT TOP 5 
	o.ShipCountry AS QuocGia,
	COUNT (od.ProductID) AS SoLuongSanPham
INTO NamQGItMuaHang
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID=od.OrderID
GROUP BY o.ShipCountry
ORDER BY SoLuongSanPham ASC;

--SELECT TOP 5 Customers.Country, COUNT (OrderDetails.ProductID) AS SoLuongSanPham 
--INTO NamQGItMuaHang
--FROM Customers
--INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
--INNER JOIN OrderDetails ON Orders.OrderID=OrderDetails.OrderID
--GROUP BY Customers.Country
--ORDER BY SoLuongSanPham ASC;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE QUERY
-- 1.	Hãy tạo một query đặt tên là SuaTenQuocGia1 (sửa tên quốc gia) để khi chạy query này sẽ sửa lại tên quốc gia trong bảng CUSTOMERS: “USA” sửa thành “Mỹ”. 
-- Tên các quốc gia khác vẫn giữ nguyên. 
UPDATE Customers
SET Country = 'My'
WHERE Country = 'USA'

SELECT Country
FROM Customers

-- 2.	Hãy tạo một query đặt tên là SuaTenQuocGia2 (sửa tên quốc gia) để khi chạy query này
--sẽ sửa lại tên quốc gia trong bảng CUSTOMERS: “Germany” sửa thành “Đức” và “France” sửa thành “Pháp”. Tên các quốc gia khác vẫn giữ nguyên. 
UPDATE Customers 
SET Country =
	CASE 
		WHEN Country='Germany' THEN 'Duc'
		WHEN Country='France' THEN 'Phap'
		ELSE Country
	END;

SELECT Country FROM Customers

-- 3.	Hãy tạo một query đặt tên là SuaTenQuocGia3 (sửa tên quốc gia) để khi chạy query này sẽ sửa lại tên quốc gia trong 
-- 2 bảng CUSTOMERS và SUPPLIERS: “Germany” sửa thành “Đức” và “France” sửa thành “Pháp”. Tên các quốc gia khác vẫn giữ nguyên. 
UPDATE Customers 
SET Country =
	CASE 
		WHEN Country='Germany' THEN 'Duc'
		WHEN Country='France' THEN 'Phap'
		ELSE Country
	END;

SELECT Country FROM Customers

UPDATE Suppliers 
SET Country =
	CASE 
		WHEN Country='Germany' THEN 'Duc'
		WHEN Country='France' THEN 'Phap'
		ELSE Country
	END;

SELECT Country FROM Suppliers

-- 4.	Hãy tạo một query đặt tên là SuaTenLoaiSP (sửa tên loại sản phẩm) để khi chạy query này sẽ sửa tên loại sản phẩm trong bảng 
-- LOAISANPHAM: “Beverages” sửa thành “nước giải khát” và “Condiments” sửa thành “gia vị”. Tên các loại sản phẩm khác vẫn giữ nguyên. 
USE Northwind;

UPDATE LOAISANPHAM
SET TenLoaiSP = 
    CASE 
        WHEN TenLoaiSP = 'Beverages' THEN 'nước giải khát'
        WHEN TenLoaiSP = 'Condiments' THEN 'gia vị'
        ELSE TenLoaiSP
    END
WHERE TenLoaiSP IN ('Beverages', 'Condiments');

-- 5.	Hãy tạo một query đặt tên là SuaTenLoaiSP (sửa tên loại sản phẩm) để khi chạy query này sẽ sửa tên loại sản phẩm trong 
-- bảng LOAISANPHAM: “Confections” sửa thành “bánh kẹo” và “Seafood” sửa thành “hải sản”.
-- Tên các loại sản phẩm khác vẫn giữ nguyên. 
UPDATE LOAISANPHAM
SET TenLoaiSP =
	CASE 
		WHEN TenLoaiSP = 'Confections' THEN 'bánh kẹo'
		WHEN TenLoaiSP = 'Seafood' THEN 'hải sản'
		ELSE TenLoaiSP
	END
WHERE TenLoaiSP IN ('Confections', 'Seafood');
select *
from Products
-- 6.	Hãy tạo một query đặt tên là SuaPostalCode (sửa mã bưu điện) để khi chạy query này sẽ sửa mã bưu điện của các 
-- khách hàng Germany: sửa 2 số đầu thành 18. Mã bưu điện của các khách hàng quốc gia khác giữ nguyên.
UPDATE Customers
Set PostalCode = CONCAT('18', SUBSTRING(postalcode,0, 2))
WHERE Country = 'Duc';

-- APPEND QUERY 
-- 	Append query chia làm 2 loại nhỏ: 
-- 	1). APPEND QUERY THÊM 1 HÀNG DỮ LIỆU 
-- 1.	Tạo một Append Query đặt tên là Them1LoaiSPa. Khi chạy query mới này thì ta thêm một record vào table Categories. Thông tin thêm vào là: 
--	   	CategoryName: Văn phòng phẩm 
--	   	Description: Sách, vở, giấy, bút, mực 
-- Mở bảng Categories để xem các thay đổi sau khi ta chạy query. 
INSERT INTO Categories (CategoryName, Description)
VALUES ('Văn phòng phẩm', 'Sách, vở, giấy, bút, mực');
select CategoryName, Description
from Categories

-- 2.	Hãy tạo một query đặt tên là Them1LoaiSPb (thêm loại sản phẩm). 
-- Query này sẽ yêu cầu người dùng cung cấp thông tin về tên loại sản phẩm (CategoryName) 
-- và miêu tả sản phẩm (Description), sau đó sẽ thêm một record vào table Categories với các thông tin vừa nhập. 
DECLARE	@CategoryName nvarchar(15), @Description nvarchar(255)
SET @CategoryName = 'Bacon'
SET @Description = 'description bacon'
INSERT INTO Categories (CategoryName, Description)
VALUES (@CategoryName, @Description)	

-- 3.	Hãy tạo một query đặt tên là ThemMotKhachHang (thêm một khách hàng). 
-- Khi chạy, query này sẽ thêm một record vào table Customers với các thông tin cá nhân của các anh chị. 
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('NEWID', 'VinaSuki', 'Ikyy', 'Sales', '140/4', 'HCM', 'Dong Nai', '0157', 'Vietnam', '0144546777', '3253225');
select *
from Customers

-- 4.	Hãy tạo một query đặt tên là ThemMotNhanVien (thêm một nhân viên). 
-- Khi chạy, query này sẽ thêm một record vào table Employees với các thông tin cá nhân của các anh chị. 
INSERT TO Employees(LastName, FirstName, Address, City, Country)
VALUES(Yuki, Han, 325/6, Tokyo, Japan);

-- 5.	Hãy tạo một query đặt tên là ThemMotDonHang (thêm một đơn hàng).7
-- Khi chạy, query này sẽ thêm một record vào table Employees với các thông tin do người dùng nhập khi chạy query. 
DECLARE @LastName nvarchar(20)
DECLARE @FirstName nvarchar(15)
DECLARE @Address nvarchar(50)
DECLARE @City nvarchar(15)
DECLARE @Country nvarchar(20)
SET @LastName='VuKi'
SET @FirstName='Lori'
SET @Address='432'
SET @City='Belin'
SET @Country='France'
INSERT INTO Employees(LastName, FirstName, Address, City, Country)
	VALUES(@LastName,@FirstName,@Address,@City,@Country)
-- 2). APPEND QUERY THÊM NHIỀU HÀNG DỮ LIỆU 
-- Copy thiết kế (khơng lấy dữ liệu) bảng Customers v lưu thành bảng KhachHang 

-- 6.	Hãy tạo một query đặt tên là LayDLKhachHangMy (lấy dữ liệu khách hàng Mỹ). 
-- Khi chạy, query này sẽ thêm một số record là khách hàng Mỹ từ bảng Custmers vào bảng KhachHang. 
SELECT* INTO KhachHang
FROM Customers
WHERE Country='USA'

-- 7.	Hãy tạo một query đặt tên là LayDLKhachHangQuy (lấy dữ liệu khách hàng quý). 
-- Khi chạy, query này sẽ thêm khoảng 10 record là khách hàng có nhiều đơn hàng nhất từ bảng Custmers vào bảng KhachHang. 
INSERT INTO KhachHang
SELECT * FROM Customers
WHERE CustomerID in (select top 10 Customers.CustomerID
					from Customers, Orders
					where Customers.CustomerID=Orders.CustomerID
					group by Customers.CustomerID order by count(*) desc)
	and CustomerID not in (select CustomerID from KhachHang)


--  DELETE QUERY 
-- 1.	Hãy tạo một query đặt tên là Xoa1LoaiSP để xóa 1 record sinh ra do chạy câu 1 append query. 
DELETE FROM Categories
WHERE CategoryName='Văn phòng phẩm'

-- 2.	Hãy tạo một query đặt tên là XoaCacKHMy để xóa các record sinh ra do chạy câu 6 append query. 
DELETE FROM Customers
WHERE Country='USA'

--3.	Hãy tạo một query đặt tên là XoaCacKHQuy để xóa các record sinh ra do chạy câu 7 append query. 
DELETE FROM KhachHang
WHERE CustomerID in (select top 10 Customers.CustomerID
					from Customers, Orders
					where Customers.CustomerID=Orders.CustomerID
					group by Customers.CustomerID order by count(*) desc)

-- 4.	Hãy tạo một query đặt tên là XoaCacKHKhongMuaHang để xóa các record lưu các khách hàng chưa mua đơn hàng nào. 
SELECT * INTO Customers_Backup FROM Customers
SELECT * FROM Customers_Backup
SELECT CustomerID from Orders
SELECT DISTINCT CustomerID FROM Orders

DELETE FROM Customers_Backup
WHERE CustomerID not in (SELECT DISTINCT CustomerID FROM Orders)

SELECT * FROM Customers_Backup

-- . 5.  Hãy tạo một query đặt tên là XoaCacLoaiHangKhongCoSP để xóa các record lưu các loại hàng chưa có sản phẩm nào. 
select * into Categories_Backup from Categories
select * from Categories_Backup
select CategoryID from Products
select distinct CategoryID from Products

delete from Categories_Backup
where CategoryID not in (select distinct CategoryID from Products)

select * from Categories_Backup

-- CROSS-TAB QUERY 
-- 1.	Hãy tạo một query đặt tên là ThongKeSPTheoNam (thống kê sản phẩm theo năm).
-- Query này sẽ yêu cầu người dùng cung cấp năm bắt đầu thống kê, năm kết thúc thống kê sau đó 
-- lập một danh sách trong đó: Các hàng là tên các sản phẩm, các cột là lần lượt các năm liên tiếp trong khoảng các năm vừa nhập
--, giá trị trong các ô là số lượng sản phẩm đã bán được. 


DECLARE @StartDate datetime
DECLARE @EndDate datetime

SET @StartDate = '1997'
SET @EndDate = '1998'

SELECT ProductName, [1996], [1997],[1998]
FROM (SELECT ProductName, SUM(Quantity) AS 'TongSP', YEAR (OrderDate) 'Nam'
		FROM Products, Orders,[Order Details] OD
		WHERE Products.ProductID=OD.ProductID AND Orders.OrderID=OD.OrderID AND YEAR (OrderDate) BETWEEN @StartDate AND @EndDate
		GROUP BY ProductName ,YEAR (OrderDate)) a
	
	PIVOT 
	( SUM (TongSP) FOR Nam IN ([1996], [1997],[1998])
	)b


--2.	Hãy tạo một query đặt tên là ThongKeSPTheoThang (thống kê sản phẩm theo tháng). 
--Query này sẽ yêu cầu người dùng cung cấp tháng bắt đầu thống kê, tháng kết thúc thống kê sau đó lập một danh sách trong đó:
--Các hàng là tên các sản phẩm, các cột là lần lượt các tháng liên tiếp trong khoảng các tháng vừa nhập của năm 1997,
--giá trị trong các ô là số lượng sản phẩm đã bán được. 
USE Northwind
DECLARE @StartDate datetime
DECLARE @EndDate datetime

SET @StartDate = '1996-01-01'
SET @EndDate = '1998-12-01'
select ProductName, year (OrderDate) as 'Nam', sum(Quantity) as 'So SP ban'
		from Products, [Order Details], Orders	
		where Products.ProductID= [Order Details].ProductID and [Order Details].OrderID= Orders.OrderID
		and year(OrdreDate) between year (@StartDate) and (@EndDate)
		group by ProductName, year (OrderDate)
		order by year(OrderDate), ProductName

--3.	Hãy tạo một query đặt tên là ThongKeSLMuaSPTheoQG (thống kê số lượng mua sản phẩm theo quốc gia khách hàng). 
--Query này sẽ tạo danh sách có cột đầu tiên là các quốc gia của khách hàng, các cột còn lại là tên các loại sản phẩm, 
--trong các ô còn lại là số lượng sản phẩm mỗi quốc gia mua mỗi loại hàng. 

DECLARE @StartDa datetime
DECLARE @EndDa datetime

SET @StartDa = '1-1-1997'
SET @EndDa = '1-10-1997'

SELECT ProductName, [1], [2],[3],[4], [5],[6],[7], [8],[9],[10], [11],[12]
FROM (SELECT ProductName, SUM(Quantity) AS 'TongSP', MONTH (OrderDate) 'thang'
		FROM Products, Orders,[Order Details] OD
		WHERE Products.ProductID=OD.ProductID AND Orders.OrderID=OD.OrderID AND MONTH (OrderDate) BETWEEN @StartDa AND @EndDa
		GROUP BY ProductName ,MONTH (OrderDate)) a
	
	PIVOT 
	( SUM (TongSP) FOR Thang IN ([1], [2],[3],[4], [5],[6],[7], [8],[9],[10], [11],[12])
	)b