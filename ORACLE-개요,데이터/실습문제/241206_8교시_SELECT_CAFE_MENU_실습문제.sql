USER localhost;
-- cafe table 데이터 모두 조회
SELECT * FROM cafe;

-- menu table 데이터 모두 조회
SELECT * FROM menu;

-- FOREIGN KEY (cafe_id) REFERENCES Cafe(cafe_id)

-- 지역에 서울로 시작하는 카페 이름과 위치 조회
SELECT cafe_name, location
FROM cafe
WHERE location LIKE '서울%';

-- 가격이 5500원인 메뉴 조회
SELECT menu_name, price
FROM menu
WHERE price = 5500;

-- 1. 각 카페의 이름과 등록된 메뉴 개수를 조회하세요.
SELECT c.cafe_name, COUNT(menu_name)
FROM menu m, cafe c
WHERE c.CAFE_ID = m.cafe_ID
GROUP BY c.cafe_name, m.CAFE_ID;

-- 2. 각 카페에서 가장 비싼 메뉴의 가격을 조회하세요.
SELECT c.cafe_name, MAX(m.price)
FROM menu m, cafe c
WHERE c.CAFE_ID = m.CAFE_ID
GROUP BY c.cafe_name;

-- 3. 메뉴 가격이 5,000원 이상인 메뉴를 가진 카페의 이름을 조회하세요.
SELECT cafe.CAFE_NAME, menu.PRICE
FROM menu, cafe 
WHERE menu.CAFE_ID = cafe.CAFE_ID
AND menu.price > 5000;

-- 4. 특정 카페 (cafe_id = 3)의 모든 메뉴 이름과 가격을 조회하세요.
SELECT cafe.CAFE_NAME, menu.PRICE
FROM menu, cafe 
WHERE menu.CAFE_ID = cafe.CAFE_ID
AND cafe.CAFE_ID = 3;

-- 5. 모든 메뉴의 가격을 합산한 결과를 조회하세요.
SELECT SUM(menu.PRICE)
FROM menu;

-- 6. '아메리카노'를 판매하는 카페의 이름을 중복 없이 조회하세요.
SELECT DISTINCT c.CAFE_NAME
FROM cafe c, menu m
WHERE c.CAFE_ID = m.MENU_ID
AND m.MENU_name = '아메리카노'; 

-- 7. 메뉴 이름에 '라떼'가 포함된 모든 메뉴의 이름과 가격을 조회하세요.
SELECT menu_name, price
FROM MENU
WHERE menu_name LIKE '%라떼%'

-- 8. 각 카페에서 메뉴의 평균 가격을 (버림) 계산하여 카페 이름과 함께 조회하세요.
SELECT c.CAFE_NAME, FLOOR(AVG(m.price))
FROM cafe c, menu m	
WHERE c.cafe_id = m.cafe_id
GROUP BY c.CAFE_NAME;

-- 9. 특정 지역('서울 강남구')의 카페 이름과 해당 카페의 메뉴 개수를 조회하세요.
SELECT c.CAFE_NAME, count(m.MENU_NAME)
FROM cafe c, menu m
WHERE c.CAFE_ID = m.cafe_id
AND c.LOCATION LIKE '서울 강남구%'
GROUP BY c.CAFE_NAME;

-- 10. 모든 카페의 메뉴 개수를 합산하여 조회하세요.
SELECT COUNT(menu_id) AS total_menu_count
FROM Menu;

-- 11. 특정 지역('서울 서초구')에 위치한 카페에서 판매하는 메뉴들의 총 가격을 조회하세요.
SELECT SUM(m.price)
FROM menu m, cafe c
WHERE c.cafe_id = m.cafe_id AND c.location = '서울 서초구';

-- 12. 메뉴 이름에 '프라푸치노'가 포함된 메뉴를 판매하는 카페 이름을 조회하세요.
SELECT c.CAFE_NAME, m.MENU_NAME
FROM menu m, cafe c
WHERE c.CAFE_ID = m.CAFE_ID
AND m.MENU_NAME LIKE '%프라푸치노%';

-- 13. 특정 메뉴 이름('아이스 아메리카노')의 가격을 가진 메뉴를 조회하세요.
SELECT m.MENU_NAME, m.price
FROM menu m
WHERE menu_name = '아이스 아메리카노';

-- 14. 메뉴 이름에 '녹차'가 포함된 모든 메뉴를 조회하세요.
SELECT menu_name
FROM MENU
WHERE menu_name LIKE '%녹차%';

-- 15. 메뉴 설명(description)이 없는 메뉴의 이름과 가격을 조회하세요.
SELECT menu_name, price
FROM MENU
WHERE DESCRIPTION IS NULL;

-- 16. 메뉴 설명(description)에 '달콤한'이라는 단어가 포함된 메뉴를 조회하세요.
SELECT menu_name, description
FROM Menu
WHERE description LIKE '%달콤한%';

-- 17. 카페 이름과 해당 카페에서 판매 중인 메뉴의 총 가격 합계를 조회하세요.
SELECT c.CAFE_NAME, SUM(price)
FROM menu m, cafe c
WHERE m.CAFE_ID = m.CAFE_ID
GROUP BY c.cafe_name;

-- 18. '서울 용산구'에 위치한 카페들의 평균 메뉴 가격을 조회하세요. (버림
SELECT FLOOR(AVG(price))
FROM cafe c, menu m
WHERE c.cafe_id = m.CAFE_ID
AND c.location LIKE '%서울 용산구'
GROUP BY c.CAFE_ID;


