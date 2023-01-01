/*
A. where 조건절

1. 비교연산자

    =      : 비교대상과 동일조건의 자료를 검색
		!=, <> : 같지 않다.
		>      :크다
		>=     :크거나 같다
		<      :작다
		<=     :작거나 같다
		
2. 기타

  between a and b : a와 b사이의 데이터를 검색
	in(a, b, ...)   : a, b, ... 의 값을 가지고 있는 데이터만 검색
	like    : 특정패턴을 가지고 있는 데이터를 검색 예) A로 시작한 이름, B로 끝난 이름을 가진 사람, x가 있는 이름
	
	is null / is not null : null값인지 아닌지 여부
	a and b  : 논리곱
	a or b   : 논리합
	not a    : 부정
*/
select * from emp where sal >= 1000 and sal <=2000;

select * from emp where sal between 1000 and 2000;

select * from emp;
-- Null : 컴퓨터 계산 못함

select ename, sal, comm, sal+comm 총급여 from emp;

/* 비교연산 */
-- 1. 급여(sal)가 7900인 사원만 조회하기
select * from emp;
select * from emp where sal = 7900;
select * from emp where sal = 1600;
-- 2. 급여가 900보다 작은 사원만 조회하기
select * from emp where sal < 900;
-- 3. 이름이 smith인 사원만 조회하기
select * from emp where ename = 'SMITH';
-- 소문자를 대문자로 변환해주는 함수 : upper()
-- 대문자를 소무나로 변환해주는 함수 : lower()
select * from emp where ename = 'smith';
select lower(ename) from emp;
select ename from emp where lower(ename) = 'smith';
select ename from emp where ename = upper('smith');

-- 4. 입사일자(hiredate)
-- 입사일이 1980-12-17인 사원만 조회 (힌트 - 날짜도 문자열과 동일하게 취급)
select * from emp where hiredate = '1980-12-17';
select * from emp where hiredate = '1980.12.17';
select * from emp where hiredate = '1980/12/17'
select * from emp where hiredate = '19801217'; -- 오라클DB엔진이 날짜형으로 자동형변환
select * from emp where hiredate = '1980-DEC-17'; -- DB환경에 따라 실행되기도 한다
select * from emp where hiredate = '1980-dec-17'; -- DB환경에 따라 실행되기도 한다
select * from emp where hiredate = '1980.DEC.17'; -- DB환경에 따라 실행되기도 한다
select * from emp where hiredate = '1980.dec.17'; -- DB환경에 따라 실행되기도 한다
select * from emp where hiredate = '1980/DEC/17'; -- DB환경에 따라 실행되기도 한다
select * from emp where hiredate = '1980/dec/17'; -- DB환경에 따라 실행되기도 한다
select * from emp where hiredate = '12171980'; -- DB환경에 따라 실행되기도 한다

/* 4칙연산자 */
-- +, - *, / 사용가능
select sal, sal*100, sal+100, sal-100, sal/15 from emp;

-- 실습
-- emp테이블에서 인상전 급여와 인상후급여(인상은 10%) 급여를 조회
-- 사원명, 인상전급여, 인상(10%)후 급여를 출력
-- 오라클에서는 dual이라는 dummy테이블을 제공한다.
select ename 사원명, sal "인상 전 급여", sal+sal*0.1 "인상 후 급여" from emp;
select * from dual;
select '사원이름' from dual;
select 100 from dual;
select 100, 100*1.1 from dual;

select ename 사원명, sal 인상전급여, sal*1.1 "인상(10%)후 급여" from emp;

-- 실습. 사원명이 'W'보다 크거나 같은 사원만 출력
-- and, between, like
select ename 사원명 from emp where ename >= 'W';
select enema 사원명 from emp where ename = 'W';
select ename 사원명 from emp where ename like '%M%';
select * from emp where ename >= 'W' and ename < 'X';
select * from emp where ename between 'W' and 'X';
select * from emp where ename like 'W%'; -- W로 시작하는 사원
select * from emp where ename like '%D'; -- D로 끝나는 사원
select * from emp where ename like '%S%'; -- S를 포함하는 사원

-- between을 사용해서 급여가 2000보다 크면서 3000보다 작은 사원만 출력
-- between 사용시 주의사항) 반드시 작은 값을 먼저 정의해야 한다.
select * from emp where sal between 2000 and 3000; -- between을 사용할때 비교연산자를 사용할 필요가 없다
select * from emp where sal between 3000 and 2000; -- 에러가 나지는 않지만 결과가 없다.(논리적 에러)

/* 연습문제 */
-- 00.share\01.실습문제\01.database\01.where\홍길동.sql로 제출
-- ex01) 급여가 1000보다 작은 사원만 출력하기(ename/sal/hiredate 만 출력)
select * from emp where sal < 1000;

