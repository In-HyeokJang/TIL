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

------
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