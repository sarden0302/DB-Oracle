/*
asterisk (*) : 모든, 포함하다 (All)
*/

/*
컬럼 값 산술 연산
-- 컬럼 값 : 행과 열이 교차되는 테이블의 한 칸에 작성된 값
-- select 문 작성 시 컬럼명에 산술 연산을 직접 작성하면 조회결과에 연산결과가
   반영되어 조회된다.
*/
SELECT
    *
FROM
    department;

SELECT
    dept_id
FROM
    department;

SELECT
    *
FROM
    national;

SELECT
    emp_id,
    emp_name,
    salary
FROM
    employee;

SELECT
    emp_name,
    hire_date
FROM
    employee;

SELECT
    dept_id,
    dept_title
FROM
    department;

SELECT
    emp_id,
    emp_name,
    salary * 12
FROM
    employee;

SELECT
    emp_id,
    emp_name,
    salary,
    salary * 12
FROM
    employee; 

-- salary * 12에 별칭을 붙여서 연봉이라 표기하기
/* AS(Alias) : 별칭 */
SELECT
    emp_id,
    emp_name,
    salary,
    salary * 12 AS 연봉
FROM
    employee; 

-- employee 테이블에서 EMP_ID AS 직원아이디, EMP_NAME AS 직원이름, SALARY AS 월급
SELECT
    emp_id   AS 직원아이디,
    emp_name AS 직원이름,
    salary   AS 월급
FROM
    employee;

/* SYSDATE SYSTIMESTAMP 현재 시간 */
-- SYSDATE      : 현재시간 (년, 월, 일, 시, 분, 초)
-- SYSTIMESTAMP : 현재시간 (년, 월, 일, 시, 분, 초, ms + 지역(local) 

/* DUAL (Dummy Table) : 가짜 테이블 */
-- 기능이나 단순 데이트 조회를 위해 SQL에서 제공하는 존재하지 않는 가짜 테이블
SELECT SYSDATE FROM DUAL;      -- 24/12/04
SELECT SYSTIMESTAMP FROM DUAL; -- 24/12/04 14:28:53.661000000 +09:00

/* 날짜 데이터 연산하기 (+, - 만 가능) */
--> +1 == 1일 추가
--> -1 == 1일 감소
SELECT (SYSDATE-1) AS 어제시간, SYSDATE AS 현재시간, (SYSDATE + 1) AS 내일 FROM DUAL;

/* 현재시간      1시간 후             1분 후             10초 후 */
-- SYSDATE  SYSDATE + 1/24 + SYSDATE + 1/24/60 SYSDATE + 1/24/60/60*10

/* TO_DATE('문자열', '패턴') */
-- 문자열을 패턴 형태로 해석해서 DATE 타입으로 변경하는 함수
SELECT '2024-12-04', TO_DATE('2024-12-04', 'YYYY-MM-DD') FROM DUAL; 

-- EMPLOYEE 에서 모든 사원의 이름, 입사일 근무 일수 (SYSDATE - 입사일)
SELECT EMP_NAME AS 사원이름, HIRE_DATE, SYSDATE - HIRE_DATE AS 근무일수 FROM EMPLOYEE;

/* SELECT 특정 기준에 부합한 컬럼 조회 
     SELECT  컬럼명
     FROM    테이블명
     WHERE   조건작성;
     
     WHERE에서 존재 유무 확인
     IS NOT NULL = 빈 값이 아닌 값
*/

-- 퇴사여부가 Y인 사원의 이름과 퇴시일 조회
SELECT EMP_NAME, ENT_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'Y';

-- 보너스가 있는 사원의 이름과 보너스 금액 조회
SELECT EMP_NAME, BONUS 
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- 급여가 300만원 이상인 사원의 이름과 급여를 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- DEPARTMENT 테이블에서 LOCATION_ID가 'Li' 지역에 위치한 모든 정보 조회
SELECT *
FROM DEPARTMENT
WHERE LOCATION_ID = 'L1';

-- EMPLOYEE 에서 이메일 주소가 없는 사원의 이름
SELECT EMP_ID FROM EMPLOYEE WHERE EMAIL is null;

-- EMPLOYEE 에서 관리자가 없는 사원의 정보
SELECT * FROM EMPLOYEE WHERE MANAGER_ID IS NULL;

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 사원의 이름, 입사일, 근무일수(현재 시간 - 입사일) 조회
-- FLOOR  : 소수점 아래 모두 내림
-- CELL  : 소수점 아래 모두 올림
-- ROUND : 소수점 아래 모두 반올림
SELECT EMP_NAME, HIRE_DATE, FLOOR(SYSDATE - HIRE_DATE) AS 근무일수
FROM EMPLOYEE;


-- EMPLOYEE 테이블에서 부서 코드가 D9 부서가 아닌 사원들만 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

-- EMPLOYEE 테이블에서 연봉이 5000만원 이하인 사원의 사번, 이름, 연봉 조회
SELECT EMP_ID, EMP_NAME, SALARY * 12 AS 연봉
FROM EMPLOYEE
WHERE 연봉 <= 50000000;

-- EMPLOYEE 테이블에서 부서코드가 D6이 아닌 사원의 이름 부서코드 전화번호 조회
SELECT EMP_NAME, DEPT_CODE, PHONE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D6';

-- EMPLOYEE 테이블에서 부서코드가 D1, D3이 아닌 사원의 이름 부서코드 조회
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D3' AND DEPT_CODE != 'D1';

/*
WHERE 절에서 특정 값의 기준을 설정할 때 특정 값의 범위나 조건을 설정

AND         : &&
OR          : ||

IN  ()      : 조건에 여러 값을 지정할 때 사용 값의 목록 중 하나와 일치하는 행을 선택
              OR의 간결한 표현 방법
NOT IN  ()  : IN과 반대로, 조건에서 지정한 목록에 포함되지 않는 값만 선택
              값의 목록과 일치하지 않는 행만 선택
*/
-- EMPLOYEE 테이블에서 부서코드가 D1, D3가 아닌 사원 조회
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN('D1', 'D3');

-- D5 부서에 속한 사원의 사원번호 사원이름 부서코드 조회
SELECT emp_id, emp_name, dept_code
FROM employee
WHERE dept_code = 'D5';

-- 입사일이 2000년 이후인 지원들의 정보 조회 
SELECT *
FROM employee
WHERE hire_date >= TO_DATE('2000-01-01', 'YYYY-MM-DD');

-- 퇴직여부가 'Y'이고, 퇴사일이 2015년 이후인 지원들의 정보
SELECT *
FROM employee
WHERE ENT_YN = 'Y' AND ENT_DATE >= TO_DATE('2015-01-01', 'YYYY-MM-DD');

-- employee 테이블에서 성씨가 '전'씨인 사원의 이름
SELECT emp_name
FROM employee
WHERE emp_name LIKE '전%';

-- employee 테이블에서 이름이 수로 끝나는 사원의 이름 조회
SELECT emp_name
FROM employee
WHERE emp_name LIKE '%수';



SELECT * 
FROM DEPARTMENT D RIGHT OUTER JOIN EMPLOYEE E ON D.DEPT_ID = E.DEPT_CODE
ORDER BY DEPT_ID;

SELECT * FROM JOB;



