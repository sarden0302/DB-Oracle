USE bestproducts;
SELECT * FROM ranking;

SELECT * FROM items;

SELECT * FROM items INNER JOIN ranking ON ranking.item_code = items.item_code WHERE ranking.main_category = "ALL";

SELECT items.provider, COUNT(*) 
FROM items 
INNER JOIN ranking 
ON ranking.item_code = items.item_code
GROUP BY items.provider;

SELECT items.provider, COUNT(*)
FROM items
INNER JOIN ranking 
ON items.item_code = ranking.item_code
WHERE ranking.main_category = 'ALL'
GROUP BY items.provider;
-- 메인 카테고리가 패션의류인 서브 카테고리 포함, 패션의류 전체 베스트상품에서 판매자별 베스트 상품 갯수가 5이상인 판매자와 베스트상품 갯수 출력해보기
SELECT I.provider, COUNT(*)
FROM items I
INNER JOIN ranking R 
ON I.item_code = R.item_code
WHERE main_category = '패션의류'
GROUP BY I.provider
HAVING COUNT(I.PROVIDER) >= 5;

-- 메인 카테고리가 신발/잡화인 서브 카테고리 포함, 전체 베스트상품에서 판매자별 베스트상품 갯수가 10이상인 판매자와 베스트상품 갯수를 베스트상품 갯수 순으로 출력해보기
SELECT I.provider, COUNT(I.provider)
FROM items I
INNER JOIN ranking R
ON I.item_code = R.item_code
WHERE R.main_category = '신발/잡화'
GROUP BY I.PROVIDER
HAVING COUNT(I.provider) >= 10
ORDER BY COUNT(I.provider) DESC;

-- 메인 카테고리가가 화장품/헤어인 서브 카테고리 포함, 전체 베스트상품의 평균, 최대, 최소 할인 가격 출력해보기
SELECT AVG(dis_price), MAX(dis_price), MIN(dis_price) 
FROM items I
INNER JOIN ranking R
ON I.item_code = R.item_code
WHERE R.main_category = '화장품/헤어';
