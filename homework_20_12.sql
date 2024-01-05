-- В рамках БД "песочница" напишите след/запросы:

-- (1) Вывести данные о товарах (проекция: название товара, цена, название категории, название компании поставщика)
SELECT
Products.ProductName,
Products.Price,
Categories.CategoryName,
Suppliers.SupplierName

FROM Products

JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- (2) Вывести список стран, которые поставляют морепродукты
SELECT Suppliers.Country FROM Products

JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

WHERE Categories.CategoryName = "Seafood";

-- (3) Вывести два самых дорогих товара из категории Beverages из USA
-- SELECT Categories.CategoryName, Suppliers.Country, Products.Price FROM Products

SELECT * FROM Products

JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

WHERE Categories.CategoryName = "Beverages" AND Suppliers.Country = "USA"

ORDER BY Price DESC LIMIT 2;

-- (4) Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT Products.ProductName, Products.Price * 1.09 AS Price_USD FROM Products

JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID

ORDER BY Products.Price DESC LIMIT 1;

-- (5) Дайте короткий ответ на вопрос: в чем отличие БД от СУБД
-- БД - это сама по себе база данных, то есть какой-то набор данных.
-- СУБД - это же уже приложение/ПО для работы с этим набором данных.  