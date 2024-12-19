/*
초기에 SQL 문을 명령프롬포트(CMD) 창에서 작성 후 출력 결과 수정 확인

개발자가 눈으로 직관적으로 확인하기 위해 UI 개발
MySQL  -> MySQL-WORKBENCH
ORACLE -> ORACLE DEVELOPER

DBEAVER -> 모든 SQL 회사 통합 화면 

[명령어]
    1. C:\Users\sarde> mysql -u 유저명 -p
    
    특정 데이터 베이스 접속
    C:\Users\sarde> mysql -u root -p 데이터베이스명

    2. 데이터베이스 목록 조회
    -> SHOW DATABASES;

    3. 특정 데이터베이스 접속
    -> USE 데이터베이스이름;

    4. 특정 데이터베이스 내 존재하는 테이블 목록 조회
    -> SHOW TABLES;

    5.특정 테이블 내 컬럼 구조 확인인
    -> SHOW COLUMNS FROM 테이블명

    이외 CREATE ~ DELETE COMMIT 등 모든 명령어 사용 가능

    6. 종료
    -> EXIT


mysql> use khtdb;
Database changed
mysql> select * from user;
+---------+-----------+-----------------+----------------+
| user_id | user_name | location        | contact_number |
+---------+-----------+-----------------+----------------+
|       1 | 홍길동    | 서울시 강남구   | 010-1234-5678  |
|       2 | 고말숙    | 서울시 영등포구 | 010-2345-6789  |
|       3 | 김철수    | 서울시 송파구   | 010-9876-5432  |
|       4 | 이순신    | 서울시 종로구   | 010-4567-8901  |
|       5 | 최지훈    | 서울시 서초구   | 010-5677-8911  |
|       6 | 정수민    | 서울시 강동구   | 010 6781-2345  |
|       7 | 김태호    | 경기도 수원시   | 010-2222-3333  |
|       8 | 이광수    | 인천시 남동구   | 010-4444-5555  |
|       9 | 강정식    | 서울시 중랑구   | 010-5558-6666  |
+---------+-----------+-----------------+----------------+
9 rows in set (0.00 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| khtdb              |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> SHOW TABLES;
+-----------------+
| Tables_in_khtdb |
+-----------------+
| employee        |
| user            |
| userprofile     |
+-----------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE USER;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| user_id        | int          | NO   | PRI | NULL    | auto_increment |
| user_name      | varchar(100) | NO   |     | NULL    |                |
| location       | varchar(255) | YES  |     | NULL    |                |
| contact_number | varchar(20)  | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM USER;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| user_id        | int          | NO   | PRI | NULL    | auto_increment |
| user_name      | varchar(100) | NO   |     | NULL    |                |
| location       | varchar(255) | YES  |     | NULL    |                |
| contact_number | varchar(20)  | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> EXIT;
Bye

C:\Users\sarde>
*/