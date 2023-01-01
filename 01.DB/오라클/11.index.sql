/*
	인덱스(Index)란?
	
	인덱스는 특정 데이터가 HDD의 어느 위치(메로미)에 저장되어 있는지에 대한 정보를 가진
	주소와 같은 개념이다. 인덱스는 데이터와 위치주소(rowid) wjdqhfmf key와 value의 형태의 한쌍
	으로 저장되어 관리가 된다.
	
	인덱스의 가장 큰 목적은 데이터를 보다 빠르게 검색 또는 조작할 수 있게 하기 위함이다.
	
	rowid는 오라클DB에서만 사용하는 개념이다. rowid는 특적의 데이터가 저장되어 있는 위치정보
	를 의미한다. 즉 , HDD에 저장되어 있는 메모리주소로서 oracle에서는 총 18byte길이의 정보이다.
	
	rowid의 구조 AAAE9fAAEAAAAP1AAA
	
	1) 데이터의 오브젝트번호(6) : AAAE9f
	2) 파일번호(3) 							: AAE
	3) block번호(6)							: AAAAP1
	4) 행번호(3)								: AAA
	
	index문법
	
	1. 생성 : create [unique] index 인덱스명 on 테이블명(컬럼, ...컬럼n)/ []는 생략가능
	2. 삭제 : drop index 인덱스명;
*/
select rowid, ename from emp;
select rowidtochar(rowid), ename from emp;
select length(rowid) from emp;



select rowid -- 7521 사원의 자료가 저자오디어 있는 HDD의 메모리주소(위치)
     , ename
		 , empno
 from emp
 where empno = 7521;

-- 1. DD에서 index목록조회
select * from user_indexes;
select * from user_indexes where table_name = 'C_TEST1';
select * from user_indexes where table_name = 'EMP';

--index컬럼을 조회
select * from user_ind_columns where table_name = 'DEPT2';

-- 3. index 생성(1) - unique index
create unique index idx_dept2_dname on dept2(dname);

select * from user_indexes where table_name = 'DEPT2';
select * from user_ind_columns where table_name = 'DEPT2';

-- 4. index생성(2) - non unique index
select * from dept2;
create index idx_dept2_area on dept2(area);
select * from user_indexes where table_name = 'DEPT2';
select * from user_ind_columns where table_name = 'DEPT2';

-- 5. 결합인덱스
select ename, sal, job from emp where ename = 'SMITH' and job = 'CLERK';
select ename, sal, job from emp where job = 'CLERK' and ename = 'SMITH';
select count(*) from emp where job = 'CLERK';
select * from user_ind_columns where table_name = 'EMP';

create index idx_emp_ename_job on emp(ename, job);
select * from user_ind_columns where table_name = 'EMP';

-- 6. index rebuilding 하기
-- index 생성
create table idx_test(no number);
select * from idx_test;


-- pl/sql
begin
	for i in 1..100000 loop
		insert into idx_test values(i);
	end loop;
	commit;
end;

drop table idx_test;

select count(*) from idx_test;

select * from idx_test order by no;

-- index 생성후에 조회
create unique idx_test_no on idx_test(no);
select * from idx_test order by no;
select * from idx_test where no = 9000;

-- 실습. 
-- ex01) new_emp4를 생성, no(number), name(), sal(number)
create table new_emp4 (
	no			number
,	name		varchar2(20)
, sal			number
);
-- ex02) 데이터를 insert
--    1000, 'SMITH', 300
--    1001, 'ALLEN', 250
--    1002, 'KING', 430
--    1003, 'BLAKE', 220
--    1004, 'JAMES', 620
--    1005, 'MILLER', 810
insert into new_emp4 values(1000, 'SMITH', 300);
insert into new_emp4 values(1001, 'ALLEN', 250);
insert into new_emp4 values(1002, 'KING', 430);
insert into new_emp4 values(1003, 'BLAKE', 220);
insert into new_emp4 values(1004, 'JAMES', 620);
insert into new_emp4 values(1005, 'MILLER', 810);

select * from new_emp4;

-- ex03) name컬럼에 인덱스 생성
create index idx_emp4_name on new_emp4(name);

select * from user_indexes where table_name = 'NEW_EMP4';

-- ex04) 인덱스를 사용하지 않는 일반적인 SQL
select * from new_emp4 where name = 'BLAKE'; -- 인덱스사용
select * from new_emp4 where no = 1003; -- 인덱스 사용(x)



/* 개발 Tool 사용하기*/
-- 1. new_emp5 테이블

-- table or comment에 eomment 달기
comment on table emp is '사원테이블';
comment on column emp.empno is '사원번호';
comment on column emp.ename is '사원이름';

-- 주석조회하기
select * from user_tab_comments;
select * from user_col_comments where table_name = 'NEW_EMP5';

/* 실습 */
-- 1. 자기 이니셜로 database 생성 (create user scott 참조)
create user hmw identified by 12345;
select * from dba_users where username='SYS' or username='HR' or username='HMW';

select * from dba_role_privs where grantee='HR' or grantee='HMW';
select * from dba_sys_privs where grantee='HR' or grantee='HMW';

grant connect, resource to hmw;
select * from dba_role_privs where grantee='HR' or grantee='HMW';

alter user hmw default tablespace users;
alter user hmw temporary tablespace temp;

-- 2. scott에 있는 EMP, DEPT 생성(scott.emp, scott.dept 참조)

CREATE TABLE HMW.DEPT
   (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14) ,
    LOC VARCHAR2(13) ) ;

CREATE TABLE HMW.EMP  
   (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,  
    ENAME VARCHAR2(10),  
    JOB VARCHAR2(9),  
    MGR NUMBER(4),  
    HIREDATE DATE,  
    SAL NUMBER(7,2),  
    COMM NUMBER(7,2),  
    DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);


CREATE TABLE HMW.BONUS
    (
    ENAME VARCHAR2(10)  ,
    JOB VARCHAR2(9)  ,
    SAL NUMBER,
    COMM NUMBER
    ) ;
      
CREATE TABLE HMW.SALGRADE
      ( GRADE NUMBER,
    LOSAL NUMBER,
    HISAL NUMBER );
   
create table hmw.emp as select * from scott.emp;
create table hmw.dept as select * from scott.dept;
create table hmw.bonus as select * from scott.bonus;
create table hmw.salgrade as select * from scott.salgrade;

-- 3. 각 테이블에 data 추가하기

INSERT INTO HMW.DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO HMW.DEPT VALUES (20,'RESEARCH','DALLAS');   
INSERT INTO HMW.DEPT VALUES (30,'SALES','CHICAGO');  
INSERT INTO HMW.DEPT VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO HMW.EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO HMW.EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO HMW.EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO HMW.EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO HMW.EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO HMW.EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO HMW.EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO HMW.EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy')-85,3000,NULL,20);
INSERT INTO HMW.EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO HMW.EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO HMW.EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy')-51,1100,NULL,20);
INSERT INTO HMW.EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO HMW.EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO HMW.EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

INSERT INTO HMW.SALGRADE VALUES (1,700,1200);
INSERT INTO HMW.SALGRADE VALUES (2,1201,1400);
INSERT INTO HMW.SALGRADE VALUES (3,1401,2000);
INSERT INTO HMW.SALGRADE VALUES (4,2001,3000);
INSERT INTO HMW.SALGRADE VALUES (5,3001,9999);

-- 4. 사용자(Database) 삭제하기 (drop user)

drop user hmw cascade;


