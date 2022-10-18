#### DML
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
    PRIMARY KEY (기본키)
        - 중복된 값 x, null 값 x, 
    FORIEGN KEY (외래키)
        - 자식테이블에는 부모테이블에 존재하는 값만 넣을 수 있다.
        - 부모테이블에만 존재하고, 자식테이블에는 존재하지 않는 값만 삭제가 가능하다.
    NOT NULL
        - null을 넣을 수 없게 만드는 제약 조건.
    UNIQUE
        - 중복을 허용하지 않는다
    CHECK
        - 데이터의 범위
    데이터 타입
        - 컬럼에 저장될 데이터의 타입(날짜,...)

#### UPDATE
    - 데이터 수정(갱신)하기

    update 테이블명
    set 바꿔줄컬럼 = 바꿔주고 싶은 값
    where 컬럼 조건

#### DELETE
    - 행 전체 삭제
    
    delete from 테이블명
    where 조건;
