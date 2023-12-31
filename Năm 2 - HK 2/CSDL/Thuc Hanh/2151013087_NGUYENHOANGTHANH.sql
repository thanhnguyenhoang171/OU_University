use Northwind
-- 1.Vi?t t�ch �?-c�c gi?a 2 b?ng Customers v� Orders, nh?n x�t s? h�ng k?t qu?. Th�m �i?u ki?n k?t, nh?n x�t s? h�ng k?t qu?. 
select *
from Customers, Orders -- 75,530 rows

select *
from Customers, Orders
where Customers.CustomerID=Orders.CustomerID; --830 row
-- 2. L?p danh s�ch c�c Customer ? th�nh ph? London ho?c ? n�?c Ph�p (France). Danh s�ch g?m: Customer ID, Company Name, Contact Name, Address, City
select CustomerID, CompanyName, ContactName, Address, City 
from Customers
where City='LonDon' or Country = 'France';
-- 3. L?p danh s�ch c�c Customer l� Sales Manager c?a n�?c M? (USA) ho?c l� Owner c?a Mexico. Danh s�ch g?m nh� tr�n, th�m c?t Contact Title
select CustomerID, CompanyName, ContactName, ContactTitle, Country
from Customers
where(Country = 'USA' and ContactTitle = 'Manager') or (Country <> 'Mexico' and not ContactTitle = 'Owner');
-- 4. L?p danh s�ch c�c Customer l� Manager c?a n�?c M? (USA) ho?c: kh�ng ph?i l� Owner c?a Mexico. Danh s�ch g?m c�c fields nh� tr�n 
select CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from Customers
where ContactTitle LIKE '%Manager' and Country='USA' or (ContactTitle='Owner' and not Country='Mexico');
-- 5. L?p danh s�ch c�c Order c� ng�y �?t h�ng trong 6 th�ng �?u n�m 1997. Danh s�ch g?m: Order ID, Order Date, Customer, Employee trong �� Customer l� Company Name c?a kh�ch h�ng, Employee l?y Last Name 
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName AS Customer, Employees.LastName AS Employee
FROM Orders, Customers, Employees
WHERE Orders.CustomerID=Customers.CustomerID AND Orders.EmployeeID=Employees.EmployeeID AND YEAR(Orders.OrderDate)=1997 AND MONTH(Orders.OrderDate)<=6;
-- 6. L?p danh s�ch c�c Order c� ng�y �?t h�ng trong th�ng 2 n�m 1997. Danh s�ch g?m: Order ID, Order Date, CustomerID, EmployeeID.
select OrderID, OrderDate, CustomerID, EmployeeID
from Orders
where year(OrderDate)=1997 and month(OrderDate)=2;
-- 7. Danh s�ch c�c Order c� Ship Country l� UK do nh�n vi�n c� m? l� 2 ph? tr�ch trong n�m 1997. Danh s�ch g?m:   Order ID, Order Date, Freight 
select OrderID, OrderDate, Freight 
from Orders 
where ShipCountry='UK' and EmployeeID=2 and year(OrderDate)=1997;
-- 8. Ng�?i ta mu?n bi?t danh s�ch c�c s?n ph?m c� t�n b?t �?u l� Ch. Anh chi h?y l?p danh s�ch n�y, g?m c�c c?t: Product ID, Product Name.
select ProductID, ProductName
from Products
where ProductName LIKE 'Ch%';
-- 9. L?p danh s�ch c�c s?n ph?m kh�ng c?n ti?p t?c cung c?p n?a (tr�?ng Discontinued) v� c� s? l�?ng t?n kho (tr�?ng Unit In stock) l?n h�n kh�ng. Danh s�ch g?m: Product ID, Unit Price, Unit In Stock.
select ProductID, UnitPrice, UnitsInStock
from Products
where Discontinued=1 and  UnitsInStock >0;
-- 10. L?p danh s�ch c�c kh�ch h�ng kh�ng thu?c n�?c M?. Danh s�ch g?m: Company Name, Contact Name, Country, Phone, Fax 
select CompanyName, ContactName, Country, Phone, Fax
from Customers
where not(Country='USA');
-- 11. L?p danh s�ch c�c kh�ch h�ng kh�ng thu?c c�c n�?c Brazil, Italy, Spain, Venezuela v� UK. Danh s�ch g?m: Company Name, Contact Name, Country, Phone, Fax
select CompanyName, ContactName, Country, Phone, Fax 
from Customers
where Country not in ( 'Brazil', 'Italy', 'Spain', 'Venezuela',  'UK');
-- 12. L?p danh s�ch c�c ��n �?t h�ng c� Ship country l� USA v� c� Freight > 300 ho?c c�c ��n c� Ship Country l� Argentina v� Freight <5. Danh s�ch g?m: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight
select OrderID,c.CompanyName AS Customer, e.LastName AS Employee, OrderDate, ShipCountry, ShippedDate, Freight
from Orders o, Customers c, Employees e
where (ShipCountry = 'USA' AND Freight > 300) OR (ShipCountry = 'Argentina' AND Freight < 5) AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
--13. L?p danh s�ch c�c ��n �?t h�ng c� Ship country l� USA v� c� Freight > 300 ho?c c�c ��n c� Ship Country l� Argentina v� Freight <5. Danh s�ch g?m: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight
select OrderID,c.CompanyName AS Customer, e.LastName AS Employee, OrderDate, ShipCountry, ShippedDate, Freight
from Orders o, Customers c, Employees e
where (ShipCountry = 'USA' AND Freight > 300) OR (ShipCountry = 'Argentina' AND Freight < 5) AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 14.	L?p danh s�ch c�c ��n h�ng trong th�ng 4/97 g?m c�c th�ng tin sau: Order ID, Order Date, Customer, Employee, Freight, New-Freight trong �� New-Freight =110% Freight. 
select OrderID,OrderDate, c.CompanyName AS Customer, e.LastName AS Employee, Freight, (110/100)*Freight AS New_Freight
from Orders o, Customers c, Employees e
where month(o.OrderDate)=4 and year(o.OrderDate)=1997 AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 15. L?p danh s�ch c�c ��n h�ng trong th�ng 4/97 g?m c�c th�ng tin sau: Order ID, Order Date, Customer, Employee, Freight, New-Freight trong �� New-Freight =110% Freight.
select p.ProductID, p.ProductName, s.CompanyName AS SupplierName , p.UnitPrice, p.UnitsInStock,p.UnitPrice* p.UnitsInStock 	AS Total,s.Fax AS	SupplierFax
from Products p,Suppliers s
where p.Discontinued = '0' and s.SupplierID=p.SupplierID; 
-- 16. L?p danh s�ch nh�n vi�n (Table Employee) c� hire date t? n�m 1993 tr? v? tr�?c. Danh s�ch g?m: Name, Hire date, Title, BirthDate, Home Phone, trong �� tr�?ng Name gh�p t? c�c tr�?ng: TitleOfCourstesy, ch? �?u tr�?ng LastName v� tr�?ng FirstName 
SELECT CONCAT(TitleOfCourtesy, ' ', LEFT(LastName, 1), '. ', FirstName) AS Name, HireDate, Title, BirthDate, HomePhone 
FROM Employees 
WHERE YEAR(HireDate) <= 1993 ;
-- 17. L?p danh s�ch c�c Order c� ng�y �?t h�ng trong th�ng 4 h�ng n�m. Danh s�ch g?m: Order ID, Order Date, Customer, Employee trong �� Customer l� Company Name c?a kh�ch h�ng, Employee l?y Last Name
SELECT o.OrderID , o.OrderDate , c.CompanyName AS Customer, e.LastName AS Employee 
FROM Orders o, Customers c, Employees e
WHERE MONTH(o.OrderDate) = 4 AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 18. L?p danh s�ch c�c Order c� ng�y �?t h�ng c�c n�m ch?n. Danh s�ch g?m: Order ID, Order Date, Customer, Employee trong �� Customer l� Company Name c?a kh�ch h�ng, Employee l?y Last Name
SELECT o.OrderID, o.OrderDate, c.CompanyName AS Customer, e.LastName AS Employee
FROM Orders o, Customers c, Employees e
WHERE YEAR(o.OrderDate) % 2 = 0 AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 19. L?p danh s�ch c�c Order c� ng�y �?t h�ng l� 5, 13, 14, 23. Danh s�ch g?m: Order ID, Order Date, Customer, Employee trong �� Customer l� Company Name c?a kh�ch h�ng, Employee l?y Last Name
SELECT o.OrderID, o.OrderDate, c.CompanyName AS Customer, e.LastName AS Employee
FROM Orders o, Customers c, Employees e
WHERE DAY(o.OrderDate)=5 or DAY(o.OrderDate)= 13 or DAY(o.OrderDate)= 14 or DAY(o.OrderDate)= 23 AND e.EmployeeID=o.EmployeeID AND c.CustomerID=o.CustomerID;
-- 20.	Ng�?i ta mu?n c� danh s�ch chi ti?t c�c ho� ��n (Order Details) trong n�m 1997. Danh s�ch g?m c�c th�ng tin: Order ID, ProductName, Unit Price, Quantity, ThanhTien, Discount, TienGiamGia, TienPhaiTra trong ��: ThanhTien = UnitPrice*Quantity, TienGiamGia = ThanhTien *Discount, TienPhaiTra = ThanhTien � TienGiamGia 
SELECT 
    OrderDetails.OrderID, 
    Products.ProductName, 
    OrderDetails.UnitPrice, 
    OrderDetails.Quantity, 
    OrderDetails.UnitPrice * OrderDetails.Quantity AS ThanhTien,
    OrderDetails.Discount,
    (OrderDetails.UnitPrice * OrderDetails.Quantity) * OrderDetails.Discount AS TienGiamGia,
    (OrderDetails.UnitPrice * OrderDetails.Quantity) - ((OrderDetails.UnitPrice * OrderDetails.Quantity) * OrderDetails.Discount) AS TienPhaiTra
