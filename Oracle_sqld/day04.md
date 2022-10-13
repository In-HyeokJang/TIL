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
    -- AM or PM : 오전 오후
    SELECT TO_DATE('030102', 'yymmdd') ,
	    TO_DATE('03-01/02', 'YY-MM/DD'),
	    TO_DATE('030201','mmddyy') ,
	    TO_DATE('1993 11 20 2:50', 'YYYY MM DD HH:MI') 
    FROM dual;

    -- 날짜 --> 문자
    SELECT TO_CHAR(sysdate, 'yy/mm/dd-day HH24:mi:ss')
        TO_CHAR(sysdate, 'yy"년" mm"월" dd"일" day am hh:mi:ss')
    FROM dual;

※ 기타
    NVL(null value) (값1, 값2) 
                        값1 자리가 NULL 이라면 결과는 값2
                        값1 자리가 NULL이 아니라면 결과는 값1

    DECODE(값1, 조건값, 결과값1, 결과값2)
            값1 자리가 조건값이라면 결과는 결과값1
            값1 자리가 조건값이 아니라면 결과는 결과값2

    CASE 표현식
        CASE 컬럼명
            WHEN 조건값1 THEN 결과값1
            WHEN 조건값2 THEN 결과값2
            ...
            ELSE 결과값n
        END
        컬럼에 들어있는 값이 조건값1 이라면 결과값1이 결과로,
        그게 아니라 조건값2라면 결과값2가 결과로,
        ...
        위에있는 모든 조건값에 해당하지 않는다면 결과값n이 결과

        CSSE
            WHEN 조건1 THEN 값1
            WHEN 조건2 THEN 값2
            ...
            ELSE 값N
        END
        조건1을 만족하면 결과는 값1
        그게 아니라 조건2를 만족하면 값2
        ...
        위에있는 조건을 모두 만족하지 않는다면 결과는 값N
------
    -- 직원의 봉금을 조회하되
    -- commission을 받는 직원들은 커미션이 포함된 봉급을 조회하라
    SELECT first_name,
	    salary + salary * commission_pct
    FROM employees;

    SELECT commission_pct,
    	NVL(commission_pct, 0)
    	FROM employees;

    SELECT first_name,
    	salary + salary *  NVL(commission_pct, 0)
    	FROM employees;

    -- 10번 부서를 제외한 나머지부서는 봉급을 10% 인상
    SELECT department_id,
	    salary,
	    decode(department_id, 10, salary, salary * 1.1)
	    FROM employees
    	ORDER BY department_id ASC;

    SELECT department_id, salary,
	    DECODE(department_id, 50, salary * 0.9, DECODE(department_id, 60, salary *1.1, salary))
    FROM EMPLOYEES
    ORDER BY DEPARTMENT_ID;

    -- decode는 앞에서부터 차례대로 계산함
    SELECT department_id, 
    	employee_id,
    	DECODE(department_id, 50, '확인', DECODE(employee_id, 120, '확인2', '확인3')) 
    FROM employees
    ORDER BY DEPARTMENT_ID, EMPLOYEE_ID  asc;

    SELECT department_id, 
	    salary,
	    CASE  department_id
		    WHEN 50 THEN salary * 0.9
		    WHEN 60 THEN salary * 1.1
	    	ELSE salary
    	END 조정급여
    FROM employees
    ORDER BY department_id;

    -- employee_id 가 110 혹은 120 혹은 130인 직원은 0.9배
    -- employee_id 가 150이상 160 이하는 1.1배
    -- 나머지는 그대로
    SELECT employee_id, salary,
	    CASE
		    WHEN employee_id IN(110, 120, 130) THEN salary * 0.9
		    WHEN employee_id BETWEEN 150 AND 160 THEN salary * 1.1
		    ELSE salary
    	END 조정급여
    FROM employees
    ORDER BY EMPLOYEE_ID ;

    -- 봉급을 기준으로 상위 중위 하위를 판단하고자 한다
    -- 직원의 봉급이 10000이상이라면 상위
    -- 3000이상, 10000미안이라면 중위
    -- 나머지는 하위로 표현하고자 한다.
    -- first_name, salary, 비고 컬럼을
    -- salary 오름차순으로 조회하기
    -- (비고 컬럼에는 상위중위하위 정보가 들어가있다)
    SELECT first_name, salary,
	    CASE
		    WHEN salary >= 10000 THEN '상위'
		    WHEN SALARY >= 3000 AND salary<10000 THEN '중위'
		    ELSE '하위'
    	END 비고
    FROM employees
    ORDER BY SALARY ASC;


    -- employee_id가 150 초과인 인원은 A팀
    -- 140 초과 150이하인 인원은 B팀
    -- 130 초과 140이하인 인원 C팀
    -- 나머지 : D팀
    -- 단 이름이 대문자 D로 시작하은 인원으 employee_id 와 관계없이 특별팀
    -- 사원의 employee_id, first_name, 팀 종류를 조회 하시오

    SELECT employee_id, first_name,
	    CASE
		    WHEN FIRST_NAME LIKE 'D%' THEN '특별팀'
		    WHEN employee_id >150 THEN 'A팀'
		    WHEN employee_id >140 THEN 'B팀'
		    WHEN EMPLOYEE_ID >130 THEN 'C팀'
		    ELSE 'D팀'
    	END 팀종류
    FROM EMPLOYEES
    ORDER BY EMPLOYEE_ID;

