- 외래키 관점에서
    - 사원명 이라는 컬럼은 상사컬럼에 제공 되고 있으니 부모
    - 상사컬럼은 사원명으로 부터 제공 받고 있으니 자식

- 계층형쿼리
    ```oracle
    select 컬럼명
    from 테이블
    start with 조건             -- 누구부터?
    connect by [nocycle] 연결조건         -- 어느쪽으로?
    [order siblings by 컬럼명]; -- 자식이 여러명이라면 먼저 차아갈 컬럼
    ```

- 계층형 질의를 편하게 사용하기 위해 제공하는 함수
    ```oracle 
    sys_connect_by_path(컬럼명, 분리기호)
        현재까지 지나온 데이터의 경로를 표시
    connect_by_root(컬럼명)
        데이터전개를 시작한 루트 데이터
    ```

- 가상컬럼
    ```oracle
        leverl
            해당데이터의 레벨
        connect_by_isleaf
            리프노드(자식이 없다)라면 1, 아니면 0이 들어가 있는 가상 컬럼
        connect_by_iscycle
            사이클이 발생했다면 1, 아니면 0이 들있는 가상 컬럼
        ```

#### 절차형SQL
    - 프로그래밍언어처럼 if문, 반복문 등을 사용할 수 있게 하는 명령어
    ```oracle
        declare
            - 선언부, 사용하는 변수에 대해 정의, 데이터타입 선언
        begin
        end
            - 실행부, 구현하고자 하는 로직을 정의
        [exception]
            - 예외처리부, 오류가발생했을때 처리할 방법을 정의
            - 생략가능
    ```
- 프로시져 (procedure; 리턴이 없는 함수)
    - 필요한 로직을 미리 정의하는 것
    - 사용 결과가 값이 아니다
- 프로시져 생성
    ```oracle
    create procedure 프로시져명(변수 in 타입, 변수 in 타입, 변수 in 타입)
    is
        내부에서 사용할 변수
    begin
        문장;
        문장;
        문장;
        ...
    end;
    ```
- 프로시져사용
    ```oracle
    begin
        프로시져명(값, 값, ...);
    end;
    ```
- 함수(function; 리턴이 있는 함수)
    - 필요한 로직을 미리 정의하는 것
    - 사용 결과가 값이다
    ```oracle
    create function 함수명(변수 in 타입, 변수 in 타입, ...)
    is
        내부에서 사용할 변수;
    begin 
        실행시킬문장;
        문장;
        ...;
    return 함수사용결과로되돌려줄값;
    end;

--------------
```oracle
    CREATE TABLE 무한상사(
	사원명 	varchar2(300),
	직급		varchar2(300),
--	봉금		number(10),
--	커미션	number(3, 3),
	상사		varchar2(300),
	CONSTRAINT 무한상사_pk PRIMARY KEY (사원명),
	CONSTRAINT 무한사사_fk FOREIGN KEY (상사) REFERENCES 무한상사 (사원명)
);
DROP TABLE 무한상사;

INSERT INTO 무한상사
VALUES ('김철수', '사장', null);

INSERT INTO 무한상사
VALUES ('유재석', '부장', '김철수');

INSERT INTO 무한상사
VALUES ('박명수', '과장', '유재석');

INSERT INTO 무한상사
VALUES ('정준하', '과장', '유재석');

INSERT INTO 무한상사
VALUES ('정현돈', '대리', '박명수');

INSERT INTO 무한상사
VALUES ('하하', '사원', '정현돈');

INSERT INTO 무한상사
VALUES ('노홍철', '사원', '정현돈');

INSERT INTO 무한상사
VALUES ('길', '인턴', '하하');

SELECT * FROM 무한상사;

DROP TABLE 무한상사;

-- 계층형쿼리
-- 부모 -> 자식 (순방향)
SELECT * FROM 무한상사 
START WITH 사원명 = '유재석'
CONNECT BY PRIOR 사원명 = 상사;
			-- prior 부모 = 자식;

-- 자식 -> 부모(역방향)
SELECT * FROM 무한상사 
START WITH 사원명 = '유재석'
CONNECT BY PRIOR 상사 = 사원명;
			-- prior 자식 = 부모;

-- 가장 위쪽 데이터 부터 순방향 계층형 질의
SELECT * FROM 무한상사
--START WITH 상원명 - '김철수'
WHERE 직급 IN '부장'
START WITH 상사 IS NULL 
CONNECT BY PRIOR 사원명 = 상사
order siblings BY 사원명 desc;

SELECT 사원명, 
	sys_connect_by_path(사원명, '->'), -- 경로를 알려주느 함수
	connect_by_root(직급), --데이터 전개를 시작한게 누구인지 알려주는 함수
	LEVEL,
	connect_by_isleaf --leaf노드 자식이 없는 노드 (자식이 없으면 1, 자식이 있으면 0)
FROM 무한상사
WHERE LEVEL <= 2 AND connect_by_isleaf = 0
START WITH 사원명 = '유재석'
CONNECT BY PRIOR 사원명 = 상사;

INSERT INTO 무한상사
values('홍길동', '회장', '길');

UPDATE 무한상사 
SET 상사 = '홍길동'
WHERE 사원명 = '김철수';

SELECT 사원명,
	connect_by_iscycle
FROM 무한상사
START WITH 사원명 = '정현돈'
CONNECT BY nocycle PRIOR 사원명 = 상사;

COMMIT;

-- procedure 만들기
-- 무한상사 테이블에서 사원정보 삭제하기
UPDATE 무한상사 
SET 상사 = null 
WHERE 상사= '김철수';

DELETE FROM 무한상사
WHERE 사원명 = '김철수';

SELECT * FROM 무한상사;

ROLLBACK;
-- 사원을 삭제하는 프로시져 만들기
CREATE PROCEDURE delete_emp(v_name IN varchar2)
IS
BEGIN 
	UPDATE 무한상사
	SET 상사 = NULL 
	WHERE 상사 = v_name;
	DELETE FROM 무한상사
	WHERE 사원명 = v_name;
END;

SELECT * FROM 무한상사;

BEGIN
	delete_emp('박명수');
END;

ROLLBACK;
DROP PROCEDURE delete_emp;


-- emloyees 테이블에 직원을 추가하는 프로시져
CREATE PROCEDURE ins_emp(first_name IN varchar2)
IS 
	v_emp_id number(3)
BEGIN
	SELECT max(employee_id) + 1
	INTO v_emp_id
	FROM employees;
	inset INTO employees 
	VALUES (v_emp_id, first_name, 'last', 'email', NULL, sysdate, 'SA_REP', NULL, NULL, NULL, null);
END;


BEGIN 
	ins_emp("둘리");
END;

-- function : 사용 결과가 값인 프로시져
CREATE FUNCTION get_salary(v_emp_id IN number)
IS
	v_salary number(12)
BEGIN
	SELECT salary
	INTO v_salary
	FROM employees
	WHERE employee_id = v_emp_id;
RETURN v_salary;
END;

BEGIN 
	get_salary(101);
END;

DROP FUNCTION get_salary;
```