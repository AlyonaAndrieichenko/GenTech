-- В рамках БД "песочница" напишите след/запросы:
-- Вывести среднюю стоимость товара в категории 1 (проекция: название_категории, сред/стоимость)
SELECT ProductName, AVG(Price) AS avg_price FROM Products
WHERE CategoryID = 1;

-- Вывести телефоны поставщиков (suppliers) и перевозчиков (shippers)
SELECT Phone FROM Shippers AS ShippersAndSupliersPhones
UNION
SELECT Phone FROM Suppliers;

-- SELECT DISTINCT Suppliers.SupplierName, Suppliers.Phone, Shippers.ShipperName, Shippers.Phone FROM Products
-- JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
-- JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
-- JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
-- JOIN Shippers ON Shippers.ShipperID = Orders.ShipperID;

-- Вывести все заказы, добавив поле is_premium, если его доставит перевозчик 3 (ShipperID)
SELECT *,
	CASE WHEN ShipperID = 3
    		THEN true
            ELSE false
    END AS is_premium
FROM Orders;

-- Вывести все товары, причем для товаров от поставщиков 1 и 3 и ценой до 250 EUR добавить скидку в 5.5% (проекция: все поля + поле Price_down)
SELECT *,
	CASE WHEN SupplierID IN(1,3) AND Price < 250
    	THEN Price *.945
        ELSE Price
    END AS Price_down
FROM Products;