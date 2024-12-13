/*
cmd에서 mysql 접속 후, 데이터베이스 생성, 유저 생성, 권한 설정
mysql -u root -p
password : 513795;

-- 회사 내에서 TABLE과 QUERY 저장을 위한 데이터베이스 명칭 설정
CREATE DATABASE 데이터베이스명칭;

-- 데이터베이스에 접속할 수 있는 유저 생성
CRATE USER '유저 이름'@'%' IDENTIFIED BY '새로운 비밀번호';
'%' = 자바에서 public 같은 개념으로 어떤 컴퓨터에서든 접근 가능
'localhost' = 자바에서 private 같은 개념으로 현재 사용하는 컴퓨터에서만 접근 가능
*/

-- ※ 주의사향 : 데이터베이스 명칭, 유저명, 유저비밀번호는 대소문자 띄어쓰기 모두 구분
CREATE DATABASE 데이터베이스명칭
CREATE USER '유저명'@'%' IDENTIFIED BY '비밀번호';
GRANT ALL PRIVILEGES ON 데이터베이스명칭.* TO '유저명'@'%';
FLUSH PRIVILEGES;

/* GRANT : 권한 허용
  GRANT ALL PRIVILEGES 데이터베이스명칭.* TO 'kht'@'%';
  데이터베이스.* : 내에 있는 모든 테이블 접근 ok
  TO 'kht'@'%';

  특권 적용
  FLUSH PRIVILEGES;

*/
