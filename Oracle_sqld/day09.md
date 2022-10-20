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

### DCL(Date Control Language)
    - 데이터베스에 접근하고, 객체들을 사용하도록 권한을 주거나 회수하는 명령어

    - 권한(privilege)
        - 시스템권한
            - 데이터베이스 접속, 사용자(계정) 생성 및 삭제
        - 오브젝트권한
            - 테이블, 뷰, 등에 대한 삽입 삭제 수정 조회와 관련된 권한

        - grant : 권한 부여
                ```oracle
                 grant 권한종류 on 테이블명 to 사용자 [with admin option];
                 with admin option을 쓰면 부여받은 권한을 다른 계정에게 부여할 수 있음
                 grant 오브젝트권한 on 테이블명 to 사용자[with admin option];
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
            
            - 오브젝트권한
                - select
                - insert
                - update
                - delete

        - 계정 생성
            create user 사용자명 identified by 비밀번호;
        - 데이터 베이스 접근권한
            - grant create session to 사용자명;
        
        -- table epace가 부족하다고 나올 시
        -- 계정에게 table space를 부여해야 한다
            - grant unlimited tablespace to 사용자명;

         - cmd창 -> sqlplus -> Enter user-name: sys as sysdba -> Enter password: 1234 -> show user 확인 user is "sys" -> create user guest(id) identified by 1234(pw); -> 다시 sys as dba로그인 -> grant설정 grant create session to guset; / table 생성권한 부여 grant create table to guest; / table 갯수 생성 권한 부여 grant unlimited tablespace to guest;

         - connect sys/1234 as sysdba 바로 연결하는법

         - 역할(Role)
            - 사용자별로 다수의 권한을 부여하는 경우에는 역할로 묶어서 관리할 수 있다
            ``` oracle
            역할 생성
                create role 역할명;
            시스템권한부여
                grant 시스템권한 to 역할명;
            오브젝트권한부여
                grant 오브젝트권한 on 역할;
            계정에 역할 부여
                grant 역할 to 사용자;
            ```

### 계층형 질의
    - 계층형 데이터를 조회하기 위해 사용하는 쿼리문

    - 계층형 데이터
        - 데이터 간의 상/하 혹은 앞/뒤 의 개념이 포함된 데이터
    
    - 루트노드
        - 가장 최 상위 데이터(뿌리)
    - 리프노트
        - 자식이 존재하지 않는 데이터
    - 형제노드
        - 동일한 레벨에 존재하는 데이터
    - 데이터전개
        - 데이터를 찾아간다