--- *** DML(Data Manipulation Language) : 데이터 조작 언어 ***---
/*
    - 테이블 값을 삽입, 수정, 삭제
    - 데이터 변경 후 COMMIT 반듯이 작성
    - ROLLBACK : 이전 COMMIT 단계로 돌아간다
    ※ 주의 : 혼자서 COMMIT, ROLLBACK 하지 말 것 
*/

-- INSERT 작성용 테이블 복제해서 생성 
-- CAFE 테이블을 복제해서 EATS 테이블 생성
CREATE TABLE EATS AS SELECT * FROM CAFE; -- CAFE 테이블 형식을 그대로 복제해서 EATS 생성
                                         -- 테이블 형식 && 데이터 모두 복제
CREATE TABLE Cafe (
    cafe_id NUMBER PRIMARY KEY,        -- 카페의 고유 ID
    cafe_name VARCHAR2(100) NOT NULL,  -- 카페 이름
    location VARCHAR2(255),            -- 카페 위치
    contact_number VARCHAR2(20)        -- 카페 연락처
);
-- ↓ 아래처럼 테이블명만 교체해서 그대로 교체

CREATE TABLE EATS (
    cafe_id NUMBER PRIMARY KEY,        -- EATS의 고유 ID
    cafe_name VARCHAR2(100) NOT NULL,  -- EATS 이름
    location VARCHAR2(255),            -- EATS 위치
    contact_number VARCHAR2(20)        -- EATS 연락처
);


/*
1. INSERT 
    테이블에 새로운 행을 추가하는 구문

    [작성법]
    1) INSERT INTO 테이블명 VALUES (데이터, 데이터, ...);
    2) INSERT INTO 테이블명 (컬럼명, 컬럼명, ...)
                    VAlUES (데이터, 데이터, ...);
        - 테이블에 내가 선택한 컬럼에 대한 값만 INSERT 할 때 사용
            선택 안된 컬럼은 값이 NULL이 들어감

2. UPDATE 
    테이블의 데이터 수정하는 구문

    [작성법]
    UPDATE 테이블명 SET 컬럼명 = 바꿀 값 [WHERE 컬럼명 비교연산자 비교값];

3. DELETE
    테이블에 행을 삭제하는 구문

    [작성법]
    DELETE FROM 테이블명 WHERE 조건설정
    ※ WHERE 조건 작성 안할 시 모두 삭제
*/
DELETE FROM 테이블명;