create database p01_quiz_product;

use p01_quiz_product;

create table goodsList(
num int primary key,
code char(5) not null,
name char(30) not null,
price int ,
maker char(20),
cnt int,
mfg timestamp default now()
);

insert into goodsList values(
1, 'A001', '디지털TV', 520000, '제일', 7, '2016-04-27');

insert into goodsList values(
2, 'A002', 'DVD', 24000, '제일', 4, '2016-06-08');

insert into goodsList values(
3, 'U101', 'DSLR', 83000, '우수', 8, '2015-12-19');

insert into goodsList values(
4, 'U102', '전자사전', 160000, '우수', 3, '2015-11-30');

insert into goodsList values(
5, 'H704', '전자렌지', 90000, '하나', 11, '2016-02-15');


select num, code, name, price, maker, cnt, date_format(mfg, '%Y-%m-%d') as mfg from goodsList;