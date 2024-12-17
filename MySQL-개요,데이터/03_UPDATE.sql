/*

DML (Data Manipulation Language) 

-- 주의 : 혼자서 COMMIT, ROLLBACK 금지!

UPDATE 

테이블에 기록된 컬럼의 값을 수정하는 구문

[작성법]
UPDATE 테이블명 SET 컬럼명 = 바꿀 값 WHERE 컬럼명 비교연산자 비교값;

※ 주의할 점
Error Code : 1265. Data truncated for column '컬럼명' at row 
    CASE 1 : 컬럼에 INSERT 할 수 있는 데이터가 정해져있는 ENUM이나 SET에 데이터의 범위에 벗어난 
             데이터를 입력시 에러 발생생
    CASE 2 : 최대 글자 수 작성 가능한 컬럼에 최대 글자수를 초과해서 데이터를 작성했을 때

    [해결방안]
    SQL_SAFE_UPDATES = 0 (안전모드 종료) 후 
    ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 ENUM(변경사항);
    
Error Code: 1175. You are using safe update mode and you tired to update a table without a WHERE
                  that uses  a KEY column.
    : Safe Update Mode 가 사용 중인 경우에 WHERE에서 KEY 값을 이용해서 업데이트 하려고 할 때
    -> To disable safe mode, toggle tha option in Preferences -> SQL Editor and reconnect.
    SET SQL_SAFE_UPDATES = 0;  -- > 안전모드 종료
    SET SQL_SAFE_UPDATES = 1;  -- > 안전모드 시작


*/