#### 날짜타입함수
    -- last_day(날짜타입) : 월의 마지막 일을 계산
    SELECT LAST_DAY(SYSDATE)
    FROM dual;

    --round(날짜, '표현하고싶은 년,달,일') : 반올림
    --TRUNC(날짜, '표현하고싶은 년,달,일') : 절삭
    SELECT SYSDATE ,
    	ROUND(SYSDATE), -- 12시가 지나서 반올림하여 다음날로 나옴 / 기준 12:00
    	round(SYSDATE,'year'),
    	ROUND(SYSDATE, 'month'),
    	ROUND(SYSDATE, 'day'), -- 'day'는 요일
    	round(SYSDATE, 'dd') -- 'dd'는 일을 의미
    FROM dual;

    SELECT SYSDATE,
	    TRUNC(SYSDATE), -- 시간을 다 잘라버림
	    TRUNC(SYSDATE, 'year') , --연도에서 잘라 버림
	    TRUNC(sysdate, 'month'), -- 일부터 다 잘라버림
	    TRUNC(sysdate, 'day') , -- 저번주로 나옴
	    TRUNC(sysdate, 'dd') -- 시간을 다 잘라버림
    FROM dual;

    -- 모든 직원들은 입사한 후 월요일에 직원 교육을 받는다.
    -- 직원이름, 교육일자, 입사한 후 며칠만에 교육을 받는지 조회하기

    -- 입사한 직원들의 이름과 올해 몇년차인지 연차를 조회하기

    SELECT first_name || ' ' || last_name AS 직원이름, 
	    HIRE_DATE ,
	    NEXT_DAY(HIRE_DATE, 2) 교육일자 ,
	    NEXT_DAY(HIRE_DATE, 2) - HIRE_DATE 비고
    FROM employees;

    SELECT hire_date,
	    SYSDATE,
    	MONTHS_BETWEEN(SYSDATE, hire_date) 
    FROM employees;

    SELECT TRUNC(sysdate, 'year') ,
	    TRUNC(hire_date, 'year') ,
    	MONTHS_BETWEEN(TRUNC(sysdate, 'year'),TRUNC(hire_date, 'year')) / 12 +1 년차
    FROM EMPLOYEES;

    SELECT first_name 이름, 
	    NEXT_DAY(HIRE_DATE, 2) 교육일자 ,
	    NEXT_DAY(HIRE_DATE, 2) - HIRE_DATE 비고,
	    MONTHS_BETWEEN(TRUNC(sysdate, 'year'),TRUNC(hire_date, 'year')) / 12 +1 년차
    FROM employees;

#### 타입 
    숫자        number(Oracle), numeric(mysql 등등 (정수, 실수, ... ))
    날짜        date(Oracle), datetime(mysql ...)
    문자(열)    varchar2    크기가 가변적으로 변하는 문자    Oracle
                char       크기가 고정적인 문자             Oracle
                varchar    크기가 가변적으로 변하는 문자     mysql등등
                char       크기가 고정적인 문자             mysql등등

    - 타입 변환
        숫자 ----> 문자 ----> 날짜
             <----     <----
        
        TO_NUMBER(문자값) : 문자를 숫자로 바꿀때 사용
        TO_DATE(문자값) : 문자를 날짜로 바꿀때
        TO_CHAR(숫자 OR 날짜) : 숫자, 날짜를 문자로 바꿀때



----
    -- 문자 --> 숫자
    SELECT TO_NUMBER('1500') 
    FROM dual;

    -- 숫자 형식 문자만 숫자로 변경 가능하다
    --SELECT TO_NUMBER('안녕') 
    --FROM dual;

    --숫자 --> 문자
    --TO_CHAR(숫자값) 
    SELECT TO_CHAR(salary) 
    FROM employees;

    -- 타입이 다르더라도 연산이 가능하긴 하지만
    -- 이는 자동으로 어느 한쪽의 타입을 바꾸고 있기 때문이다
    -- 이를 자동형변환이라고 한다.
    -- 하지만 자동형변환은 우리가 예상하지느 못한 방향으로 주어질 수 있다.
    -- 연산 속도에 영향을 미치기에 웬만하면 지양한다.
    SELECT first_name, salary
    FROM EMPLOYEES
    WHERE TO_CHAR(salary) LIKE  '1%'; 

    SELECT '10' + '20'
    FROM dual;

    -- 숫자를 무자로 바꿀 때 형식 지정하기
    -- 9 : 자릿수
    -- 0 : 빈 공간을 0으로 채울지 여부
    -- $ : $기호 의미
    -- L : 지역화폐
    -- . : 소수점 위치
    -- , : , 위치

    SELECT TRIM(TO_CHAR(123456789.55555, 'L09,999,999,999.99'))  -- 적은숫자보다 적으면 #으로 출력되어서 못봄
    FROM dual;

    -- 사원 이름과, 사원의 봉급을 $12,000 형식으로 조회하기
    SELECT first_name 이름, 
    	trim(TO_CHAR(salary, '$99,999')) 봉급
    FROM employees;

    -- 문자 --> 날짜
    -- to_date(문자값, 형식)
    -- Y : 년도
    -- M : 월
    -- D : 일
    -- DAY : 요일
    -- HH : 시간(1~12)
    -- MI : 분(0~59)
    -- SS : 초
    SELECT TO_DATE('030102', 'yymmdd') ,
	    TO_DATE('03-01/02', 'YY-MM/DD'),
	    TO_DATE('030201','mmddyy') ,
	    TO_DATE('1993 11 20 2:50', 'YYYY MM DD HH:MI') 
    FROM dual;

    -- 날짜 --> 문자
    SELECT TO_CHAR(sysdate, 'yy/mm/dd-day HH24:mi:ss')
    FROM dual;