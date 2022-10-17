#### 조인
    - 여러개의 테이블을 연결하여 조회하는 문법

    - 내부, 동등조인(inner join / equi join)
        - 두 테이블 간의 컬럼 값들이 정확 일치하는 경우에만 결과를 가져오는 방법
        - 조인 조건 자리에는 = 연산자 활용한다.

        오라클 문법
            select 테이블1.컬럼1, 테이블2.컬럼2, ...
            from 테이블1, 테이블2
            where 조인조건;

        ANSI(미국 국가 표준 협회)문법 / SQL표준 문법
            select 테이블1, 컬럼1, 테이블2.컬럼2, ...
            from 테이블1 inner join 테이블2
            on 조인조건;

    - 외부조인(Outer join)
        조인 조건이 완벽히 일치하지 않아도 결과로 가져온다.
        
        오라클 문법
        - Left outer join
            select 테이블1.컬럼, 테이블2.컬럼
            from 테이블1, 테이블2
            where 테이블1.컬럼 = 테이블2.컬럼(+);

        - Right outer join
            select 테이블1.컬럼, 테이블2.컬럼
            from 테이블1, 테이블2
            where 테이블1.컬럼(+) = 테이블2.컬럼;

            - (+)가 와야 하는 곳은 데이터가 부족한 컬럼이라고 생각한다.
            - (+)가 붙지 않은 쪽을 모두 표현한다.
            - (+)가 기술되지 않은 족이 조인의 이름이 된다.

        ANSI문법
            select 테이블1.컬럼, 테이블2.컬럼
            from 테이블1 조인이름(left outer join / right outer join) 테이블2
            on 조인조건;

    - 비동등조인(non equi join)
        - 두개의 테이블 컬럼 값들이 정확하게 일치하지 않는 경우에만 결과로 가져온다
        - =연산자가 아닌 다른 연산자(between, like, >, >=, ...)를 조인 조건으로 사용하는 조인

    - 서브쿼리
        SQL문 안에 포함되어있는 SQL문
        (select문 안에 포함되어 있는 select문)
        서브쿼리는 select 문에서 select절, from절, where절, having절, order by절 에서 사용이 가능하며
        insert문에서 values절, update문에서 set절 에서 사용이 가능하다.
        서브쿼리는 반드시 () 감싸야 한다.
        실행결과에 따른 분류
            1. 단일 행 서브쿼리     : 서브쿼리 결과가 행이 1개 나오는 경우
                - 단일행 서브쿼리는 단일행 연산자와 함께 사용이 가능하다.
                (단일행연산자 : = > < >= <= <> ...)
            2. 다중 행 서브쿼리     : 서비쿼리 결과가 여러개의 행이 나오는 경우
                - 다중행 연산자와 함께 사용이 가능하다
                in, any, all, exists
            3. 다중 컬럼 서브쿼리   : 서브쿼리 결과가 여러개의 열, 여러개의 행이 나오는 경우
