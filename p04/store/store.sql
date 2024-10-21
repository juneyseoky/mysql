####### D/N : store #######
# 테이블 참조관계의 이해

create database if not exists store;

use store;

# 상품 재고 목록 테이블(goodsStock)
create table goodsStock(
no int ,
goodsCode char(20) primary key,
goodsName char(30) ,
price int 
);

# 상품 판매 내역 테이블(saleList)
create table saleList(
no int ,
sellCode char(20),
sellCnt int,
sellPrice int, 
sellTime time , 
constraint foreign key(sellCode)
references goodsStock(goodsCode)
);

insert into goodsStock(no, goodsCode, goodsName, price)
values (1, 'C001', '아메리카노', 3500),
(2, 'T002', '레몬티', 3000),
(3, 'F003', '샌드위치', 4000);


# saleList.sellCode는 goodsStock.goodsCode 를 참조함으로
# goodsStock.goodsCode가 생성되지 않은 상태에서는 아래 쿼리를 실행 할수 없다.
insert into saleList(no, sellCode, sellCnt, sellPrice, sellTime)
values (1, 'C001', 2, 7000, now()),
(2, 'F003', 2, 8000, now()),
(3, 'C001', 1, 3500, now()),
(4, 'T002', 1, 3000, now()),
(5, 'C001', 4, 14000, now()),
(6, 'F003', 3, 12000, now());

select * from goodsStock order by no asc;
select * from saleList order by no asc;

update saleList set sellPrice = 15000 where  sellCode= 'test001';

# Cross Join (= 크로스 조인, 카타시안 결합)
# 데이터들을 전부 합친다.
select * from goodsStock, saleList;

# Inner Join (이너조인, 크로스 조인에서 공통으로 일치하는 자료의 결합)
# 2개의 테이블에서 공통자료를 갖는 컬럼을 조건으로 지정함.
select * from goodsStock as g 
inner join saleList as s on s.sellCode = g.goodsCode;

select s.no, goodsName, goodsCode, price from goodsStock as g 
left join saleList as s on s.sellCode = g.goodsCode;

set sql_safe_updates = 0;

############# Union #############

create table goodsList(
no int , 
gCode char(20) ,
gname char(30) ,
count int,
constraint primary key(gCode)
);

insert into goodsList values
(1, 'A005', '운동화', 5),
(2, 'B003', '화장품', 9),
(3, 'C002', '카메라', 2),
(4, 'D007', '피자', 16)
;

select * from goodsList order by no desc;

create table product (
num int,
pCode char(20) primary key,
pName char(30),
saleVol int,
price int
);

insert into product values
(1, 'A041', '모자', 3, 7000),
(2, 'B003', '화장품', 14, 8000),
(3, 'D007', '피자', 26, 3500);
select * from product
order by num desc;

# union all을 사용 하지 않으면 중복된 데이터는 한개로 줄여서 나옴
select no, gCode, gName from goodsList
union
select num, pCode, pName from product;

################## VIEW #################
# select 문에만 적용됨.

create view saleResult as
select s.no, goodsName, goodsCode, price from goodsStock as g 
left join saleList as s on s.sellCode = g.goodsCode;

select * from saleResult;

show tables;

drop view saleResult;

################## INDEX #################
# create FullText Index I/N On T/N(C/N); 으로 생성
show index from goodsList;