alter user hr IDENTIFIED by hr;
select username, ACCOUNT_STATUS, LOCK_DATE from dba_user
 where username='HR';
 
 
 -- 1) hr 계정의 employees
 
 select * from employees;
 select * from hr.employees;
 
 
 -- 2) dlfma (first,last), 입사일(hire_data)만 조회하기
 select First_name, last_name, hire_date from hr.EMPLOYEES;
 
 -- 3) last_name이 king 사원만 조회하기
select First_name, last_name, hire_date from hr.EMPLOYEES
 where last_name ='King';
 
 -- 4) last_name이 king이면서 first_name = steven 사원만 조회하기
 -- hint) and 키워드
 select First_name, last_name, hire_date from hr.EMPLOYEES
 where last_name ='King' and first_name = 'Steven';
 
 -- 5) 사원중에서 급여(salary)가 17000 이상인 사원만 조회하기
 -- hint) 비교연산자 > 사용하기
 select * from hr.EMPLOYEES
  where salary >= 17000;
	 
	 select * from hr.EMPLOYEES
  where salary > 17000;
	
	 select * from hr.EMPLOYEES
  where salary < 17000;
	
	 select * from hr.EMPLOYEES
  where salary <= 17000;
	
	 select * from hr.EMPLOYEES
  where salary >= '17000';
	
	-- 6) 급여가 10000보다 크면서 17000보다 작은 사원만 조회하기
	-- hint) and조건
	 select * from hr.EMPLOYEES
  where salary < 17000 
	and salary > 10000;

--    테이블 조회하기
-- 테이블 목록 조회
SELECT * FROM all_all_tables;
SELECT * FROM dba_tables;
SELECT * FROM ALL_OBJECTS WHERE OBJECT_TYPE = 'TABLE';

-- 테이블 목록 조회 (접속한 계정)
SELECT * FROM tabs;
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE = 'TABLE';
SELECT * FROM USER_TABLES;

-- 테이블 코멘트 조회
SELECT * FROM ALL_TAB_COMMENTS WHERE TABLE_NAME = '테이블명';
SELECT * FROM USER_TAB_COMMENTS;
 
--    컬럼 조회하기
-- 컬럼 조회
SELECT * FROM COLS WHERE TABLE_NAME = '테이블명';
SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = '테이블명';
SELECT * FROM USER_TAB_COLUMNS;

-- 컬럼 코멘트 조회
SELECT * FROM USER_COL_COMMENTS;

	 