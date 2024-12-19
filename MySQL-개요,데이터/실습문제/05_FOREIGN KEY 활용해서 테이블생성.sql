USE khtuser;

SELECT *  from user;

SELECT * FROM address;

SELECT * FROM user_activity;

START transaction;

DROP TABLE user_activity;
DROP TABLE address;
DROP TABLE user;

CREATE TABLE user (
	user_id   INT         auto_increment primary key, -- 기본 키 작성 시 자동적으로 숫자 증가
    username  VARCHAR(50) NOT NULL,					  -- NULL값 비허용
    email     VARCHAR(50) UNIQUE,					  -- 유일한 값만 가능, NULL값 1개 가능
    age       INT         CHECK(age >= 18), 		  -- 18살 이상이어야하고 NULL값은 들어가면 등록 X
    create_at DATETIME        NOT NULL DEFAULT current_timestamp -- 기본 값 적용, 
);

CREATE TABLE order_item (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT CHECK(quantity > 0),
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
	FOREIGN KEY(user_id) REFERENCES user(user_id) 
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

SELECT * FROM user;

SELECT * FROM order_item;

INSERT INTO USER (username, email, age)
VALUES
('김민수', 'minsu.kim@example.com', 28),
('이영희', 'younghee.lee@example.com', 34),
('박철수', 'chulsoo.park@example.com', 21),
('최지연', 'jiyeon.choi@example.com', 29),
('정다은', 'daeun.jung@example.com', 25),
('한승우', 'seungwoo.han@example.com', 32),
('김서연', 'seoyeon.kim@example.com', 22),
('이준호', 'junho.lee@example.com', 27),
('장민지', 'minji.jang@example.com', 30),
('윤성호', 'seongho.yoon@example.com', 24),
('강유진', 'yujin.kang@example.com', 26),
('조은비', 'eunbi.cho@example.com', 23),
('배현우', 'hyunwoo.bae@example.com', 31),
('신재은', 'jaeeun.shin@example.com', 28),
('홍길동', 'gildong.hong@example.com', 35),
('오지훈', 'jihoon.oh@example.com', 29),
('서미경', 'mikyoung.seo@example.com', 22),
('노수민', 'sumin.no@example.com', 20),
('하윤아', 'yuna.ha@example.com', 26),
('황도영', 'doyoung.hwang@example.com', 33);
INSERT INTO order_item (USER_ID, PRODUCT_NAME, QUANTITY)
VALUES
(1, '노트북', 1),
(2, '무선 이어폰', 2),
(3, '휴대폰 케이스', 3),
(4, '커피 머신', 1),
(5, '스마트 워치', 1),
(6, '책상', 1),
(7, '게이밍 마우스', 1),
(8, '키보드', 2),
(9, '스탠드 조명', 1),
(10, '운동화', 1),
(11, '휴대폰', 1),
(12, '캠핑 의자', 2),
(13, '캠핑 텐트', 1),
(14, '블루투스 스피커', 1),
(15, '전자책 리더기', 1),
(16, 'HDMI 케이블', 3),
(17, '모니터', 1),
(18, '가습기', 1),
(19, '공기청정기', 1),
(20, '프라이팬 세트', 1);

commit;
START transaction;

SELECT * FROM user;
-- concat substring_index 이메일 모두 @kht.co.kr;
UPDATE user SET email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@kht.co.kr');

-- inner join 
SELECT U.user_id, U.username, U.email, U.age, OI.order_id, OI.product_name, OI.quantity, OI.order_date
FROM user U
JOIN order_item OI
ON U.user_id = OI.user_id;

SET SQL_SAFE_UPDATES = 1;

-- 최근 주문 순으로 정렬
SELECT U.username, OI.product_name, OI.order_date
FROM user U
JOIN order_item OI
on U.user_id = OI.user_id
ORDER BY OI.order_date DESC;

