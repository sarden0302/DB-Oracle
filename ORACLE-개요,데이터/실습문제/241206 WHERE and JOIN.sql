SELECT *
FROM employee;
-- 1. EMPLOYEE 테이블에서 부서코드가 'D5', 'D6'인 부서의 평균 급여 조회
-- UPPER 함수는 문자열 하나 변환 UPPER( , ) 불가능
SELECT dept_code, FLOOR(AVG(e.SALARY)) AS 평균_급여
FROM employee e
WHERE UPPER(dept_code) IN ('D5', 'D6')
GROUP BY e.DEPT_CODE;

-- 2. EMPLOYEE 테이블에서 직급 별 2000년도 이후 입사자들의 급여 합을 조회
---- WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000
-- EXTRACT(YEAR ...) : 년도만 가져오기
SELECT job_code, SUM(e.SALARY)
FROM employee e
WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000
GROUP BY JOB_CODE;

-- 3. EMPLOYEE 테이블에서 부서 별로 같은 직급인 사원의 급여 합계를 조회하고
-- 부서 코드 오름차순으로 정렬
/* SUM이나 AVG 같이 특정 함수로 계산한 결과를 나타낼 때는 조회하고자 하는 컬럼명을 작성해줄 경우
 GROUP BY 절에 작성한 컬럼을 SELECT에 작성해 구분해야한다.
*/
SELECT dept_code, job_code, SUM(SALARY)
FROM employee 
GROUP BY job_code, dept_code
ORDER BY dept_code, job_code;

-- 4. EMPLOYEE 테이블에서 부서 별로 급여 등급이 같은 직원의 수를 조회하고
-- 부서코드, 급여 등급 오름차순으로 정렬
SELECT dept_code, SAL_LEVEL, SUM(salary)
FROM employee
WHERE dept_code IS NOT null
GROUP BY dept_code, SAL_LEVEL
ORDER BY dept_code, sal_level;

-- 5. EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고
---- 부서코드 오름차순 정렬
SELECT dept_code, count(*)
FROM EMPLOYEE
WHERE bonus IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY dept_code;

-- 6. EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고
---- 부서코드 오름차순 정렬 null 인 행 빼고 카운트
SELECT dept_code, COUNT(BONUS)
FROM EMPLOYEE
WHERE bonus IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY dept_code ;

-- EMPLOYEE 테이블과 DEPARTMENT 테이블에서 부서코드 조회하기
SELECT *
FROM DEPARTMENT d INNER JOIN EMPLOYEE e ON e.DEPT_CODE = d.DEPT_ID;

SELECT e.emp_id, e.emp_name, e.dept_code, d.dept_title
FROM employee e, department d
WHERE e.DEPT_CODE = d.DEPT_ID; --Oracle에서 실행 불가

SELECT e.emp_id, e.emp_name, e.dept_code, d.dept_title
FROM employee e INNER JOIN  department d ON e.DEPT_CODE = d.DEPT_ID; 

SELECT e.EMP_id, e.EMP_NAME, j.JOB_CODE, j.JOB_NAME
FROM employee e, job j
WHERE e.JOB_CODE = j.JOB_CODE;

SELECT e.emp_id, e.emp_name, e.dept_code, d.dept_title
FROM employee e LEFT OUTER JOIN  department d ON e.DEPT_CODE = d.DEPT_ID;

SELECT d.DEPT_ID, d.DEPT_TITLE, d.LOCATION_ID, l.LOCAL_NAME
FROM department d, location l
WHERE d.LOCATION_ID = l.LOCAL_CODE;

-- DEPARTMENT 테이블과 LOCATION 테이블 NATIONAL 테이블을 이용해서
-- d.dept_id, d.dept_title, d.location_id, l.national_code, n.national_name
SELECT d.DEPT_ID, d.DEPT_TITLE, d.LOCATION_ID, l.NATIONAL_CODE, n.NATIONAL_NAME
FROM DEPARTMENT d, LOCATION l, NATIONAL n
WHERE d.location_id = l.LOCAL_CODE AND l.NATIONAL_CODE = n.NATIONAL_CODE;

SELECT d.DEPT_ID, d.DEPT_TITLE, d.LOCATION_ID, l.NATIONAL_CODE, n.NATIONAL_NAME
FROM location l 
inner JOIN department d ON d.LOCATION_ID = l.LOCAL_CODE
inner JOIN NATIONAL n ON l.NATIONAL_CODE = n.NATIONAL_CODE;

-- 1. EMPLOYEE 테이블에서 각 부서에 속한 사원들의 평균 급여
-- 평균 급여 컬럼명은 [평균 급여] 표기
-- dept_code
SELECT e.dept_code, FLOOR(AVG(e.SALARY)) AS "평균 급여"
FROM EMPLOYEE e
GROUP BY e.dept_code
ORDER BY e.dept_code;

-- 2. EMPLOYEE 테이블에서 각 직급마다 급여가 가장 높은 사원의 이름과 급여 MAX(SALARY)
-- GROUP BY && ORDER BY
SELECT max(salary) AS "가장 높은 급여", JOB_CODE, emp_name
FROM employee e
GROUP BY job_code, emp_name
ORDER BY job_code, MAX(salary) desc;


-- 3. EMPLOYEE 테이블에서 부서별로 입사한 직원들의 평균 급여
-- GROUP BY 
SELECT FLOOR(AVG(salary)), DEPT_CODE
FROM EMPLOYEE
GROUP BY dept_code
ORDER BY MAX(salary) desc;

-- 4. 부서이름이 인사관리부인 직원의 이름 출력
SELECT emp_name
FROM EMPLOYEE e, department d
WHERE d.DEPT_ID = e.DEPT_CODE
AND d.DEPT_TITLE = '인사관리부';
