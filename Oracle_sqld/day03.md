#### null 사용
    -- null값이 들어있는 행 골라내기
    -- is null
    SELECT first_name, last_name, manager_id
    FROM EMPLOYEES
    WHERE manager_id IS NULL;

    -- null값이 들어있지 않는 행 골라내기
    --  is not null
    SELECT first_name, last_name, commission_pct
    FROM employees
    WHERE commission_pct IS NOT NULL;

- 함수
    - 일련의 정의된 동작을 수행한다.
    - 입력값, 수행동작, 결과값을 잘 파악해야 한다.

- 단일행함수
    - 행 하나하나씩 적용되는 함수
    - 문자타입함수 : 문자값을 입력 받는 함수
    - 숫자타입함수
    - 날짜타입함수
    - 변환함수
    - 일반함수

- 다중행함수

-----
    -- 문자타입함수
    SELECT first_name,
	    lower(first_name) AS "Lower", -- 소문자변형
	    upper(first_name) AS "upper" -- 대문자로 변형
    FROM EMPLOYEES;

    SELECT first_name
    FROM employees
    WHERE upper(first_name) = UPPER('david');

    SELECT email,
	    initcap(email) -- 첫글자만 대문자로 변형
	    FROM EMPLOYEES;
	
    -- substr(문자값, 시작숫자, 자를길이숫지)
    -- 해당 문자값을 시작숫자부터 길이만큼 잘라낸 문자가 결과로 나온다
    SELECT first_name,
	    substr(first_name,2,5)
	    FROM employees;