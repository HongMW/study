/*
	제약사항 constrain
	
	테이블에 정확한 데이터만 입력이 될 수 있도록 사전에 정의(제약)하는 방법을 의미한다.
	데이터가 추가될 때 사정에 정의된 제약조건에 불일치 되는 자료는 DB엔진에서 미연에 방지할 수 있게 된다.
	
	제약조건의 종류
	
	1. not null		 (NN) : null값이 입력되지 못하도록 하는 조건
	2. unique			 (UK) : 중복값 불허
	3. Primary Key (PK) : NN  + UK인 컬럼, PK는 테이블당 한개만 정의 가능, 여러개 컬럼조합에서 생성은 가능
	4. Foreign Key (FK) : 외부 테이블인 PK인 컬럼을 참조 (Reference)하도록 하는 조건
	5. Check			 (CK) : 설정된 값만 입력되도록 하는 조건 (예 : 성별구분 'F' or 'M'값만 허용)
*/
-- 1. 테이블 생성시에 선언
-- 1) 정식문법
-- 		a. contraint 제약조건명		 제약조건 -> DD에 사용자가 지정한 이름이 등록된다.
--		b. contraint 제약조건								-> DD에 시스템이 임의순번의 이름을 들록(SYS798142)
create table new_emp_1 (
		no 			 number(4)  		constraint emp_no_pk   	 primary key
	, name  	 varchar2(20) 	constraint emp_name_nn 	 not null
	, ssn   	 varchar2(13)   constraint emp_ssn_nn    not null
													  constraint emp_ssn_uk    unique
  , loc_code number(1)      constraint emp_loc_ck    check(loc_code < 5)
	, deptno   varchar2(6)    constraint emp_deptno_fk references dept2(dcode)												
);
select * from dept2;
select * from new_emp_1;

-- 2) 약식문법
create table new_emp_2 (
		no			number(4)			primaey key
	, name		varchar2(20)	not null
	, ssn			varchar2(13)	not null unique
	, loc_code number(1)		check(lock_code < 5)
	, deptno	varchar2(6)		references dept2(decode)
);
	
create table new_emp_2 (
		no 			 number(4)  		primary key
	, name  	 varchar2(20) 	not null
	, ssn   	 varchar2(13)   not null unique			
  , loc_code number(1)      check(loc_code < 5)	
	, deptno   varchar2(6)    references dept2(dcode)		
);

	
--2. 제약조건 조회하기
select * from user_constraints
 where table_name like 'NEW%';
 
 -- 실습. 테이블에 데이터 추가하기 (제약조건 테스트하기)
 select * from new_emp_1;
 select * from dept2;
 insert into new_emp_1 values(1, '홍길동', '8011181234567', 1, 9001);
 insert into new_emp_1 values(2, '홍길순', '8111181234567', 1, 9001); 
 insert into new_emp_1 values(3, '홍길상', '8211181234567', 1, 9001); 
 
-- 에러테스트
insert into new_emp_1 values(1, '홍길동', '8011181234567', 1, 9010); -- FK not found
insert into new_emp_1 values(3, '홍길성', '8311181234567', 1, 9001); -- PK 에러
insert into new_emp_1 values(null, '홍길성', '8311181234567', 1, 9001); -- NN 에러
insert into new_emp_1 values(4, null, null, 1, 9001); -- NN 에러
insert into new_emp_1 values(4, '손흥민', '8411181234567', 5, 9001); -- CK 에러

insert into new_emp_1 values(4, '손흥민', '8411181234567', 3, 9001); -- 정상처리
select * from new_emp_1;

-- 실습2. 제약수정하기
-- 1) new_emp_2.name에 UK조건 추가
select * from user_constraints where table_name like 'NEW%';
alter table enw_emp_2 add constraint emp_name_uk unique(name);

-- 2) new_emp_2.loc_code에 NN조건 추가
alter table enw_emp_2 add constraint emp_loc_nn not null(loc_code);
alter table enw_emp_2 modify(loc_code constraint eml_loc_nn not null);

