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

    SELECT department_id,
	    job_id, sum(salary), 
	    GROUPING (department_id), 
	    DECODE(GROUPING(department_id), 1, '모든부서', department_id) 부서,
	    GROUPING (job_id),
    	DECODE(GROUPING(job_id),1,'모든직책',job_id) 직책
    FROM employees
    GROUP BY ROLLUP (DEPARTMENT_ID, job_id);

    SELECT 
    	DECODE(GROUPING(department_id), 1, '모든부서', department_id) 부서,
    	DECODE(GROUPING(job_id),1,'모든직책',job_id) 직책,
    	SUM(SALARY) 합계
    FROM employees
    GROUP BY ROLLUP (department_id, job_id);
    --where 절 자리에는 그룹함수를 사용할 수 없다.
    -- HAVING 절을 사용하여 그룹함수 조건을 적용시킬수 있다.
    SELECT department_id, SUM(salary)		-- 3
    FROM employees							-- 1
    GROUP BY department_id					-- 2
    ORDER BY department_id;					-- 4

    --having 절은 보통 group by 다음 줄에 사용한다.
    SELECT department_id, SUM(salary)		-- 5
    FROM employees							-- 1					
    WHERE EMPLOYEE_ID > 150					-- 2
    GROUP BY department_id					-- 3
    HAVING SUM(SALARY) > 30000				-- 4
    ORDER BY department_id;					-- 6


#### 윈도우함수
    - 컬럼과 컬럼간의 연산이 아닌, 행과 행 간의 비교 또는 연산을 처리하기 위해 사용하는 함수
    - 데이터베이스를 사용한 온라인 분석 처리 용도로 사용하기 위해서 SQL에 추가가 되어있으며 OLAP 함수라고 부르기도 한다.
    - 메인쿼리 뿐만 아니라 서브쿼리에서도 사용 가능하지만 함수 자체에서 중첩할 수는 없다.
    - 윈도우 함수 사용 결과는 행 갯수에 영향을 미치지 않는다.

    -- select 윈도우함수 over([PARTITION BY] [ORDER BY] [WINDOWING절])
    -- FROM 테이블명;
        - PARTITION BY : 그룹화시킬 컬럼
        - ORDER BY : 정렬 순서
        - WINDOWING 절 : 적용시킬 데이터(행)

    - WINDOWING절
        ROUS BETWEEN 시작점 AND 끝점 
            - 물리적인 행의 범위
        RANGE BETWEEN 시작점 AND 끝점
            - 논리적인 값의 범위
        
        - 시작점
            UNBOUNDED PRECEDING : 최초의 레코드(행, 인스턴스, 튜플)
            CURRENT ROW : 현재 레코드(행, 인스턴스, 튜플)
            값 PRECEDING : 값만큼 이전 레코드
            값 FOLLOWING : 값만큼 이후 레코드

        - 끝점
            UNBOUNDED FOLLOWING : 마지막 레코드
            CURRENT ROW : 현재 레코드
            값 PRECEDING : 값만큼 이전 레코드
            값 FOLLOWING : 값만큼 이후 레코드

        - WINDOWING 절이 없으면 default는 RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 이다.

    -윈도우함수 종류
        - 순위함수 : 레코드의 순위를 계산하는 함수
            - RANK() 
            - DENSE_RANK()
            - ROW_NUMBER()
            - ORDER BY를 반드시 써야 한다.
        
        - 집계함수 : 
            - SUM()
            - AVG()
            - MAX()
            - MIN()
            - COUNT()
            - STDDEV()

        - 순서함수
            - FIRST_VALUE() : 파티션별 첫 번째 값
            - LAST_VALUE() : 파티션 별 마지막 값
            - LAG() : 파티션 별 이전 행의 값
            - LEAD() : 파티션 별 다음 행의 값
        
        - 비율함수
            - RATIO_TO_REPORT()
                파티션 내 SUM에 대한 백분율
            - PERCENT_RANK()
                (순위 - 1) / (전체갯수 - 1)
                파티션 내 순서별 백분율, 0부터 시작
            - CUME_DIST()
                파티션 내 순서별 백분율, 0보다 큰 값부터 시작
            - NTILE()
                균등하게 행 갯수 N 등분 그룹 나눔