-- ex02) 부서(dept)테이블에서 부서번호와, 부서명을 별칭으로 한 sql문을 작성
select * from dept;
select deptno 부서번호, dname 부서명 from dept;

-- ex03) 사원테이블에서 직급만 출력하는데 중복되지 않게 출력하는 sql문
select * from emp;
select distinct job from emp order by 1;

-- ex04) 급여가 800인 사원만 조회
select * from emp where sal = 800;

-- ex05) 사원명이 BLAKE인 사원만 출력
select * from emp where ename = 'BLAKE';

-- ex06) 사원이름 JAMES~MARTIN사이의 사원을 사원번호, 사원명, 급여를 출력
-- and / between 두가지형태로 작성
select empno 사원번호, ename 사원명, sal 급여 from emp where ename between 'JAMES' and 'MARTIN';

select '부서번호는 ' || deptno || ' and ' || '부서명은 ' || dname as "부서번호 and 부서명" from dept;

select sal 급여 from emp;


/* B. in 
컬럼명 in(값1, ...값n)
*/
-- 1. emp에서 부서번호가 10, 20 사원만 조회
select * from emp where deptno >= 10 and deptno <= 20;

select * from emp where deptno between 10 and 20;

select * from emp where deptno in (10,20);

select * from emp order by deptno;

/* C. like
 1. %             : 복수개의 문자, 어떤 값이 와도 상관이 없고 문자수에 제한이 없다.(0개의 문자도 상관없다)
	  
		컬럼(표현식) like '문자열%'  -> 시작
		컬럼(표현식) like '%문자열'  -> 종료
		컬럼(표현식) like '%문자열%' -> 포함
		
 2. _(underscore) : 1개의 문자를 의미
 
 */
 
-- 1. 사원이름이 A로 시작되는 사원만 출력

select * from emp where ename >= 'A' and ename < 'B';

select * from emp where ename between 'A' and 'B';

select * from emp where ename lik
e 'A%';

-- 2. 사원이름이 N으로 끝나는 사원만 출력

select ename, sal, deptno from emp where ename like '%N';

select ename, sal, deptno from emp where ename like '%EN';

select ename, sal, deptno from emp where ename like '%IN';

-- 3. 사원이름이 A를 포함하는 사원만 출력

select ename, sal, deptno from emp where ename like '%A%';

-- 4. sal가 50으로 끝나는 사원만 조회

select * from emp where sal like '%50';

-- 5. 1980년에 입사한 사원만 조회

select * from emp where hiredate like '1980%';  -- 결과안나옴 : 형변환함수 to_date(), to_char()숫자를 문자로, to_number() 문자 날수를 숫자로

-- 6. 입사월이 02월에 입사한 사원만 조회

select * from emp where hiredate like '%02%';

-- 7. 사원명이 4자리인 사원만 조회

select * from emp where ename like '____';

select * from emp where ename like 'S____';

/* D. is null / is not null */

select * from emp;

select * from emp where comm is null;

select * from emp where comm = null;  -- 오라클에서는 결과없음

select * from emp where comm is not null;

select * from emp where comm <> null; -- 오라클에서는 결과없음

select * from emp where comm != null; -- 오라클에서는 결과없음

-- 실습
-- 사원의 총급여를 출력
-- null 값은 연산할 수 없다.
select ename, sal, comm, sal + comm from emp; -- null값을 처리하기 위한 함수 nvl(), nvl2()
select ename, sal, comm, sal + nvl(comm, 0) from emp;

/* E. 기타 */
-- 1. 오라클에서만 존재하는 dummy table
select * from dual;

-- 2. 오라클함수중에서 현재일자를 리턴해 주는 함수 : sysdate

select sysdate from dual;

-- 3. 조건에 맞는 데이터의 건수를 리턴해주는 함수 : count()
select * from emp order by hiredate;

select count(*) from emp;
select count(ename) from emp;
select count(comm) from emp;

-- 4. 부서가 10번인 사원수는?

select * from emp where deptno = 10;

select count(*) from emp where deptno = 10;

select count(deptno) from emp where deptno = 10;

select count(comm) from emp where deptno = 10;

/* 연습문제 */
-- ex01) 입사일이 1982-01-01 이후이면서 급여가 3000보다 크거나 같은 사원목록
select *
  from emp 
 where hiredate >= '1982-01-01' 
   and sal >= 3000;
-- ex02) 사원이름은 S로 시작되면서 급여가 800인 사원
select * 
  from emp 
 where ename like 'S%' 
   and sal = 800;
-- ex03) 급여가 1000보다 크면서 (comm이 1000보다 작거나 comm이 not null) 인사원

select *from emp where comm < 1000 and sal > 1000;

 select * from emp
 where (comm is not null or comm < 1000)
  and sal > 1000;
	
select * from emp where sal > 1000 and (comm is not null or comm < 1000);

-- 비교연산할 경우 연산의 우선순위를 주의할 것
