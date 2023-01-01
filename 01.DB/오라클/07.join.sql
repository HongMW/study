/*
  Join 문법
	
	1. 오라클 문법
	
	  select e.ename, e.deptno, e.dname
		  from emp e, dept d
			where e.deptno = d.deptno;
	2. ANSI Join
	
	  select e.ename, e.deptno, d.dname
		from emp e inner join dept d on e.deptno = d.deptno;
*/

select deptno, ename from emp;
select deptno, dname from dept;

select deptno, ename, dname
from emp, dept; -- deptno를 어디서 가져올지 판단할 수 없기 때문에 에러

select dept.deptno, ename, dname
from emp, dept; -- 조건이 없는 커티션곱인 결과

select dept.deptno, ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select dept.deptno, emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

-- 테이블 별칭
select d.deptno, e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- ansi
select d.deptno, e.deptno, e.ename, d.dname
from emp e inner join dept d on e.deptno = d.deptno;

-- A. 등가조인(equi join)
-- 실습1. student, professor에서 지도교수의 이름과 학생의 이름을 출력
-- orecla, ansi 각각 실행해 보세요
select * from student;
select * from professor;
select* from department;

select s.name, p.name
from student s, professor p
where s.profno = p.profno;

--ansi
select s.deptno1, p.deptno, s.name, p.name
from student s inner join professor p
on s.profno = p.profno;

-- 실습2. student, professor, department에서 지도교수의 이름과 학생의 이름과 학과명을 출력
--  orecla, ansi 각각 실행해 보세요
select s.name, d.dname, p.name
 from student s, department d, professor p
 where s.deptno1 = d.deptno and s.deptno1 = p.deptno;

--ansi
select s.name, d.dname, p.name
 from student s inner join professor p on s.profno = p.profno
                inner join department d on s.deptno1 = d.deptno;

/* B. outer join */
select count(*) from student;
select count(*) from student where profno is null;

-- 지도교수가 정해져있지 않은 학생도 출력
-- 1) 오라클문법
select s.name 학생명, p.name 교수명
from student s, professor p
where s.profno = p.profno(+);

-- 2) ansi
select s.name 학생명, p.name 교수명
from student s left outer join professor p on s.profno = p.profno;

-- 학생이 할당되지 않은 지도교수도 출력
-- 1) 오라클
select s.name 학생명, p.name 교수명
from student s, professor p
where s.profno(+) = p.profno;

-- 2) ansi
select s.name 학생명, p.name 교수명
from student s right outer join professor p on s.profno = p.profno;

/* C. self join */
select distinc(mgr) from emp;

select empno, ename from emp emp;
select empno, mgr from emp mgr;

select emp.empno 사원번호, emp.ename 사원이름
     , mgr.empno 관리자번호, mgr.ename 관리자명
 from emp emp, emp mgr
where emp.mgr = mgr.empno;


-- 실습
-- 1. student, department에서 학생명, 학과번호, 1전공과목명 출력
-- 2. emp2 , p_grade에서 현재 직급의 사원명, 직급, 현재연봉, 해당직급의 하한/ 상한금앨륵 출력(천단위 , 로 구분)
-- 3. emp2 , p_grade에서 사원명, 나이, 직급, 예상직급(나이를 계산후에 해당 나이의 직급), 나이는 오늘날짜를 기준
--    trunc로 소수점이하는 절살
select * from emp2;
select * from p_grade;

-- 1. student, department에서 학생명, 학과번호, 1전공과목명 출력
select * from student;
select* from department;

select st.name 학생명, st.deptno1 학과번호, de.dname "1전공과목명"
 from student st, department de
 where st.deptno1 = de.deptno;
 
 select st.name 학생명, st.deptno1 학과번호, de.dname "1전공과목명"
 from student st join department de
 on st.deptno1 = de.deptno;
 
 
 -- 2. emp2 , p_grade에서 현재 직급의 사원명, 직급, 현재연봉, 해당직급의 하한/ 상한금앨륵 출력(천단위 , 로 구분)
select * from emp2;
select * from p_grade;

select em.name
     , em.position 
		 , ltrim(to_char(em.pay, '999,999,999,999')) 연봉
		 , ltrim(to_char(gr.s_pay, '999,999,999,999')) 하한급여
		 , ltrim(to_char(gr.e_pay, '999,999,999,999')) 상한급여
 from emp2 em, p_grade gr
 where em.position = gr.position;



-- 3. emp2 , p_grade에서 사원명, 나이, 직급, 예상직급(나이를 계산후에 해당 나이의 직급), 나이는 오늘날짜를 기준
--    trunc로 소수점이하는 절살
select * from emp2;
select * from p_grade;

select em.birthday
     , sysdate - em.birthday
		 , trunc((sysdate - em.birthday) / 365, 0)
	from emp2 em;

select em.name
     , trunc((sysdate - em.birthday) / 365, 0)
     , em.position "현재 직급"
		 , gr.position 예상직급
 from emp2 em, p_grade gr
 where trunc((sysdate - em.birthday) / 365, 0) between gr.s_age and gr.e_age;
 
 select emp.name
     , trunc((sysdate - emp.birthday) / 365, 0)
     , emp.position 현재직급
		 , grd.position 예상직급
  from emp2 emp, p_grade grd
 where trunc((sysdate - emp.birthday) / 365, 0) between grd.s_age and grd.e_age;
 
 select em.name
     , em.position "현재 직급"
		 , gr.position 예상직급
 from emp2 em join p_grade gr
 on trunc((sysdate - em.birthday) / 365, 0) between gr.s_age and gr.e_age;
 
 -- 4. customer, gift에서 고객포인트보다 낮은 포인트의 상품중에서 Notebooke을 선택할
 -- 수 있는 고객명과 포인트, 상품명을 풀력하기
select * from customer;
select * from gift;

select cus.gname 고객명
     , cus.point 마일리지
		 , gf.gname 상품명
 from customer cus, gift gf
where cus.point > gf.g_start
  and gf.gname = 'Notebook';

select cus.gname 고객명
     , cus.point 마일리지
		 , gf.gname 상품명
 from customer cus join gift gf
   on cus.point > gf.g_start
  and gf.gname = 'Notebook';

-- 5. emp에서 사원번호,  사원명, 입사일이 자신보다 먼저 입사한 인원수를 출력
-- 단, 입사일이 빠른 사원수를 오름차순으로 정렬
-- self join
select empno, ename from emp emp;
select empno, mgr from emp mgr;

select emp.empno 사원번호, emp.ename 사원이름
     , mgr.empno 관리자번호, mgr.ename 관리자명
 from emp emp, emp mgr
where emp.mgr = mgr.empno;

select * from emp e1;
select * from emp e2;

select e1.empno 사원번호
      , e1.ename 사원명			
      , to_char(e1.hiredate, 'yyyy-mm-dd') 입사일
			,count(e2.hiredate)
  from emp e1, emp e2
	where e1.hiredate > e2.hiredate(+)
	 and e1.hiredate is not null
	 group by e1.empno, e1.ename, to_char(e1.hiredate, 'yyyy-mm-dd')
	order by 3;




