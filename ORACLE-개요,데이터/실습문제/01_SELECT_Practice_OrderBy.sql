SELECT * FROM employee;

SELECT emp_name, salary * 12 AS 연봉 
FROM employee
ORDER BY 연봉 ASC;

SELECT emp_name
FROM EMPLOYEE 
ORDER BY emp_name desc;

-- EMPLOYEE 테이블에서 사원들의 급여를 오름차순으로 정렬
SELECT emp_id, emp_name, salary
FROM EMPLOYEE E
ORDER BY salary /*ASC*/;

-- EMPLOYEE 테이블에서 사원들의 입사일을 내림차순 정렬
SELECT emp_id, emp_name, hire_date
FROM EMPLOYEE E
ORDER BY hire_date DESC;
 
-- DEPARTMENT 테이블의 부서명을 오름차순 출력
SELECT dept_id, dept_title
FROM DEPARTMENT D
ORDER BY dept_title;

-- EMPLOYEE 테이블에서 부서코드가 없는 사원들의 이름을 내림차순 정렬
SELECT emp_id, emp_name, dept_code
FROM EMPLOYEE E
WHERE dept_code IS NULL
ORDER BY emp_name DESC;


-- 5. 급여가 employee 테이블에서 3000000원 이상인 사원들의 급여 등급(sal_level) 내림차순 정렬 
-- SELECT emp_id, emp_name, sal_level
SELECT emp_id, emp_name, sal_level, salary
FROM EMPLOYEE E
WHERE salary >= 3000000
ORDER BY sal_level desc;

-- EMPLOYEE 테이블에서 오름차순 + NULLS FIRST (NULL 값을 제일 위)
SELECT emp_name, phone
FROM EMPLOYEE 
ORDER BY phone NULLS FIRST;

-- EMPLOYEE 테이블에서 내름차순 + NULLS LAST (NULL 값을 제일 아래)
SELECT emp_name, phone
FROM EMPLOYEE 
ORDER BY phone /* NULLS LAST */;

-- EMPLOYEE 테이블에서 내림차순 + NULLS FIRST 
-- SELECT emp_name, phone
SELECT emp_name, phone
FROM EMPLOYEE E
ORDER BY phone DESC NULLS FIRST;

SELECT EMP_NAME, phone
FROM EMPLOYEE E;

SELECT *
FROM employee
WHERE job_code IN('J6', 'J7');