FROM 
    OrderDetails, Products, Orders
WHERE 
    YEAR(Orders.OrderDate) = 1997 AND Products.ProductID=OrderDetails.ProductID AND Orders.OrderID=OrderDetails.OrderID;
-- 21.	T��ng t? nh� c�u 20 nh�ng ch? l?y c�c record c� Discount >0 v� c� TienPhaiTra <50 
SELECT 
    OrderDetails.OrderID, 
    Products.ProductName, 
    OrderDetails.UnitPrice, 
    OrderDetails.Quantity, 
    OrderDetails.UnitPrice * OrderDetails.Quantity AS ThanhTien,
    OrderDetails.Discount,
    (OrderDetails.UnitPrice * OrderDetails.Quantity) * OrderDetails.Discount AS TienGiamGia,
    (OrderDetails.UnitPrice * OrderDetails.Quantity) - ((OrderDetails.UnitPrice * OrderDetails.Quantity) * OrderDetails.Discount) AS TienPhaiTra
FROM  OrderDetails, Products, Orders
WHERE OrderDetails.ProductID = Products.ProductID AND OrderDetails.OrderID = Orders.OrderID AND
    YEAR(Orders.OrderDate) = 1997 AND 
    OrderDetails.Discount > 0 AND 
    ((OrderDetails.UnitPrice * OrderDetails.Quantity) - ((OrderDetails.UnitPrice * OrderDetails.Quantity) * OrderDetails.Discount)) < 50;