-- 실습3. FK설정하기
create table c_test1(
	no				number
, name			varchar2(6)
, deptno		number
);
create table c_test2(
	no				number
, name			varchar2(6)
, deptno		number
);
select * from c_test1;
select * from c_test2;
drop table c_test1;
drop table c_test2;
-- primary key / foregin key
-- FK는 참조테이블의 컬럼이 PK or UK인 컬럼만 FK로 정의할 수 있다.
alter table c_test1 add constraint c_test1_no_fk foreign key(deptno) references c_test2(deptno); 
-- UK or PK가 아니기 때문에 에러

alter table c_test2 add constraint c_test2_derptno_uk unique(deptno); -- UK로 지정
alter table c_test1 add constraint c_test1_no_fk foreign key(deptno) references c_test2(deptno); 

select * from user_constraints where table_name like 'C_%';

--FK제약사항 테스트
insert into c_test1 values(1, 'HONG', 10);
insert into c_test2 values(1, 'HR', 10);
insert into c_test1 values(1, 'HONG', 10);

select * from c_test1;
select * from c_test2;

-- 부모테이블의 자료 삭제
delete from c_test2 where deptno = 10; -- 자식레코드 존재하기 때문에 삭제 불가능

delete from c_test1 where deptno = 10;
delete from c_test2 where deptno = 10;

select * from c_test1;
select * from c_test2;

-- delete옵션중 cascate옵션
-- 자식레코드가 있을 경우에 자식레코드를 삭제할 것인지 
-- 또는 null값으로 데이터를 수정할 것인지를 결정하는 옵션

insert into c_test2 values(1, 'HR', 10);
insert into c_test1 values(1, 'HONG', 10);

-- on delete set null
drop table c_test1;
drop table c_test2;

alter table c_test2 add constraint c_test2_derptno_uk unique(deptno); -- UK로 지정

alter table c_test1 add constraint c_test1_no_fk foreign key(deptno) references c_test2(deptno)
-- 			on delete set null;
			on delete cascade;

delete from c_test1 where deptno = 10;
delete from c_test2 where deptno = 10;

/* 연습문제 */
-- https://upcake.tistory.com/226
-- ex01) 테이블명 : STAR_WARS (영화 정보를 저장한다)
--       컬럼 : EPISODE_ID : 에피소드 아이디로써, 숫자형 타입으로 기본 키가 된다.
--              EPISODE_NAME : 에피소드에 따른 영화 제목, 가변길이문자형(50 BYTE)이다.
--              OPEN_YEAR : 개봉년도로써, 숫자형 타입이다.

-- ex02) 테이블명 : CHARACTERS ( 등장인물 정보를 저장한다)
--         컬럼 : CHARACTER_ID   : 등장인물 아이디로써, 숫자형 타입(5자리), 기본키
--                CHARACTER_NAME : 등장인물 명으로 가변 길이 문자형 타입(30 BYTE)이다.
--                MASTER_ID      : 등장인물이제다이일 경우 마스터아이디값, 숫자형(5자리)
--                ROLE_ID        : 등장인물의 역할 아이디로써, INTEGER 타입이다.
--                EMAIL          : 등장인물의 이메일 주소로 varchar2(40 BYTE)이다.


-- ex03) 테이블명 : CASTING ( 등장인물과 실제 배우의 정보를 저장한다)
--         컬럼 : EPISODE_ID: 에피소드 아이디로써, 숫자형 타입(5자리)으로 기본키
--                CHARACTER_ID: 등장인물 아이디로써, 숫자형 타입(5자리)이며 참조키
--                REAL_NAME : 등장인물의 실제 이름으로, varchar2(30 BYTE)이다.

-- ex04) INSERT 문을 사용하여 STAR_WARS 테이블에 다음과 같이 데이터를 저장해보자. 
-- EPISODE_ID  EPISODE_NAME                                 OPEN_YEAR              
-- ----------- ---------------------------------------  --------------                
-- 1              보이지 않는 위험(The Phantom Menace)          1999                   
-- 2              클론의 습격(Attack of the Clones)             2002                   
-- 3              시스의 복수(Revenge of the Sith)              2005
-- 4              새로운 희망(A New Hope)                       1977                   
-- 5              제국의 역습(The Empire Strikes Back)          1980                   
-- 6              제다이의 귀환(Return of the Jedi)             1983 

