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




    - ALTER : 변경, 수정
    - DROP : 삭제
    - TRUNCATE : 내용삭제