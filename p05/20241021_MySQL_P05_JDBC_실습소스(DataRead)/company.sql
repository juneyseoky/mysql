##### D/N : Company #####

create database company;
use company;

create table staffList(
num 		int 		not null 		,
id 			char(10) 					,
name 		char(10) 	not null 		,
age 		int 						,
address 	char(50) 	not null 		,
constraint primary key(id)
);
desc staffList;

insert into staffList values 
(1, 'tester1', '테스터1', 27, '서울시 서대문구'),
(2, 'guest', '게스트', 34, '경기도 과천시');

select * from staffList order by num desc;

update staffList set
age=30
where id='guest';

set sql_safe_updates =0;
delete from staffList where num=1;


insert into staffList values 
(3, 'lemon', '레몬', 41, '대전시 중구');

select * from staffList order by num desc;


