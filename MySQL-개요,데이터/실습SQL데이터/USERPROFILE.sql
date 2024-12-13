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