create database if not exists p04_bbs;

use p04_bbs;

create table userTbl(
no int unique auto_increment comment '순번',
userID char(20) primary key comment '회원ID',
userPW char(20) not null comment '회원 Password',
userNick char(20) not null comment '회원닉네임',
userLevel char default '1' comment '회원닉네임',
email char(30) not null,
cellPhone char(15) ,
joinTime timestamp not null default now()
);

desc userTbl;

insert into userTbl(userID, userPW, userNick, userLevel, email, cellPhone) values
('goodman', 'a123', '머그컵', 1,'goodman@naver.com', '010-123-4567'),
('tree', 'b123', '노을', 1,'tree@daum.net', '017-423-4568'),
('apple', 'c123', '커피', 2,'apple@naver.com', '010-723-4569'),
('sea', 'd123', '캠핑', 3,'sea@apple.com', '011-323-4560'),
('bridge', 'e123', '허브', 2,'bridge@nate.com', '010-2623-4561');

select * from userTbl;

create table articleTbl (
no int primary key auto_increment comment '순번',
writerID char(20) not null,
title char(100) not null,
content char(200) not null,
cwriteTime timestamp default now(),
boardType char(10) not null,
constraint foreign key(writerID)
references userTbl(userID)
);

alter table articleTbl change cwriteTime writeTime timestamp;

insert into articleTbl (writerID, title, content, writeTime, boardType)
values 
('goodman', '가입인사', '반갑습니다.', '2018-06-12', 'free'),
('apple', '문의사항', '이미지 업로드 안됩니다.', '2018-12-23', 'image'),
('tree', '연락처변경', '연락처 변경 어떻게 하나요?', '2019-01-05', 'qna');

create table emailTbl (
no int primary key auto_increment comment '순번',
sendID char(20) not null comment '발신자 ID',
sendEmail char(30) not null comment '발신자 email',
emailTitle char(100) not null comment '메일제목',
emailContent char(200) comment '메일내용',
receiveEmail char(30) not null comment '수신자 Email',
sendTime timestamp not null default now() comment '전송시간',
constraint foreign key(sendID)
references userTbl(userID)
);

insert into emailTbl(sendID, sendEmail, emailTitle, emailContent, receiveEmail,sendTime)
values 
('bridge','bridge@nate.com','휴대폰 분실','연락 안됩니다','manager@nate.com','2020-03-31'),
('tree','tree@daum.net','휴가 보고서','첨부 파일 참조','admin@comp.co.kr','2020-06-29');

# 게시판목록 테이블(articleTbl)과 이메일 발신 내역 테이블(emailTbl)을 사용하여
# [순번, 제목, 내용, 시간] 필드로 구성된 Union 결과를 조회하시오.
select 
no '순번', title '제목', content '내용', date_format(writeTime, '%Y-%m-%d') '시간'
from articleTbl
union
select 
no '순번', emailTitle '제목', emailContent '내용', date_format(sendTime, '%Y-%m-%d') '시간' 
from emailTbl;

# Inner Join으로 구현하고 이를 bbsView라는 이름으로 View 객체를 생성하여 조회하시오
# 순번, 작성자 ID, 닉네임, 회원레벨, 글제목, 글작성시간, 게시판종류
create view bbsView as 
select userTbl.no '순번', userID '작성자 ID', userNick '닉네임', userLevel '회원레벨', title '글제목', 
date_format(writeTime,'%Y-%m-%d') '글작성시간', articleTbl.boardType '게시판종류'
from userTbl
inner join articleTbl on userTbl.userID = articleTbl.writerID;
select * from bbsView;

drop view bbsView;

# userTbl 테이블에서 순번 3에 해당하는 회원 ID : apple 자료를 삭제합니다.
delete from articleTbl where writerID = 'apple';
delete from userTbl where userID = 'apple';