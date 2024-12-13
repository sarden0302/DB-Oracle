SELECT *
FROM employee;

SELECT *
FROM DEPARTMENT;

-- 1. 문제: 사원명이 노옹철인 사원이 속한 부서명을 조회하세요.
SELECT *
FROM department D RIGHT OUTER JOIN employee E
ON D.DEPT_ID = E.DEPT_CODE
WHERE D.DEPT_ID = (
	SELECT ES.DEPT_code
	FROM employee ES
	WHERE ES.emp_name = '노옹철'
);

-- 2. 문제: J2 직급의 평균 급여보다 높은 급여를 받는 사원의 이름과 급여를 조회하세요.
SELECT EM.emp_name, EM.salary
FROM EMPLOYEE EM
WHERE EM.salary > (
	SELECT AVG(ES.SALARY)
	FROM EMPLOYEE ES
	WHERE ES.job_code = 'J2'
	
);

-- 3. 문제: 지역코드 L1에 속한 부서에서 근무하는 사원의 이름을 조회하세요.
SELECT E.emp_name, D.DEPT_ID, D.LOCATION_ID
FROM EMPLOYEE E LEFT OUTER JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
WHERE D.LOCATION_ID IN 'L1';

-- 4. 문제: 관리자를 가지고 있는 사원의 이름과 관리자 이름을 조회하세요.
SELECT emp_name, (
				SELECT emp_name 
				FROM employee ES
				WHERE E.manager_id = ES.emp_id 
) AS manager_name
FROM EMPLOYEE E
WHERE manager_id IS NOT NULL;

-- 5. 문제: 부서 코드가 D5인 부서에서 가장 높은 급여를 받는 사원의 이름과 급여를 조회하세요.
SELECT EM.emp_name, EM.salary
FROM employee EM
WHERE EM.SALARY = (
	SELECT MAX(ES.SALARY)
	FROM employee ES
	WHERE dept_code = 'D5'
);

-- 6. 문제: 퇴사 여부가 N인 사원 중 가장 적은 급여를 받는 사원의 이름과 급여를 조회하세요
SELECT emp_name, salary
FROM EMPLOYEE
WHERE salary = (
	SELECT MIN(salary)
	FROM employee
	WHERE ENT_YN = 'N'
);

-- 7. 문제: 부서 코드가 D8인 부서에서 입사일이 가장 빠른 사원의 이름과 입사일을 조회하세요.
SELECT emp_name, hire_date
FROM EMPLOYEE
WHERE hire_date = (
	SELECT MIN(hire_date)
	FROM EMPLOYEE
	WHERE dept_code = 'D8'
);

-- 8. 문제: 전 사원의 최대 급여와 최소 급여를 조회하세요.
SELECT (
	SELECT MAX(E1.salary)
	FROM employee E1) AS MAX_SALARY
	, (
	SELECT MIN(E2.salary)
	FROM employee E2) AS MIN_SALARY
FROM DUAL;
/**
 * SELECT MAX(E1.salary) FROM employee E1) AS MAX_SALARY : 가장 높은 급여
 * SELECT MIN(E2.salary) FROM employee E2) : 가장 낮은 급여
 * 
 * DUAL = 가상 테이블 DUmmy tAbLe
 * 		※ Oracle에만 있음
 * 		- 다른 SQL(MySQL || PostgresSQL) 에서는 FROM 테이블 생략 가능
 * 
 * ex) 현재시간 표현 쿼리
 * ORACLE  : SELECT SYSDATE FROM DUAL:
 * 이외 SQL : SELECT SYSDATE;
 */

