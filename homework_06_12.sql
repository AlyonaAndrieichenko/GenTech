-- 1. Приведите десять типовых бизнес-процессов для предметной области ВИДЕО-ХОСТИНГ (Youtube), а также их соответствие по CRUD.

-- Регистрация пользователя - Create
-- Загрузка видео-ролика пользователем на канал - Create
-- Просмотр видео-ролика - Read
-- Удаление видео-ролика пользователем с канала - Delete
-- Подключение подписки на Youtube Premium - Update
-- Отмена подписки на Youtube Premium - Update
-- Поставить лайк на видео - Update
-- Оставить комментарий под видео - Create
-- Удалить комментарий под видео - Delete
-- Включить уведомления - Update

-- В рамках БД "песочница" напишите след/запросы:

-- 1. Вывести название и стоимость товаров от 20 до 150 EUR 
SELECT ProductName, Price FROM Products WHERE Price >= 20 && Price <= 150;

-- 2. Вывести страны поставщиков, кроме тех, что из USA.
SELECT Country FROM Suppliers WHERE Country != 'USA';

-- 3. Вывести перевозчика с ID 1
-- не указано, что нужно конкретно имя, поэтому вывожу всю информацию о нём
SELECT * FROM Shippers WHERE ShipperID	= 1;

-- 4. Вывести контактные имена клиентов, кроме тех, что из France и USA.
SELECT ContactName FROM Customers WHERE Country != 'France' AND Country != 'USA';

-- 5. Вывести страну, город и адрес всех поставщиков, кроме тех, что из Japan и Brazil
SELECT Country, City, Address FROM Suppliers WHERE Country != 'Japan' AND Country != 'Brazil';