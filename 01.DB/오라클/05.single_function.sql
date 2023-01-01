/* 단일행 함수*/
-- A. 문자함수
-- 1. initcap()
select ename from emp;
select initcap(ename) from emp;

-- 2. upper() / lower()
select ename from emp;
select lower(ename) from emp;
select upper(lower(ename)) from emp;
select initcap(upper(lower(ename))) from emp;

-- 3. length, lengthb
select ename, length(ename) from emp;
select '홍길동', length('홍길동'), lengthb('홍길동') from dual;  -- utf-8 문자셋 한글 한자당 3bytes

-- 4. concat () / ||
select name, id
     , concat(name, '-') "name-"
		 , concat(concat(name, '-'),id) "name-id"
		 , concat(concat('홍길동의 직업은','의적입니다'),' 나이는 1000살입니다') as 홍길동
		 , '홍길동의 직업은 ' || '의적입니다' || ' 나이는 1000살입니다' as 홍길동
 from professor;
 
 -- 5. substr(값, 위치, 갯수) / substrb(값, 위치, 갯수)
 select 'abcde'
      , substr('abcde', 3, 2) as cd1
			, substr('abcde', -3, 2) as cd2
			, substr('abcde', 2, 3) as bcd1
			, substr('abcde', -4, 3) as bcd2 
	from dual;
 
 select '홍길동'
     , substr('홍길동', 1, 1) as 홍길동1
		 , substrb('홍길동', 1, 1) as 홍길동2
		 , substrb('홍길동',1,2) as 홍길동3
		 , substrb('홍길동',1,3) as 홍길동4 
	from dual;
 
 -- 6. instr(문자열, 검색글자, 시작위치(기본값 1), 몇번재(기본값, 1))
 -- 검색한 글자의 위치를 리턴
 -- 시작위치가 음수일 경우 뒤에서 부터 검색
 select 'A*B*C*D'
      , instr('A*B*C*D', '*') as "2nd"
			, instr('A*B*C*D', '*', 3) as "4th"
			, instr('A*B*C*D', '*', 1, 2) as "4th1" 
			, instr('A*B*C*D', '*', 5) as "6th"
			, instr('A*B*C*D', '*', 1, 3) as "6th1"
			, instr('A*B*C*D', '*', -5, 1) as "2nd1"
			, instr('A*B*C*D', '*', -1, 2)
	from dual;

select 'HELLO WORLD'
     , instr('HELLO WORLD', 'O')
		 , instr('HELLO WORLD', 'O', -1)
		 , instr('HELLO WORLD', 'O', -2)
  from dual;

-- 7, lpad(문자열, 자리수, 채울문자) / rpad(문자열, 자리수, 채울문자)
select name, id, length(id)
     , lpad(id, 10, '*')
		 , rpad(id, 10, '*')
  from student;


-- 8. ltrim() / rtrim()
select ename
     , ltrim(ename, 'C')
		 , rtrim(ename, 'R')
 from emp;

select '   xxx    ' from dual
union all
select ltrim('   xxx    ') from dual
union all
select rtrim('   xxx    ') from dual
union all
select trim('   xxx    ') from dual;

-- 9. replace(문자열, 변경전문자, 변경후문자)
select ename
     , replace(ename, 'KI', '**')
		 , replace(ename, 'I', '_______________')
		 -- **ARK, **NG, **LLER, substr()
		 , substr(ename, 1, 2)
		 , replace(ename, substr(ename, 1, 2), '**')
  from emp
 where deptno = 10;

-- B. 숫자함수
-- 1. round(실수, 반올림위치)(소수)
select 976.235 
     , round(976.235)
		 , round(976.235, 0)
		 , round(976.235, 1)
		 , round(976.235, 2)
		 , round(976.235, 3)
		 , round(976.235, -1)
		 , round(976.235, -2)
		 , round(976.235, -3)
  from dual;

-- 2. trunc(실수, 버림위치)
select 976.235
		, trunc(976.235)
		, trunc(976.235, 0)
		, trunc(976.235, 1)
		, trunc(976.235, 2)
		, trunc(976.235, 3)
		, trunc(976.235, -1)
		, trunc(976.235, -2)
		, trunc(976.235, -3)
  from dual;

