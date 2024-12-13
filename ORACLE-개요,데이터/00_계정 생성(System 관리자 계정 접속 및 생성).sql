/*
asterisk (*) : 모든, 포함하다 (All)
*/

/*
컬럼 값 산술 연산
-- 컬럼 값 : 행과 열이 교차되는 테이블의 한 칸에 작성된 값
-- select 문 작성 시 컬럼명에 산술 연산을 직접 작성하면 조회결과에 연산결과가
   반영되어 조회된다.
sqlplus sys as sysdba; //관리자로 접속

sqlplus = 오라클에서 만든 sql 로 접속할 수 있도록 연결하는 통로

sys = System   as  sysdba = SystemDataBaseAdmin

ALTER SESSION SET "_ORACLE_SCRIPT"=true;
└──────── 관리자로 접속해서 user 생성하고, 권한부여 ok?
        기본으로 false로 되어있기 때문에 true
        권한부여 및 유저 생성을 진행한다 => true 변경


CREATE      USER 사용자아이디 IDENTIFIED BY 비밀번호;
생성하다 사용자를                   비밀번호설정

GRANT       connect, resource, dba TO kht;
권한부여     연결 ok   사용ok  dba(=관리자로서 모든 권한 부여)  TO 사용자아이디;
*/