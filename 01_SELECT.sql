/* AS(AliaS) : 별칭 */

/* SYSDATE SYSTIMESTAMP 현재 시간 */
-- SYSDATE      : 현재시간 (년, 월, 일, 시, 분, 초)
-- SYSTIMESTAMP : 현재시간 (년, 월, 일, 시, 분, 초, ms + 지역(local) 

/* DUAL (Dummy Table) : 가짜 테이블 */
-- 기능이나 단순 데이트 조회를 위해 SQL에서 제공하는 존재하지 않는 가짜 테이블

/* 현재시간      1시간 후             1분 후             10초 후 */
-- SYSDATE  SYSDATE + 1/24 + SYSDATE + 1/24/60 SYSDATE + 1/24/60/60*10

/* TO_DATE('문자열', '패턴') */
-- 문자열을 패턴 형태로 해석해서 DATE 타입으로 변경하는 함수

/* SELECT 특정 기준에 부합한 컬럼 조회 
     SELECT  컬럼명
     FROM    테이블명
     WHERE   조건작성;
     
     WHERE에서 존재 유무 확인
     IS NOT NULL = 빈 값이 아닌 값
*/

/*********************** WHERE 절 ********************/
/*
-- 테이블에서 조건을 충족하는 행을 조회할 때 사용
-- where 절에는 조건식(true / false) 만 작성

-- 비교 연산자 : >, <, >=, <=, =(같다), !=, <>(같지 않다.)
   논리 연산자 : AND, OR, NOT
   컬럼 존재 여부 : 컬럼명 IS NULL  /  컬럼명 IS NOT NULL
   컬럼명 IN (값1, 값2, 값3, ...) : 컬럼의 값이 (OR) 안에 작성된 값과 일치하면 true;
   컬럼명 NOT IN (값1, 값2, 값3, ...) : 컬럼의 값이 (AND) 안에 작성된 값과 일치하면 false;
*/

/***** LIKE *****
비교하려는 값이 특정한 패턴을 만족 시키면 true

[작성법]
WHERE 컬럼명 LIKE '패턴';

'%' : 포함하다
   - %A  : A라는 문자로 끝나는 문자열 찾기
   - A%  : A라는 문자로 시작하는 문자열 찾기
   - %A% : A라는 문자로 포함되는 문자열 찾기
*/

/*
WHERE 절에서 특정 값의 기준을 설정할 때 특정 값의 범위나 조건을 설정

AND         : &&
OR          : ||

IN  ()      : 조건에 여러 값을 지정할 때 사용 값의 목록 중 하나와 일치하는 행을 선택
              OR의 간결한 표현 방법
NOT IN  ()  : IN과 반대로, 조건에서 지정한 목록에 포함되지 않는 값만 선택
              값의 목록과 일치하지 않는 행만 선택
*/

/***** ORDER BY *****/
/*
: SELECT 문의 조회 결과를 정렬할 때 사용하는 구문
SELECT 구문에서 제일 마지막에 해석

[작성법]

3. SELECT 컬럼명 AS 별칭, 컬럼명, 컬럼명, ...
1. FROM 테이블명
2. WHERE 
...
Last. ORDER BY 컬럼명 | 별칭 | 컬럼순서(ASC/ DESC)

ORDER BY ASC (ascending)
         DESC (descending)
   - Default : ASC
   - NULLS FIRST : null 인 순서부터 맨 위 
   - NULLS LAST  : null 인 순서를 맨 아래 (Default)
   
     ※ ORDER BY 맨 뒤에 작성

장점 : 자바, 자바스크립트 그 외 언어 중 정렬이 가장 빠르다.

*/