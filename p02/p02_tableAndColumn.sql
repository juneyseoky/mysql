create database GYM_management;
use GYM_management;

create table userList(
no int auto_increment unique not null,
userID char(20) primary key not null,
userPW char(20) not null,
userNick char(20) not null,
userLevel char not null default '1',
email char(30) not null,
cellPhone char(15) ,
joinTime datetime not null default now()
);

desc memberList;

# table 이름 변경 alter table [기존테이블이름] rename [변경할이름];
alter table userList rename memberList;

# column명 변경 alter table [변경할 테이블] change column [기존 컬럼명] [변경할 컬럼명] [데이터 타입] [제약조건] 
# primary key가 이미 설정된 경우에는 제약조건에 쓰이지 않는다.
alter table memberList change column name userNick char(20) ;
alter table memberList change column id userID char(20);

# PK 삭제하는 쿼리
alter table memberList drop primary key;

# 자료형 변경
alter table memberList
change column joinTime joinTime timestamp;

# 컬럼 추가
alter table memberList
add column address char(50) null;

# 컬럼 삭제 
alter table memberList drop column cellphone;

alter table memberList add column age SMALLINT;

alter table memberList change column address addr char(50);

alter table memberList drop userLevel;

alter table memberList drop joinTime;

insert into memberList value
(1, 'hana02', 1234, '김하나', 'haha@naver.com', '서울시 송파구 성내동 23', 25),
(2, 'orange', 1234, '이성수', 'ssyu3@daum.net', '경기도 부천시 원미구 중동 46', 26),
(3, 'camping', 1234, '박인호', 'good@google.com', '서울시 서대문구 대현동 9', 24),
(4, 'amp93', 1234, '김시현', 'card@naver.com', '경기도 파주시 운정동 85', 36),
(5, 'boxer', 1234, '최정인', 'send@test.co.kr', '서울시 강남구 역삼동 12', 30),
(6, 'time5', 1234, '하정태', 'hajeong@daum.net', '경기도 용인시 기흥구 보라동 63', 31),
(7, 'skyblue', 1234, '박윤정', 'heart@google.com', '경기도 남양주시 다산동 205', 36),
(8, 'tree', 1234, '이가람', 'tree@naver.com', '경기도 부천시 원미구 상동 7', 31);

select * from memberList order by no asc;

delete from memberList where userPW = 1234;

# distinct는 select 뒤에 오며 조회시 중복데이터 하나만 출력한다.
select distinct age from memberList;

# 문자열 조건 검색(=조회)
select * from memberList where name = '김시현';
# 대표문자 = 와일드 카드 => %
select * from memberList where addr like '서울시%';

select * from memberList where userID='camping' or userID='tree';

select * from memberList where userID in ('camping', 'tree');

select * from memberList where email like '%google%';

set sql_safe_updates = 0;

# memberList에서 성이 '이'씨인 사람만 검색 
select * from memberList where name like '이%';

#  memberList에서 주소가 경기도부터 시작하는 데이터 검색 후 이름을 오름차순으로 정렬
select * from memberList where addr like '경기도%' order by name asc;

# 네이버 메일 사용자 수 
select count(*) as '네이버 메일 사용자 수' from memberList where email like '%naver%'; 

