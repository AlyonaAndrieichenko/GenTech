-- Завершить описание схемы БД "соц/сеть" (юзеры, публикации, друзья)
-- https://dbdiagram.io/d/Social-Media-65c0e103ac844320ae7941f3

-- В рамках БД webshop создайте произвольную таблицу клиентов и добавьте несколько клиентов
 create table clients (
 id int primary key auto_increment,
 fullname varchar(128) not null,
 created_at timestamp default current_timestamp,
 phone_number varchar(20) not null,
 country varchar(128) not null,
 city varchar(128) not null,
 address varchar(128) not null
 );
 
 insert into clients (fullname, phone_number, country, city, address)
 values 
	('Jack Jackson', '+491635522114', 'Germany', 'Berlin', 'str. Street № 20'),
	('Mary F', '+35855522114', 'USA', 'New York', 'str. Street № 20'),
	('Aladin', '+5841522114', 'India', 'New Deli', 'str. Indian № 54'),
	('John Di', '+3809635522114', 'Germany', 'Dresden', 'str. Dresdenstreet № 20'),
	('Anna Li', '+9856155622114', 'Germany', 'Berlin', 'str. Street № 20');
    
    select * from clients;