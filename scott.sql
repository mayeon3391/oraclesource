-- RDBMS
-- 기본단위 : 테이블

-- EMP(사원정보 테이블)
-- empno(사번), ename(사원명),job(직책), mgr(직속상관사번), hiredate(입사일), sal(급여), comm(추가수당), deptno(부서번호)
-- NUMBER(4,0) : 전체 자릿수 4자리(소수점 자릿수 0)
-- VARCHAR2(10) : 문자열 10Byte (VAR : 가변 - 7byte 문자열 저장했다면 7byte 공간만 사용)
--				  영어 10문자, 한글 2byte, utf-8 3byte 할당
-- DATE : 날짜
-- DEPT : 부서테이블
-- deptno(부서번호), dname(부서명), loc(부서위치)

-- SALGRADE(급여테이블)
-- grade(급여등급), losal(최저급여), hisal(최대급여)

-- 개발자 : C(Insert)R(Read)U(Update)D(Delete)
--SQL(Structured Query Language : 구조질의 언어) : RDBMS 데이터를 다루는 단어 

--spl 구문 실행 순서
-- 3) SELECT
-- 1) FROM
-- 2) WHERE
-- 4) ORDER by

--spl 구문 실행 순서
-- 5)SELECT
-- 1) FROM
-- 2) WHERE
-- 3) GROUP BY
-- 4) HAVING
-- 6) ORDER by

-- 1. 조회(SELECT) - Read
-- 사원정보조회(전체조회)
-- *(모든 열)
SELECT * FROM EMP e; 

-- 특정 열 조회
SELECT e.EMPNO, e.ENAME, e.JOB FROM EMP e;

-- 사원번호, 부서번호만 조회
SELECT e.EMPNO , e.DEPTNO FROM EMP e;

-- 중복 데이터는 제외하고 조회
SELECT DISTINCT deptno FROM emp;

SELECT DISTINCT job, deptno FROM emp;

-- 별칭
SELECT ename, sal, sal * 12 + comm annsal, comm
FROM EMP e;

SELECT ename, sal, sal * 12 + comm AS "annsal", comm
FROM EMP e;

SELECT ename, sal, sal * 12 + comm AS annsal, comm
FROM EMP e;

SELECT ename, sal, sal * 12 + comm 연봉, comm
FROM EMP e;

SELECT ename, sal, sal * 12 + comm 연 봉, comm
FROM EMP e;
-- 별칭에 공백이 들어가는 경우 ""로 반드시 묶어야함
SELECT ename 사원명, sal 급여, sal * 12 + comm "연 봉", comm 수당 FROM EMP;

-- 원하는 순서대로 출력 데이터를 정렬(오름, 내림)
-- 오름차순을 때 asc 생략 가능
-- emp 테이블의 모든 열을 급여 기준으로 오름차순
SELECT * FROM emp e ORDER BY e.sal ASC;
SELECT * FROM emp e ORDER BY e.sal;
-- 내림차순
SELECT * FROM emp e ORDER BY e.sal DESC;

-- 사번, 이름, 직무만 급여 기준으로 내림차순
SELECT
	e.empno,
	e.ename,
	e.job
FROM
	emp e
ORDER BY
	e.sal DESC;

-- 부서번호의 오름차순, 급여의 내림차순
SELECT
	*
FROM
	emp e
ORDER BY
	e.deptno ASC,
	e.sal DESC;

--
SELECT e.empno emloyee_no,
e.ename employee_name,
e.mgr manager,
e.sal salary,
e.comm cmmissionm,
e.deptno depar
FROM
emp e;

SELECT
	*
FROM
	emp e
ORDER BY
	e.deptno DESC,
	e.ename ASC;

-- where : 조회 시 조건 부여
-- 부서번호가 30번인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 30;

-- 사번이 7782인 원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7782;

-- 부서번호가 30이고 직책이 SALESMAN 사원 조회
-- 오라클에서 문자는 ''만 허용, 대소문자 구분
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 30 AND e.JOB = 'SALESMAN';

-- 사번 7499 이고 부서번호가 30 사원조회
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7499
	AND e.DEPTNO = 30;


-- 사번이 7499 이거나 부서번호가 30인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7499
	OR e.DEPTNO = 30;

-- 연산자
-- 1) 산술연산자 : +, -, *, /
-- 2) 비교연산자 : >, <, >=, <=, =
-- 3) 등가비교연산자 : =, 같지않다(!=, <>, ^=)
-- 4) 논리부정연산자 : NOT
-- 5)            : IN
-- 6) 범위 : BETWEEN A AND B
-- 7) 검색 : LIKE 연산자와 와일드카드(_,%)
-- 8) IS NULL : 널과 같다
-- 9) 집합 연산자 : UNION, MINUS, INTERSECT

-- 연봉이(SAL * 12) 36000인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.sal * 12 = 36000;

-- 급여가 3000이상인 사원 조회
SELECT *
FROM EMP e
WHERE e.sal >= 3000;

-- 급여가 2500이상이고 직업이 ANALYST 사원 조회
SELECT *
FROM EMP e
WHERE e.SAL >=2500 AND e.JOB = 'ANALYST';

-- 문자를 대소비교
-- 사원명의 첫 문자가 F와 같거나 F보다 뒤에 있는 사원조회
SELECT *
FROM EMP e
WHERE e.ENAME >= 'F';

-- 급여가 3000이 아닌 사원 조회
SELECT *
FROM EMP e
WHERE NOT e.sal = 3000;

-- job 이 MANAGER 이거나, SALESMAN 이거나, CLERK 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.JOB = 'MANAGER'
	OR e.JOB = 'SALESMAN'
	OR e.JOB = 'CLERK';

-- in 연산자로 변경
SELECT
	*
FROM
	EMP e
WHERE
	e.JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT
	*
FROM
	EMP e
WHERE
	e.JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- BETWEEN A AND B
-- 급여 2000 이상 3000 이하
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL >= 2000
	AND e.SAL <= 3000;

SELECT
	*
FROM
	EMP e
WHERE
	e.SAL BETWEEN 2000 AND 3000;

-- 급여 2000 이상 3000 이하가 아닌 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL NOT BETWEEN 2000 AND 3000;


-- LIKE
-- _ : 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미
-- % : 길이와 상관없이 (문자 없는 경우도 포함) 모든 문자열 데이터를 의미

-- 사원명이 S로 시작하는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE 'S%';

-- 사원 이름의 두번째 글자가 L인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '_L%';

-- 사원명에 AM이 포함된 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '%AM%';


-- 사원명에 AM이 포함되지 않은 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME NOT LIKE '%AM%';


-- IS NULL
-- COMM이 NULL 인 사원 조회
SELECT *
FROM emp e
WHERE e.COMM IS NULL;

--MGR이 NULL 인 사원(= 직속상관이 없는) 조회
SELECT *
FROM emp e
WHERE e.mgr IS NULL;


-- 직속 상관이 있는 사원 조회
SELECT *
FROM emp e
WHERE e.mgr IS NOT NULL;


-- 집합연산자
-- UNION(합집합)
-- 부서번호 10, 20 사원조회 (OR , IN)
SELECT * FROM EMP e WHERE e.DEPTNO = 10 OR e.DEPTNO  = 20;
SELECT * FROM EMP e WHERE e.DEPTNO IN (10, 20);

SELECT e.EMPNO, e.ENAME, e.SAL FROM EMP e WHERE e.DEPTNO = 10
UNION 
SELECT e.EMPNO, e.ENAME, e.SAL FROM EMP e WHERE e.DEPTNO  = 20;


--타입 일치만 확인 => 타입이 맞는다면 연결
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10
UNION 
SELECT e.SAL, e.JOB, e.DEPTNO, e.EMPNO FROM EMP e WHERE e.DEPTNO  = 20;


-- UNION(중복 제외하고 출력), UNION ALL(중복 데이터도 출력)
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10
UNION 
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e WHERE e.DEPTNO  = 10;

SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10
UNION ALL
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e WHERE e.DEPTNO  = 10;


-- MINUS (차집합)
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e
MINUS
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e WHERE e.deptno = 10;

