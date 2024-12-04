-- 1. EMPLOYEE 테이블에서 모든 데이터를 조회하세요.
SELECT *
FROM employee;

-- 2. DEPARTMENT 테이블에서 DEPT_TITLE과 LOCATION_ID를 조회하세요.
SELECT dept_title, location_id
from DEPARTMENT;

-- 3. EMPLOYEE 테이블에서 SALARY가 3,000,000 이상인 직원들의 EMP_NAME과 SALARY를 조회하세요.
SELECT emp_name, salary
FROM employee
WHERE salary >= 3000000;

-- 4. DEPARTMENT 테이블에서 LOCATION_ID가 'L1'인 부서를 조회하세요.
SELECT dept_title
FROM department
WHERE location_id = 'L1';

-- 5. EMPLOYEE 테이블에서 BONUS가 NULL인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE bonus IS NULL;

-- 6. EMPLOYEE 테이블에서 SALARY가 2,500,000 이상이고 BONUS가 0.2 이상인 직원의 EMP_NAME을 조회하세요.
SELECT EMP_NAME
FROM employee
WHERE salary >= 2500000 AND bonus > 0.2;

-- 7. EMPLOYEE 테이블에서 JOB_CODE가 'J6'이거나 'J7'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE job_code IN('J6', 'J7');

-- 8. DEPARTMENT 테이블에서 DEPT_TITLE에 '영업'이라는 단어가 포함된 부서를 조회하세요.
SELECT *
FROM department
WHERE dept_title LIKE '%영업%';

-- 9. EMPLOYEE 테이블에서 입사일(HIRE_DATE)이 2000년 이후인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE hire_date >= TO_DATE('2000-01-01', 'YYYY-MM-DD'); 

-- 10. EMPLOYEE 테이블에서 퇴직 여부가 'Y'이고 퇴사일이 2015년 이후인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE ent_yn = 'Y' AND ent_date >= TO_DATE('2015-01-01', 'YYYY-MM-DD');

-- 11. EMPLOYEE 테이블에서 EMP_NAME의 첫 글자가 '김'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE emp_name LIKE '김%';

-- 12. EMPLOYEE 테이블에서 JOB_CODE가 'J1', 'J2', 'J3'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE job_code IN('J1', 'J2', 'J3');

-- 13. EMPLOYEE 테이블에서 특정 DEPT_CODE('D1', 'D5', 'D9')를 제외한 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE dept_code NOT IN('D1', 'D5', 'D9');

-- 14. EMPLOYEE 테이블에서 MANAGER_ID가 NULL인 직원들의 EMP_NAME과 DEPT_CODE를 조회하세요.
SELECT emp_name, dept_code
FROM employee
WHERE manager_id IS NULL;

-- 15. EMPLOYEE 테이블에서 EMP_NAME에 '김'이 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE emp_name LIKE '%김%';

-- 16. EMPLOYEE 테이블에서 EMAIL 주소에 'gmail'이 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE email LIKE '%gmail';

-- 17. EMPLOYEE 테이블에서 PHONE 번호가 '010'으로 시작하는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE phone LIKE '010%';

-- 18. EMPLOYEE 테이블에서 PHONE 번호가 '1234'로 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE phone LIKE '%1234';

-- 19. DEPARTMENT 테이블에서 DEPT_TITLE이 '영업'으로 끝나는 부서를 조회하세요.
SELECT dept_title
FROM department
WHERE dept_title LIKE '%영업';

-- 20. DEPARTMENT 테이블에서 DEPT_TITLE에 '관리'라는 단어가 포함된 부서를 조회하세요.
SELECT dept_title
FROM department
WHERE dept_title LIKE '%관리%';

-- 21. EMPLOYEE 테이블에서 EMP_NAME이 '이'로 시작하는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE emp_name LIKE '이%';

-- 22. EMPLOYEE 테이블에서 JOB_CODE가 'J'로 시작하고 두 번째 문자가 '1'인 직원을 조회하세요.
SELECT *
FROM employee
WHERE job_code LIKE 'J1%';

-- 23. EMPLOYEE 테이블에서 EMAIL이 'com'으로 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE email LIKE '%com';

-- 24. EMPLOYEE 테이블에서 HIRE_DATE의 연도가 2021년인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE hire_date LIKE '21%';

-- 25. EMPLOYEE 테이블에서 EMP_NAME의 마지막 글자가 '호'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE emp_name LIKE '%호';

-- 26. EMPLOYEE 테이블에서 EMAIL에 'company'라는 단어가 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE email LIKE '%company%';

-- 27. EMPLOYEE 테이블에서 EMP_NAME에 '수'로 시작하거나 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE emp_name LIKE '수%' OR emp_name LIKE '%수';
