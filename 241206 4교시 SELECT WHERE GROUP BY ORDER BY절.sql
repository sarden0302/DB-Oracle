-- EMPLOYEE 테이블에서 부서코드, 부서(그룹) 별 급여 합계 조회
-- /* 어떤 그룹을 묶어서 조회할 것인지 GROUP BY로 묶음 */
SELECT dept_code, SUM(salary), AVG(salary)
FROM EMPLOYEE
GROUP BY dept_code
ORDER BY dept_code;

-- EMPLOYEE 테이블에서 부서코드, 부서 별 급여의 합계, 부서 별 급여의 평균(정수처리), 인원수 조회, 부서코드 오름차순
SELECT e.dept_code, SUM(e.SALARY), FLOOR(AVG(e.salary)), COUNT(*) AS 사원수
FROM EMPLOYEE e
GROUP BY DEPT_CODE
ORDER BY dept_code;

-- EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수 && 부서코드 오름차순
SELECT e.DEPT_CODE, COUNT(e.BONUS)
FROM EMPLOYEE e
GROUP BY e.DEPT_CODE
ORDER BY dept_code;

-- EMPLOYEE 부서코드, 부서별 보너스 받는 사원의 수 && 부서코드 오름차순 정렬 null 뺴고
SELECT e.DEPT_CODE, COUNT(e.BONUS)
FROM EMPLOYEE e
WHERE dept_code IS NOT null
GROUP BY e.DEPT_CODE
ORDER BY dept_code;

SELECT *
FROM DEPARTMENT;

SELECT *
FROM EMPLOYEE;

