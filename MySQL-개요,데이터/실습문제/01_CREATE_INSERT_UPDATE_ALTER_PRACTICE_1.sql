/************************************************
**************** SELECT 문 사용 ******************
*************************************************/

-- KHTUSER 데이터 베이스에서
-- USER TABLE 홍길동의 이메일주소와 전화번호 조회
USE khtuser;
SELECT username, email, phone
FROM USER
WHERE username = '홍길동'; 

-- khtshopping 
-- `order` 테이블 주문산태가 pending 인 주문 수를 조회 
use khtshopping;
SELECT * 
FROM `order`
WHERE status = 'PENDING';

-- khtcafe 
-- tables 테이블 available 상태인 테이블 번호와 수용 인원 (capacity)조회
USE khtcafe;
SELECT table_number, capacity 
FROM tables
WHERE status = 'AVAILABLE';


-- khtcafe
-- menu 테이블에서 가장 비산 메뉴의 이름과 가격
use khtcafe;
SELECT name, price 
FROM menu
ORDER BY price 
LIMIT 1;

-- CAFE_ORDER 테이블에서 STATUS가 PREPARING 인 주문의 테이블 번호화 주문 금액 조회
use khtcafe;
SELECT table_id, total_amount
FROM cafe_order
WHERE status = 'PREPARING';

-- khtuser 데이터 베이스에서 LOGIN 활동을 한 사용자들의 이름과 세부활동 정보 확인
-- JOIN ON
USE khtuser;

SELECT U.username, A.details
FROM user_activity A
JOIN user U on A.user_id = U.USER_ID
WHERE A.ACTIVITY_Type = 'LOGIN';

-- 홍길동 비밀번호를 hong123으로 변경
-- UPDATE 문을 SQL 에서 직접적으로 실행할 때 문제가 되는 것을 방지하기 위해 SAFE 모드 생성
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM USER;
UPDATE USER SET password_hash = 'hong123' WHERE username='홍길동';

-- SAFE 모드 재설정 
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE USER SET password_hash = 'kim7890' WHERE username='김영희';
UPDATE USER SET password_hash = 'chulsoo5678' WHERE username='이철수';
UPDATE USER SET password_hash = 'park245' WHERE username='박민수';
UPDATE USER SET password_hash = 'choi9876' WHERE username='최수지';

COMMIT;

use khtcafe;
SELECT * FROM tables;
-- 테이블 자체 수정 tables
-- enum('AVAILABLE', 'OCCUPIED')
-- CREATE TABLE SET - CHECKBOX
-- CREATE TABLE ENUM - RADIO

-- ALTER TABLE 수정할컬럼명 MODIFY COLUMN 컬럼명 규칙
ALTER TABLE tables MODIFY COLUMN status ENUM('사용 가능', '사용중'); 

UPDATE tables SET status = '사용 가능' WHERE status = 'AVAILABLE';
UPDATE tables SET status = '사용중' WHERE status = 'OCCUPIED';

COMMIT;
SELECT * FROM cafe_order;
ALTER TABLE cafe_order MODIFY COLUMN status ENUM('PREPARING', 'PENDING', 'COMPLETED', 'CANCELLED', '준비 중', '완료', '대기 중', '취소');
UPDATE cafe_order SET status = '취소' WHERE status = 'CANCELLED';
ALTER TABLE cafe_order MODIFY COLUMN status ENUM('준비 중', '완료', '대기 중', '취소');

commit;

-- DROP TABLE then CREATE;
-- 종료 = 0    시작 = 1
-- 외래키 체크 종료
SET FOREIGN_KEY_CHECKS = 0;
-- DROP TABLE IF EXISTS 테이블명칭;
-- ex) 만약에 MENU 테이블 삭제 원할 시
-- DROP TABLE IF EXISTS MEMU;

-- 테이블 삭제 후 외래키 체크 시작 설정
SET FOREIGN_KEY_CHECKS = 0;