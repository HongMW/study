/* A. 그룹함수 */
-- 1. count : 조건에 맞는 행의 갯수를 리턴
select count(*) from emp;
select count(sal), count(comm), count(nvl(comm, 0)) from emp;
-- 부서별 인원수?
select count(*) from emp where deptno = 10
union
select count(*) from emp where deptno = 20
union
select count(*) from emp where deptno = 30;

-- 2. sum()
--총급여
select sum(sal) from emp;
select sum(ename) from emp; --에러
select count(ename), sum(sal), round(sum(sal) / count(ename), 0) from emp;

-- 3. avg()
--평균급여
select avg(sal) from emp;
select count(ename), sum(sal), round(sum(sal) / count(ename), 0) from emp
union all
select count(ename), sum(sal), round(avg(sal), 0) from emp;

-- 4. max()/ min()
-- 최대급여/ 최소급여
select min(sal), max(sal) from emp;

-- 실습. 
-- 1. sal+comm 총급여, 평균급여를 구하기
select sum(sal+nvl(comm, 0)), round(sum(sal+nvl(comm, 0))/ count(ename), 0) from emp;
select count(ename), sum(sal), round(avg(sal+nvl(comm, 0)), 0) from emp;
-- 2. 1) 최소급여 / 최대급여
select min(sal), max(sal) from emp;

--    2) 최소급여자? 최대급여자?
select ename, sal from emp where sal = (select min(sal) from emp)
union
select ename, sal from emp where sal = (select max(sal) from emp);
--    3) 최초입사자?, 최종이사자?
select min(hiredate), max(hiredate) from emp;
select ename, hiredate from emp where hiredate = '1980-12-17'
union
select ename, hiredate from emp where hiredate = '1987-05-23';

select ename, hiredate from emp where hiredate = (select min(hiredate) from emp)
union
select ename, hiredate from emp where hiredate = (select max(hiredate) from emp);

/*
  B. 그룹화하기(group by)
	
	1. select 절에는 그룹함수 이외의 칼럼이나 표현식을 사용할 경우에 반듯;
	   group by절에 선언이 되어야 한다. group by절에 선언된 컬럼은 select절에
		 포함되지 않아도 된다
	2, group by절에는 반드시 컬럼명이나 표현식이 사용되어야 한다. 즉, 컬럼별칭은
	   시용할 수 없다.
  3. group by절에 사용한 열기준으로 정렬을 하기 위해서 order by절을 사용할 경우
	   반드시 group by절 뒤에 선언해야 한다. 즉, order by절은 group by절 뒤에 위치
		 해야 한다., order by절은 순번 or 별칭으로도 정의가 가능하다.
*/
-- 부서별 인원수?
select count(*) from emp where deptno = 10
union
select count(*) from emp where deptno = 20
union
select count(*) from emp where deptno = 30;

select deptno, count(*) 
  from emp 
group by deptno
order by deptno; 
-- group by 보다 order by가 먼저 쓰이면 에러가 난다

-- 부서별 총급여/평균급여
-- 1) union all
select sum(sal) "부서 총급여", round(avg(sal)) from emp where deptno = 10
union all
select sum(sal) "부서 총급여", round(avg(sal)) from emp where deptno = 20
union all
select sum(sal) "부서 총급여", round(avg(sal)) from emp where deptno = 30;

select sum(sal), round(avg(sal), 0) from emp where deptno = 30;

-- 2) group by
select deptno, sum(sal), round(avg(sal)) from emp group by deptno order by deptno;

-- 실습
-- ex01) 부서별로 사원수와 급여 평균, 급여합계를 구하기, 정렬은 부서(deptno)

select deptno, count(ename), round(avg(sal)), sum(sal) from emp group by deptno order by 1;

-- 강사님

select deptno 부서, count(*) 사원수, round(avg(sal)) "급여 평균", sum(sal) 급여합계 from emp group by deptno order by 1;


