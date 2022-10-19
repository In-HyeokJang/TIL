### DDL (Date Definition Language)
    -DDL은 데이터베이스의 테이블과 같은 데이터 구조 구성요소 등을 생성, 삭제, 변경하는 명령어

#### DDL 적용대상
    - 테이블 (Table)
        데이터를 저장하는 기본 저장 단위
    - 뷰 (view)
        하나 이상의 테이블로 부터 유되되는 가상의 테이블
    - 인덱스 (Index)
        검색 속도를 향상시키기 위한 데이터베이스 오브젝트
    - 스키마 (Schema)
        데이터베이스의 구조와 제약조건에 관한 전반적인 설명을 기술한 메타데이터들의 집합

#### 데이터 유형
    - Char (크기)
        - ORALE, SQL-SERVER의 표기방식
        - CHARACTER(크기) : 나머지방식
        - 크기가 고정된 문자 데이터
        - 최대크기는 2000바이트 / SQL-SERVIER : 8000바이트
        - 저장된 값이 크기보다 작다면 나머지 공간이 채워짐

    - Varchar2 (크기)
        - ORACLE의 표기방법
        - SQL-SERVER : VARCHAR(크기) 사용
        - 최대사이즈는 4000바이트
        - SQL-SERVER : 8000바이트
        - 가변길이로 조정이 되어 실질적으로 사용한 만큼만 크기를 차지한다.

    - Date 
        - SQL-SERVER : DATETIME
        - 날짜, 시각 데이터
        - ORACLE : 1초단위, SQL-SERVER : 3.33밀리초(1000밀리초가 1초) : 0.003초

    - Number (정수부분크기, 소수점크기)
        - ORACLE 문법
        - SQL-SERVER에서는 10가지 이상의 숫자타입을 갖고 있음 : NUMERIC타입이라 부른다.

#### DDL명령어
    - CREATE : 생성
        create table 테이블명(
            컬럼명 데이터타입(크기),
            컬럼명 데이터타입(크기),
            컬럼명 데이터타입(크기),
            ...
        );
        - 제약조건 추가하여 table 생성하기
            - 제약조건 유형
                - PRIMARY KEY
                - FORIEGN KEY
                - UNIQUE : 중복된 값을 넣지 못하게 하는 조건
                - NOT NULL
                - CHECK
            1. 컬럼 수준에서 제약조건 추가
                create table 테이블명(
                    컬럼1 데이터타입(크기) 제약조건1 제약조건2...,
                    컬럼2 데이터타입(크기) 제약조건1 ...,
                    ...
                );
            2. 테이블 수준에서 제약조건 추가
                create table 테이블명(
                    컬럼명1 데이터타입(크기),
                    컬럼명2 데이터타입(크기),
                    ... ,
                    CONSTRAINT 제약조건명 제약조건유형 (적용시킬컬럼명),
                    CONSTRAINT 제약조건명 제약조건유형 (적용시킬컬럼명), ...
                );

    - 테이블 생성 시 주의사항
        - 적절한 이름 사용 
        - 테이블 이름을 중복하면 안된다.
        - 한 테이블 내에서 컬럼 이름이 중복되면 안된다.
        - 테이블 이름은 문자로 시작한다.
        - 예약어는 사용 불가하다.


    - 데이터 무결성
        - 데이터베이스에 저장된 값들이 정확하고 일관성 있는 데이터링을 나타내는 특성
        - 개체무결성 (entity integrity) 
            : primary key로 선택된 컬럼은 중복되지 않아야 하며 null값을 가질 수 없다
        - 참조무결성 (reference integrity) 
            : 부모에 존재하는 값만 자식에 넣어줄 수 있다, 자식에 사용하지 않는 값만 부모에서 삭제할 수 있다.
        - 영역무결성 (domain integrity)
            : 데이터의 타입, 범위, 기본값, 유일성과 관련된 제한이며 정의된 domain에 알맞은 데이터만 컬럼에 저장할 수 있다.
        - 비즈니스무결성(bussiness integrity)
            : 사용자의 업무규칙에 따른 비즈니스적인 제약조건

#### select문을 통한 테이블 생성
    - CTAS(Create Table ~ As Select)
    - 오라클
        ```oracle
        create table 신규테이블명 as select * from 기존테이블;
        ```
    - SQL-SERVER
        ```mysql
        select * into 신규테이블명 from 기존테이블명;
        ```
    - not null 제약조건만 복사가 되며 다른 제야조건은 사라진다.

