## Oracle_sqld

- 스크립트 파일 만들기
  - Scripts 폴도 우클릭 -> Create -> Create New File 생성
- 글씨체 및 글씨크기 변경하기
  - 윈도우(상단) -> 설정 -> User Interface -> 모양 -> 색상 및 글꼴 -> 기본 -> 텍스트 글꼴 더블클릭 -> 글씨체 및 크기 설정 -> Apply and Close
- Oracle 연결 하기
  - 상단 데이터베이스 모양 클릭 localhost 연결 (각 db프로그램에 따라 많이 뜰수 있음 ex)Oracle, MySQL...)
- 스크립트 파일
  - 명령어를 적는 파일

### SQL(Structured Query Language)

    - 데이터베이스관리시스템(DBMS)의 데이터를 관리하기 위해 설계된 언어 SQL문, 쿼리문, 질의문 이라 이야기 함
    - SQL문의 주요 특징
        - 한줄 한줄씩 실행되는 문장(Script)
        - 대문자 소문자 구별하지 않음
            1. 예약어(이미 역할이 정해져 있는 단어)는 대문자, 나머지는 소문자로 작성한다.
            2. 너무 길어지면 가독성을 높이기 위해서 줄바꿈을 할 수 있다.
            3. 들여쓰기를 사용하여 가독성을 높일 수 있다.

### RDBMS(관계형데이터베이스관리시스템)

    - 2차원의 표 형태의 테이블이 관계를 맻고 있다.
    - 테이블 : Obiect(객체) / entity(객체) 데이터가 저장되는 공간, 행과 열로 이루어져 있다.
    - 행 : row, 가로줄, 레코드, instance, 튜플, 가로우~라고 외우면 좋음
    - 열 : column, 세로줄, 속성
    - 행과 열이 만나는 교점 : 필드

#### 문 설명

- SELECT 문
  -SELECT 컬럼명 FROM 테이블명;

- DISTINCT 문
  - 컬럼 명 앞에 distinct 사용
  - select distinct 컬럼명 from 테이블명;

  - 여러개의 컬럼을 복합적으로 생각하여 중복 제외 한 후 가져올수도 있음
  - select distinct 컬럼명, 컬럼명 from 테이블명;
- 별칭
  - select 컬럼명 as "별칭" from 테이블명;
  - as 생략 가능, "" 생략가능, 둘다 생략 가능, 별칭이 예약어거나 띄어쓰기가 있다면 ""생략 불가능

-ASC / DESC - ASC 낮은순 부터 나열 - DESC 높은 순 부터 나열

    -- dual : 오라클에서 제공하는 결과를 눈으로 확인할 때 사용할 수 있는 연습용 테이블

#### 값의 종류

- 숫자 number 10, -5, 1, ...
- 문자(열) varchar2 / char '안녕하세요', 'Ethan', ... (''문자값을 알려주기 위해서 ''안에 넣어서 사용)
- 문자(열) varchar2 / char '안녕하세요', 'Ethan', '10', ... (''문자값을 알려주기 위해서 ''안에 넣어서 사용)
- 날짜 date 년월일시간분초

※ 하나의 컬럼에는 같은 타입의 값만 들어갈 수 있다

#### 연산자

    연결연산자
        a || b --> ab / '안녕' || '반가워' --> 안녕반가워
                    두 값을 연결하여 하나의 값으로 만들어준다.
    산술연산자
        + - * /
        DATE 타입의 값인 경우 + - 사용가능, 일이 계산된다

        -- 산술연산자(문자타입 값(문자타입 값이 있는 컬럼)은 산술연산 불가)
        -- SELECT 'hello' + 10
        -- FROM dual;

        -- 날짜타입의 값은 덧셈 뺄셈만 가능, 기준: 일 수
        SELECT hire_date,
        hire_date + 10, -- 일수가 더해지고
        HIRE_DATE - 10,	-- 일수가 빼진다
        hire_date + 0.5, -- 일을 환선해서 시간 더하기 (12시간)
        hire_date + 30/24/60/60 --시간 분 초는 일로 환산
        FROM EMPLOYEES;

        SELECT salary,
        salary * 10
        FROM EMPLOYEES;

        -- 0으로는 나눗셈 불가능
        --SELECT 10 /0
        --FROM dual;

    관계(비교) 연산자
            a > b   : a가 b보다 큰조건
            a < b   : a가 b보다 작은조건
            a >= b  : a가 b보다 크거나 같은 조건
            a <= b  : a가 b보다 작거나 간은 조건
            a = b   : a가 b랑 같은 조건
            a <> b  : a랑 b랑 다른 조건

    sql연산자
        In (a,b,c, ...)     : a 가 b 혹은 c 혹은 ...인 조건
        a Between b And c   : a 가 b 이상, c이하인 조건
        a Like 패턴         : a가 패턴을 만족하는 조건
            %   : ~로 해석
            _   : 자릿수로 해석

    논리연산자
        a and b     : a 조건도 만족하고 그리고 b조건도 만족하는 조건
        a or b      : a 조건 혹은 b조건 둘중 하나라도 만족하는 조건
        a not b     : a 조건을 만족하지 않는 조건



    -- 행 골라내기

    -- salary가 7000 이상인 행 골라내기
    SELECT FIRST_NAME , LAST_NAME , SALARY
    FROM employees
    WHERE SALARY >= 7000
    ORDER BY SALARY ASC;

    -- 문자는 아스키코드에 해당하는 숫자 값으로 환산하여 적용된다
    SELECT first_name
    FROM EMPLOYEES
    WHERE first_name > 'E'
    ORDER BY first_name ASC;

    -- first_name이 David인 사람
    SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE first_name = 'David' and SALARY >= 7000;

    SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE first_name = 'David' or SALARY >= 7000
    ORDER BY SALARY ASC;

    SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE NOT FIRST_NAME = 'David' ;

    -- SQL 연산자
    SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE first_name IN ('David', 'John', 'Danielle')
    ORDER BY first_name ASC;

    SELECT first_name, last_name, salary
    FROM employees
    WHERE first_name = 'David' OR FIRST_NAME ='John' OR FIRST_NAME = 'Danielle';

    SELECT first_name, last_name, salary
    FROM employees
    WHERE salary IN (6000, 7000, 8000);

    -- salary가 5000이상 10000이하인 행들 뽑기
    SELECT first_name, last_name, salary
    FROM employees
    WHERE SALARY BETWEEN 5000 AND 10000
    ORDER BY SALARY ASC;

    SELECT first_name, last_name, salary
    FROM employees
    WHERE SALARY >= 5000 AND SALARY <=10000;

    -- Like
    -- % : 문자가 없어도 되고, 몇개가 와도 상관없다
    -- _ : 어떤 문자가 와도 되는데 한 자리만
    SELECT first_name
    FROM employees
    WHERE first_name LIKE '%e';

    SELECT first_name
    FROM employees
    WHERE first_name LIKE '%e%';

    SELECT first_name
    FROM employees
    WHERE first_name LIKE '%he%';

    SELECT first_name
    FROM employees
    WHERE first_name LIKE 'D%e';

    SELECT first*name
    FROM employees
    WHERE first_name LIKE '%he*';

    -- 자동으로 salary 또는 '1%' 둘중 하나가 변형되서 출력
    SELECT salary
    FROM employees
    WHERE salary LIKE '1%';