--INTERSECT(교집합)
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e
INTERSECT
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO FROM EMP e WHERE e.deptno = 10;

-- 오라클 함수
-- 내장함수
-- 1) 문자함수
-- 대소문자를 바꿔주는 함수 : UPPER(), LOWER(), INIRCAP()
-- 문자의 길이를 구하는 함수 : LENGTH(), LENGTHB()
-- 문자열 일부 추출 : SUBSTR(문자열데이터, 시작위치, 추출길이)
-- 문자열 데이터 안에서 특정 문자 위치 찾기 : INSTR()
-- 특정 문자를 다른 문자로 변경 : REPLACE(원본문자열, 찾을문자열, 변경문자열)
-- 두 문자열 데이터를 합치기 : CONCAT(문자열1, 문자열2), ||
-- 특정 문자 제거 : TRIM(), LTRIM(), RTRIM()
-- 데이터의 공간을 특정 문자로 채우기 : LPAD(), RPAD()
-- LPAD(데이터, 데이터 자릿수, 채울문자)
-- RPAD(데이터, 데이터 자릿수, 채울문자)

-- Oracle => 10자리로 표현
SELECT
	'Oracle',
	LPAD('Oracle', 10, '#'),
	RPAD('Oracle', 10, '#'),
	LPAD('Oracle', 10),
	RPAD('Oracle', 10)
FROM
	dual;


-- 사원이름을 전부 대문자, 소문자, 첫문자만 대문자로 변경
SELECT e.ENAME, UPPER(e.ENAME), LOWER(e.ENAME ), INITCAP(e.ENAME)
FROM EMP e;


-- 제목 oracle 검색
-- LIKE '%oracle%' OR like'%ORACLE%' OR LIKE 'Oracle'
-- SELECT *
-- FROM board
-- WHERE upper(title) = upper('oracle')

-- 사원명 길이 구하기
SELECT e.ENAME, LENGTH(e.ENAME)
FROM EMP e;

--사원명이 5글자 이상인 사원 조회
SELECT *
FROM EMP e
WHERE LENGTH(e.ename) >= 5;

--LENGTHB() : 문자열 바이트 수 반환
-- XE 버전 : 한글에 3BYTE 사용
-- dual : sys 소유 테이블(임시 연산이나 함수의 결과값 확인 용도로 사용)
SELECT LENGTH('한글'), lengthb('한글')
FROM dual;

-- 시작위치 지정 시 양수(왼쪽), 음수(오른쪼굽터) : 맨 끝부터 -1
SELECT e.JOB, SUBSTR(e.JOB,1,2), SUBSTR(e.JOB,5)
FROM EMP e;

SELECT
	e.JOB,
	SUBSTR(e.JOB, -LENGTH(e.JOB)),
	SUBSTR(e.JOB,-LENGTH(e.JOB), 2),
	SUBSTR(e.job, -3)
FROM
	EMP e;

--INSTR(대상문자열, 위치를 찾으려는 문자, 시작위치, 시작위치에서 찾으려는 문자가 몇 번째인지)
SELECT
	INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
	INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
	INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM
	DUAL;

-- 사원 이름에 S가 있는 사원 조회
SELECT *
FROM EMP e WHERE e.ENAME LIKE '%S%';

SELECT *
FROM EMP e WHERE INSTR(e.ename,'S') > 0;

-- REPLACE(원본문자열, 찾을문자열, 변경문자열)
SELECT
	'010-1234-5678' AS REPLACE_BEFORE,
	REPLACE('010-1234-5678', '-', ' ') AS REPLACE1,
	REPLACE('010-1234-5678', '-') AS REPLACE2
FROM
	dual;

-- 사번 : 사원명
SELECT CONCAT(e.EMPNO, CONCAT(' : ', e.ENAME))
FROM EMP e;

SELECT
	e.EMPNO || ' : ' || e.ENAME
FROM
	EMP e;


-- TRIM(삭제옵션(선택), 삭제할문자(선택) FROM 원본문자열(필수))
SELECT
	'[' || TRIM(' __Oracle__') || ']' AS trim,
	'[' || TRIM(LEADING FROM ' __Oracle__') || ']' AS trim_leading,
	'[' || TRIM(TRAILING FROM ' __Oracle__') || ']' AS trim_trailing,
	'[' || TRIM(BOTH FROM ' __Oracle__') || ']' AS trim_both
FROM
	DUAL;

--LTRIM(), RTRIM()
SELECT
	'[' || TRIM(' __Oracle__') || ']' AS TRIM,
	'[' || LTRIM(' __Oracle__') || ']' AS LTRIM,
	'[' || RTRIM(' __Oracle__') || ']' AS RTRIM,
	'[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM2
FROM
	DUAL;

-- 숫자함수
-- 반올림 : ROUND()
-- 버림 : TRUNC()
-- 가장 큰 정수 : CEIL()
-- 가장 작은 정수 : FLOOR()
-- 나머지 : MOD()

--   -2 -1  0 1 2
--1 2 3 4 . 5 6 7 8

SELECT
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND1,
	ROUND(1234.5678, 1) AS ROUND2,
	ROUND(1234.5678, 2) AS ROUND3,
	ROUND(1234.5678, -1) AS ROUND4,
	ROUND(1234.5678, -2) AS ROUND5
FROM
	DUAL;


SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC1,
	TRUNC(1234.5678, 1) AS TRUNC2,
	TRUNC(1234.5678, 2) AS TRUNC3,
	TRUNC(1234.5678, -1) AS TRUNC4,
	TRUNC(1234.5678, -2) AS TRUNC5
FROM
	DUAL;

SELECT
	CEIL(3.14),
	FLOOR(3.14),
	CEIL(-3.14),
	FLOOR(-3.14)
FROM
	DUAL;

SELECT MOD(15,6), MOD(10,2), MOD(11,2)
FROM DUAL;


-- 날짜함수
-- 오늘날짜/시간 : SYSDATE
-- 몇개월 이후 날짜 구하기 : ADD_MONTHS()
-- 두 날짜 간의 개월 수 차이 구하기 : MONTHS_BETWEEN
-- 돌아오는 요일, 달의 마지막 날짜 구하기 : NEXT_DAY() / LAST_DAY()
SELECT
	SYSDATE AS NOW,
	SYSDATE - 1 YESTERDAY,
	SYSDATE + 1 AS TOMORROW,
	CURRENT_DATE AS CURRENT_DATE,
	CURRENT_TIMESTAMP AS CURRENT_TIMESTAMP
FROM
	DUAL;

-- 오늘날짜를 기준으로 3개월 이후 날짜 구하기
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- 입사한지 40년 넘은 사원 조회
SELECT *
FROM EMP e
WHERE ADD_MONTHS(E.HIREDATE, 480) < SYSDATE;

-- 오늘날짜와 입사일자의 차이 구하기
SELECT
	e.EMPNO,
	e.ENAME,
	e.HIREDATE,
	SYSDATE,
	MONTHS_BETWEEN(e.HIREDATE, SYSDATE) AS month1,
	MONTHS_BETWEEN(SYSDATE, e.HIREDATE) AS month2,
	TRUNC(MONTHS_BETWEEN(e.HIREDATE, SYSDATE)) AS month3
FROM
	EMP e;

SELECT
	SYSDATE,
	NEXT_DAY(SYSDATE, '월요일'),
	LAST_DAY(SYSDATE)
FROM
	DUAL;

-- 자료형을 변환하는 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자열 데이터로 반환
-- TO_NUMBER() : 문자열 데이터를 숫자 데이터로 반환
-- TO_DATE() : 문자열 데이터를 날짜 데이터로 반환

-- number + '문자숫자' : 덧셈 가능 (자동형변환)
SELECT e.EMPNO, e.ENAME, e.EMPNO + '500'
FROM EMP e
WHERE e.ENAME  = 'SMITH';

--SELECT e.EMPNO, e.ENAME, e.EMPNO + 'abcd'
--FROM EMP e
--WHERE e.ENAME  = 'SMITH';

SELECT
	sysdate,
	to_char(sysdate, 'YYYY/MM/DD')
FROM
	dual;


