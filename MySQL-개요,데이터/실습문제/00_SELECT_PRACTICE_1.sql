-- Error Code: 1046. No database selected
-- > 사용할 DATABASE USE 안했을 시 발생
-- > 사용할 DATABASE USE 안했을 시 발생

-- SELECT INSERT UPDATE 와 같은 DML DDC DCL 구문은 대소문자 구분 x
-- 이외 데이터베이스 명칭, 유저명칭, 비밀번호 모두 대소문자 구분 o 

SELECT current_date;
SELECT 4 * 5;
-- USE 데이터베이스명칭 -> 사용할 데이터베이스 선택 및 시작
USE KHTDB;

/*
예를 들어 KEKO 회사가 MELON, DAUM, KAKAOTALK 데이터를 관리할 때
MySQL 회사 SQ을 이용해서 관리를 하고, 각 데이터 베이스에 유저가 접근하기 위해 사용
1. 유저 아이디, 비밀번호로 접속
2. DAUM 데이터베이스에 접속해서 회원정보나 게시글관리 테이블 확인하길 원한다면 
	USE DAUM;
    SELECT * FROM DAUM_회원정보테이블;


*/

CREATE TABLE USER (
    user_id INT PRIMARY KEY auto_increment,         -- 유저의 가입순서
    user_name VARCHAR(100) NOT NULL,  				-- 유저 이름
    location VARCHAR(255),           				-- 유저 주소
    contact_number VARCHAR(20)        				-- 유저 연락처
); 

SELECT * FROM USER;

INSERT INTO USER (USER_NAME, LOCATION, CONTACT_NUMBER) 
VALUES ('홍길동', '서울시 강남구', '010-1234-5678'); 

commit;

INSERT INTO USER (USER_NAME, LOCATION, CONTACT_NUMBER) 
			VALUES ('고말숙', '서울시 영등포구', '010-2345-6789'),
				   ('김철수', '서울시 송파구', '010-9876-5432');
                   
                   
SELECT *
FROM USER;

START TRANSACTION;
INSERT INTO USER (USER_NAME, LOCATION, CONTACT_NUMBER) 
			VALUES ('이순신', '서울시 종로구', '010-4567-8901'),
            ('최지훈', '서울시 서초구', '010-5677-8911'),
            ('정수민', '서울시 강동구', '010-6781-2345'),
            ('김태호', '경기도 수원시', '010-2222-3333'),
            ('이광수', '인천시 남동구', '010-4444-5555');

COMMIT;

SELECT * FROM USER;

-- 서울에 거주하는 사람
SELECT *
FROM USER 
WHERE location like '서울%';

-- 전화번호 중간에 4라는 숫자가 들어간 유저 조회
SELECT *
FROM USER 
WHERE contact_number like '%4%';
-- 서울에 거주하지 않는 사람 조회

SELECT *
FROM USER 
WHERE location NOT LIKE '서울%';

-- USERPROFILE 테이블 생성
 
-- USER_ID 기본키 자동증가
-- USERNAME 문자열 빈 값 x (50byte)
-- EMAIL 문자열 빈 값	(100 byte)
-- BIRTHDAY DATE
-- ACCOUNT_BALNACE DECIMAL(10,2)
START TRANSACTION;

CREATE TABLE userprofile (
	user_id INT NOT NULL, auto_increment, 		-- 유저아이디 기본키
    username VARCHAR(50) NOT NULL, 				-- 이름
    email VARCHAR(100) NOT NUll, 				-- 이메일
    birthdate DATE, 							-- 생일
    account_balance DECIMAL(10, 2),				-- 계좌 잔액
    gender ENUM('MALE', 'FEMALE'),				-- 성별
    hobbies SET('READING', 'SPORTS', 'RUNNING') -- 취미
    PRIMARY KEY(user_id)
);

INSERT INTO USERPROFILE (USERNAME, EMAIL, BIRTHDATE, ACCOUNT_BALANCE, GENDER, HOBBIES)
VALUES
    ('홍길동', 'hong1@example.com', '1990-01-01', 10000.50, 'MALE', 'READING'),
    ('김영희', 'kim1@example.com', '1995-02-15', 5000.00, 'FEMALE', 'SPORTS'),
    ('이철수', 'lee1@example.com', '1987-03-10', 2000.75, 'MALE', 'RUNNING'),
    ('박민수', 'park1@example.com', '1993-05-20', 7000.25, 'MALE', 'READING,SPORTS'),
    ('최수영', 'choi1@example.com', '1998-07-30', 8000.00, 'FEMALE', 'RUNNING'),
    ('정하나', 'jung1@example.com', '1990-09-10', 3000.40, 'FEMALE', 'READING'),
    ('한상민', 'han1@example.com', '1985-04-25', 6000.30, 'MALE', 'SPORTS,RUNNING'),
    ('안세정', 'oh1@example.com', '1992-12-12', 9000.00, 'MALE', 'READING'),
    ('윤미래', 'yoon1@example.com', '1988-08-08', 4000.00, 'FEMALE', 'SPORTS'),
    ('장동건', 'jang1@example.com', '1991-11-11', 7500.50, 'MALE', 'RUNNING'),
    ('고은아', 'ko1@example.com', '1996-06-06', 3000.00, 'FEMALE', 'READING,SPORTS'),
    ('황보영', 'hwang1@example.com', '1994-03-03', 8500.75, 'FEMALE', 'RUNNING'),
    ('임채연', 'lim1@example.com', '1997-05-15', 2000.25, 'FEMALE', 'READING'),
    ('백승호', 'baek1@example.com', '1989-10-10', 6000.00, 'MALE', 'SPORTS'),
    ('송지효', 'song1@example.com', '1993-02-02', 9500.50, 'FEMALE', 'READING,RUNNING'),
    ('조세호', 'cho1@example.com', '1995-07-07', 1500.75, 'MALE', 'SPORTS'),
    ('이광수', 'lee2@example.com', '1991-09-09', 8000.00, 'MALE', 'RUNNING'),
    ('김나영', 'kim2@example.com', '1986-12-01', 7000.25, 'FEMALE', 'READING'),
    ('박지성', 'park2@example.com', '1988-01-01', 5000.75, 'MALE', 'SPORTS,RUNNING'),
    ('유재석', 'yoo1@example.com', '1987-05-05', 10000.00, 'MALE', 'READING,SPORTS');
    
SELECT * FROM userprofile;

-- ERROR CODE: 1051. Unknown table