-- ex02) 업무별로 인원수, 평균급여, 최고급여, 최소급여, 급여 합계, 정렬은 직급(job)

select job 직급, count(ename) 사원수, round(avg(sal)) 평균급여, min(sal)최소급여, max(sal)최고급여, sum(sal) "급여 합계" from emp group by job order by job;

-- 강사님

select job 직급, count(*) 사원수, round(avg(sal)) 평균급여, min(sal)최소급여, max(sal)최고급여, sum(sal) "급여 합계" from emp group by job order by job;

-- ex03) 2번예제 기준으로 부서별, 직급별로 출력하기

select deptno 부서, job 직급, count(*) 사원수, round(avg(sal)) 평균급여, min(sal)최소급여, max(sal)최고급여, sum(sal) "급여 합계" from emp group by deptno, job order by job;
select deptno 부서, job 직급, count(*) 사원수, round(avg(sal)) 평균급여, min(sal)최소급여, max(sal)최고급여, sum(sal) "급여 합계" from emp group by deptno, job order by deptno;

-- ex04) 2번예제를 기준으로 10번 부서만 출력

select job 직급, count(*) 사원수, round(avg(sal)) 평균급여, min(sal)최소급여, max(sal)최고급여, sum(sal) "급여 합계" from emp  where deptno = 10 group by job order by job;


-- 부서의 평균 급여가 3000 보다 크거나 같은 부서만 조회하기

select job 직급
     , count(*) 사원수
		 , round(avg(sal)) 평균급여
		 , min(sal)최소급여
		 , max(sal)최고급여
		 , sum(sal) "급여 합계" 
  from emp  
group by job 
where round(avg(sal)) 
order by job; -- 에러

-- 그룹함수에 조건을 정의하기 위해서는 where절을 사용할 수 없다.
-- 대신에 having적을 사용한다


/* 
  having 조건절 : 그룹결과를 조건별로 조회하기 위해서 사용
	
	단일행 함수에서 사용된 where 조건절과 동일하다.
	즉, 그룹결과에서는 조건을 주기위해서는 having절을 사용하고 where조건절에는 집계함수를
	사용할 수 없다
	
	having절에는 집계함수를 가지고 조건을 비교할 경우에 사용되며 having절과 group by절은
	함계 사용할 수 있다. 즉, having절은 group by절 없이는 사용할 수가 없다.
 */

select job 직급
     , count(*) 사원수
		 , round(avg(sal)) 평균급여
		 , min(sal)최소급여
		 , max(sal)최고급여
		 , sum(sal) "급여 합계" 
  from emp  
group by job 
having round(avg(sal)) >= 3000
order by job;

-- 실습. emp에서
-- 1. 부서별/직급별 평균급여, 사원수
select * from emp;
select deptno, job, round(avg(sal)), count(*) from emp group by job, deptno;

-- 2, 부서별        평균급여, 사원수
select deptno, round(avg(sal)), count(*) from emp group by deptno;

-- 3. 총계          평균급여, 사원수
select round(avg(sal)), count(*) from emp;

-- union all
select deptno, job, round(avg(sal)), count(*) from emp group by job, deptno
union all
select deptno, round(avg(sal)), count(*) from emp group by deptno
union all
select round(avg(sal)), count(*) from emp;

-- 강사님
select * from
(select deptno, job, round(avg(sal)), count(*) from emp group by job, deptno
union all
select deptno, null, round(avg(sal)), count(*) from emp group by deptno
union all
select 99, null, round(avg(sal)), count(*) from emp) order by deptno, job;

-- rollup : 자동으로 소계와 합계를 구해주는 함수
-- group by rollup(deptno, job)n + 1개의 그룹이 생성
-- rollup(순서에 주의)
select deptno
     , job
		 , round(avg(sal))
 from emp
group by rollup(deptno, job);