#### 다중 행 함수
    - 여러 행에 걸쳐 함수가 적용된다.
        결과는 1개
        집계함수
            COUNT()
            SUM()
            AVG()
            MAX()
            MIN()
            STDDEV() : 표준편차

#### group함수
    group by 절 안에서 사용된다.
    rollup() : 앞에 있는 컬럼별 소계를 구해준다. 컬럼순서가 바뀌면 결과도 달라진다.
    cube () : 써있는 모든 경우의 수를 계산하여 소계를 구한다.
                컬럼 순서가 바뀌어도 결과는 달라지지 않는다.

-----
    -- 집계함수	
    -- 행의 갯수가 일치할 때만 사용 가능하다.
    SELECT sum(salary),
    	AVG(SALARY),
    	COUNT(SALARY) ,
    	MAX(SALARY) ,
    	MIN(SALARY),
    	STDDEV(SALARY) 
    FROM employees;

    -- null값
    -- null값은 제외하고 연산된다
    SELECT count(commission_pct),
	    sum(commission_pct)
    FROM employees;

    SELECT count(first_name)
    FROM employees;

    -- 해당 테이블의 행(데이터, 레코드, 인스턴스, 듀플)갯수
    SELECT count(*)
    FROM employees;

    -- 그룹화 하여 산출
    -- group by 절과 group함수
    SELECT DISTINCT department_id
    FROM employees;

    SELECT department_id, AVG(salary) 평균, SUM(SALARY)  
    FROM employees
    GROUP BY department_id
    ORDER BY DEPARTMENT_ID ;

    SELECT hire_date,department_id, AVG(salary) 평균  	-- 4. department_id 컬럼, hire_date컬럼, 평균
    FROM employees										-- 1. employees 테이블에서
    WHERE EMPLOYEE_ID > 150							 	-- 2. employee_id > 150 행을 골라 내고
    GROUP BY hire_date, department_id					-- 3. hire_date가 같은 순으로, 그 중에서 department_id별로 골라내고
    ORDER BY DEPARTMENT_ID ;							-- 5. department_id 오름차순으로 정렬하여 조회

    SELECT department_id, hire_date,
    	sum(salary)
    	FROM EMPLOYEES
    	WHERE EMPLOYEE_ID  > 150 AND DEPARTMENT_ID IS NOT NULL  
    	GROUP BY ROLLUP (DEPARTMENT_ID, HIRE_DATE)  -- 순서가 바뀌면 결과가 바뀐다.
    	ORDER BY DEPARTMENT_ID ;

    SELECT hire_date, department_id, SUM(salary) 
    FROM EMPLOYEES 
    WHERE EMPLOYEE_ID > 150 AND DEPARTMENT_ID IS NOT NULL 
    GROUP BY ROLLUP (HIRE_DATE, DEPARTMENT_ID)
    ORDER BY HIRE_DATE ;

    SELECT hire_date, department_id, SUM(salary) 
    FROM EMPLOYEES 
    WHERE EMPLOYEE_ID > 150 AND DEPARTMENT_ID IS NOT NULL 
    GROUP BY CUBE  (HIRE_DATE, DEPARTMENT_ID); -- cube : 두개 다 소계를 구해준다
