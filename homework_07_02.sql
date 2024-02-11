-- В рамках БД music:
-- Создать таблицу комментариев (comments) с использованием механизма валидации данных в SQL

 create table comments (
 id int primary key auto_increment,
 created_at timestamp default current_timestamp,
 content varchar(128) not null,
 author_id int not null,
 track_id int not null,
 
 foreign key (author_id) references users (id),
 foreign key (track_id) references tracks (id)
 );
 
-- Добавить в таблицу комментариев несколько записей

insert into comments (content, author_id, track_id)
values
	('Cool track!', 2, 1),
	('Not bad!', 5, 1),
	('Like it!', 3, 4),
	('It could be better', 1, 2),
	('Love it', 5, 2),
	('You are the best', 4, 3),
	('I am waiting for the next one', 3, 5),
	('I am waiting for the next one', 4, 1);
    
-- Вывести ко-во комментариев на каждый трек (в упорядоченном виде)

select track_id, count(track_id) as comments_count from comments
group by track_id;