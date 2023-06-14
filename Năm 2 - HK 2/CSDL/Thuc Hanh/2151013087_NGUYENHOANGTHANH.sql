use Northwind
-- 1.Vi?t tích Ð?-các gi?a 2 b?ng Customers và Orders, nh?n xét s? hàng k?t qu?. Thêm ði?u ki?n k?t, nh?n xét s? hàng k?t qu?. 
select *
from Customers, Orders -- 75,530 rows

select *
from Customers, Orders
where Customers.CustomerID=Orders.CustomerID; --830 row
-- 2. L?p danh sách các Customer ? thành ph? London ho?c ? ný?c Pháp (France). Danh sách g?m: Customer ID, Company Name, Contact Name, Address, City
select CustomerID, CompanyName, ContactName, Address, City 
from Customers
where City='LonDon' or Country = 'France';
-- 3. L?p danh sách các Customer là Sales Manager c?a ný?c M? (USA) ho?c là Owner c?a Mexico. Danh sách g?m nhý trên, thêm c?t Contact Title
select CustomerID, CompanyName, ContactName, ContactTitle, Country
from Customers
where(Country = 'USA' and ContactTitle = 'Manager') or (Country <> 'Mexico' and not ContactTitle = 'Owner');
-- 4. L?p danh sách các Customer là Manager c?a ný?c M? (USA) ho?c: không ph?i là Owner c?a Mexico. Danh sách g?m các fields nhý trên 
select CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from Customers
where ContactTitle LIKE '%Manager' and Country='USA' or (ContactTitle='Owner' and not Country='Mexico');
-- 5. L?p danh sách các Order có ngày ð?t hàng trong 6 tháng ð?u nãm 1997. Danh sách g?m: Order ID, Order Date, Customer, Employee trong ðó Customer là Company Name c?a khách hàng, Employee l?y Last Name 
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName AS Customer, Employees.LastName AS Employee
FROM Orders, Customers, Employees
WHERE Orders.CustomerID=Customers.CustomerID AND Orders.EmployeeID=Employees.EmployeeID AND YEAR(Orders.OrderDate)=1997 AND MONTH(Orders.OrderDate)<=6;
-- 6. L?p danh sách các Order có ngày ð?t hàng trong tháng 2 nãm 1997. Danh sách g?m: Order ID, Order Date, CustomerID, EmployeeID.
select OrderID, OrderDate, CustomerID, EmployeeID
from Orders
where year(OrderDate)=1997 and month(OrderDate)=2;
-- 7. Danh sách các Order có Ship Country là UK do nhân viên có m? là 2 ph? trách trong nãm 1997. Danh sách g?m:   Order ID, Order Date, Freight 
select OrderID, OrderDate, Freight 
from Orders 
where ShipCountry='UK' and EmployeeID=2 and year(OrderDate)=1997;
-- 8. Ngý?i ta mu?n bi?t danh sách các s?n ph?m có tên b?t ð?u là Ch. Anh chi h?y l?p danh sách này, g?m các c?t: Product ID, Product Name.
select ProductID, ProductName
from Products
where ProductName LIKE 'Ch%';
-- 9. L?p danh sách các s?n ph?m không c?n ti?p t?c cung c?p n?a (trý?ng Discontinued) và có s? lý?ng t?n kho (trý?ng Unit In stock) l?n hõn không. Danh sách g?m: Product ID, Unit Price, Unit In Stock.
select ProductID, UnitPrice, UnitsInStock
from Products
where Discontinued=1 and  UnitsInStock >0;
-- 10. L?p danh sách các khách hàng không thu?c ný?c M?. Danh sách g?m: Company Name, Contact Name, Country, Phone, Fax 
select CompanyName, ContactName, Country, Phone, Fax
from Customers
where not(Country='USA');
-- 11. L?p danh sách các khách hàng không thu?c các ný?c Brazil, Italy, Spain, Venezuela và UK. Danh sách g?m: Company Name, Contact Name, Country, Phone, Fax
select CompanyName, ContactName, Country, Phone, Fax 
from Customers
where Country not in ( 'Brazil', 'Italy', 'Spain', 'Venezuela',  'UK');
-- 12. L?p danh sách các ðõn ð?t hàng có Ship country là USA và có Freight > 300 ho?c các ðõn có Ship Country là Argentina và Freight <5. Danh sách g?m: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight
select OrderID,c.CompanyName AS Customer, e.LastName AS Employee, OrderDate, ShipCountry, ShippedDate, Freight
from Orders o, Customers c, Employees e
where (ShipCountry = 'USA' AND Freight > 300) OR (ShipCountry = 'Argentina' AND Freight < 5) AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
--13. L?p danh sách các ðõn ð?t hàng có Ship country là USA và có Freight > 300 ho?c các ðõn có Ship Country là Argentina và Freight <5. Danh sách g?m: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight
select OrderID,c.CompanyName AS Customer, e.LastName AS Employee, OrderDate, ShipCountry, ShippedDate, Freight
from Orders o, Customers c, Employees e
where (ShipCountry = 'USA' AND Freight > 300) OR (ShipCountry = 'Argentina' AND Freight < 5) AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 14.	L?p danh sách các ðõn hàng trong tháng 4/97 g?m các thông tin sau: Order ID, Order Date, Customer, Employee, Freight, New-Freight trong ðó New-Freight =110% Freight. 
select OrderID,OrderDate, c.CompanyName AS Customer, e.LastName AS Employee, Freight, (110/100)*Freight AS New_Freight
from Orders o, Customers c, Employees e
where month(o.OrderDate)=4 and year(o.OrderDate)=1997 AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 15. L?p danh sách các ðõn hàng trong tháng 4/97 g?m các thông tin sau: Order ID, Order Date, Customer, Employee, Freight, New-Freight trong ðó New-Freight =110% Freight.
select p.ProductID, p.ProductName, s.CompanyName AS SupplierName , p.UnitPrice, p.UnitsInStock,p.UnitPrice* p.UnitsInStock 	AS Total,s.Fax AS	SupplierFax
from Products p,Suppliers s
where p.Discontinued = '0' and s.SupplierID=p.SupplierID; 
-- 16. L?p danh sách nhân viên (Table Employee) có hire date t? nãm 1993 tr? v? trý?c. Danh sách g?m: Name, Hire date, Title, BirthDate, Home Phone, trong ðó trý?ng Name ghép t? các trý?ng: TitleOfCourstesy, ch? ð?u trý?ng LastName và trý?ng FirstName 
SELECT CONCAT(TitleOfCourtesy, ' ', LEFT(LastName, 1), '. ', FirstName) AS Name, HireDate, Title, BirthDate, HomePhone 
FROM Employees 
WHERE YEAR(HireDate) <= 1993 ;
-- 17. L?p danh sách các Order có ngày ð?t hàng trong tháng 4 hàng nãm. Danh sách g?m: Order ID, Order Date, Customer, Employee trong ðó Customer là Company Name c?a khách hàng, Employee l?y Last Name
SELECT o.OrderID , o.OrderDate , c.CompanyName AS Customer, e.LastName AS Employee 
FROM Orders o, Customers c, Employees e
WHERE MONTH(o.OrderDate) = 4 AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 18. L?p danh sách các Order có ngày ð?t hàng các nãm ch?n. Danh sách g?m: Order ID, Order Date, Customer, Employee trong ðó Customer là Company Name c?a khách hàng, Employee l?y Last Name
SELECT o.OrderID, o.OrderDate, c.CompanyName AS Customer, e.LastName AS Employee
FROM Orders o, Customers c, Employees e
WHERE YEAR(o.OrderDate) % 2 = 0 AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID;
-- 19. L?p danh sách các Order có ngày ð?t hàng là 5, 13, 14, 23. Danh sách g?m: Order ID, Order Date, Customer, Employee trong ðó Customer là Company Name c?a khách hàng, Employee l?y Last Name
SELECT o.OrderID, o.OrderDate, c.CompanyName AS Customer, e.LastName AS Employee
FROM Orders o, Customers c, Employees e
WHERE DAY(o.OrderDate)=5 or DAY(o.OrderDate)= 13 or DAY(o.OrderDate)= 14 or DAY(o.OrderDate)= 23 AND e.EmployeeID=o.EmployeeID AND c.CustomerID=o.CustomerID;
-- 20.	Ngý?i ta mu?n có danh sách chi ti?t các hoá ðõn (Order Details) trong nãm 1997. Danh sách g?m các thông tin: Order ID, ProductName, Unit Price, Quantity, ThanhTien, Discount, TienGiamGia, TienPhaiTra trong ðó: ThanhTien = UnitPrice*Quantity, TienGiamGia = ThanhTien *Discount, TienPhaiTra = ThanhTien – TienGiamGia 
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
-- 21.	Týõng t? nhý câu 20 nhýng ch? l?y các record có Discount >0 và có TienPhaiTra <50 
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
-- 22.	T? Table Product, ð?m s? s?n ph?m, ðõn giá cao nh?t, th?p nh?t và ðõn giá trung b?nh cu? t?t c? s?n ph?m 
SELECT 
    COUNT(ProductID) AS SoSanPham, 
    MAX(UnitPrice) AS DonGiaCaoNhat, 
    MIN(UnitPrice) AS DonGiaThapNhat, 
    AVG(UnitPrice) AS DonGiaTrungBinh