-- 3. mod, ceil, floor
select 121
     , mod(121, 10) -- 121/10 -> 몫 = 12, 나머지 = 1
		 , ceil(123.45) -- 124
		 , ceil(123.0000001) -- 124
		 , floor(123.45) -- 123
		 , floor(123.0000001) -- 123
 from dual;

-- 4. power
select '2의 3승 = ', power(2, 3) from dual;
select '3의 3승 = ', power (3, 3) from dual;

-- 5. rownum : 오라클에서만 사용되는 속성으로 모든 객체에서 사용할 수 있다.
-- rownum은 전체열 즉, *와는 같이 사용할 수 없다.
-- rownum은 행번호를 의미한다.
select * from student;
select rownum, * from student; -- 에러, 같이 사용할 수 없다.
select rownum, name from student;
select * from
select rownum rn, name, id, jumin from student where deptno1 = 101;

select * from
(select rownum rn, name, id, jumin from student where deptno1 = 101) order by name;

-- C. 날짜함수
-- 1. sysdate
select sysdate from dual;

-- 2. months_between
select months_between(sysdate, '20211031') from dual;
select months_between(sysdate, '2021-10-31') from dual;
select months_between(sysdate, '2021.10.31') from dual;
select ename, hiredate from emp;

-- 근속개월수
select ename, hiredate, months_between(sysdate, hiredate) from emp;

-- 3. add_months
select sysdate
     , add_months(sysdate, 2)
		 , add_months(sysdate, -4)
		 from dual;

-- 4. next_day
select sysdate
     , next_day(sysdate, 1) -- 1~7 : 일요일 ~ 토요일
		 , next_day(sysdate, 2)
		 , next_day(sysdate, 3)
		 , next_day(sysdate, 4)
		 , next_day(sysdate, 5)
		 , next_day(sysdate, 6)
		 , next_day(sysdate, 7)
 from dual;

-- 5. last_day
select sysdate
     , last_day(sysdate)
		 , last_day('20211001')
		 , last_day('2021.09.01')
 from dual;

select sysdate
    , round(sysdate)
		, trunc(sysdate)
		, round('20221020')
		, trunc('20221020')
	from dual;

/* D. 형변환함수

  1. to_char   : 날짜 or 숫자를 문자로 변환
	2. to_number : 문자형숫자를 숫자로 변환(단, 해당 문자열이 숫자형식이어야 한다.)
	3. to_date   : 문자형을 날짜형으로 변환(단, 날짜형식에 맞아야 한다.)
	
*/
-- 1. 묵시적(암묵적, 자동) / 명시적(수동)변환
-- 1) to_number
select 2 + 2 from dual
union all
select 2 + '2' from dual; -- 묵시적

select 2 + '2a' from dual; -- 에러

select 2 + to_number('2') from dual; -- 명시적

select * from emp where sal like '%50';

select 'A' + 2 from dual;

-- 2. to_char()
-- 1) 날짜에서 문자로
-- a. 연
select sysdate
    , to_char(sysdate) -- 시스템환경변수 RR/MM/DD
		, to_char(sysdate, 'YYYY') -- YYYY
		, to_char(sysdate, 'RRRR') -- YYYY
    , to_char(sysdate, 'YY') -- YY
		, to_char(sysdate, 'RR') -- YY
		, to_char(sysdate, 'yy') -- YY
		, to_char(sysdate, 'YEAR') -- YYYY
		, to_char(sysdate, 'year') -- yyyy
  from dual;

-- b. 월
select sysdate
    , to_char(sysdate) -- 시스템환경변수 RR/MM/DD
		, to_char(sysdate, 'MM') -- 10
		, to_char(sysdate, 'MON') -- 10월
		, to_char(sysdate, 'MONTH') -- 10월
		, to_char(sysdate, 'mm') -- 10
		, to_char(sysdate, 'month') -- 10월
  from dual;
	