select deptno
     , nvl(job, '----부서합계----')
		 , round(avg(sal))
 from emp
group by deptno, rollup(job);

select deptno
     , nvl(job, '----부서합계----')
		 , round(avg(sal))
 from emp
group by job, rollup(deptno);

-- 실습. professor테이블에 deptno, position별로 교수인원수, 급여합계구하기
-- rollup 함수 이용하기
select * from professor;
select deptno, position
     , nvl(position, '------')
		 , count(*) 인원수
		 , sum(pay) 부서합계
  from professor
group by rollup(deptno, position);






-- cube
select * from professor;
select deptno, position
     , nvl(position, '------')
		 , count(*) 인원수
		 , sum(pay) 부서합계
  from professor
group by cube(deptno, position);

-- pivot : 엑셀의 pivot과 동일한 기능

/* E. 누적함수

   1. sum(컬럼) over(order by 기준열) : 누계(누적)함수
	   --> sum() over(partition by order by 기준열)
	 2. ratio_to_report() : 비율을 구하는 함수
*/
-- 1. sum() over()
select * from panmae;
select * from panmae where p_store = 1000 order by 1;

-- 1000번대리점의 판매누계액 구하기
select p_date
     , p_code
		 , p_qty
		 , p_total
		 , sum(p_total) over(order by p_date, p_code) 판매누계액
 from panmae
 where p_store = 1000 order by 1;

-- 상기예제를 기준으로 제품코드/대리점별 누계구하기
select p_date
     , p_code
		 , p_qty
		 , p_total
		 , sum(p_total) over(partition by p_code, p_store order by p_date) 판매누계액
 from panmae;

-- 2. ration_to_report : 판매비율
select p_code
     , sum(p_qty) over() 팬매수량
		 , p_store
		 , p_total
		 , round(ratio_to_report(sum(p_qty)) over() * 100.2) "수량(%)"
		 , round(ratio_to_report(sum(p_total)) over() *100, 2) "금액(%)"
 from panmae
group by p_code, p_store, p_qty, p_total;


/* 연습문제 */
-- 1. emp 테이블을 사용하여 사원 중에서 급여(sal)와 보너스(comm)를 합친 금액이 가장 많은 경우와 
--    가장 적은 경우 , 평균 금액을 구하세요. 단 보너스가 없을 경우는 보너스를 0 으로 계산하고 
--    출력 금액은 모두 소수점 첫째 자리까지만 나오게 하세요
-- MAX, MIN, AVG

-- 2. student 테이블의 birthday 컬럼을 참조해서 월별로 생일자수를 출력하세요
-- TOTAL, JAN, ...,  5 DEC
--  20EA   3EA ....

-- 3. Student 테이블의 tel 컬럼을 참고하여 아래와 같이 지역별 인원수를 출력하세요.
--    단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM
--    으로 출력하세요

-- 4. emp 테이블을 사용하여 직원들의 급여와 전체 급여의 누적 급여금액을 출력,
-- 단 급여를 오름차순으로 정렬해서 출력하세요.
-- sum() over()

-- 5. student 테이블의 Tel 컬럼을 사용하여 아래와 같이 지역별 인원수와 전체대비 차지하는 비율을 
--    출력하세요.(단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU,055-GYEONGNAM)

-- 7. emp 테이블을 사용하여 부서별로 급여 누적 합계가 나오도록 출력하세요. 
-- ( 단 부서번호로 오름차순 출력하세요. )

-- 8. emp 테이블을 사용하여 각 사원의 급여액이 전체 직원 급여총액에서 몇 %의 비율을 
--    차지하는지 출력하세요. 단 급여 비중이 높은 사람이 먼저 출력되도록 하세요

-- 9. emp 테이블을 조회하여 각 직원들의 급여가 해당 부서 합계금액에서 몇 %의 비중을
--     차지하는지를 출력하세요. 단 부서번호를 기준으로 오름차순으로 출력하세요.