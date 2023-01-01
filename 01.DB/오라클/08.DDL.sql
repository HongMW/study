/*
  테이블생성하기
	
	1. 문법
	
	ceate table 테이블명(
	   컬럼1   데이터타입(크기)   default 기본값,
		 컬럼n   데이터타입(크기)   default 기본값
  );
	
	2. 데이터타입
	
	   1) 문자형
		    a. char(n)     : 고정길이 / 최대 2kb / 기본길이 1byte
				b. varcahr2(n) : 가변길이 / 최대 4kb / 기본길이 1byte
				c. long        : 가변길이 / 최대 2gb
				
		 2) 숫자형
		 
		   a. number(p, s) : 가변숫자 / p(1~38, 기본 38), (84~127, 기본 0) / 최대 22byte
			 b. float(p)     : number하위타입 / p(1~128 기본 128) / 최대 22byte
		 
		 3) 날짜타입
		  
			 a. date       : bc 4712.01.01 ~ 9999.12.31까지, 년원일시분초까지 입력가능
			 b. timestamp  : 년월일시분초밀리초까지 입력가능
			 
		 4) lob타입
		    clob/blob/bfile
*/
/* A. 테이블생성하기 */
create table mytable (
    no        number(3,1)
	, name      varchar2(10)
	, hiredate date
);
select * from mytable;

-- 식별자
create table 한글테이블 (
  사원번호    number(3,1)
, 사원이름    varchar2(10)
, 입사일자    date
);
select * from 한글테이블;

/*
  테이블생성시 제약사항
  
	1. 테이블이름은 반드시 문자로 시작해야 한다. 중간에 숫자가 포함되는 것은 가능하다.
	2. 특수문자도 가능하지만 테이블생성시에 큰 따옴표로 감싸야 한다. 하지만 권장하지는 않는다.
	3. 테이블이름이나 컬럼명은 최다 30byte까지 가능(즉, 한글은 문자셋에 따라 utf-8이면 10자, euc-kr은 15자)
	4. 동일 사용자안에서는 중복된 테이블명을 사용할 수 없다.
	5. 테이블명이나 오브젝트명은 오라클 키워드(select, from...)을 사용하지 말 것을 권장한다.
	   하지만 절대로 사용하지 말것!!!
		 
	*/
-- 1. 테이블에 자료를 추가함
-- insert into 테이블(컬럼1, ...컬럼n) values(값1, ...값n);
-- 1) insert명령은 컬럼의 갯수와 값의 갯수는 동수이어야 한다.
-- 2) 컬럼의 데이터타입과 값의 데이터타입은 동일해야 한다.
--    단, 자동형변환이 가능하다면 사용 할 수 있지만 불가능할 경우에는 에러가 발생
select * from mytable;
insert into mytable (no, name, hiredate) values(1, '홍길동', sysdate);
insert into mytable (no) values(2);
insert into mytable (no, name) values(3, '홍길순');
insert into mytable (no, name) values(4, '홍길상');
insert into mytable (no, name) values(5, '홍길자');
insert into mytable (no, name) values(6, '홍길녀');
insert into mytable (no, name, hiredate) values(1, '홍길동', sysdate); -- 중복제약사항이 없기 때문에 추가 가능
insert into mytable (no, name, hiredate) values(1, '홍길동', sysdate);
insert into mytable (no, name, hiredate) values(1, '홍길동', sysdate);
insert into mytable (no, name, hiredate) values(6, 1000, '손흥민'); --데이터타입 오류
insert into mytable (no, name, hiredate) values(6, 1000, '20221102'); -- 자동형변환 OK
insert into mytable (hiredate, no, name) values(6, 1000, '20221102'); -- 순서와 상관없지만 데이터타입 불일치
insert into mytable (hiredate, no, name) values('2022.11.02', 10, '이강인');
insert into mytable values(11, '김민재', sysdate);

-- 한글명 테이블
select * from 한글테이블;
insert into 한글테이블 (사원번호, 사원이름, 입사일자) values(1, '메시', sysdate);
select * from 한글테이블 where 사원이름 = '메시';

-- 2. 테이블복사형태로 생성
-- emp테이블을 temptable로 복사하기
-- create table temptable (empno, number, ename, ...)
create table temptable
as select * from emp;

select * from temptable;

-- 2) 테이블구조만 복사
create table temptable1
as select * from emp where 1 = 2;

select * from temptable1;

-- 3) 특정자료만 복사하기
create table temptable2
as select * from emp where deptno = 10;

select * from temptable2;

/* B. 테이블수정하기

   1. 컬럼추가하기		: alter table 테이블명 add(추가컬럼, 데이터타입)
	 2. 컬럼명변경하기	: alter table 테이블명 rename column 변경전이름 to 변경후이름
	 3. 데이터타입변경	: alter table 테이블명 modify(변경할컬럼 변경할 데이터타입)
	 4. 컬럼삭제하기		: alter table 테이블명 drop column 삭제할컬럼명

*/
-- 실습, dept2테이블을 dept6테이블로 복사하기
select * from dept2;
create table dept6 as select * from dept2;
select * from dept6;

-- 1. 컬럼추가 : dept6에 `location varchar2(20)`컬럼추가하기
select * from all_tab_columns where table_name='DEPT6';
select * from all_tab_columns where table_name='EMP';

select * from dept6;
alter table dept6 add location varchar2(20) null;