-- c. 일
select sysdate
    , to_char(sysdate) -- 시스템환경변수 RR/MM/DD
		, to_char(sysdate, 'DD') -- 31
		, to_char(sysdate, 'DAY') -- 월요일
		, to_char(sysdate, 'DDTH') -- 31ST
		, to_char(sysdate, 'dd')
		, to_char(sysdate, 'day') 
		, to_char(sysdate, 'ddth')
 from dual;
	
	
	-- d. susdnjfdlf
 select sysdate
     , to_char(sysdate) -- 시스템환경변수 RR/MM/DD
		 , to_char(sysdate, 'YYYY.MM.DD') -- YYYY.MM.DD
		 , to_char(sysdate, 'YYYY/MM/DD') -- YYYY/MM/DD
		 , to_char(sysdate, 'YYYY-MM-DD') -- YYYY-MM-DD
		 , to_char(sysdate, 'YYYY.MM.DD hh:mi') -- YYYY.MM.DD HH:MI
		 , to_char(sysdate, 'YYYY.MM.DD hh:mi:ss') -- YYYY.MM.DD HH:MI:SS
	   , to_char(sysdate, 'YYYY.MM.DD hh24:mi:ss') -- YYYY.MM.DD HH24:MI:SS
	   , to_char(sysdate, 'MON.DD.YYYY HH:MI:SS')
	 from dual;
	
-- 2) 숫자를 문자로
-- 12345 -> 12,345 or 12345.00의 형태로 변환
select 12345
     , to_char(1234, '9999')
		 , to_char(1234, '999999999')
		 , to_char(1234, '099999999')
		 , to_char(1234, '$9999')
		 , to_char(1234, '$9999.99')
		 , to_char(1234, '9,999')
		 , to_char(123456789, '9,999')
		 , to_char(123456789, '9,,999,999,999')
  from dual;

/* 연습문제 */
-- ex01) emp테이블에서 ename, hiredate, 근속년, 근속월, 근속일수 출력, deptno = 10;
-- months_between, round, turnc, 개월수계산(/12), 일수계산(/365, /12)
-- ex02) student에서 birthday중 생일 1월의 학생의 이름과 생일을 출력(YYYY-MM-DD)
-- ex03) emp에서 hiredate가 1,2,3월인 사람들의 사번, 이름, 입사일을 출력
-- ex04) emp 테이블을 조회하여 이름이 'ALLEN' 인 사원의 사번과 이름과 연봉을 
--       출력하세요. 단 연봉은 (sal * 12)+comm 로 계산하고 천 단위 구분기호로 표시하세요.
--       7499 ALLEN 1600 300 19,50
-- ex05) professor 테이블을 조회하여 201 번 학과에 근무하는 교수들의 이름과 
--       급여, 보너스, 연봉을 아래와 같이 출력하세요. 단 연봉은 (pay*12)+bonus
--       로 계산합니다.
--       name pay bonus 6,970
-- ex06) emp 테이블을 조회하여 comm 값을 가지고 있는 사람들의 empno , ename , hiredate ,
--       총연봉,15% 인상 후 연봉을 아래 화면처럼 출력하세요. 단 총연봉은 (sal*12)+comm 으로 계산하고 
--       15% 인상한 값은 총연봉의 15% 인상 값입니다.
--      (HIREDATE 컬럼의 날짜 형식과 SAL 컬럼 , 15% UP 컬럼의 $ 표시와 , 기호 나오게 하세요)

/* E. 기타함수

1. nvl()     : null값을 다른 값으로 치환, nvl(컬럼, 치환할 값)
2. nvl2()    : null값을 다른 값으로 치환, nvl2(컬럼, null일 경우, null이 아닐경우)
3. decode()  : 오라클에서만 사용되는 함수 if~else문과 유사
4. case      : decode대신에 일발적으로 사용되는 문법

       case  조건  when  결과1  then  출력1
			            [when 결과n then 출력n]
				end as 별칭

*/
-- 1. nvl()
select name, pay, bonus
     , nvl(bonus, 0)
		 , to_char(pay*12+bonus, '999,999') 총급여
		 , to_char(pay*12+nvl(bonus, 0), '999,999') 총급여
 from professor
 where deptno = 201;
 
select ename, sal, comm, nvl(comm, 0)
     , sal + nvl(comm, 0) 총급여
		 , sal + comm
 from emp;

