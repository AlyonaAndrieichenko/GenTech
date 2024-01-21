-- Вывести сред/стоимость товаров из категорий 1, 2, 5, у которых название начинается с буквы t
SELECT AVG(Price) AS avg_price FROM Products
WHERE CategoryID IN (1, 2, 5) AND ProductName LIKE 'T%';

-- Посчитать стоимость заказа 10248
SELECT SUM(Products.Price * OrderDetails.Quantity) AS total_price_order_10248 FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE OrderDetails.OrderID = 10248;

-- Вывести ко-во товаров с ценой от 10 до 250 EUR
SELECT COUNT(*) AS total_products_between_10_250 FROM Products
WHERE Price BETWEEN 10 AND 250;

-- Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT SUM(Products.Price*OrderDetails.Quantity) AS total_sum_germany_orders FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'Germany';

-- С помощью инструмента онлайн-проектирования опишите схему БД "чат поддержки" (базовые сущности и характеристики)
-- https://dbdiagram.io/d/65ad2d7aac844320ae606ee6
