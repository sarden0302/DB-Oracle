-- 함수 이용한 SELECT 작성

-- 'MySQL' ' ' 'is' 'Awesome!'
-- > 붙여서 출력

SELECT CONCAT('MySQL', ' ', 'is', 'Awesome!')
FROM DUAL;

-- hello.world.program 에서 hello.world 까지만 출력
SELECT CONCAT(SUBSTRING_INDEX('hello.world.program', '.', 1), SUBSTRING('hello.world.program', 12));

-- 전화번호 5689이 들어있는 USER 수
USE khtuser;
SELECT * FROM USER;
SELECT COUNT(*)
FROM USER
WHERE PHONE LIKE '%5678%';

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
-- > 총 길이 66bytes cuz 한글은 할 글자 당 크기 = 3, 나머지 = 1

SELECT CHAR_LENGTH(COMMENT)
FROM review
WHERE product_id = 3;
-- > 총 길이 26length BYTE 아니라 총 문자열의 길이

-- REVIEW 제품아이디 4번에 작성된 댓글에서 좋고 -> 훌륭하고 바꿔서 출력
SELECT REPLACE(comment, '좋고', '훌륭하고')
FROM review
WHERE product_id = 4;
-- REPLACE 사용 방식은 JS, JAVA, SQL 동일

SELECt * FROM `order`;
SELECT * FROM order_item;
SELECT * FROM product;
SELECT * FROM review;

-- `ORDER` 테이블 ORDER_ITEM 테이블 JOIN

SELECT O.order_id, O.user_id, O.status, O.total_amount, OI.product_id, OI.quantity, OI.price
FROM `ORDER` O
JOIN ORDER_ITEM OI 
ON O.order_id= OI.order_id;

SELECT O.order_id, O.user_id, O.status, O.total_amount, 
		OI.product_id, OI.quantity, OI.price,
		P.name
FROM `ORDER` O
JOIN ORDER_ITEM OI ON O.order_id = OI.order_id
JOIN product P ON P.product_id = OI.product_id;

-- PRODUCT 테이블과 REVIEW 테이블 INNER JOIN
SELECT P.product_id, P.name, R.user_id, R.rating, R.comment
FROM product P 
INNER JOIN review R ON P.product_id = R.product_id;

-- LEFT JOIN 사용 ORDER REVIEW 테이블 연결해서 모든 주문이 포함되도록 하되,
-- REVIEW가 없는 주문은 NULL로 표시되게 처리

SELECT O.order_id, O.user_id, O.status, R.product_id, R.rating, R.`COMMENT`
FROM `ORDER` O
LEFT OUTER JOIN review R on O.user_id = R.user_id;

-- REVIEW 테이블과 ORDER 테이블을 RIGHT JOIN으로 연결해서 모든 리뷰가 포함되도록 하고,
-- 주문 정보가 없는 경우는 NULL 표기되게 하기
SELECT R.product_id, R.user_id, R.rating, R.comment, O.order_id, O.status
FROM REVIEW R
RIGHT OUTER JOIN `ORDER` O
ON R.user_id = O.user_id;

USE khtcafe;

CREATE TABLE SNACK (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2),
    STOCK INT
);

INSERT INTO SNACK (ID, NAME, CATEGORY, PRICE, STOCK) VALUES
(1, '초코칩 쿠키', '과자', 1500.00, 50),
(2, '양파링', '스낵', 2000.00, 30),
(3, '포테이토칩', '스낵', 2500.00, NULL),
(4, '치즈볼', '과자', 1800.00, 40),
(5, NULL, '스낵', 3000.00, 20);

CREATE TABLE SNACK_ORDER (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    SNACK_ID INT,
    QUANTITY INT,
    ORDER_DATE DATETIME,
    STATUS VARCHAR(20)
);

INSERT INTO SNACK_ORDER (ID, SNACK_ID, QUANTITY, ORDER_DATE, STATUS) VALUES
(1, 1, 3, '2024-12-16 10:35:00', '배송 중'),
(2, 2, 2, '2024-12-16 11:00:00', '대기'),
(3, NULL, 1, '2024-12-16 12:00:00', '취소'),
(4, 3, NULL, '2024-12-16 13:00:00', '배송 완료'),
(5, 5, 5, '2024-12-16 14:00:00', NULL);

SELECT * FROM snack;
SELECT * FROM snack_order;

SELECT S.id, S.name, S.category, S.price, S.stock,
		O.quantity, O.order_date, O.status
FROM snack S
JOIN snack_order O
ON S.id = O.snack_id;

SELECT S.id, S.name, S.category, S.price, S.stock,
	   O.quantity, O.order_date, O.status
FROM snack S
LEFT JOIN snack_order O
ON S.id = O.snack_id;

SELECT S.id, S.name, S.category, S.price, S.stock,
	   O.quantity, O.order_date, O.status
FROM snack S
RIGHT JOIN snack_order O
ON S.id = O.snack_id;

SELECT S.id, S.name, S.category, S.price, S.stock,
	   O.quantity, O.order_date, O.status
FROM snack S
RIGHT JOIN snack_order O
ON S.id = O.snack_id;
