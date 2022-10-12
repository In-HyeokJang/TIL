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
    - 문자타입함수
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
            	
    -- replace(문자값, 변경할값, 변경값)
    -- 없는 값은 변경이 안됨
    SELECT replace('apple','x','d')
    FROM dual;

    -- length 문자의 길이를 알려주는 함수
    SELECT first_name, 
    	length(first_name)
    	FROM EMPLOYEES;

    -- 사원 email과, 사원이름, 사원 성을 조히하고자 한다.
    -- 이때 email은 개인정보 보호를 위해 뒤에서 세자리를 ***로 표현하고자 한다.
    -- 함수를 여려개 사용한다 하면 가장 안쪽에 있는거 먼저 실행된다.
    SELECT email, first_name AS "사원이름", last_name AS "사원 성",
    	substr(email, 1, LENGTH(email) - 3) || '***' 이메일
    FROM employees;

    -- concat 두문자열은 연결 (||과 같음)
    SELECT first_name, last_name,
    	concat (first_name, last_name),
    	concat(concat(first_name, ' '),last_name)
    	FROM employees;

    -- instr (문자값, 알고싶은위치값)
    SELECT first_name,
    	instr(first_name,'li')
    	FROM employees;

    -- 여러개 겹치는 언어일경우
    SELECT instr('apple','p'),
    	instr('apasdasdple','p', 3) -- 3번부터 p 찾아라 
    FROM dual;

    -- first_name과 first_name에서 두번째 n이 등장하는 위치를 조회하되
    -- n이 한개 또는 없는 직원은 제외하고 죄회하기
    SELECT first_name, 
    	instr(first_name,'n', instr(first_name,'n')+1)
    FROM employees
    WHERE instr(first_name,'n', instr(first_name,'n')+1) <> 0;

    -- LPAD, RPAD(왼쪽, 오른쪽부터 특정 문자로 자리를 채운다)
    SELECT LPAD('apple',3,'*'),
	    LPAD('apple',10,'*'),
	    RPAD('apple',10,'zk')
	    FROM dual;

    -- LTRIM, RTRIM(왼쪽, 오른쪽 문자를 지운다)
    -- TRIM(문자열 양쪽의 문자를 지운다)
    SELECT LTRIM('    A B C     ',' '),
	    LTRIM('aaaaabbbddaaa','aab'),
	    RTRIM('    A B C     '), -- 제거할 문자 생략시 띄어쓰기
	    RTRIM('aaabbbbbcccc', 'ac'),
	    TRIM    ('     a b c    '), -- TRIM은 양쪽 띄어쓰기만 제거 가능
	    replace('    A B C     ', ' ', '') 
    FROM dual;

    -- 사원이름, 사원성을 띄워쓰기로 연경하여 성함 이라는 이름으로,
    -- 사원이메일을 앞에 두 글자만 떼어내어 출력하되 나머지는 *로 채워서 출력하기
    -- ABANDA --> AB****@koreait.com
    -- DEFSSSDDD --> DE*******@koreait.com

    SELECT first_name || ' ' || last_name AS 성함,
    	RPAD(SUBSTR (email,1,2),LENGTH (email),'*') ||'@koreakit.com' 이메일 
    FROM employees;