SELECT
	sysdate,
	to_char(sysdate, 'MM'),
	to_char(sysdate, 'MON'),
	to_char(sysdate, 'MONTH'),
	to_char(sysdate, 'DD'),
	to_char(sysdate, 'DAY'),
	to_char(sysdate, 'HH24:MI:SS'),
	to_char(sysdate, 'HH12:MI:SS AM'),
	to_char(sysdate, 'HH:MI:SS PM')
FROM
	dual;

-- 9 : 숫자 한자리를 의미
-- 0 : 숫자 한자리를 의미(빈자리를 0으로 채움)
SELECT e.SAL, TO_CHAR(e.SAL, '$999,999'), TO_CHAR(e.SAL, '$000,999,999')
FROM EMP e


-- 문자열 데이터와 숫자 데이터 연산
SELECT 1300-'1500', 1300 + '1500'
FROM dual;

SELECT '1300' - '1500'
FROM dual;

-- ORA-01722: 수치가 부적합합니다
SELECT '1,300' - '1,500'
FROM dual;

-- TO_NUMBER('문자열데이터','인식할숫자형태')
SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999')
FROM dual;


-- TO_DATE() : 문자열데이터 => 날짜형식으로 변경
SELECT
	TO_DATE('2025-03-20', 'YYYY-MM-DD') AS date1,
	TO_DATE('2025-03-20', 'YYYY/MM/DD') AS date2
FROM
	DUAL;


-- NULL
-- 산술연산이나 비교연산자(IS NULL)가 제대로 수행되지 않음
-- 1) NVL(널 여부를 검사할 데티어, 널일때 반한할 데이터)
-- 2) NVL2(널 여부를 검사할 데티어, 널이 아닐때 반환할 데이터, 널일때 반한할 데이터)

SELECT
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.COMM,
	e.SAL + e.COMM,
	NVL(e.COMM, 0),
	e.SAL + nvl(e.COMM, 0)
FROM
	EMP e;


SELECT
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.COMM,
	e.SAL + e.COMM,
	NVL2(e.COMM, 'O', 'X'),
	nvl2(e.COMM, e.SAL *12 + e.COMM, e.SAL*12) AS 연봉
FROM
	EMP e;

-- 자바의 if, switch 구문과 유사
-- DECODE
-- DECODE(검사대상이 될 데이터,
--        조건1, 조건1 만족시 반환할 결과,
--        조건2, 조건2 만족시 반환할 결과,
--        조건1 ~ 조건n 일치하지 않을때 반환할 결과)
-- CASE
-- CASE 검사대상이 될 데이터
--     WHEN 조건1 THEN 조건1 만족시 반환할 결과
--     WHEN 조건2 THEN 조건2 만족시 반환할 결과
--     ELSE 조건1 ~ 조건n 일치하지 않을때 반환할 결과
-- END

-- 직책이 MANAGER 인 사원은 급여의 10% 인상
-- 직책이 SALESMAN 인 사원은 급여의 5% 인상
-- 직책이 ALALYST 인 사원은 동결
-- 나머지는 3% 인상

SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	DECODE(e.JOB, 'MANAGER', e.SAL *1.1,
	'SALESMAN', e.SAL*1.05,
	'ANALYST', e.SAL,
	e.SAL *1.03
	) AS upsal
FROM
	EMP e;
	
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	CASE
		e.JOB
		WHEN 'MANAGER' THEN e.SAL * 1.1
		WHEN 'SALESMAN' THEN e.SAL* 1.05
		WHEN 'ANALYST' THEN e.SAL
		ELSE e.SAL * 1.03
	END AS upsal
FROM
	EMP e;

-- COMM NULL 인 경우 '해당사항없음'
-- COMM 0 인 경우 '수당없음'
-- COMM > 0 인 경우 '수당 : 800'
	
	SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	CASE
		WHEN e.COMM IS NULL THEN '해당사항없음'
		WHEN e.COMM = 0 THEN '수당없음'
		WHEN e.COMM > 0 THEN '수당 : ' || e.COMM
	END AS comm_text
FROM
	EMP e;
	
	
-- [실습]
-- 1. empno7369 => 73**, ename SMITH => S****
-- empno, 마스킹처리empno, ename, 마스킹처리ename

SELECT REPLACE('7369', SUBSTR('7369', 3), '**')
FROM dual;

SELECT
	e.EMPNO,
	REPLACE(e.EMPNO, SUBSTR(e.EMPNO, 3), '**'),
	e.ENAME,
	REPLACE(e.ENAME, SUBSTR(e.ENAME, 2), '****') AS MASKING_ENAME
FROM
	EMP e;

-- RPAD
SELECT
	e.EMPNO,
	RPAD(SUBSTR(e.EMPNO, 1, 2), 4, '*'),
	e.ENAME,
	RPAD(SUBSTR(e.ENAME, 1, 1), 5, '*') AS MASKING_ENAME
FROM
	EMP e;
	

	
-- 2. emp 테이블에서 사원의 월 평균 근무일수는 21일이다.
-- 하루 근무시간을 8시간으로 보았을 때 사원의 하루급여(day_pay)와 시급(time_pay)를
-- 계산하여 출력한다. (단, 하루급여는 소수 셋째자리에서 버리고, 시급은 둘자리에서 반올림)
-- 출력형태) EMPNO, ENAME, SAL, DAY_PAY, TIME_PAY
SELECT
	e.EMPNO,
	e.ENAME,
	e.SAL,
	TRUNC(e.sal / 21, 2) AS DAY_PAY,
	ROUND((e.sal / 21) / 8, 1) AS time_pay
FROM
	EMP e;




-- 3. 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원이 정직원이 되는 날짜(R_JOB)을 YYYY-MM-DD 형식으로 출력한다.
-- 단, 추가수당이 없는 사원의 추가수당은 N/A로 출력
-- EMPNO, ENAME, HIREDATE, R_JOB, COMM
SELECT
	e.EMPNO,
	e.ENAME,
	TO_CHAR(e.hiredate, 'YYYY-MM-DD') AS HIREDATE,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(e.hiredate, 3) -1, '월요일'), 'YYYY-MM-DD') AS R_JOB,
CASE
		WHEN e.comm IS NULL THEN 'N/A'
		ELSE TO_CHAR(e.comm)
	END AS comm
FROM EMP e;




-- 4. 직속상관의 사원번호가 없을 때 : 0000
-- 직속상관의 사원번호 앞 두자리가 75 일때 : 5555
-- 직속상관의 사원번호 앞 두자리가 76 일때 : 6666
-- 직속상관의 사원번호 앞 두자리가 77 일때 : 7777
-- 직속상관의 사원번호 앞 두자리가 78 일때 : 8888
-- 그 외 직속상관 사원 번호일때 : 본래 직속상관 사원번호 그대로 출력
-- 출력형태) EMPNO, ENAME, MGR, CHG_MGR
SELECT
	e.EMPNO,
	e.ENAME,
	e.MGR,
	CASE
		WHEN mgr IS NULL THEN '0000'
		WHEN SUBSTR(e.mgr, 1, 2) = '75' THEN '5555'
		WHEN SUBSTR(e.mgr, 1, 2) = '76' THEN '6666'
		WHEN SUBSTR(e.mgr, 1, 2) = '77' THEN '7777'
		WHEN SUBSTR(e.mgr, 1, 2) = '78' THEN '8888'
		ELSE TO_CHAR(e.mgr)
	END AS CHG_MGR
FROM
		EMP e;

SELECT
	e.EMPNO,
	e.ENAME,
	e.MGR,
	CASE
		WHEN e.mgr IS NULL THEN '0000'
		WHEN e.mgr LIKE '75%' THEN '5555'
		WHEN e.mgr LIKE '76%' THEN '6666'
		WHEN e.mgr LIKE '77%' THEN '7777'
		WHEN e.mgr LIKE '78%' THEN '8888'
		ELSE TO_CHAR(e.mgr)
	END AS CHG_MGR
FROM
		EMP e;



SELECT
	e.EMPNO,
	e.ENAME,
	e.MGR,
	DECODE(SUBSTR(TO_CHAR(e.MGR), 1, 2),
			NULL, '0000',
			'75', '5555',
			'76', '6666',
			'77', '7777',
			'78', '8888',
			SUBSTR(TO_CHAR(e.mgr), 1))
	AS CHG_MGR
