/*

DDL(Date Definition Language) : 데이터 정의 언어

만들고(CREATE)
수정하고(ALTER)
삭제하고(DROP)
등 데이터 전체 구조를 정의하는 언어로 주로 DB관리자, DB설계자가 사용함

ORACLE
    - TABLE, USER, VIEW, SEQUENCE, INDEX, PACKAGE, TRIGGER, 
        PROCEDURE, FUNCTION, SYNONYM 등 생성
MySQL
    - DATABASE, TABLE, USER, VIEW, SEQUENCE, INDEX, PACKAGE, TRIGGER, 
        PROCEDURE, FUNCTION, SYNONYM 등 생성
PRIMARY KEY = 기본, 기준이 되는 키, UNIQUE + NOT NULL
AUTO_INCREMENT = 자동으로 번호 증가 설정

*/

/*

ALTER (바꾸다, 변조하다) 
- 수정 가능한 것 : 컬럼(추가/수정/삭제), 제약 조건(추가/삭제), 이름변경(테이블, 컬럼, 제약조건)

[작성법]
ALTER TABLE 테이블명 ADD | MODIFY | DROP 수정할 내용;

-------------------------------------------------------------------------------------------
1. 제약 조건 추가
ALTER TABLE 테이블명칭 ADD COLUMN 컬럼명 컬럼조건;

2. 제약 조건 수정
ALTER TABLE 테이블명칭 MODIFY COLUMN 컬럼명 컬럼조건;

3. 제약 조건 삭제
ALTER TABLE 테이블명칭 DROP COLUMN 컬럼명 컬럼조건;


*/