-- ex05) CHARACTERS 테이블에 다음의 데이터를 저장해보자.
-- CHARACTER_ID    CHARACTER_NAME       EMAIL                                    
-- --------------- -------------------- ------------------------ 
-- 1                 루크 스카이워커          luke@jedai.com                           
-- 2                 한 솔로                  solo@alliance.com                        
-- 3                 레이아 공주              leia@alliance.com                        
-- 4                 오비완 케노비            Obi-Wan@jedai.com                        
-- 5                 다쓰 베이더              vader@sith.com                           
-- 6                 다쓰 베이더(목소리)       Chewbacca@alliance.com                   
-- 7                 C-3PO                   c3po@alliance.com                        
-- 8                 R2-D2                   r2d2@alliance.com                        
-- 9                 츄바카                   Chewbacca@alliance.com                   
-- 10                랜도 칼리시안
-- 11                요다(목소리)              yoda@jedai.com                           
-- 12                다스 시디어스
-- 13                아나킨 스카이워커        Anakin@jedai.com                         
-- 14                콰이곤 진
-- 15                아미달라 여왕
-- 16                아나킨 어머니
-- 17                자자빙크스(목소리)        jaja@jedai.com 
-- 18                다스 몰          
-- 19                장고 펫 
-- 20                마스터 윈두              windu@jedai.com                          
-- 21                듀크 백작                dooku@jedai.com

-- ex06) ROLES 테이블에 다음의 데이터를 저장해보자
-- ROLE_ID(number5,0) pk, ROLE_NAME(varchar2 30)
-- 1001, '제다이'
-- 1002, '시스'
-- 1003, '반란군'

-- ex07) CHARACTERS 에는 ROLE_ID 란 컬럼, 이 값은 ROLES 테이블의 ROLE_ID 값을 참조 
-- CHARACTERS 변경하여 ROLE_ID 컬럼이 ROLES의 ROLE_ID 값을 참조하도록 참조 키를 생성

-- ex08) 참조 키를 생성후, 다음으로 CHARACTERS 테이블의 ROLE_ID 값을 변경해보자. 
-- 값의 참조는 ROLES 테이블의 ROLE_ID 값을 참조한다. 예를 들면 루크 스카이워커,   
-- 오비완 캐노비, 요다 등은 제다이 기사이므로 1001 값을 가질 것이며, 
-- 다쓰 베이더, 다쓰 몰은 시스 족이므로 1002에 해당한다. 자신이 아는 범위 내에서 
-- 이 값을 갱신하는 UPDATE 문장을 작성해 보자.

-- ex09) CHARACTERS MASTER_ID 란 컬럼, 이 컬럼의 용도는 EMPLOYEES 테이블의 MANAGER_ID 
-- 와 그 역할이 같다. 즉 제다이나 시스에 속하는 인물 중 그 마스터의 CHARACTER_ID 값을 
-- 찾아 이 컬럼에 갱신하는 문장을 작성
-- 
-- 제자                    마스터
-- ------------------  -------------------------
-- 아나킨 스카이워커      오비완 캐노비
-- 루크 스카이워크        오비완 캐노비
-- 마스터 윈두            요다
-- 듀크 백작              요다
-- 다쓰 베이더            다쓰 시디어스
-- 다쓰 몰                다쓰 시디어스
-- 오비완 캐노비          콰이곤 진
-- 콰이곤 진              듀크 백작

-- ex010) CASTING의 PK는 EPISODE_ID와 CHARACTER_ID 이다. 
-- 이 두 컬럼은 각각 STAR_WARS와 CHARACTERS 테이블의 기본 키를 참조하고 있다. 
-- CASTING 테이블에 각각 이 두 테이블의 컬럼을 참조하도록 참조 키를 생성 

-- ex11) 다음 문장을 실행해 보자. 
DELETE ROLES
 WHERE ROLE_ID = 1001;
-- 
-- 이 문장을 실행하면 그 결과는 어떻게 되는가? 또한 그러한 결과가 나오는 이유는 
-- 무엇인지 설명해 보자.
select * from roles;

select * from characters;



-- ex12) characters에 character_name 인덱스 생성하기
create index characters_ix_01 on characters(character_name);

-- ex13) 상기작업들의 data dictionary를 조회

