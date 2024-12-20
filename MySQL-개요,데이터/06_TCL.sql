/* 
TCL (Transaction Control Language) : 트랜잭션 제어 언어

Transaction : 업무, 처리
    = 데이터 변경 사항을 묶어 하나의 트랜잭션(업무)에 담아 처리
    - 트랜잭션의 대상이 되는 데이터 변경 사항 
        : DML(INSERT, UPDATE, DELETE)

    1) COMMIT : 최종 저장
                메모리 버퍼(트랜잭션)에 임시 저장된 
                데이터 변경 사항을 DB에 반영
    2) ROLLBACK : 최종 저장 취소 
                트랜잭션에 임시 저장된 데이터 변경사항을 
                삭제하고 마지막 커밋 상태로 돌아감
    3) SAVEPOINT : 임시 저장 
                임시저장한 위치까지 ROLLBACK;
        [사용법]
        SAVEPOINT "임시저장이름1";
        SAVEPOINT "임시저장이름2";

        ROLLBACK TO "임시저장이름1"; --> 임시저장이름1 전 상태로 돌아감.

트랜잭션
Atomicity(원자성)   : 트랜잭션에 포함된 작업이 모두 성공하거나 실패해야함
                     중간에 일부만 실행 X (일치성)
                     ex) 은행 송금 시, 계좌 A에서 돈이 빠져나갔는데 
                         계좌 B에 임금이 안되면 안된다
Consistency(일관성) : 트랜잭션이 실행되기 전과 후의 데이터 상태가 일관 되어야 함
                     ex) 은행 C는 UPDATE가 안될 시 데이터가 일관되어야함
Isolation(고립성)   : 여러 트랜잭션이 동시에 실행될 때, 서로의 작업에 영향을 주면 안됌
                     ex) 계좌를 여러명이서 출금할 때 하나씩 순서대로 처리
Durability(지속성)  : 트랜잭션이 완료된 후의 결과는 영구적으로 저장
                     ex) 시스템이 다운되어도 성공적으로 완료된 거래 결과는 유지되어야 함
*/

/*
SELECT * FROM khtuser.user;
-- user phone 앞에 작성된 kor) 제거
set sql_safe_updates = 0; -- 안전모드 종료

start transaction;           -- savepoint 를 사용하기 위해서는 start transaction 시작 수동 제어
savepoint sp1;              -- 임시로 되돌릴 위치이름 sp1 설정
use khtuser;              -- khtuser db로 접속
update user set phone = substring_index(phone, ')', 1); -- 수정할 update 작성
select * from user;                                        -- 제대로 수정했는지 확인

rollback to sp1;           -- 원하는대로 결과 수정 X sp1 임시저장한 위치로 되돌리기 
update user set phone = substring_index(phone, ')', -1); -- 수정
select * from user;            -- 올바르게 수정됐는지 확인

commit;                        -- 수정 결과 저장
*/