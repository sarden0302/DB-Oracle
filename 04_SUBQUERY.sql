/*
SUBQUERY (서브쿼리)
- 하나의 SQL문 안에 포함된 또 다른 SQL문
- 메인쿼리(기존쿼리)를 위해 보조 역할을 하는 쿼리문
-- SELECT, FROM, WHERE, HAVING 절에서 사용 가능
    - SELECT (서브쿼리절) FROM 테이블 이름
    - SELECT 컬럼명       FROM (서브쿼리절)
    - SELECT 컬럼명       FROM 테이블 이름  WHERE (서브쿼리절)
    - ...
      HAVING (서브쿼리절)

*/