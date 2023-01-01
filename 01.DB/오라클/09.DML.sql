/*	
	DML
	
	1. insert : 데이터를 테이블에 추가
	2. update : 데이터를 테이블에 수정
	3. delete : 데이터를 테이블에 삭제
	4. merge	: 2개 이상의 테이블을 핸개의 테이블로 병합
	
	A. insert
	
	1. 테이블에 새로운 행(row, 레코드)를 추가할 때 사용하는 SQL문장
	2. 테이블에 새로운 데이터를 입력(추가)하기 위한 데이터 자작어
	3. 문법
	
			1) insert into 테이블명 (컬럼1, ...컬럼n) values (값1, ...값n);
			2) insert into 테이블명 values(값1, ...값n);
			   -- 제약사항 : 컬럼과 동일 갯수, 동일순서, 동일데이터타입일 경우에만 컬럼을 생략할 수 있다.
			3) 서브쿼리를 이용해서 기존 테이블의 데이터를 추가하는 방법
			  ... insert into 테이블명 select 컬럼1, ... 컬럼n from 테이블명 where 조건절...
				... 동일갯수, 동일순소, 동일타입일 경우에 사용가능
			4) insert all
					when 조건 into
					when 조건 into
			5) insert all
						into 테이블명 values()
						into 테이블명 values()
						
*/
-- 1. 레코드추가
-- 실습. dept2에 '부서번호 = 9000, 부서명 = 테스트부서_1, 상위부서 = 1006, 지역 = 기타지역'으로 추가
select * from dept2;
select * from dept2 where dcode >= 9000;
insert into dept2(dcode, dname, pdept, area) values(9000, '테스트부서_1', 1006, '기타지역');
insert into dept2 values(9001, '테스트부서_2', 1006, '기타지역');

-- 2. professor테이블에 교수번호 =5001, 교수명 = 홍길동, 교수id = hong, position = 정교수, 급여 = 510, 입사일 = 2022.10.10
select * from professor;
insert into professor(profno, name, id, position, pay, hiredate) values(5001, '홍길동', 'hong', '정교수', 510, '2022.10.01');

-- 3. professor에서 테이블구조만 복사해서 professor4 만들고
create table professor4
as select * from professor where 1 = 2;
select * from professor4;

--   profno > 4000 교수만 professor4에 추가
drop table professor4;
insert into professor4 select * from professor where profno > 4000;

-- 강사님
create table professor4 as select * from professor where 1 = 2;
insert into professor4 select * from professor where profno > 4000;


-- 4. professor기준으로 prof_3, prof_4테이블을 생성
-- 1) 각각 profno number, name varchar2(30)의 2개의 열만 존재한 테이블을 생성
create table prof_3 as select profno, name from professor where 1=2;
create table prof_4 as select profno, name from professor where 1=2;

drop table prof_6;
select * from prof_3;
select * from prof_4;
-- 2) prof_3에는 1000~1999까지의 교수만
insert into prof_3 select profno, name from professor where profno between 1000 and 1999;
-- 3) prof_4에는 2000~2999까지의 교수만
insert into prof_4 select profno, name from professor where profno between 2000 and 2999;

create table prof_3 as select profno,name from professor where profno between 1000 and 1999;

-- 5. insert all(1)
--		when 조건 then into
create table prof_5 as select profno, name from professor where 1=2;
create table prof_6 as select profno, name from professor where 1=2;

insert all
		when profno between 1000 and 1999 then into prof_5 values(profno, name)
		when profno between 2000 and 2999 then into prof_6 values(profno, name)
	select profno, name from professor;
	
select * from prof_5;
select * from prof_6;

-- 5. insert all(2)
--			into 테이블명 values()
-- 동일자료를 각각의 테이블에 insert하는 방법
-- prof_5, prof_6에 3000~3999까지의 교수를 동시에 추가하기
insert all
	into prof_5 values(profno, name)
	into prof_6 values(profno, name)
select profno, name from professor
where profno between 3000 and 3999;

