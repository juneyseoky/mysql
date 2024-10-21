create database if not exists shoppingMall;

use shoppingMall;

create table productiList(
seq int comment '번호' not null unique auto_increment,
productCode char(30) comment '상품코드' primary key,
productName char(10) comment '상품명' ,
stockVol int comment '재고량',
pDate char(20) comment '상품 생산날짜',
personCharge char(20) comment '담당자',
sellPrice int comment '판매가'default 0);

alter table productiList rename to store;

desc store;

alter table store change productCode pCode char(30);
alter table store change productName pName char(30);
alter table store modify pDate datetime;

alter table store add column pCost int comment '원가';
alter table store add column gType char(30) comment '상품 분류';
alter table store add column salesVol int comment '판매량';

alter table store drop column personCharge;

SELECT COUNT(*) 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'store' AND TABLE_SCHEMA = 'shoppingmall';

insert into store(pCode, pName, stockVol, salesVol, pDate, sellPrice, pCost, gType) values
('F257', '삼겹살', 52, 71, '2020-03-11', 6400, 4800, 'Food'),
('D105', '썬크림', 30, 104, '2020-02-24', null, 5200, 'Daily'),
('P30', '보급형 휴대폰', 5, 7, '2020-12-27', 360000, 470000, 'Phone'),
('P70', '폴더블 폰', 2, 2, '2020-03-04', 1325000, 1190000, 'Phone'),
('F330', '생수', 61, 242, '2020-02-26', 7800, 6100, 'Food'),
('C45', '발목양말', 27, 11, '2019-11-30', 1500, 840, 'Wear'),
('F647', '라면', 260, 193, '2020-02-25', 4150, 3300, 'Food'),
('D002', '치약', 23, 0, '2020-01-09', 0, 0, null),
('D913', '키친타월', 46, 15, '2019-12-14', 4580, 2900, 'Daily'),
('D854', '핸드크림', 9, 3, '2019-07-08', 5000, 5000, 'Daily');

select * from store order by seq asc;

# 전체자료에서 판매가 필드와 분류 필드에 NULL이 입력되어 있는 자료만 조회하세요.
# (출력 필드 ➜ 번호, 상품코드, 상품명, 판매가, 분류)
select seq, pCode, pName, sellPrice, gType 
from store where gType is null or sellPrice is null;

# 상품코드 D105인 썬크림의 판매가를 8500원으로 수정하세요.
update store set sellPrice = 8500 
where pCode = 'D105';
select * from store where pCode = 'D105';

# 상품코드 D002, 상품명 치약의 데이터를 아래 내용으로 수정하세요.	
# • 판매량 ➜ 54개  • 판매가 ➜ 5900원  • 원가 ➜ 3400원  • 분류 ➜ Daily
update store set 
salesVol = 54, sellPrice = 5900, pCost = 3400, gType = 'Daily'
where pCode = 'D002';
select * from store where pCode = 'D002';

# 전체데이터에서 판매량의 내림차순으로 상위 3개의 데이터만 조회하세요.
select * from store order by salesVol desc limit 0,3;

# 상품 분류 컬럼에서 상품의 종류를 중복하지 않고 1개씩 조회하세요. 단, 분류필드만 조회합니다.
select distinct gType from store;

# 전체 데이터를 상품 분류의 오름차순으로 정렬하여 조회한 결과에서 분류가 동일한 데이터의 재고량 내림차순으로 정렬하여 조회하세요.
select * from store order by gType asc, stockVol desc;

# 상품코드에서 'D'와 'F'를 포함하는 모든 자료를 조회하세요.
select * from store where pCode like '%D%' or pcode like '%F%';

# 재고량이 30개 이하인 모든 상품을 조회하세요.
select * from store where stockVol <= 30;

# 상품명이 '삼겹살'인 제품의 상품코드와 생산일을 각각 'F412'와 '2020-03-21'로	변경하세요.
update store set pCode = 'F412', pDate = '2020-03-21' where pName = '삼겹살';
select * from store where pName = '삼겹살';

# 상품분류에서 'Food'에 해당하는 상품들중에서 최대판매량 제품과 최소판매량 제품을 조회하세요
select max(salesVol) '최대값', min(salesVol)'최소값'from store where gType = 'Food'
group by gType;

select pName, salesVol from store 
where gType = 'Food' and
salesvol = (select min(salesVol) from store where gType ='Food') or 
salesvol = (select max(salesVol) from store where gType ='Food');

(SELECT pName '최대 판매량 제품명', salesVol '판매량'
FROM store
WHERE gType = 'Food'
AND salesVol = (SELECT MIN(salesVol) FROM store WHERE gType = 'Food'))
UNION
(SELECT pName '최소 판매량 제품명', salesVol '판매량' 
FROM store
WHERE gType = 'Food'
AND salesVol = (SELECT MAX(salesVol) FROM store WHERE gType = 'Food'));
# Error Code: 1054. Unknown column 'Name' in 'field list'


(SELECT pName '최소 판매량 제품명', salesVol '판매량'
FROM store
WHERE gType = 'Food'
ORDER BY salesVol ASC
LIMIT 1)
UNION
(SELECT pName, salesVol 
FROM store
WHERE gType = 'Food'
ORDER BY salesVol DESC
LIMIT 1);

select * from store;


