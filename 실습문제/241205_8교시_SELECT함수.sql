-- 평균 급여 조회
SELECT CEIL(AVG(salary))
FROM employee;

-- 부서 코드가 'D5'인 사원의 수 
SELECT COUNT(EMP_NAME)
FROM EMPLOYEE E
WHERE DEPT_CODE = 'D5';

-- 전화번호가 있는 사원의 수
SELECT COUNT(EMP_NAME)
FROM EMPLOYEE E
WHERE phone IS NOT NULL;

-- 전화번호가 없는 사원의 수 
SELECT COUNT(*)
FROM EMPLOYEE E
WHERE PHONE IS NULL;

-- 존재하는 부서코드의 수를 조회
SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE E;

-- 부서명이 '영업'으로 끝나는 부서 조회
SELECT *
FROM DEPARTMENT
WHERE dept_title LIKE '%영업%';

-- 이름이 대문자로 표시된 직원 조회 
SELECT *
FROM EMPLOYEE E
WHERE E.EMP_NAME = UPPER(EMP_NAME);

-- 이름이 '송'으로 시작하는 직원 조회
SELECT *
FROM EMPLOYEE E
WHERE EMP_NAME LIKE '송%';

-- 급여가 200만 원 이하인 직원의 이름과 급여 조회
SELECT emp_name, salary
FROM EMPLOYEE E
WHERE salary <= 2000000;

-- 'Y'로 퇴사 여부가 표시된 직원의 평균 급여 조회
SELECT AVG(salary)
FROM EMPLOYEE E
WHERE ENT_YN = 'Y';

-- . '영업'으로 끝나는 부서에 속한 직원 수 조회
SELECT COUNT(*)
FROM DEPARTMENT 
WHERE dept_title LIKE '%영업';

SELECT *
FROM EMPLOYEE E;

-- 각 부서별 직원 수 조회
SELECT dept_code, count(*)
FROM EMPLOYEE
GROUP BY dept_code;

-- 급여등급이 'S5' 이상인 직원 이름과 급여 조회
SELECT emp_name, salary, SAL_LEVEL
FROM EMPLOYEE E
WHERE SAL_LEVEL >= 'S5';

-- 전화번호가 '010'으로 시작하지 않는 직원 조회
SELECT *
FROM EMPLOYEE E
WHERE phone NOT LIKE '010%';

SELECT *
FROM EMPLOYEE E;

-- 각 부서별 평균 급여 조회
SELECT dept_code, AVG(salary)
FROM EMPLOYEE E
GROUP BY dept_code;

-- 'N'으로 표시된 퇴사 여부 직원 수 조회
SELECT count(*)
FROM EMPLOYEE E
WHERE ent_yn = 'N';

-- 급여가 300만 원 이상인 직원 이름과 급여 조회
SELECT emp_name, salary
FROM EMPLOYEE E
WHERE SALARY >= 3000000;

SELECT *
FROM job;
-- 테이블: JOB
-- 직급명이 소문자로 표시된 데이터 조회
SELECT job_name
FROM job 
WHERE job_name = LOWER(JOB_NAME);
