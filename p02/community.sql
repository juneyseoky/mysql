create database community;

use community;

create table bbs_TBL (
no int auto_increment,
writerID char(30) not null,
articleTitle char(50) not null,
readCnt int not null,
writeTM timestamp not null,
filename char(100) null,
constraint pk_BBS_TBL primary key(no)
);

desc bbs_TBL;


insert into bbs_TBL (writerID, articleTitle, readCnt, writeTM)
values ( 'tree', '연습글제목입니다.', 0 , now());

insert into bbs_TBL (writerID, articleTitle, readCnt, writeTM)
values ( 'hana02', '오잉.', 0 , now()),
( 'tree', '내소개를하지.', 0 , now()),
( 'camping', '졸려.', 0 , now());

select * from community.bbs_TBL order by no desc;