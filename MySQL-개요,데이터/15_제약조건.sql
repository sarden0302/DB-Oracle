/*
제약 조건 (CONSTRAINTS)

    사용자가 원하는 조건의 데이터만 유지하기 위해 특정 컬럼에 설정하는 제약
    데이터 무결성 보장을 목적으로 함

    * 무결성 無缺性 Integrity
      : 없을 무, 모자랄 결, 성질 성 
      -> 완벽한 성질, 데이터 손실이 없고, 완전 정확, 한결 같아야 함

      + 입력 데이터에 문제가 없는지 자동으로 검사하는 목적
      + 데이터의 수정/삭제 가능여부 검사등을 목적으로 함
            --> 제약조건을 위배하는 DML

    [종류]
    PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY

    [제약 조건 확인하는 방법]
    (MySQL)
    SELECT *
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = '테이블명'
    AND TABLE_SCHEMA = '데이터베이스명';

    (ORACLE)
    USER_CONSTRAINTS : 사용자가 작성한 제약조건을 확인하는 DICTIONARY VIEW

    [컬럼 수준 제약 조건 확인]
    (MySQL)
    SELECT *
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE TABLE_NAME = '테이블명'
    AND TABLE_SCHEMA = '데이터베이스명';
*/

/*
PRIMARY KEY : 기본키 
    - 각 행을 고유하게 식별하는 컬럼 또는 컬럼 조합
    - 테이블당 하나의 PRIMARY KEY만 설정
    - UNIQUE + NOT NULL

    [작성법]
    CREATE TABLE 테이블명(
        user_id INT AUTO_INCREMENT PRIMARY KEY,

    )

NOT NULL : 
    - 특정 컬럼이 빈 값을 가지지 못하도록 제약
    - NOT NULL 설정 시 기본값(DEFAULT VALUE) 를 설정해서 NULL 값 방지 가능

    [작성법]
    CREATE TABLE 테이블명(
        user_id INT          AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL,
        signupDate DATE      NOT NULL DEFAULT CURRENT_DATE
    )
    username && signupDate 모두 NOT NULL


UNIQUE :
    - 컬럼의 값이 고유해야 함을 보장
    - 테이블 내에서 중복된 값을 허용하지 않음
    - UNIQUE 제약 조건은 단 1회 NULL 값을 허용
    - 한 테이블에 여러 UNIQUE 컬럼 값을 가질 수 있음음

    [작성법]
    CREATE TABLE 테이블명(
        user_id   INT          AUTO_INCREMENT PRIMARY KEY,
        userEmail VARCHAR(100) UNIQUE
    )



FOREIGN KEY
    - 한 테이블의 컬럼이 다른 테이블의 PRIMARY KEY나 UNIQUE 컬럼을 참조하도록 설정
    - 데이터베이스 내에서 테이블 간의 관계를 정의하는데 사용

    - 참조 무결성 유지
    - 부모 테이블의 데이터 변경 시 행동(삭제 / 업데이트) 제어할 수 있음

    ON DELETE와 ON UPDATE 동작
        CASCADE  : 참조하는 데이터가 변경되면 참조된 데이터도 함께 변경
        SET NULL : 참조된 데이터를 NULL로 변경
        RESTRICT : 변경을 제한

    [작성법]
    CREATE TABLE customer(
        customer_id   INT          AUTO_INCREMENT PRIMARY KEY,
        customer_name VARCHAR(100) UNIQUE
    )

    CREATE TABLE orders(
        order_id   INT          AUTO_INCREMENT PRIMARY KEY,
        customer_id VARCHAR(100) UNIQUE
        FOREIGN KEY (customer_id) REFERENCE customer(customer_id) ON DELETE CASCADE 
    )
    ※ ON DELETE CASCADE : 참조하는 컬럼들도 삭제시 같이 삭제

CHECK
    - 특정 컬럼 값이 지정된 조건을 만족해야 함을 보장
    - MYSQL 8.0 이상에서 지원

    - 데이터 삽입 또는 업데이트 시 조건 검증
    - 조건 불만족할 경우 DB 저장 X

    [작성법]
    CREATE TABLE 테이블명(
        user_id INT           AUTO_INCREMENT PRIMARY KEY,
        price   DECIMAL(10,2) CHECK(price > 0)
    )
    price COLUMN should be greater than 0

*/