/*
	B. update
	
	1. 테이블에 저장된 데이터를 수정하기 위해서 사용하는 명령
	2. 기존의 행을 수정하기 위해서 사용한다.
	3. 주의할 점(조건을 안주면 테이블의 모든 데이터가 바뀐다)
		where 조건절에 특정의 조건을 정의하지 않으면 전체 데이터가 수정된다.
	4. 문법
	
		update 데이터명
				set 컬럼1 = 값1, ...값n = 값n
			where 조건절
*/
drop table PROFESSOR4 purge;
create table emp999 as select * from emp;
select * from emp999;

update emp999
	set sal = 99999;
	where ename = 'XXXX';
	
-- 실습1. 모든 사원의 급여는 10% 인상하기
update emp999
	set sal = sal*1.1;
	
select e.sal, e2.sal from emp e, emp999 e2
where e.empno = e2.empno;

-- 실습. professor에서 직급이 `assistant professor`인 사람의 bonus를 200으로 인상하기
select * from professor where positon = 'assistant professor';
create table professor4 as select * from professor;
update professor4
 set bonus = 200
where position = 'assistant professor';

select * from professor4;
select * from professor;
select p1.pay, p2.pay 증가 from professor p1, professor4 p2 where p1.name = p2.name;
-- 실습. professor에서 Sharon Stone과 동일한 position(instructor)인 교수들의 급여를 15%인상하기
-- position을 서브쿼리를 이용해서 비교
-- where position = 'instructor' -> where position = (select ????)
select * from professor where name = 'Sharon Stone';
select * from professor where position = 'instructor';

update professor4
 set pay = pay * 1.15
where position = (select position from professor4 where name = 'Sharon Stone');

select position from professor where name = 'Sharon Stone';


/*
	C. delete : 테이블에서 특정 조건의 자료를 삭제명령
	
			delete from 테이블명 where 조건절
*/
select * from professor4;
delete from professor4;

-- 실습1. professor1을 professor에서 복사 후에 교수번호가 5000이상인 교수만 삭제하기
create table professor1 as select * from professor;

select * from professor1;

delete from professor1
where profno >= 5000;

/*
	D. merge
	
		여러개의 테이블을 한개의 테이블로 병합하는 명령
		
		merge imto 병합할 테이블명
				using 테이블1 on 병합조건 when matched then update set 업데이트할 내용
																										update where 조건절
																	when not matched tehm imsert into values(...)
																	
*/

create table charge_01 (
		u_date		varchar2(6)
	, cust_no		number
	, u_time		number
	, charge		number
);
create table charge_02 (
		u_date		varchar2(6)
	, cust_no		number
	, u_time		number
	, charge		number
);
create table charge_tot (
		u_date		varchar2(6)
	, cust_no		number
	, u_time		number
	, charge		number
);

insert into charge_01 values('141001', 1000, 2, 1000);
insert into charge_01 values('141001', 1001, 2, 1000);
insert into charge_01 values('141001', 1002, 1, 1000);

insert into charge_02 values('141002', 1000, 3, 1000);
insert into charge_02 values('141002', 1001, 4, 1000);
insert into charge_02 values('141002', 1003, 1, 1000);


select * from charge_01
union all
select * from charge_02;

select * from charge_tot;

-- 1. merge charge_01 + charge_tot
merge into charge_tot tot
			using charge_01 c01 on (tot.u_date = c01.u_date)
			when 		 matched then update set tot.cust_no = c01.cust_no
			when not matched then insert values(c01.u_date, c01.cust_no, c01.u_time, c01.charge);
			
select * from charge_tot;

-- 2. merge charge_02 + charge_tot
merge into charge_tot tot
			using charge_02 c02 on (tot.u_date = c02.u_date)
			when 		 matched then update set tot.cust_no = c02.cust_no
			when not matched then insert values(c02.u_date, c02.cust_no, c02.u_time, c02.charge);

select * from charge_tot;

drop table charge_01;
drop table charge_02;
drop table charge_tot;

/*
	E. Transaction
	
		commit		: 작업을 최종적으로 확정
		rollbalck	: 확정되지 않
*/


