-- 한줄주석
/* 여러줄 주석 */
-- 1. oracle 사용자 조회
-- show user : SQL*plus 명령으로 일반 명령이 아니다. 즉, 오라클에서만 사용가능한 명령이다.
select * from dba_users;
select username, ACCOUNT_STATUS, LOCK_DATE from dba_users;

-- 2. 사용자 role(권한) 조회
select * from dba_role_privs;
select * from dba_role_privs where grantee='sys';
select * from dba_role_privs where grantee='SYS';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE='SYS';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE="SYS"; -- 문자열이 아니라 키워드
SELECT * FROM DBA_ROLE_PRIVS WHERE "GRANTEE"='SYS'; 

-- 3. lock된 사용자 해제하기
select username, ACCOUNT_STATUS, LOCK_DATE from dba_users 
 where username='HR'; -- EXPIRED & LOCKED
 
-- 사용자잠금을 해제하는 명령 - sysdba권한을 가진 사용자만 가능
alter user hr account unlock;
select username, ACCOUNT_STATUS, LOCK_DATE from dba_users 
 where username='HR';  -- EXPIRED

-- 사용자 비밀번호 변경(설정)하기
alter user hr IDENTIFIED by hr;
select username, ACCOUNT_STATUS, LOCK_DATE from dba_users 
 where username='HR';  -- OPEN

-- 실습
-- 1) hr계정의 employees 조회하기
select * from employees;
select * from hr.employees;

-- 2) 이름(first, last), 입사일(hire_date)만 조회하기
select First_name, last_name, hire_date
  from hr.EMPLOYEES;

-- 3) last_name이 king 사원만 조회하기
 select First_name, last_name, hire_date
  from hr.EMPLOYEES
 where last_name = 'King';
 
-- 4) last_name이 king이면서 first_name = Steven 사원만 조회하기\
-- hint) and 키워드
 select First_name, last_name, hire_date
  from hr.EMPLOYEES
 where last_name = 'King'
   and First_name= 'Steven';
 
-- 5) 사원중에서 급여(salary)가 17000 이상인 사원만 조회하기
-- hint) 비교연산자 > 사용하기
 select *
  from hr.EMPLOYEES
 where salary > 17000;

 select *
  from hr.EMPLOYEES
 where salary >= 17000;

 select *
  from hr.EMPLOYEES
 where salary < 17000;

 select *
  from hr.EMPLOYEES
 where salary <= 17000;

 select *
  from hr.EMPLOYEES
 where salary >= '17000';
 
-- 6) 급여가 10000보다 크면서 17000보다 작은 사원만 조회하기
-- hint) and조건 
select * from hr.EMPLOYEES
where salary < 17000
and salary > 10000;

-- 1. 사용자계정을 생성
create user scott identified by tiger; -- 사용자 생성과 동시에 비밀번호를 부여
select * from dba_users where username='SYS' or username='HR' or username='SCOTT';

-- 2. 생성된 사용자에게 권한을 부여
select * from dba_role_privs where grantee='HR' or grantee='SCOTT';
select * from dba_sys_privs where grantee='HR' or grantee='SCOTT';

-- 권한부여하기
grant connect, resource to scott;
select * from dba_role_privs where grantee='HR' or grantee='SCOTT';

-- 3. scott에 작업장소를 부여하기
alter user scott default tablespace users;
alter user scott temporary tablespace temp;

-- 4. 실습용 데이타베이스(테이블) 생성하기
-- dept, emp, bonus, salgrade테이블 생성
-- 사용자를 scott으로 변경후에 작업하기