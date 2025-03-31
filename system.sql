--오라클 관리자
-- system, sys(최고권한)

--sys as sysdba
-- 비밀번호 : 엔터

-- 오라클 12c 버전부터 사용자계정 생성시 접두어(c##)를 요구함
-- c##hr
-- c## 사용하지 않을때
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- 비밀번호 변경
-- 비밀번호 대서문자 구별함
-- ALTER USER hr IDENTIFIED BY hr;

ALTER USER scott IDENTIFIED BY tiger;

-- 계정 잠금 해제
-- ALTER USER hr account unlock;

-- 데이터사전 DBA_USERS 를 사용하여 사용자 정보 조회
SELECT * FROM DBA_USERS WHERE USERNAME = 'SCOTT';

-- scott view 생성 권한 부여
GRANT CREATE VIEW TO scott;




































