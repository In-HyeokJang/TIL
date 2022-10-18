### DML
    - select : 검색, 조회
    - insert : 추가, 삽입
    - update : 수정
    - delete : 삭제

#### INSERT 
    insert into 테이블(컬럼, 컬럼, ...)
    values(값, 값, ...)
        컬럼을 명시적으로 기술하면, 컬럼 순서를 지킬 필요가 없으며, 생성된 컬럼의 값으로는 기본값이 들어간다
        (기본값이 없으면 Null 값이 삽입)

    insert into 테이블명
    values(값, 값, 값, 값, ...);
        컬럼 갯수랑 컬럼 내용 순서랑 동일하게 values 해주어야 한다.

 - 제약조건
    - PRIMARY KEY (기본키)
        - 중복된 값 x, null 값 x, 
    - FORIEGN KEY (외래키)
        - 자식테이블에는 부모테이블에 존재하는 값만 넣을 수 있다.
        - 부모테이블에만 존재하고, 자식테이블에는 존재하지 않는 값만 삭제가 가능하다.
    - NOT NULL
        - null을 넣을 수 없게 만드는 제약 조건.
    - UNIQUE
        - 중복을 허용하지 않는다
    - CHECK
        - 데이터의 범위
    - 데이터 타입
        - 컬럼에 저장될 데이터의 타입(날짜,...)

#### UPDATE
    - 데이터 수정(갱신)하기

    update 테이블명
    set 바꿔줄컬럼 = 바꿔주고 싶은 값
    where 컬럼 조건

#### DELETE
    - 행 전체 삭제
    - from 생략 가능

    delete from 테이블명
    where 조건;

    delete 테이블명
    where 조건;

### TCL (Transaction Control Language)
    - 트랜잭션을 제어하는 명령어
    - 업무를 처리하기 위한 데이터베이스의 논리적인 작업 단위

    -트랜잭션 특성
        Atomicity (원자성) 
            - 더 이상 분해가 불가능한 업무의 최소 단위
            - all or nothing
        Consistency (일관성)
            - 트랜잭션이 실행되기 전과 후의 데이터베이스 내용에 모순이 있으며 안된다.
        Isolation (격리성)
            - 실행중인 트랜잭션 중간 결과에 다른 트랜잭션 접근 불가
        Durability (영속성)
            - 성공적으로 트랜잭션이 수행되면 그 내용은 영구적으로 데이터베이스에 저장된다.

    - Commit 
        - 하나의 트랜잭션을 정상적으로 완료하고, 그 결과를 데이터베이스에 반영하라
    - RollBack
        - 문제(문법/논리)가 발생한 트랜잭션을 취소하기 위한 명령어
    - SavePoint
        - 하나의 트랜잭션을 작게 분할하여 저장하는 명령어
         savepoint 세이브포인트이름;
         rollbact to 세이브포인트이름; --세이브포인트이름으로 돌아감

    - TRANSACTION 실행 방식
        - AUTO COMMIT
            - 기본모드, DML을 수행 할때마다 DBMS가 알아서 트랜잭션을 컨트롤 하는 방식
        - 암시적 트랜잭션
            - 트랜잭션의 시작은 DBMS가 처리하고 트랜잭션의 끝은 사용자가 명시적으로 처리하는 방법
        - 명시적 트랜잭션
            - 사용자가 트랜잭션의 시작과 끝을 지정하는 방식
            - BEGIN TRANSACTION (BEGIN TRAN)으로 시작하고 COMMIT/ROLLBACK [TRANSATION] 으로 끝

