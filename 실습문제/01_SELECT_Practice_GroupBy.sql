-- 1. 이메일 주소가 등록된 직원의 이름과 부서명을 출력하시오.
SELECT EMP_name, DEPT_CODE
FROM employee
WHERE email IS NOT NULL;

-- !join으로 인해 dept_title이 null 값은 사라지고 출력 
/*SELECT e.emp_name, d.dept_title
FROM employee e,
INNER JOIN department d
ON e.dept_code = d.DEPT_ID
WHERE e.email IS NOT NULL;*/

-- 2-1. 각 부서의 최고 급여 순서로 출력하시오.(최고 급여 순)
SELECT emp_name, DEPT_CODE, max(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, emp_name
ORDER BY dept_code, max(SALARY) DESC;

-- 2-2. 각 부서의 최고 급여만 출력하시오.
-- 서브쿼리
SELECT emp_name, DEPT_CODE, salary
FROM EMPLOYEE
WHERE (DEPT_CODE, salary) IN (
		SELECT dept_code, MAX(salary)
		FROM EMPLOYEE
		GROUP BY dept_code
	)
ORDER BY dept_code;

SELECT emp_name, DEPT_CODE, salary
FROM EMPLOYEE
ORDER BY dept_code;

-- 3. 각 급여 등급별 직원 수를 출력하시오.
SELECT sal_level, COUNT(EMP_NAME) AS "직원 수"
FROM EMPLOYEE
GROUP BY sal_level;


-- 4. 부서 이름과 평균 급여를 급여가 높은 순으로 정렬 출력하시오.
SELECT e.DEPT_CODE, d.dept_title, FLOOR(AVG(e.salary)) AS "평균 급여"
FROM EMPLOYEE e, DEPARTMENT d
WHERE e.DEPT_CODE = d.DEPT_ID
GROUP BY e.dept_code, d.dept_title
ORDER BY FLOOR(AVG(e.salary)) desc;


-- 5. 지역별 부서 수를 출력하시오.
SELECT location_id, count(DISTINCT dept_id)
FROM department
GROUP BY LOCATION_ID;

-- 6. 각 부서(DEPT_CODE)별 보너스 비율(BONUS)의 평균을 구하되, 평균 보너스 비율이 높은 순으로 정렬
SELECT dept_code, AVG(bonus)
FROM employee
GROUP BY DEPT_CODE;

/*SELECT d.DEPT_title, e.dept_code, AVG(e.salary), avg(e.bonus)
FROM employee e, DEPARTMENT d
WHERE e.dept_code = d.dept_id
GROUP BY e.DEPT_CODE
ORDER BY e.dept_code;
*/

-- 7.각 부서(DEPT_CODE)별 평균 급여(SALARY)와 평균 보너스 비율(BONUS)을 조회하되, 부서명(DEPT_TITLE)을 기준으로 오름차순 정렬
SELECT dept_code, FLOOR(AVG(salary)), AVG(bonus)
FROM employee
GROUP BY dept_code 
ORDER BY dept_code;

SELECT d.DEPT_title, AVG(e.salary), avg(e.bonus)
FROM employee e, DEPARTMENT d
WHERE e.dept_code = d.dept_id
GROUP BY d.DEPT_title
ORDER BY d.dept_title;


-- 8. 각 부서별 퇴사자 수를 조회하고, 퇴사자 수가 많은 순으로 정렬
SELECT dept_code, COUNT(CASE WHEN ent_yn = 'Y' THEN 1 end)
FROM employee
GROUP BY DEPT_CODE
ORDER BY count(CASE WHEN ent_yn = 'Y' THEN 1 end) DESC, DEPT_CODE;




