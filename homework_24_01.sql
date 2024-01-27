-- В рамках БД "песочница" напишите след/запросы:
-- Вывести заказы со стоимостью от 5000 EUR (проекция: номер_заказа, стоимость_заказа)
SELECT OrderDetails.OrderID, SUM(OrderDetails.Quantity*Products.Price) AS total_price FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY OrderDetails.OrderID
HAVING total_price >= 5000;

-- Вывести страны, в которые было отправлено 3 и более заказов
SELECT Customers.Country, COUNT(*) AS total_orders FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Country
HAVING total_orders >= 3;

-- Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)
SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS saled_quantity FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName
ORDER BY saled_quantity DESC
LIMIT 10;

-- Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)
SELECT Employees.EmployeeID, Employees.LastName, Employees.FirstName, SUM(OrderDetails.Quantity*Products.Price)*.05 AS Salary FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Employees.EmployeeID;