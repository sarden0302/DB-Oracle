-- 함수 이용한 SELECT 작성

-- 'MySQL' ' ' 'is' 'Awesome!'
-- > 붙여서 출력

SELECT CONCAT('MySQL', ' ', 'is', 'Awesome!')
FROM DUAL;

-- hello.world.program 에서 hello.world 까지만 출력
SELECT CONCAT(SUBSTRING_INDEX('hello.world.program', '.', 1), SUBSTRING('hello.world.program', 12));

-- 전화번호 5689이 들어있는 USER 수
SELECT * FROM USER;
SELECT COUNT(*)
FROM USER
WHERE PHONE LIKE '%5678';

-- PRODUCT
-- CONCAT 이용해서 제품명 : 울트라 게이밍 키보드, 가격 : 89000
USE khtshopping;
SELECT * FROM product;
SELECT CONCAT('제품명 : ', name, ', 가격 : ', price)
FROM product
WHERE product_id = 3;

-- REVIEW 테이블 제품 아이디 3번의 댓글 길이
SELECT * FROM review;
SELECT LENGTH(COMMENT)
FROM review
WHERE product_id = 3;

-- REVIEW 제품아이디 4번에 작성된 댓글에서 좋고 -> 훌륭하고 바꿔서 출력
SELECT REPLACE(comment, '좋고', '훌륭하고')
FROM review
WHERE product_id = 4;