-----
    -- 윈도우 함수
    -- 전체 직원의 이름과 월급 순위
    -- rank절 순위 함수에는 order by는 꼭 있어야 한다.
    SELECT first_name, salary,
	    RANK () OVER(ORDER BY SALARY DESC) 순위,		-- 중복 되면 순위가 건너뜀
	    DENSE_RANK () OVER (ORDER BY salary DESC),	-- 중복 되도 순위 건너 안뛰고 순서대로
	    ROW_NUMBER () OVER (ORDER BY salary DESC) 순위	-- 중복 허용 하지 않고 순위대로 진행
    FROM employees;

    SELECT 
    first_name, salary,
	    ROW_NUMBER () OVER (ORDER BY salary DESC, first_name asc)
    FROM employees;


    -- 부서 별 봉급 많이 받는 순위
    -- partition by 는 윈두우 함수를 group by 하고 싶을때 사용
    SELECT first_name, department_id, salary,
	    RANK () OVER (PARTITION BY department_id ORDER BY salary DESC)
    FROM employees;


    -- 윈도우 함수(집계함수)
    SELECT first_name, salary,
	    sum(salary) OVER ()
    FROM EMPLOYEES;
    
    SELECT first_name, department_id, salary,
	    sum(salary) over(PARTITION BY department_id),
	    round(salary / sum(salary) over(PARTITION BY department_id) * 100, 2) 평균 
        FROM employees;

    SELECT first_name, department_id, salary,
	    FIRST_VALUE(first_name) OVER (PARTITION BY department_id ORDER BY salary) fisrt_value,
	    LAST_VALUE(first_name) OVER (PARTITION BY department_id
								    ORDER BY salary
	    							RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) -- 최초 레코드부터 최후 레코드 까지 적용시키겠다.
    --								RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) -- 처음 레코드 부터 현재 레코드 적용
	    							last_value,
    	LAG(first_name) OVER (PARTITION BY department_id ORDER BY salary) lag, -- 이전행을 받아온다.
    	LEAD(first_name) OVER (PARTITION BY department_id ORDER BY salary) lead -- 이후행을 받아온다.
	    FROM employees;


    SELECT first_name, department_id, salary,
    	ROUND( ratio_to_report(salary) OVER (PARTITION BY department_id) * 100,2) || '%' 평균 --sum 백분율
    FROM employees;

    SELECT first_name, salary,
    	RANK () OVER (ORDER BY salary) 순위,
    	CUME_DIST () OVER (ORDER BY salary) 누적비율,
    	PERCENT_RANK() OVER (ORDER BY salary) -- (자기순위 - 1) / (전제 - 1)
    FROM employees;

    SELECT first_name, salary, 
    	NTILE(3) over(ORDER BY salary) 
    FROM employees;

    -- 부서 끼리 묶어서 n 등분
    SELECT first_name, department_id, salary, 
	    NTILE(3) OVER (PARTITION BY department_id ORDER BY salary ) 
    FROM employees;

#### ★ 조인 join ★
    관계형데이터베이스
        - 여러개의 테이블이 서로 관계를 맺고 있다
        - 관계를 맺고 있는 테이블 간에는 값은 값을 공유하는 컬럼이 존재한다.

        - A테이블
            A테이블 속에 있는 a라는 컬럼을 B테이블에 제공하고 있다.

        - B테이블
            B테이블에 있는 b라는 컬럼은 A테이블로부터 받은 a컬럼이다.
            b라는 컬럼은 A라는 컬럼으로 부터 받은 외래키(foregin key)

    조인 join
        - 여러개의 테이블을 연결하여 조회하는 기법

        - 동등조인(equi join, 내부조인 inner join)
            양쪽 테이블에서 조건이 일치하는 행만 가져오는 조인

        - Oracle 에서만 적용
            select 컬럼명, 컬럼명, ...
            from 테이블명, 테이블명 
            where 조인조건;
        
        - 표준조인방법(db 다 가능)
            select 컬럼명, 컬럼명, ...
            from 테이블명
            inner join 테이블명 on 조인조건;

------
    -- 사원의 이름과 해당사원이 근무하는 부서의 이름
    -- 동등조인 같은 값이 있는거만 가져온다
    -- null 값은 가져오지 않음
    SELECT a.first_name, b.department_name
    FROM employees a, DEPARTMENTS b
    WHERE a.department_id  = b.department_id;

    SELECT *
    FROM employees a, DEPARTMENTS b
    WHERE a.department_id = b.department_id;

    SELECT *
    FROM employees a, DEPARTMENTS b
    WHERE b.department_id = a.department_id;

    SELECT * 
    FROM departments b , employees a
    WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID ;

    -- 중심이 되는 테이블을 앞쪽에 기술

    -- 둘다 있는 값으면 소속을 꼭 써주어야 함
    SELECT e.first_name, e.department_id, d.department_name
    FROM EMPLOYEES e, DEPARTMENTS d 
    WHERE e.DEPARTMENT_ID =d.DEPARTMENT_ID ;