-- 실습 1. scott의 전체 테이블 조회하기 : tabs
--     2. emp 테이블 전체 자료(행, 레코드...) 조회
--     3. dept 테이블 전체 자료(행, 레코드...) 조회
--     4. bonus 테이블 전체 자료(행, 레코드...) 조회
--     5. salgrade 테이블 전체 자료(행, 레코드..) 조회
select * from tabs;
select * from emp;
select * from dept;
select * from bonus;
select * from salgrade;

/*
A. SQL문의 종류

1. DML(Data Maniqulation Language, 데이터 조작어) : 테이터와 관련된 명령

    1) select : 자료를 조회
	  2) insert : 자료를 추가
		3) delete : 자료를 삭제
		4) update : 자료를 수정
		5) commit : CRUD의 수행작업을 최종적으로 확정
		6) rollback : CRUD의 수행작업을 취소
		
		* CRUD : Create, Read, Update, Delete
		
2. DDL(Data Definition Language, 데이터정의어) : 객체(table, user, role...)관련명령

  1) create   : 유dml rorcp(Object user, table, view, index, ...)를 생성
	2) drop     : DB객체를 삭제(완전삭제), 권한을 함부러 주지 않는다
	3) truncate : DB객체를 삭제(데이터만삭제) 영역을 남겨둔다
	4) alter    : DB객체를 수정
	
3. DCL(Data Control Language, 데이터관리어)

  1) grant  : 사용자에게 권한을 부여
	2) revoke : 사용자권한을 취소
	

b. select 문법

   select [distinct] {*, col1, ...coln [as 별칭]}
	    from 테이블명(view 이름) [별칭]
	  where 조건절 [and, or, like, between...]
		order by 열이름(or 표현식) ... [asc(어센딩)/desc(디센딩)]
		
		1. distinct  : 중복행이 있을 경우에 중복 제거하고 한행만 출력
		2. *         : 객체(table, view...)의 모든 컬럼을 출력
		3. 별칭(alias): 객체나 컬럼명을 별칭으로 정의
		4. where     : 조건에 만족하는 행(데이터)만 검색
		5. 조건절      : 컬럼, 표현식, 상수, 및 비교연산(<, >, =, 등)
		6. order by  : 질의(query)결과를 정렬(asc 오름차순(기본값), desc 내림차순)
			
*/

select hiredate as 입사 일자 from emp;
select job from emp;
select distinct job from emp;

-- 1. 특정테이블에서 특정컬럼(열)의 자료를 조회하기
-- 실습
-- emp테이블에서 empno를 사원번호, ename 사원이름, sal "급 여"
-- 별칭을 부여해서 조회하기
select empno, ename, sal from emp;
select empno as 사원번호, ename as 사원이름, sal as "급 여" from emp;
select empno 사원번호, ename 사원이름, sal "급 여" from emp;

-- 2. 표현식 : literal, 상수, 문자열 : 표현식은 작은 따옴표로 정의해야 한다.
select '' ename from emp; -- ''를 ename이라는 별칭으로 정의
select '사원이름 =', ename from emp;
select "사원이름 =", ename from emp; -- 큰따옴표는 에러 걸린다
select '사원이름 =', "ename" from emp; -- 큰 따옴표일 경우 컬럼명은 대소문자를 구분한다.
select '사원이름 =', "ENAME" from emp;
select '사원이름 =', "ENAME" from "emp"; -- 에러
select '사원이름 =', "ENAME" from "EMP";
SELECT '사원이름 =', ENAME FROM EMP;

-- 3. distinct : 중복제거
select * from emp;
select * from dept;
select deptno from emp;
select distinct deptno from emp;
select deptno distinct from emp; -- 에러 : distinct는 열이름 앞에 의치해야 한다.

-- 실습 : 부서와 직책을 조회할 때 중복을 제거
select deptno, job from emp;
select distinct deptno, distinct job from emp; --에러 
select distinct deptno, job from emp;

-- 실습 : 부서번호순서로 정렬해서 조회하기 (asc, desc)
select * from emp;
select * from emp order by deptno;
select * from emp order by deptno asc;
select * from emp order by deptno desc;
select * from emp order by 1 asc;
select * from emp order by 8 asc;
select deptno, job from emp order by 1 asc;
select deptno, job from emp order by deptno desc, job asc;
select deptno, job from emp order by 1, 2;
select deptno, job from emp order by 1 desc, 2 asc;

-- 실습. deptno, job의 중복제거하고 부서번호 역순, 직책 정순으로 조회
select distinct deptno, job from emp order by deptno desc, job asc;
select distinct deptno, job from emp order by 1 desc, 2 asc;

select distinct deptno 부서번호, job from emp order by 부서번호 desc, job asc;

-- 별칭(alias)으로 열이름 부여하기
select ename from emp;
select '사원이름', ename from emp;  -- ilteral(문자열)은 하나의 열로 인식이 된다.
select 사원이름, ename from emp;    --  컴럼으로 인식 즉, 테이블에 컬럼이 존재하는 것으로 인식되기 때문에 에러


-- 작은 따옴표 사용시 주의사항
-- smith's의 이름은 ???
select ename from emp;
select ename from emp ename = 'SMITH';
-- 출력 smith's의 이름은 smith 입니다.
select 'smith''s 이름은', ename, '입니다' from emp where ename = 'SMITH';

-- 컬럼 및 문자열을 연결하기
-- concat() 함수 or  || 연산자 :
select 'smith''s이름은' || ename || '입니다' from emp where ename= 'SMITH';
select 'smith''s이름은' || ename || '입니다' as 사원이름 from emp where ename= 'SMITH';


select concat('smith''s 이름은', ename) from emp where ename = 'SMITH';
select concat('smith''s 이름은', ename, '입니다') from emp where ename = 'SMITH'; --에러
select concat(concat('smith''s 이름은', ename),'입니다') from emp where ename = 'SMITH';

-- 실습. smith의 부서는 10번 입니다 형태로 출력
select ename, deptno from emp;
select ename || ' 의 부서는' || deptno || '번 입니다' as 사원부서 from emp;
select concat(ename, ' 의 부서는') || deptno || '번 입니다' as 사원부서 from emp;
select concat(concat(ename, ' 의 부서는'), deptno) || '번 입니다' as 사원부서 from emp;
select concat(concat(concat(ename, ' 의 부서는'), deptno), '번 입니다') as 사원부서 from emp;


/* C. 연습문제 */
-- 1. Student 에서 학생들의 정보를 이용해서 "Id and Weight" 형식으로 출력하세요
select * from student;
select id, weight from student;
select id || ' and ' || weight as "Id and Weight" from student;
select name || '''s ID = ' || id || ', Weight is ' || weight || 'kg' as "Id and Weight" from student order by 1;

-- 2. emp에서 "Name and Job"형식으로 출력
select 'Name : ' || ename || ' and ' || 'Job : ' || job as "Name and Job" from emp;

-- 3. emp에서 "Name and Sal"
select 'Name : ' || ename || ' and ' || 'Sal : ' || sal as "Name and Sal" from emp;
select ename || '의 급여는 $' || sal as "사원이름과 급여" from emp order by 1;




