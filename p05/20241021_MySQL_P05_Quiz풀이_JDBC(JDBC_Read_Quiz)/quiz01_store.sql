#####  D/N : p01_quiz_store  #####

create database p01_quiz_store;
use p01_quiz_store;

create table orderList (
	num 		int 		primary key 	,
    item 		char(30) 	not null 		,
    unitPrice 	int 		null 			,
    price 		int 						,
    cnt 		int 		
);
desc orderList;

insert into orderList values 
(1, '햄버거', 6000, 12000, 2);


insert into orderList values 
(2, '피자', 2100, 21000, 1),
(3, '커피', 2500, 7500, 3);


select * from orderList order by num asc;




