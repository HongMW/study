/*
A. 집합연산자

1. union     : 두 집합의 결과를 합쳐서 출력, 단 중복이 있을 경우 중복을 제거하고 정렬
2. union all : 두 집합의 결과를 합쳐서 출력, 중복과 상관없이 전체 데이터를 출력, 정렬하지 않음
3. intersect : 두 집합의 교집합을 출력, 정렬
5. minus     : 두 집합의 차집합을 출력, 정렬, 선후가 중요

[집합연산자의 조건]

1. 두 집합의 select절의 컬럼갯수가 동일해야 한다.
2. 두 집합의 select절의 컬럼들은 동일한 테이터타입이어야 한다.
3. 두 집합의 컬럼명이 달라도 상관 없다. 하지만, 먼저 정의된 컬럼명으로 정해진다.

*/
select * from student;
SELECT * FROM PROFESSOR;

select studno 학생번호 from student;
select profno 교수번호 from professor;

-- 1. union 학생번호와 교수번호를 하나로 합치기
select studno xxxxx from student
union
select profno 교수번호 from professor; -- 먼저 정의 된 것이 컬럼명이 된다

select studno 학생번호 from professor
union
select profno 교수번호 from student;

select profno 교수번호 from professor
union
select studno 학생번호 from student;

select name 교수명, 1 from professor
union
select name 학생명, 2 from student;

select profno 교수명, 1 from professor
union
select name 학생명, 2 from student; -- 에러 컬럼의 데이터형이 다르기 때문에 에러 발생

select name 교수명, profno from professor
union
select name 학생명 from student; -- 컬럼갯수가 다르기 때문에 에러 발생

-- 2. union all

select count(*) from student;

-- union은 중복제거, 20건, 정렬(o)
select studno, name, deptno1 from student
union
select studno, name, deptno1 from student;

-- union all은 중복제거하지 않음, 40건, 정렬(x)
select studno, name, deptno1, 1 from student
union all
select studno, name, deptno1, 2 from student;

-- 3. intersect
select studno, name, deptno1 from student where deptno1 = 101;
select studno, name, deptno1 from student where deptno1 = 102;

select studno, name, deptno1 from student where deptno1 = 101
intersect
select studno, name, deptno1 from student where deptno1 = 102;

-- 4. minus

select studno, name, deptno1 from student where deptno1 = 101
minus
select studno, name, deptno1 from student where deptno1 = 102;

select studno, name, deptno1 from student where deptno1 = 102
minus
select studno, name, deptno1 from student where deptno1 = 101;
