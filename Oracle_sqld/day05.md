#### 집계함수
    - 결과가 한 개가 나오는 함수
    -GROUP BY 절
        -그룹화 하여 집계함수를 적용 시킬 수 있다.

        -ROLLUP(컬럼명1, 컬럼명2, ...)
            - 컬럼명1 별 소계를 구해준다
            - 컬럼의 순서가 바뀌면 결과도 바뀌게 된다.

        -CUBE(컬럼명1, 컬럼명2, ...)
            - 컬럼 순서에 상관 없이 모든 경우의 수를 기준으로 소계를 구해준다.
            - 컬럼의 순서가 바뀌어도 결과는 달라지지 않는다.

        - GROUPING SETS(컬럼명1, 컬럼명2)
            - 컬럼명 1별 소계, 컬럼명2 별 소계
            - 컬럼의 순서가 바뀌어도 결관느 달라지지 않는다.
            -()를 써서 새로운 집합을 만들어서 적용가능하다.

        -GROUPING() 
            - 그룹별 소계가 아니라 도와주는 역할
            - 소계가 집계된다면 결과는 1 아니면 결과가 0
        
        - HAVING절
            - GROUP 함수를 조건에 적용시키고 싶다면 HAVING절을 사용해야 하며
            - HAVING절은 GROUP BY절 앞에 또는 뒤에 위치하면 된다.
            (개념상 뒤쪽에 위치하는 것이 해석에 자연스러움)
------

    -- department_id별 소계, hire_date 별 소계
    -- 컬럼의 위치가 변해도 결과는 달라지지 않는다
    SELECT department_id, hire_date, SUM(salary)
    FROM EMPLOYEES
    GROUP BY GROUPING SETS(department_id, HIRE_DATE );

    -- GROUPING SETS() 함수는 괄호로 묶어서 새로운 집합으로 생각할 수 있다.
    -- DEPARTMENT_ID별, JOB_ID가 같은 사람들끼리 소계 혹은 HIRE_DATE별 소계
    SELECT department_id, job_id, hire_date, sum(salary)
    FROM employees
    GROUP BY GROUPING SETS ((DEPARTMENT_ID, JOB_ID), HIRE_DATE);

#### 윈도우함수