------
```orcal
    -- 부서 이름과 관리자 이름
    SELECT d.department_name 부서이름, e.first_name 이름, e.employee_id 사원번호, d.manager_id 부서아이디
    FROM DEPARTMENTS d , EMPLOYEES e 
    WHERE d.MANAGER_ID = e.EMPLOYEE_ID;

    --ANSI 문법
    SELECT d.DEPARTMENT_NAME , e.FIRST_NAME 
    FROM DEPARTMENTS d INNER join EMPLOYEES e
    ON d.MANAGER_ID = e.EMPLOYEE_ID ;

    --부서id가 30보다 큰 행들만 콜라내서...
    SELECT d.department_name 부서이름, e.first_name 이름, e.employee_id 사원번호, d.manager_id 부서아이디
    FROM DEPARTMENTS d , EMPLOYEES e 
    WHERE d.MANAGER_ID = e.EMPLOYEE_ID AND d.DEPARTMENT_ID > 30;

    SELECT d.DEPARTMENT_NAME , e.FIRST_NAME 
    FROM DEPARTMENTS d INNER join EMPLOYEES e
    ON d.MANAGER_ID = e.EMPLOYEE_ID 
    WHERE d.DEPARTMENT_ID >30;

    -- 외부조인
    -- Orale
    -- 부서 이름과 관리자 이름
    SELECT d.department_name, e.first_name
    FROM departments d, employees e
    WHERE d.MANAGER_ID(+) = e.EMPLOYEE_ID ;

    -- ANSI 외부조인
    SELECT d.DEPARTMENT_NAME , e.FIRST_NAME 
    FROM DEPARTMENTS d LEFT OUTER JOIN EMPLOYEES e 
    ON d.MANAGER_ID = e.EMPLOYEE_ID ;

    SELECT d.DEPARTMENT_NAME , e.FIRST_NAME 
    FROM DEPARTMENTS d right OUTER JOIN EMPLOYEES e 
    ON d.MANAGER_ID = e.EMPLOYEE_ID ;

    SELECT * 
    FROM DEPARTMENTS d LEFT OUTER JOIN EMPLOYEES e 
    ON d.MANAGER_ID = e.EMPLOYEE_ID;

    SELECT * 
    FROM DEPARTMENTS d right OUTER JOIN EMPLOYEES e 
    ON d.MANAGER_ID = e.EMPLOYEE_ID;

    -- 3 join
    -- 사원 이름(employees), 부서명(departments), 부서의 city(locations)
    SELECT e.FIRST_NAME , d.DEPARTMENT_name, l.CITY 
    FROM EMPLOYEES e ,DEPARTMENTS d , LOCATIONS l 
    WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.LOCATION_ID = l.LOCATION_ID ;

    --ANSI문법
SELECT e.FIRST_NAME , d.DEPARTMENT_name, l.CITY 
FROM EMPLOYEES e 
INNER JOIN DEPARTMENTS d  
on e.DEPARTMENT_ID = d.DEPARTMENT_ID 
INNER JOIN LOCATIONS l 
ON d.LOCATION_ID  = l.LOCATION_ID ;


-- 자기 자신을 조인하는 경우 : 자체조인(self join)
-- 직원 이름과 직원을 관리하는 상사 이름
SELECT a.FIRST_NAME , b.FIRST_NAME 
FROM employees a, employees b
WHERE a.MANAGER_ID = b.EMPLOYEE_ID; 

------------
    -- 서브쿼리
-- 단일행 서브쿼리
-- Joshua가 받는 봉급 이상을 받는 직원의 이름과 봉급 조회하기
SELECT salary
FROM employees
WHERE first_name = 'Joshua';

SELECT first_name, salary
FROM employees
WHERE salary >= (
	-- 서브쿼리
	SELECT salary
	FROM employees
	WHERE first_name = 'Joshua'
	)ORDER BY SALARY  asc;

-- David가 받는 봉급과 동일한 봉급을 받는 직원의 이름과 봉급 조회하기
-- 다중행 서브쿼리 (다중행연산자)
SELECT first_name, salary
FROM EMPLOYEES 
WHERE salary in (
	SELECT SALARY 
	FROM employees
	WHERE first_name = 'David'
);

SELECT SALARY 
	FROM employees
	WHERE first_name = 'David';

SELECT first_name,SALARY 
	FROM employees
	WHERE salary in (4800, 9500, 6800);

-- 전체 직원 평균 봉급보다 많은 봉급을 받는 직원의
-- 이름, 봉급을 조회하기
SELECT AVG(salary)
FROM EMPLOYEES;

SELECT first_name, salary
FROM employees
WHERE SALARY  > (
	SELECT AVG(salary)
	FROM EMPLOYEES
)
ORDER BY SALARY asc;

--in (값, 값, 값,...)
-- 관계연산자 any(값, 값, 값,...)
-- salary가 6000보다 큰 조건 / 7000보다 큰 조건 /10000 보다 큰 조건에 대해서 어느하나 만족하면 값을 가져온다.
SELECT first_name, salary
FROM employees
WHERE SALARY > ANY (6000, 7000, 10000)
ORDER BY salary;

-- David라는 사람의 봉급 중에 가장 작은 금액보다 큰 금액을 받는 사람들을 다 알려줘!
SELECT first_name, salary
FROM employees
WHERE SALARY > ANY (
	SELECT SALARY 
	FROM employees
	WHERE first_name = 'David'
	)
ORDER BY salary;

    ```