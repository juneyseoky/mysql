# 중복된 데이터를 1개로 표시한다.
select distinct age from memberList;

# group by를 적용한 컬럼은 같은 데이터들을 그룹화되어 1개로 표시한다.
# 그룹을 지정한 대상의 다른 컬럼에 대해 집계함수를 적용해야만 한다.
# 집계함수 => count(), max(), min(), avg(), sum(), .....
select count(name) a,age from memberList group by age;

# group by의 조건절 having
# having 조건절은 group by를 반드시 사용해야만 적용할 수 있다.
# 또한 having은 group by 결과에 대한 조건만 적용할 수 있다.
# 참고. where 조건절은 전체 데이터에 대하여 조건을 적용하는 것.

select no, name, age, addr from memberList order by no asc;

select age from memberList where age >=30 order by no asc;

# having은 group by 결과에 대한 조건
select count(no), age from memberList group by age having count(no)>=2;

select * from memberList where age = 36;

set autocommit = 1;
# set autocommit 은 insert, update, delete를 사용할 때
# 작업을 임시적용하는 단계를 별도로 지정해둔다. 곧바로 최종적용되지는 않음

select * from memberList order by no asc;

insert into memberList (userID, userPW, name, email, addr, age)
values('apple', '1234', '사과', 'apple@nate.com','서울시 성북구', '28');
commit;
delete from memberList where userID = 'apple';
rollback;

# TCL 구문 = > insert, update, delete 구문에 대하여
# 실행 후 최종 적용까지 rollback, commit의 명령어를 사용하여
# 적용 여부를 결정하는 구문
# 먼저 set autocommit = 0 으로 설정해야만 위의 기능을 적용alter
# set autocommit = 1 으로 설정하면 자동 커밋으로 됨으로
# rollback의 기능을 사용할수 없다.

# autocommit 의 설정을 확인할려면 selete @@AUTOCOMMIT;
select @@AUTOCOMMIT;

savepoint ppp; # commit, rollback 시작지점

update memberList set addr='중랑구 면목동' where no = 8;

rollback to ppp;