※
 - DML 사용 후 Commit 혹은 Rollback은 필수이다.
 - 따라서 조건이나 서브쿼리의 결과를 예상할 수 없다면 커밋하기 이전에 조회를 하여 내가 원하는 데이터 삽입,수정,삭제 되었는지 확인하고, commit 혹은 rollback하는 것이 바람직하다.


 -----------------
 ```oracle
    -- departments 테이블에서 새로운 행 (레코드) 추가하기
INSERT INTO departments(department_id, DEPARTMENT_NAME)
VALUES (300, 'new department_name');

SELECT * FROM departments;

--컬럼명 생략하여 INSERT 
-- 테이블에서 컬럼 갯수랑 순서에 동일하게 values 해줘야 함
INSERT INTO departments
VALUES (310, 'new department_name2',NULL,null);

-- primary key 중복 에러
-- INSERT INTO DEPARTMENTS 
-- values(310, 'new department_name3', NULL, null);

-- update
UPDATE DEPARTMENTS  
SET DEPARTMENT_ID = 290
WHERE DEPARTMENT_ID = 300;

UPDATE DEPARTMENTS 
SET location_id = 1700
WHERE department_name LIKE '새%';

SELECT * FROM DEPARTMENTS;

UPDATE departments 
SET manager_id = 200, location_id = NULL 
WHERE DEPARTMENT_name LIKE '%새';

-- DELETE 
DELETE FROM departments 
WHERE department_id >280;

SELECT * FROM DEPARTMENTS;

-----------------
-- 암시적 트랜잭션(마지막으로 commit된 이후부터 트랜잭션 시작)
INSERT INTO departments (department_id, DEPARTMENT_NAME)
VALUES (310, 'new test01');

INSERT INTO departments (department_id, department_name)
VALUES (320, 'new test02');

SELECT * FROM DEPARTMENTS;

COMMIT; -- 완료 / 영구적 반영

ROLLBACK; -- 마지막으로 commit된 상태로 돌아감

SELECT * FROM DEPARTMENTS; 

-- savepoint
INSERT INTO departments (department_id, department_name)
VALUES (330, 'new test 03');

SAVEPOINT s1;

INSERT INTO departments (department_id, department_name)
VALUES (340, 'new test 04');

SAVEPOINT s2;

INSERT INTO departments (department_id, department_name)
VALUES (350, 'new test 05');

SELECT * FROM DEPARTMENTS;

ROLLBACK TO s1;
ROLLBACK;

SELECT * FROM departments;

CREATE TABLE TBL_USER(
	user_id varchar2(30) NOT NULL primary KEY,
	user_pw varchar2(30) NOT NULL,
	user_gender char(1) NOT NULL,
	user_age number(3) NOT NULL,
	user_address varchar2(30),
	join_date DATE,
	grade varchar2(10) DEFAULT 'normal' NOT null
);

CREATE TABLE USER_ACCESS_DATE(
	user_id varchar2(30) PRIMARY KEY,
	last_access_date DATE DEFAULT sysdate NOT NULL,
	CONSTRAINT access_date_kf FOREIGN KEY (user_id)
	REFERENCES TBL_USER(user_id)
);

--회원정보
-- id : abc123
-- pw : 1234
-- 성별 : 'F'
-- 나이 : 20
-- 주소 : 서울시 강남구
-- grade : 'normal'
-- 회원가입일자 : 현재시각
INSERT INTO tbl_user (user_id, user_pw, user_gender, user_age, user_address, join_date)
VALUES ('abc123', '1234', 'F', 20, '서울시 강남구',sysdate);
SELECT * FROM tbl_user;
COMMIT;
-- 최근접속일 : 현재시간
INSERT INTO user_access_date(USER_ID)
values('abc123');
SELECT * FROM user_access_date;
COMMIT;
-- 회원정보2
-- id: def123
-- pw: 5555
-- 성별 : 'M'
-- 나이 : 28
-- 회원가입 일자 : 2020/05/ 15
-- grade : 'normal'
INSERT INTO tbl_user (user_id, user_pw, user_gender, user_age, join_date)
VALUES ('def123', '5555', 'M', 28 ,'2020/05/15');
SELECT * FROM tbl_user;
COMMIT;
-- 최근접속일 : 2020/06/01
INSERT INTO user_access_date(user_id, LAST_ACCESS_DATE)
values('def123', '2020/06/01');
SELECT * FROM USER_ACCESS_DATE;
COMMIT;


-- 회원정보3
-- id : aaa
-- pw : 000
-- 성별 : 'F'
-- 나이 : 19
-- 주소지 미입력
-- 회원가입일자 : 2020/ 02/ 01
-- grade : normal
INSERT INTO HR.TBL_USER
(USER_ID, USER_PW, USER_GENDER, USER_AGE, USER_ADDRESS, JOIN_DATE, GRADE)
VALUES('aaa', '000', 'F', 19,null, to_date('20200515','yyyymmdd'), 'normal' );
SELECT * FROM TBL_USER;
COMMIT;
-- 최근접속일 : 21/ 06/ 01
INSERT INTO user_access_date(user_id, LAST_ACCESS_DATE)
values('aaa', to_date('2020/06/01','yyyy/mm/dd'));
SELECT * FROM USER_ACCESS_DATE;
COMMIT;

SELECT a.USER_ID , a.USER_PW , a.USER_GENDER ,a.USER_AGE ,a.USER_ADDRESS ,a.JOIN_DATE ,a.GRADE ,b.LAST_ACCESS_DATE 
FROM TBL_USER a INNER JOIN USER_ACCESS_DATE b 
ON a.USER_ID = b.USER_ID ;

-- 2020년도에 회원가입한 회원등급을 vip로 승격하고자 한다
-- 테이블을 알맞게 갱신하라
UPDATE tbl_user 
SET GRADE = 'vip'
WHERE to_char(join_date, 'yyyymmdd') LIKE '2020%';

UPDATE tbl_user 
SET grade = 'vip'
WHERE join_date >= to_date('20200101','yyyymmdd') 
AND  join_date < to_date('20210101', 'yyyymmdd');

SELECT * FROM TBL_USER;
COMMIT;

-- 최근 접속일로부터 현재까지 12개월 이상 접속을 하지 않은 회원 정보를 삭제하라
SELECT * FROM user_access_date;

DELETE FROM USER_ACCESS_DATE 
WHERE LAST_ACCESS_DATE <= to_date('20211018','yyyymmdd');

DELETE user_access_date
WHERE MONTHS_BETWEEN(sysdate, last_access_date) >= 12;

ROLLBACK;
SELECT * FROM USER_ACCESS_DATE;
SELECT * FROM TBL_USER;

DELETE tbl_user
WHERE user_id NOT in(
	SELECT user_id
	FROM user_access_date
);

SELECT * FROM TBL_USER;
COMMIT;

 ```