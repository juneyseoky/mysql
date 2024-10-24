########## D/N : store (P06_실습) ############

create table item (
num int not null auto_increment,
goodsCode char(30) not null ,
goodsName char(30) not null,
price int default 0,
stock int default 0,
constraint unique(num),
constraint primary key(goodsCode)
);

desc item;

insert into item (goodsCode, goodsName, price, stock)
values ('D450B', '스피커', 70000, 14); 

select * from item;

truncate item;