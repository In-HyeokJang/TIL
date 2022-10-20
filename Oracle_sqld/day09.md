### DDL
    - CREATE
        - 테이블 생성
    - ALTER
        - 테이블 수정
    - DROP
        - 테이블 삭제
    - TRUNCATE
        - 내용 삭제

#### ALTER
- ADD : 추가
    - 컬럼추가 작성법
        ALTER TABLE 테이블명
        ADD 컬럼명 데이터타입(크기) [DEFAULT 값] [제약조건];

    - 제약조건 추가법
        ALTER TABLE 테이블명
        ADD CONSTRAINT 제약조건이름 제약조건유형;

- MODIFY : 기존에 있는 컬럼을 수정
    - 작성법
        ```oracle
        ALTER TABLE 테이블명
        MODIFY 컬럼명 데이터타입(크기) [DEFAULT 값] [제약조건];
        ```
- DROP : 만들어진 컬럼삭제 / 제약조건삭제
    - 컬럼삭제 작성법
        ```oracle
        ALTER TABLE 테이블명
        DROP COLUMN 컬럼명;
        ```
    - 제약조건 삭제 작성법
        ```oracle
        ALTER TABLE 테이블명
        DROP CONSTRAINT 제약조건이름;
        ```
- RENAME : 이름수정
    1. 컬럼명 수정
        ```oracle
        ALTER TEABLE 테이블명
        RENAME COLUMN 컬럼명 TO 바꿀이름;
        ```
    2. 테이블명 수정
        ```oracle
        ALTER TABLE 테이블명
        RENAME TO 바꿀이름 ;
        ```
    3. 제약조건명 수정
        ```oracle
        alter table 테이블명
        rename constraint 제약조건명 to 변경할이름;
        ```
- DISABLE : 제약조건 비활성화 (nocheck)
    ```ORACLE
    ALTER TABLE 테이블명
    DISABLE CONSTRAINT 제약조건명;
    ```
- ENABLE : 제약조건 활성화 (check)
    ``` ORACLE
    ALTER TABLE 테이블명
    ENABLE CONSTRAINT 제약조건명;
    ```

#### DROP