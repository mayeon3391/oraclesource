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

-- 개발자 : CR(Read)UD
--SQL(Structured Query Language : 구조질의 언어) : RDBMS 데이터를 다루는 단어 

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