FROM
	emp e;




-- 하나의 열에 출력결과를 담는 다중행 함수
-- NULL 행은 제외하고 연산
-- 1. sum() / 2. count() / 3. max() / 4. min() / 5. avg()

--전체사원 급여 합
SELECT
	sum(e.sal)
FROM
	EMP e;

--중복된 급여는 제외한 합
SELECT sum(e.sal), sum(DISTINCT e.sal), sum(ALL e.sal) FROM EMP e;

-- 단일 그룹의 그룹함수가 아닙니다(해결 : GROUP BY 절에 사용한 컬럼만 가능)
--SELECT e.ename,sum(e.sal) FROM emp e;

-- 사원 수
SELECT count(e.empno), COUNT(e.COMM)
FROM EMP e;


-- 급여의 최대값과 최소값
SELECT max(e.sal), MIN(e.SAL)
FROM EMP e;


-- 10번부서 사원 중 급여 최대값
SELECT max(e.sal), MIN(e.SAL)
FROM EMP e
WHERE e.DEPTNO = 10;

-- 20번 부서의 입사일 중 가장 최근 입사일
SELECT MAX(e.HIREDATE)
FROM EMP e 
WHERE e.DEPTNO = 20;

SELECT MIN(e.HIREDATE)
FROM EMP e 
WHERE e.DEPTNO = 20;

-- 부서번호가 30번인 사원의 평균 급여
SELECT AVG(e.SAL)
FROM EMP e
WHERE e.DEPTNO = 30;


-- 결과값을 원하는 열로 묶어 출력 : GROUP BY

-- 부서별 평균 급여
SELECT
	e.DEPTNO,
	AVG(e.SAL)
FROM
	EMP e
GROUP BY
	e.DEPTNO;

-- 부서별, 직책별 평균 급여
SELECT
	e.DEPTNO,
	e.JOB,
	AVG(e.SAL)
FROM
	EMP e
GROUP BY
	e.DEPTNO,
	e.JOB
ORDER BY
	e.DEPTNO;


-- 결과값을 원하는 열로 묶어 출력할 때 조건 추가 : GROUP BY + HAVING

-- 부서별, 직책별 평균 급여 + 평균급여 >= 2000
--WHERE 절 그룹함수 안됨
SELECT
	e.DEPTNO,
	e.JOB,
	AVG(e.SAL) AS 평균급여
FROM
	EMP e
GROUP BY
	e.DEPTNO,
	e.JOB
HAVING
	AVG(e.sal) >= 2000
ORDER BY
	e.deptno;


-- 같은 직무에 종사하는 사원이 3명 이상인 잭책과 인원 수 출력
-- SALESMAN 4
SELECT e.JOB AS 직책, COUNT(e.EMPNO) AS 인원수
FROM EMP e 
GROUP BY e.JOB
HAVING COUNT(e.EMPNO) >= 3
ORDER BY e.JOB;


--사원들의 입사연도를 기준으로부서별로 몇 명이 입사했는지 출력
-- 1987 20 2
-- 1987 30 1
SELECT TO_CHAR(e.HIREDATE, 'YYYY') AS 입사연도, e.DEPTNO, COUNT(e.EMPNO) AS 인원수
FROM EMP e 
GROUP BY TO_CHAR(e.HIREDATE, 'YYYY'), e.DEPTNO
ORDER BY 입사연도, e.DEPTNO;

-- 조인(join)
-- 여러 종류의 데이터를 다양한 테이블에 나누어 저장하기 때문에 여러 테이블의 데이터를 조합하여
-- 출력할 때가 많다. 이때 사용하는 방식이 조인
-- 종류

-- 내부조인(연결 안되는 데이터는 제외) - inner join
-- 1. 등가조인: 각 테이블의 특정 열과 일치하는 데이터를 기준으로 추출
-- 2. 비등가조인 : 등가조인 외의 방식
-- 3. 자체(self)조인 : 같은 테이블끼리 조인

-- 외부조인 : 연결 안되는 데이터 보기 - outer join 
-- 1. 왼쪽 외부조인 (left outer join) : 오른쪽 테이블의 데이터 존재 여부와 상관없이 왼쪽 테이블 기준으로 출력
-- 2. 오른쪽 외부조인 (right outer join) : 왼쪽 테이블의 데이터 존재 여부와 상관없이 오른쪽 테이블 기준으로 출력


-- 사원별 부서정보 조회
SELECT *
FROM EMP e, DEPT d
WHERE e.DEPTNO  = d.DEPTNO;

SELECT e.EMPNO, e.DEPTNO, d.DNAME, d.LOC
FROM EMP e, DEPT d
WHERE e.DEPTNO  = d.DEPTNO;

-- 나올 수 있는 모든 조합 출력
SELECT e.EMPNO, e.DEPTNO, d.DNAME, d.LOC
FROM EMP e, DEPT d;

-- 사원별 부서정보 조회 + 사원별 급여 >= 3000
SELECT
	e.EMPNO,
	e.DEPTNO,
	e.SAL,
	d.DNAME,
	d.LOC
FROM
	EMP e,
	DEPT d
WHERE
	e.DEPTNO = d.DEPTNO
	AND e.SAL >= 3000;

-- 사원별 부서정보 조회 + 사원별 급여 <= 2500 + 사원번호 9999 이하
SELECT
	e.EMPNO,
	e.DEPTNO,
	e.SAL,
	d.DNAME,
	d.LOC
FROM
	EMP e,
	DEPT d
WHERE
	e.SAL <= 2500
	AND e.EMPNO <= 9999;


--비등가조인
-- 사원별 정보 + salgrade grade
SELECT *
FROM EMP e, SALGRADE s
WHERE e.SAL >= s.LOSAL AND e.SAL <= s.HISAL;

SELECT *
FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL;

-- 자체조인
-- 사원정보 + 직속상관 정보
SELECT e1.EMPNO, e1.ENAME, e1.MGR, e2.ENAME AS mgr_ename
FROM EMP e1, EMP e2
WHERE e1.MGR = e2.EMPNO;

-- left outer join
SELECT e1.EMPNO, e1.ENAME, e1.MGR, e2.ENAME AS mgr_ename
FROM EMP e1, EMP e2
WHERE e1.MGR = e2.EMPNO(+);

-- right outer join
SELECT e1.EMPNO, e1.ENAME, e1.MGR, e2.ENAME AS mgr_ename
FROM EMP e1, EMP e2
WHERE e1.MGR(+) = e2.EMPNO;


-- 표준 문법을 사용한 조인
-- join ~ on : inner join
-- JOIN 테이블명 ON 조인하는 조건

-- inner 생략 가능
SELECT
	e.EMPNO,
	e.DEPTNO,
	d.DNAME,
	d.LOC
FROM
	EMP e
JOIN DEPT d
ON
	e.DEPTNO = d.DEPTNO;

SELECT
	*
FROM
	EMP e
JOIN SALGRADE s
ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL;

SELECT
	*
FROM
	EMP e
INNER JOIN SALGRADE s
ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL;


-- left outer join 테이블명 on 조인조건
SELECT
	e1.EMPNO,
	e1.ENAME,
	e1.MGR,
	e2.ENAME AS mgr_ename
FROM
	EMP e1
LEFT OUTER JOIN EMP e2
ON
	e1.MGR = e2.EMPNO;


SELECT
	e1.EMPNO,
	e1.ENAME,
	e1.MGR,
	e2.ENAME AS mgr_ename
FROM
	EMP e1
RIGHT OUTER JOIN EMP e2
ON
	e1.MGR = e2.EMPNO;


SELECT *
FROM EMP e1 JOIN EMP e2 ON e1.EMPNO  = e2.EMPNO JOIN EMP e3 ON e2.EMPNO = e3.EMPNO;


-- 급여가 2000을 초과한 사원의 부서정보, 사원정보 출력
-- 출력) 부서번호, 부서명, 사원번호, 사원명, 급여
SELECT
	d.DEPTNO,
	d.DNAME,
	e.EMPNO,
	e.ENAME,
	e.SAL
FROM
	EMP e
