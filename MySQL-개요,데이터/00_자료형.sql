/*
숫자자료형 
TINYINT       : 아주 작은 정수
SMALLINT      : 
MEDIUMINT     : 중간 크기의 정수
INT = INTEGER : 표준 크기의 정수 
FLOAT         : 실수형 자료형 
DOUBLE        : 실수형 자료형
BIGINT        : 매우 큰 정수
DECIMAL OR NUMBERIC : 고정소수점 표현

문자자료형
    고정길이 
        - CHAR(n) = 고정된 데이터 공간
    가변길이
        - VARCHAR(n) = 변수 공간의 길이를 변가능한 문자열
          최대 244자 (숫자, 영어 기준)저장 가능
        - TEXT : 긴글자를 저장할 때 사용                        65,535 까지 저장 가능
        - MEDIUMTEXT : TEXT보다 큰 텍스트를 저장                16MB
        - LONGTEXT   : MEDIUM보다 큰 텍스트를 저장              4GB

기타 자료형
BLOB : 이미지, 동영상 등과 같은 이진 데이터 저장
ENUM : 미리 정의된 값을 선택하는데 사용 (택 1가지 선택)
       HTML에서 SELECT - OPTION 의 RADIO 처럼 지정된 범위에서만 선택 가능
       EX) ENUM('small', 'medium', 'large') = 작음 중간 큰 중 하나를 선택해서 DB에 저장
SET  : 여러 값을 가질 수 있는 집합을 정의하는 자료형
       CHECKBOX처럼 다수 선택해서 DB에 저장
       EX) SET('독서', '낚시', '쇼핑') = 독서 낚시 쇼핑을 한 번에 저장 가능

    CREATE TABLE 테이블명칭(
        USER_ID INT PRIMARY KEY AUTO_INCREMENT,
        GENDER ENUM('male', 'female'),
        HOBBIES SET('reading', 'sports', 'traveling')
    );
날짜자료형
DATE        : 날짜만 저장 (YYYY-MM-DD)
DATETIME    : 날짜와 시간 함께 저장 (YYYY-MM-DD HH:mm:ss)
TIMESTAMP   : 날짜와 시간을 함께 저장되는데, 값이 변경될 때 자동으로 현재시간으로 갱신
              TIMESTAMP DEFAULT CURRENT_TIMESTAMP 기본으로 현재시간 저장
TIME        : 시간만 저장 (HH:mm:ss)
YEAR        : 연도만 저장 (YYYY)
MONTH       : 월만 저장   (MM)
DAY

*/