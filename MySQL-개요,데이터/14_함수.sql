/*
함수

<문자열>
CONCAT = 여러 문자열을 하나의 문자열로 결합하는 함수 
[작성법]
CONCAT(String1, String2, .... StringN)
ex) SELECT CONCAT('Hello', ' ', 'World', '!');
--> 출력 결과 : Hello World!

SUBSTRING_INDEX = 
[작성법]
SUBSTRING_INDEX(String, 구분기준, count);
                                 + : 구분 기준 왼쪽부터 count만큼 가져오기
                                 - : 구분 기준 오른쪽부터 count만큼 가져오기

ex 1) SELECT STUBSTRING_INDEX('user@example.com', '@', 1);
--> 출력 결과 : user

ex 2) SELECT STUBSTRING_INDEX('user@example.com', '@', -1);
--> 출력 결과 : example.com

EXTRACT() : 지정된 년, 월, 일 을 택해서 추출출
REPLACE() : 문자열 바꾸기
LENGTH() : 문자열 길이
INSTR() : 찾을 시작 위치부터 지정된 순번쨰 찾을 문자열의 시작 위치를 반환
SUBSTR() : 문자열을 시작 위치부터 지정된 길이만큼 잘라내서 반환
TRIM() : 주어진 문자열의 앞쪽 | 뒤쪽 | 양쪾에 존재하는 지정된 문자열 제거
        [옵션]
        - LEADING  : 
        - TRAILING : 
        - BOTH     : 

<DATE>
SYSDATE : 현재시간 (MS 불포함)
SYSTIMESTAMP : 현재시간



<숫자>
TRUNC() : 버림(잘라내기)
FLOOR() : 내림
CEIL() : 올림
ROUND() : 반올림

ABS() : 절대값
AVG() : 평균
MAX() : 최대
MIN() : 최소
SUM() : 합
MOD() : 나머지지
    SELECT SUM(*) FROM USER
    SELECT SUM(*) FROM product WHERE product_name LIKE (%?%);
COUNT() : 총 합 -> 추 후 로그인시 사용될 예정
    SELECT COUNT(*) FROM USER WHERE ID = ? AND PW = ?;
        -> ID 와 PW가 일치하는 회원이 존재하면         COUNT = 1
                                    존재하지 않으면   COUNT = 0 

<NULL 연산> : IS NULL / IS NOT NULL

*/