JOIN DEPT d
ON
	e.DEPTNO = d.DEPTNO
WHERE
	e.SAL >= 2000
ORDER BY e.DEPTNO;


-- 모든 부서정보와 사원정보를 부서번호, 사원번호 순서로 정렬하여 출력
-- 출력) 부서번호, 부서명, 사원번호, 사원명, 직무, 급여
SELECT
	d.DEPTNO,
	d.DNAME,
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL
FROM
	EMP e
JOIN DEPT d
ON
	e.DEPTNO = d.DEPTNO
ORDER BY e.DEPTNO, e.EMPNO;




-- 모든 부서정보, 사원정보, 급여등급정보, 각 사원의 직속상관 정보를
-- 부서번호, 사원번호 순서로 정렬하여 출력
-- 출력) 부서번호, 부서명, 사원번호, 사원명, 매니저번호, 급여, losal, hisal, grade, 매니저empno,매니저ename
SELECT
	e1.DEPTNO,
	d.DNAME,
	e1.EMPNO,
	e1.ENAME,
	e1.MGR,
	e1.SAL,
	s.LOSAL,
	s.HISAL,
	s.GRADE,
	e2.empno AS MGR_EMPNO,
	E2.ENAME AS mgr_ename
FROM
	EMP e1
LEFT OUTER JOIN EMP e2 ON
	e1.MGR = e2.EMPNO
JOIN DEPT d ON
	e1.DEPTNO = d.DEPTNO
JOIN SALGRADE s ON
	e1.sal BETWEEN s.LOSAL AND s.HISAL
ORDER BY e1.DEPTNO, e1.EMPNO;


-- 부서별 평균급여, 최대급여, 최소급여, 사원 수 출력
-- 부서번호, 부서명, avg_sal, min_sal, cnt
SELECT
	e.DEPTNO,
	d.DNAME,
	AVG(e.SAL) AS AVG_SAL,
	Max(e.SAL),
	MIN(e.SAL) AS MIN_SAL,
	COUNT(e.EMPNO) AS CNT
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
GROUP BY
	e.DEPTNO,
	d.DNAME;

-- 서브쿼리 : SQL 구문을 실행하는데 필요한 데이터를 추가로 조회하고자 SQL 구문 내부에서 사용하는 SELECT문
-- 연산자 등의 비교 또는 조회 대상 오른쪽에 놓이며 괄호로 묶어서 사용한다
-- 특수한 몇몇 경우를 제외한 대부분의 서브쿼리에서는 order by 절을 사용할 수 없다.
-- 서브쿼리의 select 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정
-- 서브쿼리에 있는 select 문의 결과 행 수는 함께 사용하는 메인 쿼리의 연산자 종류와 어울려야한다.
-- 1) 단일행 서브쿼리 : 실행결과가 행 하나인 서브쿼리
--		연산자 : >,>=,=,<,<=,<>,^=,!=

-- 2) 다중행 서브쿼리 : 실행결과가 여러개의 행인 서브쿼리
--		연산자 : in, any(some), all, exists

-- 3) 다중열 서브쿼리 : 서브쿼리의 SELECT 절에 비교할 데이터를 여러개 지정

-- 이름이 JONES인 사원의 급여보다 높은 급여를 받는 사원 조회

-- JONES의 급여 조회
SELECT sal FROM EMP e WHERE e.ENAME ='JONES';

-- JONES 보다 많이 받는 사원 조회
SELECT * FROM EMP e WHERE e.SAL > 2975;

-- 서브쿼리로 변경
SELECT * FROM EMP e WHERE e.SAL > (SELECT sal FROM EMP e WHERE e.ENAME ='JONES');

-- ALLEN 보다 빨리 입사한 사원 조회
SELECT * FROM EMP e WHERE e.HIREDATE < (SELECT e.HIREDATE  FROM EMP e WHERE e.ENAME ='ALLEN');

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받은 사원정보(사번, 이름, 직무, 급여,)
-- 소속부서정보(부서번호, 부서명, 부서위치) 조회
SELECT
	e.EMPNO, e.ENAME, e.JOB, d.DEPTNO, d.DNAME, d.LOC
FROM
	EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE
	e.DEPTNO = 20
	AND e.SAL > (
	SELECT
		AVG(e.SAL)
	FROM
		emp e);

-- 전체사원의 평균급여보다 적거나 같은 급여를 받는 20번 부서의 정보 조회
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	d.DEPTNO,
	d.DNAME,
	d.LOC
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
WHERE
	e.DEPTNO = 20
	AND e.SAL <= (
	SELECT
		AVG(e.SAL)
		FROM emp e);

-- 다중행 서브쿼리

-- 부서별 최고 급여와 같은 급여를 받는 사원 조회
-- 1) 부서별 최고 급여
SELECT MAX(e.SAL)
FROM EMP e GROUP  BY e.DEPTNO

SELECT * FROM EMP e WHERE e.SAL IN (3000,2850, 5000);

-- 서브쿼리 사용
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL IN (
	SELECT
		MAX(e.SAL)
	FROM
		EMP e
	GROUP BY
		e.DEPTNO);

-- ANY, SOME : 서브쿼리가 반환한 여러 결과값 중 메인 쿼리와 조건식을 사용한 결과가 하나라도 TRUE 라면
--			   메인쿼리 조건식을 TRUE로 반환

-- IN과 같은 효과를 = ANY(OR = SOME)로 가능 (IN을 더 많이 사용함)
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL = ANY (
	SELECT
		MAX(e.SAL)
	FROM
		EMP e
	GROUP BY
		e.DEPTNO);

-- < ANY, <SOME

-- 30번 부서의 (최대)급여보다 적은 급여를 받는 사원조회
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL < ANY (SELECT max(e.sal) FROM EMP e WHERE e.DEPTNO = 30)
ORDER BY e.SAL, e.EMPNO;

SELECT
	*
FROM
	EMP e
WHERE
	e.SAL < ANY (SELECT e.sal FROM EMP e WHERE e.DEPTNO = 30)
ORDER BY e.SAL, e.EMPNO;

-- 30번 부서의 급여보다 적은 급여를 받는 사원조회(다중행)
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL < ANY (SELECT e.sal FROM EMP e WHERE e.DEPTNO = 30)
ORDER BY e.SAL, e.EMPNO;

-- ALL : 서브쿼리의 모든 결과가 조건식에 맞아 떨어져야만 메인쿼리의 조건식이 TRUE

-- 30번 부서의 최소급여보다 적은 급여를 받는 사원조회(단일행)
SELECT * FROM EMP e  WHERE e.SAL <(SELECT MIN(e.sal) FROM EMP e WHERE e.DEPTNO = 30);

-- 30번 부서의 급여보다 적은 급여를 받는 사원조회(다중행)
SELECT * FROM EMP e  WHERE e.SAL < ALL (SELECT e.sal FROM EMP e WHERE e.DEPTNO = 30);


-- EXISTS : 서브쿼리에 결과값이 하나 이상 있으면 조건식이 모두 TRUE, 없으면 FALSE
SELECT * FROM EMP e WHERE EXISTS (SELECT dname FROM DEPT d WHERE DEPTNO=10);

SELECT * FROM EMP e WHERE EXISTS (SELECT dname FROM DEPT d WHERE DEPTNO=50);


-- 비교할 열이 여러개인 다중열 서브쿼리

-- 부서별 최고 급여와 같은 급여를 받는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	(e.DEPTNO,
	e.SAL) IN (
	SELECT
		e.DEPTNO ,
		MAX(e.SAL)
	FROM
		EMP e
	GROUP BY
		e.DEPTNO);

-- SELECT 절에 사용하는 서브쿼리 (결과가 반드시 하나만 반환)
-- 사원정보, 급여등급, 부서명 조회(join)
SELECT
	e.EMPNO,
	e.JOB,
	e.SAL,
	(
	SELECT
		s.GRADE
	FROM
		SALGRADE s
	WHERE
		e.SAL BETWEEN s.LOSAL AND s.HISAL) AS salgrade,
	e.DEPTNO,
	(
	SELECT
		d.DNAME
	FROM
		DEPT d
	WHERE
		e.DEPTNO = d.DEPTNO) AS dname
