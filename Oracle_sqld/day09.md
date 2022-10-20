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
    - 테이블 자체의 정의, 구조 모두 삭제
    ```ORACLE
    DROP TEABLE 테이블명;
    ```
#### TRUNCATE
    - 테이블 속의 내용(데이터)만 삭제
    ```ORACLE
    TRUNCATE TABLE 테이블명;
    ```

#### CRATE 혹은 DROP 주의사항 : 외래키(FORIEGN KEY)
    - CREATE 주의점
        - A테이블을 만들면서 A라는 컬럼을 외래키로 설정하고자 한다면
        - A라는 컬럼은 이미 만들어져 있어야 한다.

#### ※참고
- 언어          DROP            TRUNCATE            DELETE
- 종류           DDL            DDL                 DML
- ROLLBACK      불가능          불가능               가능
 -삭제상태       정의까지모두    초기상태로 만듦      테이터만 삭제

#### DCL(Date Control Language)
    - 데이터베스에 접근하고, 객체들을 사용하도록 권한을 주거나 회수하는 명령어

    - 권한(privilege)
        - 시스템권한
            - 데이터베이스 접속, 사용자(계정) 생성 및 삭제
        - 오브젝트권한
            - 테이블, 뷰, 등에 대한 삽입 삭제 수정 조회와 관련된 권한

        - grant : 권한 부여
                ```oracle
                 grant 권한종류 on 테이블명 to 사용자;
                 grant 오브젝트권한 on 테이블명 to 사용자;
                 ```
        - revoke : 권한 회수
                ```oracle
                revoke 권한종류 on 테이블명 from 사용자;
                revoke 오브젝트권한 on 테이블명 from 사용자;
                ```
        - 권한종류
            - 시스템권한
                - create session : 데이터베이스 접속 권한
                - create user : 사용자 생성 권한
                - drop user : 사용자 삭제 권한
                - create table : 테이블 생성 권한
                - alter table : 테이블 수정 할 수 있는 권한
                - drop table : 테이블 삭제 할 수 있는 권한
                - create view : view 생성 권한
                - drop view : view 삭제 권한
                
        - 계정 생성

