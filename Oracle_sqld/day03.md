#### 데이터 csv파일로 저장하기
    저장하고자 하는 데이터 마우스 우클릭 > 데이터 추출 > CSV선택 > 저장할 경로 설정 > 진행
#### CSV(comma separated value)파일
    - 컴마로 값들이 구분되어 있다

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

-----
        -- 숫자타입함수
    -- round(숫자, 표현할자릿수)
    SELECT ROUND(13.532, 2), -- 소수점두째자리까지 출력하고 그다음 숫자는 반올림
    round(13.234,1),
    ROUND(13.234,-1),
    round(13.523) --생략하면 정수로 반올림
    FROM dual;

    -- trunc(숫자, 자릿수): 해당 숫자를 절삭하여 자릿수까지 표현
    SELECT TRUNC(13.512,2),
    TRUNC(13.523) -- 생략하면 정수
    FROM dual;

    -- floor(숫자) : 정수로 내림
    -- seil(숫자) : 정수로 올림
    SELECT FLOOR(13.512) ,
    	CEIL(15.532)
    FROM dual;

    --sign(숫자) : 양수몀 1 음수면 -1 0이면 0
    SELECT SIGN(-15),
	    SIGN(10),
	    SIGN(0)
    	FROM dual;

    -- mod(숫자, 나눌값) : 숫자를 값으로 나눴을때 나머지
    -- power(숫자, 거듭제곱할값) : 숫자를 거듭제곱한 결과
    -- sqrt(숫자): 해당숫자의 제곱근
    SELECT MOD(10,3),
	    POWER(10,3) ,
	    SQRT(99) 
	    FROM dual;

    -- 사원번호가 짝수인 직원의 사원번호, 이름 조회
    SELECT employee_id, first_name
    FROM employees
    WHERE mod(EMPLOYEE_ID,2) = 0
    ORDER BY EMPLOYEE_ID asc;

---------
    -- 날짜 타입 연산
    -- 날짜 - 숫자 : 해당 날짜로부터 숫자일 만큼 이전날짜
    -- 날짜 + 숫자 : 해당 날짜로부터 숫자일 만큼 이후 날짜
    -- 날짜 - 날짜 : 날짜 사이의 일수
    -- 오늘날짜를 받아오는 방법 : sysdate
    SELECT SYSDATE 
    FROM dual;

    SELECT SYSDATE ,
    	hire_date,
    	SYSDATE - hire_date
	FROM employees;

    -- months_between(날짜, 날짜) : 몇개월이 지났는지 월로 계산해서 출력
    SELECT SYSDATE ,
	    hire_date,
	    (SYSDATE - HIRE_DATE) /365 AS"일수 / 365",
	    MONTHS_BETWEEN(SYSDATE, hire_date) /12 "월/12"
    	FROM employees;

    -- add_months(날짜, 숫자) : 숫자로 부터 날짜의 월이 더해진다
    SELECT hire_date,
    	ADD_MONTHS(hire_date, 3) 
    FROM EMPLOYEES;

    -- next_day(날짜, 숫자) : 돌아오는 요일이 결과롤 나타남
    SELECT SYSDATE ,
	    NEXT_DAY(SYSDATE,1) -- 1=일요일 ,2=월요일, 3=화요일, 4=수요일, 5=목요일, 6=금요일, 7=토요일
	    FROM dual;