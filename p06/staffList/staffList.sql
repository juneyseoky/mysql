use company;

desc stafflist;

create table memList(
num int not null unique auto_increment,
id char(10) not null primary key,
name char(10) not null,
yearRank int default 0,
position char(20));

select * from memList;