-- 2. nvl2(col, false, true)
select name, pay, bonus
--      , nvl(bonus, 0)
     , nvl2(bonus, bonus, 0) 보너스
		 , nvl2(bonus, pay+bonus, pay) 총급여
 from professor
 where deptno = 201;

select ename
     , sal
		 , comm
		 , sal + nvl(comm, 0)
		 , sal + nvl(comm, 100)
		 , nvl2(comm, '널값이 아닙니다', '널값입니다!')
-- 		 , nvl2(comm, 100, '널값입니다!') -- 결과가 데이터타입이 다른 경우에는 에러 발생
     , nvl2(comm, '널값이 아닙니다', 1000)
 from emp;

/* 연습문제 */
-- ex01) Professor 테이블에서 201번 학과 교수들의 이름과 급여, bonus , 총 연봉을 출력하세요. 
--       단 총 연봉은 (pay*12+bonus) 로 계산하고 bonus 가 없는 교수는 0으로 계산하세요
select name, pay, nvl(bonus, 0), ltrim(to_char(pay + nvl(bonus, 0), '$999,999,999')) "총 연봉" from professor;

select name, pay, nvl2(bonus, bonus, 0) bonus, ltrim(to_char(pay + nvl2(bonus, bonus, 0), '$999,999,999')) "총 연봉" from professor;

select name, pay, nvl2(bonus, bonus, 0) bonus, ltrim(to_char(nvl2(bonus, pay + bonus, pay), '$999,999,999')) "총 연봉" from professor;

-- ex02) 아래 화면과 같이 emp 테이블에서 deptno 가 30 번인 사원들을 조회하여 comm 값이 있을 경우
--       'Exist' 을 출력하고 comm 값이 null 일 경우 'NULL' 을 출력하세요
select nvl(comm, 0), nvl2(comm, 'Exist', 'NULL') 보너스 from emp where deptno = 30;


/*
  3. decode함수
	
	1) 통상적으로 if문을 decode로 표현한 함수로 오라클애서만 사용되는 함수
	2) 오라클에서 자주 사용되는 중요한 함수이다.
	3) decode(a, b, true, fale) 즉, a=b일 경우 true를 실행, 아닐 경우 false를 실행
	   --> if~else문과 동일
  4) 사용하는 예제
	
	decode(deptno, 101, true,
	               102, true,
								 193, true, flase) : if~else if~else~
								 
  decode(deptnom, 101, decode()) : 중첩if문과 유사

*/
-- 101이면 컴공, 아니면 기타학과
select name, deptno
     , decode(deptno, 101, '컴퓨터공학') -- 단순 if
		 , decode(deptno, 101, '컴퓨터공학', '기타학과') -- if ~ else
  from professor;

select * from department;

-- 실습 / 101 : 컴공, 102 : 미디어융합, 103 : 소프트 공학, 나머지는 기타공학

select name, deptno
     , decode(deptno, 101, decode(deptno, 102, decode(deptno, 103, '기타공학')'소프트공학'), '미디어융합')
	from professor;

select name, deptno
     , decode(deptno, 101, '컴공', decode(deptno, 102, '미디어융합', decode(deptno, 103, '소프트공학', '기타공학')) )
	from professor;

select name, deptno
     , decode(deptno, 101, '컴공', 102, '미디어융합', 103, '소프트공학', '기타공학') 담당학과
	from professor;

-- 연습문제 - 중첩 decode 연습문제
-- ex01) 101학과 교수중에서 Audie Murphy교수는 Best 아니면 Good을 출력, 101학과가 아닌 교수는 N/A 
select name, deptno
		 , decode(deptno, 101, decode(name, 'Audie Murphy', 'Best!!', 'Good!!' ), 'N/A' )
  from professor;
 
-- ex02) student에서 전공이 101인 학생들중에 jumin 성별구분해서 
-- 1 or 3=남자 2 or 4=여자를 출력
--       name, jumin, gender
select name, jumin
     , decode(substr(jumin, 7, 1), 1, '남', 2, '여') gender
 from student
 where deptno1 = 101;
 
 --강사님 제시
select name, jumin
     , decode(substr(jumin, 7, 1), 1, '남', '여') gender
		 , decode(substr(jumin, 7, 1), 1, '남', 2, '여', 3, '남', 4, '여') gender
 from student
 where deptno1 = 101;
 
