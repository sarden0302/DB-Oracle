USE khtuser;

-- COALLESE 
-- 컬럼에 NULL 값이 존재할 경우 NULL을 0으로 대체해서 합계 계산
USE khtcafe;

SELECT coalesce(stock, 0)
FROM SNACK;

-- > coalesce 이용해서 stock 합을 조회 
SELECT SUM(coalesce(stock, 0))
FROM snack;

SELECT SUM(coalesce(quantity, 5))
FROM snack_order;

SELECT category, sum(coalesce(stock, 0))
FROM snack
group by category;

select status, sum(coalesce(quantity, 0))
from snack_order
GROUP BY status;

select * FROM snack_order;

CREATE OR REPLACE VIEW view_status_null AS (
SELECT status, coalesce(status, '없음'), sum(coalesce(quantity, 0))
FROM snack_order
GROUP BY status);

SELECT * FROM view_status_null;

-- ORACLE 에선 COALESCE 대신 NVL NULL 통해 특정 값으로 대체
USE khtshopping;

SELECT * FROM product;

SELECT *
FROM product
WHERE name like '한_________';

USE khtuser;

SELECT * FROM user;

-- @앞에 글자 9글자인 username 조회
SELECT * FROM user
WHERE email like '_________@%';