FROM
	EMP e;


-- 10번 부서에 근무하는 사원 중 30번 부서에 없는 직책인 사원의 사원정보(사번, 이름, 직무)
-- 부서정보(부서번호, 부서명, 위치) 조회
SELECT e.EMPNO, e.ENAME, e.JOB, d.DEPTNO, d.DNAME, d.LOC
FROM EMP e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO = 10
AND e.JOB NOT IN (SELECT DISTINCT job FROM emp WHERE deptno = 30);


-- 직책이 SALESMAN 인 사람의 최고급여보다 많이 받는 사람의 사원정보, 급여등급정보를 조회
-- 다중행 함수를 사용하는 방법과 사용하지 않는 방법 2가지로 작성
-- 출력 : 사번, 이름, 급여, 등급

-- 다중행 함수를 사용하지 않는 방법
SELECT e.EMPNO, e.ENAME, e.SAL, s.GRADE
FROM EMP e JOIN SALGRADE s ON e.SAL BETWEEN s.LOSAL AND s.HISAL
WHERE e.SAL > (SELECT MAX(sal) FROM EMP e WHERE JOB = 'SALESMAN');

-- 다중행 함수 사용
SELECT e.EMPNO, e.ENAME, e.SAL, s.GRADE
FROM EMP e JOIN SALGRADE s ON e.SAL  BETWEEN s.LOSAL AND s.HISAL
WHERE e.SAL > ALL (SELECT sal FROM emp WHERE job = 'SALESMAN') ORDER BY e.EMPNO;


-- C(Insert) : 삽입

-- INSERT INTO 테이블명(필드명, 필드명, ....)
-- VALUES(값1, 값2...)

-- 필드명 생략은 테이블의 현재 열 순서대로 나열되었다고 가정하고 
-- 데이터 처리

-- 기본 테이블 복사 후 새 테이블로 생성
CREATE TABLE dept_temp AS SELECT * FROM dept;

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP
VALUES(60, 'NETWORK', 'BUSAN');

-- 값의 수가 충분하지 않습니다
-- 값의 수가 너무 많습니다
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES('NETWORK', 'BUSAN', 'NETWORK', 'BUSAN');

-- 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
-- Number(2,0)
INSERT INTO DEPT_TEMP
VALUES(600, 'NETWORK', 'BUSAN');


-- null
INSERT INTO DEPT_TEMP
VALUES(80, 'NETWORK', null);

INSERT INTO DEPT_TEMP(deptno, dname)
VALUES(90, 'NETWORK');

-- 열구조만 복사 후 새 테이블 생성
CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1<>1;

-- 날짜데이터 삽입 : 'YYYY-MM-DD' or 'YYYY/MM/DD'
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(3111, '성춘향', 'MANAGER', 9999, sysdate, 4000, NULL, 30)

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9999, '홍길동', 'PRESIDENT', null, '2020-12-13', 5000, 1000, 10)


-- emp, salgrade 급여 등급이 1인 사원들만 emp_temp 추가하기
INSERT
	INTO
	EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT
	e.*
FROM
	EMP e
JOIN SALGRADE s ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL
	AND s.GRADE = 1;


-- U(Update)
-- update 테이블명
-- set 변경할 열= 값, 변경할 열 = 값....
-- where 데이터를 변경할 대상 행을 선별하는 조건 나열

-- 90번 부서의 loc SEOUL 변경
UPDATE DEPT_TEMP
SET LOC = 'SEOUL'
WHERE DEPTNO = 90;

UPDATE DEPT_TEMP
SET LOC = 'SEOUL';

-- COMMIT;
-- ROLLBACK;

-- 40번 부서의 부서명, 위치 변경
-- DEPT 테이블 40번 부서랑 동일
UPDATE DEPT_TEMP
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

-- 50번 부서의 DNAME, LOC 변경
UPDATE DEPT_TEMP
SET LOC= 'BOSTON', DNAME= 'SALES'
WHERE DEPTNO  = 50;

-- Delete : 삭제
-- DELETE FROM 테이블명 
-- WHERE 삭제할 조건

-- DELETE 테이블명 
-- WHERE 삭제할 조건

-- 70번 부서 삭제
DELETE FROM DEPT_TEMP 
WHERE deptno = 70;

-- loc 가 SEOUL 데이터 삭제
DELETE DEPT_TEMP WHERE loc= 'SEOUL';


DELETE EMP_TEMP 
WHERE SAL >= 3000;

DELETE EMP_TEMP;

CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

-- EXAM_DEPT 테이블에 다음 데이터를 삽입하기
-- 50, ORACLE, BUSAN
-- 60, SQL, ILSAN
-- 70, SELECT, INCHEON
-- 90, DML, BUNDANG
INSERT INTO EXAM_DEPT (DEPTNO, DNAME, LOC) VALUES (50, 'ORACLE', 'BUSAN');
INSERT INTO EXAM_DEPT (DEPTNO, DNAME, LOC) VALUES (60, 'SQL', 'ILSAN');
INSERT INTO EXAM_DEPT (DEPTNO, DNAME, LOC) VALUES (70, 'SELECT', 'INCHEON');
INSERT INTO EXAM_DEPT (DEPTNO, DNAME, LOC) VALUES (90, 'DML', 'BUNDANG');

-- EXAM_EMP 테이블에 다음 데이터 삽입하기
-- 7201, USER1, MANAGER, 7788, 2016-02-01, 4500, NULL, 50
-- 7202, USER2, CLERK, 7201, 2016-02-16, 1800, NULL, 50
-- 7203, USER3, ANALYST, 7201, 2016-04-11, 3400, NULL, 60
-- 7204, USER4, SALESMAN, 7788, 2016-05-31, 2700, 300, 60
-- 7205, USER5, CLERK, 7201, 2016-07-20, 2600, NULL, 70
-- 7206, USER6, CLERK, 7201, 2016-09-08, 2600, NULL, 70
-- 7207, USER7, LECTURER, 7201, 2016-10-28, 2300, NULL, 80
-- 7208, USER8, STUDENT, 7201, 2018-03-09, 1200, NULL, 80
INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7201, 'USER1', 'MANAGER', 7788, TO_DATE('2016-02-01', 'YYYY-MM-DD'), 4500, NULL, 50);

INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7202, 'USER2', 'CLERK', 7201, TO_DATE('2016-02-16', 'YYYY-MM-DD'), 1800, NULL, 50);

INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7203, 'USER3', 'ANALYST', 7201, TO_DATE('2016-04-11', 'YYYY-MM-DD'), 4500, NULL, 60);

INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7204, 'USER4', 'SALESMAN', 7788, TO_DATE('2016-05-31', 'YYYY-MM-DD'), 2700, 300, 60);

INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7205, 'USER5', 'CLERK', 7201, TO_DATE('2016-07-20', 'YYYY-MM-DD'), 2600, NULL, 70);

INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7206, 'USER6', 'CLERK', 7201, TO_DATE('2016-09-08', 'YYYY-MM-DD'), 2600, NULL, 70);

INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7207, 'USER7', 'LECTURER', 7201, TO_DATE('2016-10-28', 'YYYY-MM-DD'), 2300, NULL, 80);

INSERT INTO EXAM_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7208, 'USER8', 'STUDENT', 7201, TO_DATE('2018-03-09', 'YYYY-MM-DD'), 1200, NULL, 80);




-- EXAM_EMP 에서 50번 부서에서 근무하는 사원의 평균 급여보다 많이 받는 사원을
-- 70번 부서로 옮기는 SQL 구문 작성
UPDATE
	EXAM_EMP
SET
	DEPTNO = 70
WHERE
	SAL > (
	SELECT
		AVG(SAL)
	FROM
		EXAM_EMP
	WHERE
		DEPTNO = 50);



-- EXAM_EMP 에서 입사일이 가장 빠른 60번 부서 사원보다 늦게 입사한 사원의
-- 급여를 10% 인상하고 80번 부서로 옮기는 SQL 구문 작성
UPDATE
	EXAM_EMP
SET
	SAL = SAL * 1.1, 