-- ex03) Student 테이블에서 1 전공이 (deptno1) 101번인 학생의 이름과 
--       연락처와 지역을 출력하세요. 단,지역번호가 02 는 "SEOUL" , 
--       031 은 "GYEONGGI" , 051 은 "BUSAN" , 052 는 "ULSAN" , 
--       055 는 "GYEONGNAM"입니다
select name, tel
     , decode(substr(tel, 1, 2), 02, 'SEOUL', decode(substr(tel, 1, 3), 031, 'GYEONGGI', decode(substr(tel, 1, 3), 051, 'BUSAN', decode(substr(tel, 1, 3), 052, 'ULSAN', decode(substr(tel, 1, 3), 055, 'GYEONGNAM') )))) 
 from student
 where deptno1 = 101;

select name, tel
     , decode(substr(tel, 1, 2), 02, 'SEOUL', decode(substr(tel, 1, 3), 031, 'GYEONGGI', decode(substr(tel, 1, 3), 051, 'BUSAN', decode(substr(tel, 1, 3), 052, 'ULSAN', decode(substr(tel, 1, 3), 055, 'GYEONGNAM') )))) from student;


-- 강사님
select name, tel
     , decode(substr(tel, 1, instr(tel, ')', 1, 1) -1), 02, 'SEOUL', 031, 'GYEONGGI', 051, 'BUSAN', 052, 'ULSAN', 055, 'GYEONGNAM')
 from student
 where deptno1 = 101;

-- 4. case 문
select name, tel
     , case substr(tel, 1 ,instr(tel, ')', 1, 1) -1)
		    when '02' then '서울'
				when '031' then '경기'
				when '051' then '부산'
				when '052' then '울산'
				when '055' then '경남'
			  else '그외'
		end as 지역번호
 from student;

-- 실습. emp 테이블에서 sal 1~1000 1등급, 1001~2000 2등급 ,2001~3000 3등급 .... 4001 보다 크면 5등급
-- when sal between 1and 1000 then 1'등급'
select ename, sal
     , case 
			   when sal between 1 and 1000 then '1등급'
				  when sal between 1001 and 2000 then '2등급'
					 when sal between 2001 and 3000 then '3등급'
					 when sal between 3001 and 4000 then '4등급'
					  else '5등급'
       end as 등급
  from emp order by 등급;

select * from emp;

-- 연습문제
-- ex01) student에서 jumin에 월참조해서 해당월의 분기를 출력(1Q, 2Q, 3Q, 4Q)
-- name, jumin, 분기
select jumin
     , case
		 when substr(jumin, 3 , 2) between 01 and 03 then '1Q'
		 when substr(jumin, 3 , 2) between 04 and 06 then '2Q'
		 when substr(jumin, 3 , 2) between 07 and 09 then '3Q'
		 when substr(jumin, 3 , 2) between 10 and 12 then '4Q'
	 end as 분기
  from student
	order by 분기; 
-- ex02) dept에서 10=회계부, 20=연구실, 30=영업부, 40=전산실
-- 1) decode
select *
  from dept;
select deptno, decode(deptno, 10, '회계부', 20, '연구실', 30, '영업부', 40, '전산실') 부서
 from dept;
-- 2) case
-- deptno, 부서명
select dname
     , case detpno
		 when 10 then '회계부'
		 when 20 then '연구실'
		 when 30 then '영업부'
		 when 40 then '전살실'
		 end as 부서명
 from dept;
-- ex03) 급여인상율을 다르게 적용하기
-- emp에서 sal < 1000 0.8%인상, 1000~2000 0.5%, 2001~3000 0.3%
-- 그 이상은 0.1% 인상분 출력

-- ename, sal(인상전급여), 인상후급여 
-- 1) decode
select ename, sal
		 , decode(sal, (sal < 1000), sal * 1.008, 'sal > 1000, sal < 2000', sal * 1.005 )
  from emp;
-- 2) case 
select sal
     , case
		 when sal < 1000 then sal * 1.008 
		 when sal between 1000 and 2000 then sal * 1.005 
		 when sal between 2001 and 3000 then sal * 1.003
		 else sal * 1.001
		 end as 급여인상율
 from emp;
