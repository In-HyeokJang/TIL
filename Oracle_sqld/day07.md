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