DEPTNO = 80
WHERE
	HIREDATE > (
	SELECT
		MIN(HIREDATE)
	FROM
		EXAM_EMP
	WHERE
		DEPTNO = 60)
	AND DEPTNO = 60;


-- EXAM_EMP 에서 급여 등급이 5인 사원을 삭제하는 SQL 구문 작성
DELETE
FROM
	EXAM_EMP
WHERE
	EMPNO IN(
SELECT e.EMPNO FROM EXAM_EMP e 
JOIN EXAM_SALGRADE s 
ON e.sal BETWEEN s.losal AND s.HISAL
WHERE s.grade = 5);

DELETE EXAM_DEPT;
DELETE EXAM_EMP;


-- 트랜젝션 : ALL or NOTHING (전부 실행 or 전부 취소)
-- DML(데이터 조작어) - INSERT, UPDATE, DELETE

-- COMMIT(전부 실행) / ROLLBACK(전부 취소)

INSERT INTO DEPT_TEMP VALUES(30, 'DATABASE', 'SEOUL');
UPDATE DEPT_TEMP SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TEMP WHERE DNAME = 'RESEARCH';

ROLLBACK;
COMMIT;

-- 세션 : 데이터베이스 접속 후 작업을 수행한 후 접속을 종료하기까지 전체 기간

SELECT *FROM EMP e;

DELETE FROM DEPT_TEMP WHERE deptno = 30;
COMMIT;


-- DDL(데이터 정의어) : 객체를 생성, 변경, 삭제
-- 1. 테이블 생성 : CREATE
-- 2. 		 변경 : ALTER
-- 3. 		 삭제 : DROP
-- 4. 테이블 전체 데이터 삭제 : TRUNCATE
-- 5. 테이블 이름 변경 : RENAME

--CREATE TABLE 테이블명(
--	컬럼명1 자료형, 
--	컬럼명2 자료형, 
--	컬럼명3 자료형
--)

-- 테이블명 규칙
-- 문자로 시작 (영문자, 한글, 숫자 가능)
-- 테이블 이름은 30바이트 이하
-- 같은 사용자 안에서는 테이블명 중복 불가
-- SQL 예약어(SELECT, FROM...)는 테이블 이름으로 사용할 수 없음

-- VARCHAR2(14) : 영어 14문자, 한글 4문자
-- NUMBER(7,2) : 전체자리수 7(소수점이 2자리 포함)

CREATE TABLE DEPT_DDL(
	DEPTNO NUMBER(2,0),
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13)
);

CREATE TABLE EMP_DDL(
	EMPNO NUMBER(4,0),
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4,0),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2,0)
);

-- 기존 테이블 구조와 데이터를 이용한 새 테이블 생성
CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;

-- 기존 테이블 구조만 이용해 새 테이블 생성
CREATE TABLE EXAM_EMP AS SELECT * FROM EMP WHERE 1<>1;

-- ALTER : 테이블 변경
-- 1) 열 추가
-- 2) 열 이름 변경
-- 3) 열 자료형 변경
-- 4) 특정 열 삭제

-- HP 열 추가
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

-- HP => TEL 변경
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

-- EMPNO 자리수 4 => 5 변경
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

ALTER TABLE EMP_DDL MODIFY ENAME VARCHAR2(8);
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(3);

-- 정도 또는 자리수를 축소할 열은 비어 있어야 합니다
-- ALTER TABLE EMP_TEMP MODIFY EMPNO NUMBER(3);

-- 특정 열 삭제 
ALTER TABLE EMP_DDL DROP COLUMN TEL;

-- 테이블 이름 변경
RENAME EMP_DDL TO EMP_RENAME;

-- 테이블 데이터 삭제
-- DELETE FROM EMP_RENAME;

-- ROLLBACK 안됨
TRUNCATE TABLE EMP_RENAME;

-- TABLE 제거
DROP TABLE EMP_RENAME;


-- MEMBER 테이블 생성하기
-- id varchar2(8) / name varchar(10) / addr varchar(50) / email 30 / age number(4)
CREATE TABLE MEMBER(
ID VARCHAR2(8),
NAME VARCHAR2(10),
ADDR VARCHAR2(50),
EMAIL VARCHAR2(30),
AGE NUMBER(4)
);

-- insert(remark X)
INSERT INTO MEMBER(id,name,ADDR,EMAIL,age)
VALUES ('hong123', '홍길동','서울시 종로구','hong123@naver.com',24);




-- Member 테이블 열 추가
-- bigo 열 추가 (문자열, 20)
ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);


-- bigo 열 크기 30으로 변경
ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);


-- bigo 열 이름을 remark 로 변경
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

-- 오라클 객체
-- 1. 오라클 데이터베이스 테이블
-- 	1) 사용자 테이블
-- 	2) 데이터 사전 - 중요한 데이터(사용자, 권한, 메모리, 성능...) : 일반 사용자가 접근하는 곳은 아님
--		USER_*, ALL_*,DBA_*,V$_*
-- 2. 인덱스 : 검색을 빠르게 처리
-- 	1) FULL SCAN
-- 	2) INDEX SCAN
-- 3. VIEW : 가상 테이블
-- 		물리적으로 저장된 테이블은 아님
-- 4. 시퀀스 : 규칠에 따라 순번을 생성



SELECT * FROM DICT; 

-- SCOTT 계정이 가진 TABLE 조회
SELECT TABLE_NAME
FROM USER_TABLES;


-- 인덱스 조회
SELECT * FROM USER_INDEXES;

-- 인덱스 생성
-- CREATE INDEX 인덱스명 ON 테이블명(열이름 ASC OR DESC, 열이름 ...)

CREATE INDEX IDX_EMP_TEMP_SAL ON EMP_TEMP(SAL);

-- 인덱스 삭제
DROP INDEX IDX_EMP_TEMP_SAL;

-- 뷰
-- 권한을 가진 사용자만 생성 가능
-- 보안성 : 특정 열을 노출하고 싶지 않을 때
-- 편리성 : select 문의 복잡도 완화
-- CREATE VIEW 뷰이름(열이름1, 열이름2...) AS (저장할 SELECT 구문)

CREATE VIEW vw_emp20 AS (
SELECT
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 20);

DROP VIEW VW_EMP20;

-- 시퀀스 : 오라클 데이터베이스에서 특정 규칙에 따른 연속 숫자를 생성하는 객체
-- 게시판 번호, 멤버 번호....

-- CREATE SEQUENCE 시퀀스명;
CREATE SEQUENCE board_seq;

-- CREATE SEQUENCE SCOTT.BOARD_SEQ
-- INCREMENT BY 1 (시퀀스에서 생성할 번호의 증가값 : 기본값 1)
-- MINVALUE 1 (시퀀스에서 생성할 번호의 최소값 : 기본값 NOMINVALUE(1 - 오름차순))
-- MAXVALUE 9999999999999999999999999999 (시퀀스에서 생성할 번호의 최대값)
-- NOCYCLE (1 ~ MAXVALUE 번호가 다 발생된 후에 새로운 번호 요청 시 에러 발생시킴) | CYCLE(1~MAXVALUE 번호가 다 발행된 후에 다시 1부터)
-- CACHE 20 (시퀀스가 생성할 번호를 메모리에 미리 할당해 놓을 개수를 지정) | NOCACHE
-- NOORDER

-- MEMBER 테이블에 NO 칼럼(NUMBER) 추가
ALTER TABLE MEMBER 
ADD NO NUMBER(20);


-- MEMBER NO 값은 시퀀스 값으로 입력하기
-- 사용할 시퀀스 생성
CREATE SEQUENCE MEMBER_SEQ;

INSERT INTO MEMBER(NO, id,name,ADDR,EMAIL,age)
VALUES (MEMBER_SEQ.NEXTVAL,'hong123', '홍길동','서울시 종로구','hong123@naver.com',24);

-- CURRVAL : 가장 마지막으로 생성된 시퀀스 확인
-- 시퀀스명.NEXTVAL : 시퀀스 발행
SELECT MEMBER_SEQ.CURRVAL
FROM DUAL;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 10
START WITH 10
MAXVALUE 90
NOCYCLE CACHE 2;

CREATE TABLE DEPT_SEQUENCE AS SELECT * FROM DEPT WHERE 1<>1;

