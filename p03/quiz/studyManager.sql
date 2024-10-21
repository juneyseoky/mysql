create database studyManager;
# create database if not exists studyManager;

use studyManager;

create table memInfo(
seq int not null unique auto_increment,
name char(5),
userid char(15) not null,
email char(30) not null,
tel1 char(4),
tel2 char(4),
tel3 char(4),
age int default 0,
address char(50),
joinTM timestamp default now(),
primary key (userid, email)
);

TRUNCATE TABLE memInfo;

desc memInfo;

insert into memInfo(name, userid, email, tel1, tel2, tel3, age, address,joinTM)
values
('한규준', 'hjoon', 'you@naver.com', '010','1111','1234',32,'서울시 서초구 방배2동', '2021-02-03'),
('피터', 'peter', 'momo@daum.net', '011','2222','2234', null,'경기도 성남시 야탑동 100', '2021-02-04'),
('박희진', 'park', 'phj@google.com', '010','3333','3234',32,'인천시 연수구 청학동', null),
('토르', 'thor', '', '019','4444','4234',36,'서울시 중랑구 상봉동 99', '2021-03-11'),
('최주연', 'juyeon', 'great@apple.com', '010','5555','5234',49,'서울시 마포구 망원동', '2021-05-29'),
('유채연', 'yuchae', 'bchae@daum.net', '010','6666','6234',32,'', '2021-06-14'),
('스타크', 'stark', 'tony@stark.com', '017','7777','7234',354,'대전시 유성구 구성동', '2021-09-03');

set sql_safe_updates = 0;

# memInfo 전체 조회
select * from memInfo;

# 토르의 이메일 주소 수정
update memInfo set email = 'thor@naver.com' where name = '토르';

# yuchae 주소 수정
update memInfo set address = '경기도 고양시 마두동' where userid = 'yuchae';

# tel1 010으로 수정
update memInfo set tel1 = '010';
# 연산자 <>는 !=와 같은 의미
update memInfo set tel1 = '010' where tel1<>'010';

# seq 7번 데이터 삭제
delete from memInfo where seq=7;

# peter 의 나이 21로 수정
update memInfo set age = '21' where userid = 'peter';

# 나이가 30대인 사람 조회
select * from memInfo where age between 30 and 39;

# 주소가 서울시로 시작하는 데이터 조회
select * from memInfo where address like '서울시%';

# 이메일주소가 daum인 사람 조회
select * from memInfo where email like '%daum%';

# 전체데이터 오름차순
select * from memInfo order by name asc;

# 전체 데이터 나이 내림차순 1차 ,이름 오름차순 2차 정렬
select * from memInfo order by age desc, name asc; 

# 가입날짜 null 사람 조회
select * from memInfo where joinTM is null;