-- 22.	T? Table Product, �?m s? s?n ph?m, ��n gi� cao nh?t, th?p nh?t v� ��n gi� trung b?nh cu? t?t c? s?n ph?m 
SELECT 
    COUNT(ProductID) AS SoSanPham, 
    MAX(UnitPrice) AS DonGiaCaoNhat, 
    MIN(UnitPrice) AS DonGiaThapNhat, 
    AVG(UnitPrice) AS DonGiaTrungBinh
FROM 
    Products
-- 23.	Nh� c�u 22 nh�ng ��?c nh�m theo lo?i s?n ph?m (Category ID
SELECT 
    CategoryID, 
    COUNT(ProductID) AS SoSanPham, 
    MAX(UnitPrice) AS DonGiaCaoNhat, 
    MIN(UnitPrice) AS DonGiaThapNhat, 
    AVG(UnitPrice) AS DonGiaTrungBinh
FROM 
    Products
GROUP BY 
    CategoryID
-- 24.	�?m s? ��n �?t h�ng cu? c�c Order c� Ship Country l� Belgium, Canada, UK 
SELECT 
    COUNT(*) AS SoDonDatHang 
FROM 
    Orders 
WHERE 
    ShipCountry IN ('Belgium', 'Canada', 'UK')
-- 25.	L?p danh s�ch c�c lo?i s?n ph?m c� ��n gi� trung b?nh l?n h�n 30 
SELECT 
    CategoryID, 
    AVG(UnitPrice) AS DonGiaTrungBinh 
FROM 
    Products 
GROUP BY 
    CategoryID 
HAVING 
    AVG(UnitPrice) > 30
-- 26.	T�nh ��n gi� trung b?nh cu? c�c s?n ph?m c� ��n gi� l?n h�n 30, nh�m theo lo?i s?n ph?m 
SELECT 
    CategoryID, 
    AVG(UnitPrice) AS DonGiaTrungBinh 
FROM 
    Products 
WHERE 
    UnitPrice > 30 
GROUP BY 
    CategoryID
-- 27.	Thi?t k? query t�nh doanh s? c?a t?ng lo?i s?n ph?m (Category) trong n�m 1996. Danh s�ch g?m 2 c?t: Category Name, Sales; trong �� SalesTotal = UnitPrice*Quantity*(1-Discount) 
SELECT 
    Categories.CategoryName, 
    SUM((OrderDetails.UnitPrice * OrderDetails.Quantity * (1 - OrderDetails.Discount))) AS Sales 
FROM 
    Orders,    OrderDetails,  Products, Categories
 WHERE   YEAR(Orders.OrderDate)=1996 AND  Orders.OrderID = OrderDetails.OrderID AND OrderDetails.ProductID = Products.ProductID  AND Products.CategoryID = Categories.CategoryID
GROUP BY 
    Categories.CategoryName
-- 28.	Thi?t k? query t�nh t? l? ti?n c�?c mua h�ng (Freight) c?a t?ng kh�ch h�ng trong n�m 1997. Danh s�ch g?m c�c c?t: Company Name (c?a Customer), Freight, SalesTotal = UnitPrice * Quantity*(1-Discount), Percent= Freight/SalesTotal 
SELECT 
    Customers.CompanyName AS CompanyName,
    Orders.Freight,
    SUM(OrderDetails.UnitPrice * OrderDetails.Quantity * (1 - OrderDetails.Discount)) AS SalesTotal,
    (Orders.Freight / SUM(OrderDetails.UnitPrice * OrderDetails.Quantity * (1 - OrderDetails.Discount))) AS 'Percent'
FROM 
    Customers,  Orders , OrderDetails 
WHERE 
    YEAR(Orders.OrderDate) = 1997 AND Customers.CustomerID = Orders.CustomerID AND Orders.OrderID = OrderDetails.OrderID 
GROUP BY 
    Customers.CompanyName, Orders.Freight;



