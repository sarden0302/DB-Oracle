/*
n = number(최대 문자 수), p = 정수 개수, s = 소수점 자릿수

대표적으로 VARCHAR2, NUMBER, TIMESTAMP 많이 사용

1. 문자열 타입 (Character Data Types)
CHAR(n)     : 고정 길이 문자열 / 한글자씩 최대 몇글자 작성할 지
            - Default : 1byte
            - 숫자 or 영어 
VARCHAR(n) : 
            ※ Oracle 사용 불가
VARCHAR2(n) : 가변길이 문자열을 저장할 때 사용하는 데이터 타입
            - 가변 길이(길이가 변할 가능성이 있다.)
            - VARCHAR보다 더 큰 공간 사용할 수 있음
            - 필수로 길이를 지정해야한다 (평균 255byte로 많이 작성함)
            - 길이(n)당 1 byte
NCHAR(n)
NVARCHAR2(n): 유니코드(한글 및 전세계어를 담을 수 있는) 문자형 
            - 길이(n)당 3 byte
CLOB(n)     : 메일이나 대량의 글자를 담을 때

2. 숫자 데이터 타입 (Numeric Data Types)
NUMBER(p, s) : 숫자나 실수를 담는 타입
             - Default : NUMBER(38, 0)

3. 날짜 및 시간 데이터 타입 (Date And Time Data Type)
DATE(n)     : 날짜 시간 시 분 초
            - Default : 7 byte
TIMESTAMP   : 날짜 시간 시 분 초(나노초단위까지 가능)
            - Default : 7 byte

4. 이진 데이터 타입 (Binary Data Type)
BLOB        : 크기 제한이 없음
            - 이미지, 동영상 이외 여러 데이터 파일 저장할 수 있음
            - 최대 4GB
            - 유지비용이 많이 들기 때문에 VCHAR로 주소를 저장하는 형식으로 바뀜

5. 논리형 데이터 타입 (Boolean Data Type)
    ※ Oracle 에서만 사용 가능
BOOLEAN     : TRUE, FALSE, NULL 사용 가능
            - 1 byte

*/

/*
1 단계 : 프론트엔드에서 길이 제한
2 단계 : 자바에서 length 숫자 길이 제한
3 단계 : DB에서 14자까지만 작성
*/
