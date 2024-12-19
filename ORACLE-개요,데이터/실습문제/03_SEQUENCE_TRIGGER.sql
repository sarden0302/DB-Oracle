-- 1. 시퀀스 생성 = 자동으로 증가하는 고유하는 값을 제공할 수 있도록 함
-- 테이블에서 데이터를 사용할 때 기본키에 회원가입한 순서를 작성
-- 사용법 CREATE SEQUENCE 시퀀스이름 START WITH 1 INCREMENT BY 1;
--      생성하다  시퀀스    시퀀스이름 몇 번부터 시작 1   증가숫자      1
-- 예를 들어 CREATE SEQUENCE 먹고간다 START WITH 100 INCREMENT BY 1;
--			먹고 가는 사람 수를 100번부터 100, 101, 102, 
--		  CREATE SEQUENCE 가져간다 START WITH 700 INCREMENT BY 1;

CREATE SEQUENCE seq_user; -- START WITH 1 INCREMENT BY 1 <- DEFAULT

-- USER는 예약어이기 때문에 "" 사용해서 TABLE 생성 가능
CREATE TABLE student(
	studentid NUMBER PRIMARY KEY,
	studentname VARCHAR2(100),
	studentage NUMBER
);        

-- 2. 트리거 생성 = 데이터 삽입 시 시퀀스를 자동으로 활용할 수 있도록 설정
-- 트리거를 이용해서 테이블에 새로운 숫자 값이 삽입될 때 시퀀스에 저장된 번호를 호출해서 ID값을 자동으로 설정
-- 무엇을 만들거나 수정하거나 삭제할 때 OR REPLACE 사용하면 새로 만들거나 존재하면 덮어쓰기
CREATE OR REPLACE TRIGGER trg_user 
BEFORE INSERT ON student 
FOR EACH ROW 
BEGIN 
	-- 시퀀스를 사용해서 student 테이블 내에 studentid 번호를 자동으로 생성
	:NEW.studentid = seq_user.NEXTVAL	
END;

-- student 테이블에 학생 정보를 저장하려한다.
-- studentid를 명시하지 않고, 자동으로 증가하는 값으로 학생을 저장하기
-- INSERT INTO 테이블명칭 (studentname, studentage) VALUES ('홍길동', 11)
DROP TRIGGER trg_user;

SELECT sequence_name
FROM user_sequences
WHERE sequence_name = 'SEQ_USER';

SELECT trigger_name, status
FROM user_triggers
WHERE trigger_name = 'trg_user';

CREATE OR REPLACE TRIGGER trg_user 
BEFORE INSERT ON student 
FOR EACH ROW 
BEGIN 
	:NEW.studentid := seq_user.NEXTVAL	
END;
DROP SEQUENCE seq_user;

INSERT INTO student (studentname, studentage) VALUES ('강철수', 12);
INSERT INTO student (studentname, studentage) VALUES ('박길자', 13);
INSERT INTO student (studentname, studentage) VALUES ('오말숙', 14);
INSERT INTO student (studentname, studentage) VALUES ('안정미', 15);

CREATE SEQUENCE seq_std INCREMENT BY 1 START WITH 1;

CREATE OR REPLACE TRIGGER trg_std 
BEFORE INSERT ON student 
FOR EACH ROW 
BEGIN 
	:NEW.studentid := seq_user.NEXTVAL	
END;