#### 데이터 모델링
    - 현실세계 특정한 목적에 따라 단순화 추상화하여 이용하기 쉬운 형식으로 표현하는 과정

    - 요구분석
        - 사용자가 본 영화기록을 바탕으로 취향을 분석하여 적절한 영화를 추천하는 서비스
        - 사용자ID, 시청한영화제목, 시청한 영화장르, 추천할영화제목, 추천할영화장르

    - 개념적 데이터 모델링(추상적)
        - 사용자테이블                              추천영화
        -------------                             ----------
        사용자id                                    사용자id
        사용자가 시청한 영화제목                    추천할 영화
        사용자가 시청한 영화의 장르                 추천할 영화 장르
    
        - 개념적 모델링의 결과로는 ERD(Entity Relationship Diagram)가 도출된다.

    - 논리적 데이터 모델링
        - 속성, 관계, 식별자 등을 정확하게 표현
        - 데이터 정규화 작업 진행
            - 데이터 정규화 : 데이터의 중복성을 제거하여 데이터의 일관성을 유지하기 위해 진행한다.
            - 1차 정규화 : 테이블 내의 속성(컬럼)값을 원자값으로 구성하는 단계
                (컬럼 속에는 한개의 값만 있어야 한다.)
                ex)
                - 오류
                    학생이름    학과    수업
                    홍길동      컴퓨터  자료구조,java,c
                    김영희      컴퓨터  java
                    김철수      경영    마케팅, 회계
                    
                - 1차 정규화 정답예시
                    학생이름    학과    수업
                    홍길동      컴퓨터  자료구조
                    홍길동      컴퓨터  java
                    홍길동      컴퓨터  c
                    김영희      컴퓨터  java
                    김철수      경영    마케팅
                    김철수      경영    회계
                    
            - 2차 정규화 : 부분 함수 종속성을 제거하는 단계
                ex)
                    학생이름    수업    담당교수
                    김영희      java    김교수
                    김영희      c       박교수
                    홍길동      c       박교수
                    김철수      java    김교수

                    학생이름    과목            과목    담당교수
                    김영희      java            java    김교수
                    김영희      c               c       박교수
                    홍길동      c               회계    최교수
                    김철수      java

                - 여러개의 속성(컬럼)을 복합적으로 사용하여 식별자(primary key)로 설정했을 때 그 중 부분적인 속성(컬럼)에 따라 나머지 컬럼이 결정
                - 부분 함수 종속성이 발생한 것이고, 이를 제거하는 단계가 2차정규화 단계이다.

            - 3차 정규화 : 이행함수 종속성을 제거하는 단계 (식별자가 아닌 일반 속성이 다른 속성을 결정하는 상태)
                ex)
                    학번        학과        등록금
                    202201      경영        300만원
                    202202      컴퓨터      400만원
                    202203      경영        300만원
                    202204      소프트웨어  500만원

                    학번        학과                    학과        등록금
                    202201      경영                    경영        300만원
                    202202      컴퓨터                  컴퓨터      400만원
                    202203      경영                    미술        300만원
                    202204      소프트웨어              소프트웨어   500만원
                                                        의학        700만원

            - 반정규화 : 정규화 되어있는 것을 이전으로 되돌리는 행위, 성능을 향상시키기 위해서 위험을 감수한다.
                
        - 데이터 모델링 최종적으로 완료된 상태

    - 물리적 데이터 모델링(구체적)
        - primary key설정, 저장할 데이터 타입, 크기 등 물리적인 성격을 고려하여 설계하는 단계
        - 실제 데이터베이스를 구축할 때 참고되는 모델


    - ALTER : 변경, 수정
    - DROP : 삭제
    - TRUNCATE : 내용삭제

------------
```oracle
CREATE TABLE test01(
	a number(3, 2),
	b varchar2(1000),
	c char(100),
	d DATE 
);

-- 컬럼 수준에서 제약조건 추가
CREATE TABLE test02(
	student_id NUMBER(3) PRIMARY KEY,
	student_name varchar2(5) NOT NULL ,
	student_gender char(1) CHECK (student_gender IN ('F', 'M')) NOT NULL ,
	student_age NUMBER(2) CHECK (student_age > 0),
	student_email varchar2(30) UNIQUE 
);

-- 테이블 수준에서 제약조건 추가
CREATE TABLE test03(
	student_id number(3),
	student_name varchar2(5) NOT NULL,
	student_gender char(1),
	student_age number(2),
	student_email varchar2(30),
	CONSTRAINT test03_pk PRIMARY KEY (student_id),
--	CONSTRAINT test03_name_not_null NOT NULL (student_name), --  테이블 수준에서 not null 제약조건 불가
	CONSTRAINT gender_check CHECK (student_gender IN ('F', 'M')),
	CONSTRAINT gender_not_null CHECK (student_gender IS NOT null),
	CONSTRAINT age_check CHECK (student_age >0),
	CONSTRAINT student_email_unique UNIQUE (student_email)
);


--외래키 제약조건
CREATE TABLE test04(
	a number(3) PRIMARY KEY,
	b number(3) REFERENCES test03(student_id),
	c number(3),
	CONSTRAINT fk FOREIGN KEY (c) REFERENCES test03(student_id)
);

-- primary ket, unique
CREATE TABLE test05(
	student_name varchar2(30),
	join_date DATE,
	contents varchar2(20),
	age number(3),
	CONSTRAINT pr PRIMARY KEY (student_name, join_date),
	CONSTRAINT uni UNIQUE (contents, age)
);
-- 각각의 컬럼에 제약조건을 다는 것이 아니라
-- 두 개의 컬럼을 복합적으로 생각하여 제약조건을 다는 것

--default
CREATE TABLE test06(
	a number(3) PRIMARY KEY,
	b number(3) DEFAULT 10 NOT NULL UNIQUE 
);

INSERT INTO test06(a)
VALUES (1);

SELECT * FROM TEST06;

CREATE TABLE emp_dup AS SELECT * FROM employees;
```