INSERT INTO DEPT_SEQUENCE VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE','SEOUL');
SELECT * FROM DEPT_SEQUENCE;

-- 마지막 발행 시퀀스 확인
SELECT SEQ_DEPT_SEQUENCE.CURRVAL
FROM DUAL;

-- 시퀀스 수정
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 3
MAXVALUE 99
CYCLE;

-- 시퀀스 제거
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE SEQ_DEPT_SEQUENCE;



-- 제약조건(★) : 테이블에 저장할 데이터를 제약하는 특수한 규칙
-- 1) NOT NULL : 빈 값을 허용하지 않음
-- 2) UNIQUE : 중복 불가
-- 3) PRIMARY KEY(PK) : 유일하게 하나만 존재
-- 4) FOREIGN KEY(FK) : 다른 테이블과 관계 맺기
-- 5) CHECK : 데이터 형태와 범위를 지정
-- 6) DEFAULT : 기본값 설정

CREATE TABLE tbl_notnull(
	LOGIN_ID VARCHAR2(20) NOT NULL,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARcHAR2(20)
);

--ORA-01400: NULL을 ("SCOTT"."TBL_NOTNULL"."LOGIN_PWD") 안에 삽입할 수 없습니다
INSERT INTO TBL_NOTNULL(LOGIN_ID,lOGIN_PWD,TEL)
VALUES('hong123', NULL,'010-1234-5678');

INSERT INTO TBL_NOTNULL(LOGIN_ID,lOGIN_PWD)
VALUES('hong123','hong123');

INSERT INTO TBL_NOTNULL(LOGIN_ID,lOGIN_PWD,TEL)
VALUES('hong123', NULL,'010-1234-5678');

-- 제약조건 이름 직접 지정
CREATE TABLE tbl_notnull2(
	LOGIN_ID VARCHAR2(20) CONSTRAINT TALNN2_LOGID_NN NOT NULL,
	LOGIN_PWD VARCHAR2(20) CONSTRAINT TALNN2_LOGPWD_NN NOT NULL,
	TEL VARcHAR2(20)
);


-- 이미 생성된 테이블에 제약조건 지적은 가능하나 이미 삽입된 데이터가
-- 제약 조건을 만족해야한다.
-- TBL_NOTNULL TEL 칼럼을 NOT NULL 로 변경
ALTER TABLE TBL_NOTNULL MODIFY (tel NOT null);

UPDATE TBL_NOTNULL tn 
SET tel = '010-2345-5678'
WHERE LOGIN_ID = 'hong123';


ALTER TABLE TBL_NOTNULL2 MODIFY (tel CONSTRAINT TALNN2_TEL_NN NOT null);
-- 제약조건 이름 변경
ALTER TABLE TBL_NOTNULL2 RENAME CONSTRAINT  TALNN2_TEL_NN TO TBL_NN2_TEL_NN;
-- 제약조건 삭제
ALTER TABLE TBL_NOTNULL2 DROP CONSTRAINT TBL_NN2_TEL_NN;

-- UNIQUE : 데이터의 중복을 허용하지 않음
--			NULL 은 중복 대상에서 제외됨
CREATE TABLE TBL_UNIQUE(
	LOGIN_ID VARCHAR2(20) UNIQUE,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARcHAR2(20)
);

-- 데이터 무결성
-- 데이터베이스에 저장되는 데이터의 정확성과 일치성 보장
-- DML 과정에서 지켜야하는 규칙

-- 무결성 제약 조건(SCOTT.SYS_C008360)에 위배됩니다
INSERT INTO TBL_UNIQUE(LOGIN_ID,lOGIN_PWD,TEL)
VALUES('hong123', 'pw123','010-1234-5678');

INSERT INTO TBL_UNIQUE(LOGIN_ID,lOGIN_PWD,TEL)
VALUES(null, 'pw123','010-1234-5678');

ALTER TABLE TBL_UNIQUE MODIFY (tel UNIQUE);

UPDATE TBL_UNIQUE tu 
SET tel = NULL;

-- 유일하게 하나만 있는 값 : PRIMARY KEY
-- PK : NOT NULL + UNIQUE 
-- 		컬럼 하나만 지정 가능

CREATE TABLE TBL_PK(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARcHAR2(20)
);

CREATE TABLE TBL_PK2(
	LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LGN_ID_PK PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARcHAR2(20)
);

INSERT INTO TBL_PK(LOGIN_ID,lOGIN_PWD,TEL)
VALUES('hong123', 'pw123','010-1234-5678');

-- 다른 테이블과 관계를 맺는 키 : 외래키(FK)
-- join 구문 EMP(DEPTNO), DEPT(DEPRNO)
-- emp 테이블에 deptno 는 dept 테이블의 deptno 값을 참조해서 삽입

-- 부서 테이블 생성 (참조 대상이 되는 테이블 먼저 작성)
CREATE TABLE DEPT_FK(
DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK(
	EMPNO NUMBER(4) CONSTRAINT EMP_FK_EMPNO_PK PRIMARY KEY,
	ENAME VARCHAR2(10) NOT NULL,
	JOB VARCHAR2(9) NOT NULL,
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2) NOT NULL,
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)
);

-- 무결성 제약조건(SCOTT.EMPFK_DEMPNO_FK)이 위배되었습니다-부모 키가 없습니다
INSERT INTO EMP_FK(EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTNO)
VALUES(9999,'TEST1','PARTNER',SYSDATE,2500,10);

-- INSERT 시 주의점
-- 1) 참조하는 대상이 되는 테이블(부모)의 데이터 삽입
-- 2) 참조하는 데이블(자식)의 데이터 삽입

INSERT INTO DEPT_FK VALUES(10,'DATABASE', 'SEOUL');
INSERT INTO EMP_FK (EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTNO)
VALUES(9999,'TEST1','PARTNER',SYSDATE,2500,10);

-- 무결성 제약조건(SCOTT.EMPFK_DEMPNO_FK)이 위배되었습니다 - 자식 레코드가 발견되었습니다

DELETE FROM EMP_FK  WHERE EMPNO = 9999;
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

-- DELETE 시 주의점
-- 1) 참조하는 테이블(자식)의 데이터 삭제
-- 2) 참조 대상이 되는 테이블(부모)의 데이터 삭제

-- 옵션설정
-- 1) ON DELETE CASCADE : 부모 삭제 시 자식도 같이 삭제
-- 2) ON DELETE SET NULL : 부모 삭제 시 자식의 연결된 자식의 부모를 NULL로 변경

CREATE TABLE EMP_FK2(
	EMPNO NUMBER(4) CONSTRAINT EMP_FK_EMPNO_PK2 PRIMARY KEY,
	ENAME VARCHAR2(10) NOT NULL,
	JOB VARCHAR2(9) NOT NULL,
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7, 2) NOT NULL,
	COMM NUMBER(7, 2),
	DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK2 REFERENCES DEPT_FK(DEPTNO) ON DELETE CASCADE
);

INSERT INTO DEPT_FK VALUES(20,'NETWORK', 'BUSAN');
INSERT INTO EMP_FK2 (EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTNO)
VALUES(9999,'TEST1','PARTNER',SYSDATE,2500,20);
-- 부모 삭제 시 자식도 같이 삭제됨
DELETE FROM DEPT_FK WHERE DEPTNO = 20;

CREATE TABLE EMP_FK3(
	EMPNO NUMBER(4) CONSTRAINT EMP_FK_EMPNO_PK3 PRIMARY KEY,
	ENAME VARCHAR2(10) NOT NULL,
	JOB VARCHAR2(9) NOT NULL,
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7, 2) NOT NULL,
	COMM NUMBER(7, 2),
	DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK3 REFERENCES DEPT_FK(DEPTNO) ON DELETE SET NULL
);

INSERT INTO DEPT_FK VALUES(20,'NETWORK', 'BUSAN');
INSERT INTO EMP_FK3 (EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTNO)
VALUES(9999,'TEST1','PARTNER',SYSDATE,2500,20);
-- 부모 삭제 시 자식의 부서는 NULL로 변경됨
DELETE FROM DEPT_FK WHERE DEPTNO = 20;























































