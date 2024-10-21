# 데이터베이스 생성
create database school;

# 기본 데이터베이스 선택
use school;

# 테이블 생성
create table student (
num int not null,
id char(10) primary key,
name char(10) not null, 
age int null,
address char(50) not null
);

# describe T/N; 테이블 정보 검색
desc student;

# 자료 입력
insert into student (num, id, name, age , address)
values ( 1, 'tester01', '테스터01', 17, '경기도 남양주시');

insert into student (num, id, name, age , address)
values ( 2, 'tester02', '테스터02', 17, '경기도 오산시');

insert into student values(
3, 'tester03', '테스터03', 34, '서울시 구로구');


# 자료 검색
select num, id, name, age, address from student where age = 34;

# 자료 수정
update student set age = 30 where id = 'tester01';

# 자료 삭제
delete from student where id = 'tester03';

# 안전모드 비활성화 (delete 할때 안전모드가 활성화 되어있으면 삭제를 할 수 없다)
SET SQL_SAFE_UPDATES = 1;

####################################################################
# '백틱(``)은 select 구문에서 테이블의 컬럼명을 명시할때 사용한다.
# ex) select `num`, `id`, name, age, address from student; 와 같이 
# 컬럼명이 예약어와 중복이 될 경우와 숫자로 `123num`와 같은 경우 백틱으로 감싸서 사용한다.
# 컬럼명이 공백일경우에도 사용된다.

# Constraint(컨스트레인트, 제약조건)
# => null/ not null, primary key, unique
# 	 자동증가 속성 auto-increment
#	 기본값 속성 default