FROM 
    Products
-- 23.	Nhý câu 22 nhýng ðý?c nhóm theo lo?i s?n ph?m (Category ID
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
-- 24.	Ð?m s? ðõn ð?t hàng cu? các Order có Ship Country là Belgium, Canada, UK 
SELECT 
    COUNT(*) AS SoDonDatHang 
FROM 
    Orders 
WHERE 
    ShipCountry IN ('Belgium', 'Canada', 'UK')
-- 25.	L?p danh sách các lo?i s?n ph?m có ðõn giá trung b?nh l?n hõn 30 
SELECT 
    CategoryID, 
    AVG(UnitPrice) AS DonGiaTrungBinh 
FROM 
    Products 
GROUP BY 
    CategoryID 
HAVING 
    AVG(UnitPrice) > 30
-- 26.	Tính ðõn giá trung b?nh cu? các s?n ph?m có ðõn giá l?n hõn 30, nhóm theo lo?i s?n ph?m 
SELECT 
    CategoryID, 
    AVG(UnitPrice) AS DonGiaTrungBinh 
FROM 
    Products 
WHERE 
    UnitPrice > 30 
GROUP BY 
    CategoryID
-- 27.	Thi?t k? query tính doanh s? c?a t?ng lo?i s?n ph?m (Category) trong nãm 1996. Danh sách g?m 2 c?t: Category Name, Sales; trong ðó SalesTotal = UnitPrice*Quantity*(1-Discount) 
SELECT 
    Categories.CategoryName, 
    SUM((OrderDetails.UnitPrice * OrderDetails.Quantity * (1 - OrderDetails.Discount))) AS Sales 
FROM 
    Orders,    OrderDetails,  Products, Categories
 WHERE   YEAR(Orders.OrderDate)=1996 AND  Orders.OrderID = OrderDetails.OrderID AND OrderDetails.ProductID = Products.ProductID  AND Products.CategoryID = Categories.CategoryID
GROUP BY 
    Categories.CategoryName
-- 28.	Thi?t k? query tính t? l? ti?n cý?c mua hàng (Freight) c?a t?ng khách hàng trong nãm 1997. Danh sách g?m các c?t: Company Name (c?a Customer), Freight, SalesTotal = UnitPrice * Quantity*(1-Discount), Percent= Freight/SalesTotal 
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