alter table dept6 add(location varchar2(20));

-- 2. 컬럼변경 : location -> loc로 변경
alter table dept6 rename column location to loc;
select * from dept6;

-- 3. 데이터타입 변경 : dname -> number, loc -> number
-- 데이터타입을 변경할 경우 기존에 데이터타입에 따라 변화가능한 타입이라면 변경할 수 있지만
-- 변환이 않되는 데이터가 있을 경우에는 에러가 발생한다.
alter table dept6 modify(loc number); -- 가능
alter table dept6 modify(dname number); -- 에러

-- 4. 컬럼추가할 때 기본값을 설정하기
create table dept7 as select * from dept2;
select * from dept7;

alter table dept7 add(location varchar2(20) default '서울');
select * from all_tab_columns where table_name='DEPT7';

alter table dept7 add(comm number default 0);
alter table dept7 add(hiredate date default sysdate);

-- 5. 컬럼의 크기를 변경
-- location 20자리를 1자리로 변경
alter table dept7 modify(location varchar2(1)); -- 에러 : 기존자료의 최대길이보다 작을 경우에는 변경불가
alter table dept7 modify(location varchar2(10));


-- 6. 컬럼삭제하기
-- comm, hiredate컬럼을 삭제
alter table dept7 drop column comm;
alter table dept7 drop column hiredate;

select * from all_tab_columns where table_name='MYEMP';

/* C. 테이블변경하기

	1. 테이블명 변경				: alter table 테이블명 rename to 변경후테이블
	2. 테이블자료삭제				: truncate table 테이블명
	3, 테이블삭제(완전삭제)	: 

*/
-- 1. 테이블명변경하기
alter table dept7 rename to dept7777;
select * from all_tab_columns where table_name='DEPT8888';

-- 2. 테이블자료삭제하기
select * from dept8888;
truncate table dept8888;

-- 사용자가 소유한 테이블 목록 보기
select * from tab;

--3. 테이블완전삭제
drop table dept8888;

/* 
	D. 읽기전용 테이블 생성하기
	
	alter table 테이블명 read only;

*/
create table   (
	no	number
	, name	varchar2(20)
);
select * from tbl_read_only;
insert into tbl_read_only(no, name) values(1, '소향');

-- 읽기전용 테이블로 변경
alter table tbl_read_only read only;
insert into tbl_read_only(no, name) values(2, '손흥민'); -- 테이블이 읽기전용이기 때문에 실행 불가

-- 읽기전용테이블을 읽기/쓰기로 변경
-- read only -> read write
alter table tbl_read_only read write;
insert into tbl_read_only(no, name) values(2, '손흥민');

/*
	E. Data Dictionary란?
	
	오라클 데이터베이스의 메모리구조와 테이블에 대한 구조정보를 가지고 있다. 각 객체(테이블, 뷰...)들이
	사용하고 있는 공간들의 정보, 제약조건, 사용자정보, 권한 및 프로파일, Role, 감사(Audit)등의 정보를 
	제공한다.
	
	1. 데이터 딕셔너리
	
		1) 데이터베이스 자원들을 효율적으로 관리하기 위해 다양한 정보를 저장하고 있는 시스템이다.
		2) 사용자가 테이블을 생성하거나 변경하는 등의 작업을 할 때 데이터베이스 서버(엔진)에 의해
			자동으로 갱신되는 테이블이다.
		3) 사용자가 데이터 딕셔너리의 내용을 수정하거나 삭제할 수 없다.
		4) 사용자가 데이터 딕셔너리를 조회할 경우 시스템이 직접 관리하는 테이블은 암호화가 되어
		  있기 때문에 내용을 볼 수가 없다.
		
	2. 데이터 딕셔너리 뷰 : 오라클은 데이터 딕셔너리의 내용을 사용자가 이해할 수 있는 내용으로 변환
	   하여 제공한다
		 
		 1) user_xxx
		 
				a. 자신의 계정이 소유한 객체에 대한 정보를 조회할 수 있다.
				b. user라는 접두어가 붙은 데이터 딕셔너리 중에서 자신이 생성한 테이블, 뷰, 인덱스등과 같은
					자신의 계정이 소유한 객체의 정보를 저장하는 user_tables가 있다.
					
					select * from user_tables;
				
		 2) all_xxx
		 
				a. 자신이 소유 or 권한을 부여 받은 객체에 대한 정보를 조회할 수가 있다.
				b. 타 계정의 객체는 원칙적으로 접근이 불가능하지만 그 객체의 소유자가 접근할 수 있도록
					권한을 부여할 경우에 타계정의 객체에도 접근할 수가 있다.
					
					select * from all_tables;
					select * from all_tables where owner = 'SCOTT';
				
		 3) dba_xxx
		 
				a. 데이터베이스관리자만 접근이 가능한 객체들의 정보를 조회할 수가 있다.
				b. dba딕셔너리는 DBA권한을 가진 사용자는 모두 접근할 수가 있다. 즉, DB에 있는 모든 객체들에
					대한 정보를 조회할 수가 있다.
				c. 따라서, DBA권한을 가진 sys, system계정으로 접속하면 dba_xxx등의 내용을 조회할 수가 있다.

*/
select * from all_tab_columns where owner = 'SCOTT';
select * from user_tab_columns;
select * from dba_tab_columns;

select * from user_tables;
select * from all_tables;











