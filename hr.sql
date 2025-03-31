-- employees (scott의 emp 동일개념)
-- first_name, last_name, job_id 조회
SELECT e.first_name, e.last_name, e.job_id
FROM EMPLOYEES e;

-- job_id 중복제외 후 조회
SELECT DISTINCT e.job_id FROM employees e;

-- 사번이 176인 사원의 last_name과 부서번호 조회
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	e.EMPLOYEE_ID = 176;


-- 급여가 12000 이상되는 사원의 last_name과 급여 조회
SELECT e.LAST_NAME, e.SALARY
FROM EMPLOYEES e
WHERE e.SALARY >= 12000;



-- 급여가 5000 ~ 12000 범위가 아닌 사원의 last_name과 급여 조회
SELECT e.LAST_NAME, e.SALARY
FROM EMPLOYEES e
WHERE (e.SALARY >= 5000 AND e.e.SALARY <=12000);

--BETWEEN A AND B
SELECT e.LAST_NAME, e.SALARY
FROM EMPLOYEES e
WHERE e.SALARY NOT BETWEEN 5000 AND 12000;


SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.SALARY < 5000
	OR e.SALARY > 12000;


-- In
-- 20, 50 번 부서에 근무하는 사원 조회(LAST_NAME, 부서번호), LAST_NAME 오름차순
SELECT
	e.LAST_NAME ,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN (20, 50)
ORDER BY
	e.LAST_NAME ASC;


-- SALARY가 2500, 3500, 7000 이 아니며, 직무가 SA_CLERK 가 아닌 사원 조회
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.SALARY NOT IN (2500, 3500, 7000)
	AND e.JOB_ID NOT IN ('SA_CLERK');

-- 날짜 데이터 '' 사용
-- 고용일이 2014년인 사원 조회(2014-01-01 ~ 2014-12-31)
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.HIRE_DATE >= '2014-01-01'
	AND e.HIRE_DATE <= '2014-12-31';

SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.HIRE_DATE BETWEEN '2014-01-01' AND '2014-12-31';

--LIKE
-- LAST_NAME 에 u가 포함되는 사원들의 사번, last_name 조회
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%u%';


--LAST_NAME의 4번째 글자가 a인 사원들의 사번, last_name 조회
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '___a%';


-- LAST_NAME에 a 혹은 e 글자가 있는 사원들의 사번, last_name 조회(last_name 내림차순)
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%a%'
	OR e.LAST_NAME LIKE '%e%'
ORDER BY
	e.LAST_NAME DESC;


-- LAST_NAME에 a 와 e 글자가 있는 사원들의 사번, last_name 조회(last_name 내림차순)

SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%a%e%'
	AND e.LAST_NAME LIKE '%e%a%'
ORDER BY
	e.LAST_NAME DESC;


-- IS NULL
-- 매니저가 없는 사원들의 LAST_NAME, JOB_ID 조회
SELECT
	e.LAST_NAME,
	e.JOB_ID
FROM
	EMPLOYEES e
WHERE
	e.MANAGER_ID IS NULL;

--ST_CLERK인 직업을 가진 사원이 없는 부서 번호 조회(단, 부서번호가 널 값인 부서 제외)
SELECT
	DISTINCT e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	e.JOB_ID != 'ST_CLERK'
	AND e.DEPARTMENT_ID IS NOT NULL;

--COMMISSION_PCT가 NILL이 아닌 사원들 중에서 COMMISSION=SALARY * COMMISSION_PCT를 구한다
--계산결과와 함께 사번, FIRST_NAME, JOB_ID 출력
SELECT
	e.EMPLOYEE_ID,
	e.FIRST_NAME,
	e.JOB_ID,
	e.SALARY * e.COMMISSION_PCT AS COMMISSION
FROM
	EMPLOYEES e
WHERE
	e.COMMISSION_PCT IS NOT NULL;


-- FIRST_NAME 이 'Curtis' 인 사람의 fist_name 과 last_name, email,phone_number, job_id 조회
-- 단, job_id 결과는 소문자로 출력한다.
SELECT
	e.FIRST_NAME,
	e.LAST_NAME,
	e.EMAIL,
	e.PHONE_NUMBER,
	LOWER(e.JOB_ID)
FROM
	EMPLOYEES e
WHERE
	e.FIRST_NAME LIKE 'Curtis';


-- 부서번호가 60,70,80,90 인 사원들의 사번,fist_name,last_name,hire_data,job_id 조회
-- 단, job_id가 IT_PROG인 사원의 경우 '프로그래머' 로 변경하여 출력한다.
SELECT
	e.EMPLOYEE_ID,
	e.FIRST_NAME,
	e.LAST_NAME,
	e.HIRE_DATE,
	REPLACE(e.JOB_ID , 'IT_PROG', '프로그래머')
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN(60, 70, 80, 90);



-- job_id가 AD_PRES, PU_CLERK인 사원들의 사번,fist_name,last_name,부서번호,job_id 조회
-- 단 사원명은 first_name, last_name을 연결하여 출력한다 (예 Douglas Grant)
SELECT
	e.EMPLOYEE_ID,
	e.FIRST_NAME || ' ' || e.LAST_NAME AS name,
	e.DEPARTMENT_ID,
	e.JOB_ID
FROM
	EMPLOYEES e
WHERE
	e.JOB_ID IN('AD_PRES', 'PU_CLERK');


-- 입사 10주년이 되는 날짜 출력
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.HIRE_DATE, ADD_MONTHS(e.HIRE_DATE, 120)
FROM EMPLOYEES e;


-- 회사 내의 최대연봉과 최소연봉의 차이 조회
SELECT
	MAX(e.SALARY) - MIN(e.SALARY) AS SALARY_DIFFERENCE
FROM
	EMPLOYEES e;

-- 매니저로 근무하는 사원들 숫자 조회
SELECT
	COUNT(DISTINCT e.MANAGER_ID)
FROM
	EMPLOYEES e;

-- 부서별 직원 수 조회(부서번호 오름차순)
-- 부서번호 직원수
SELECT e.DEPARTMENT_ID , COUNT(e.EMPLOYEE_ID) AS 직원수
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID 
ORDER BY e.DEPARTMENT_ID ;


-- 부서별 평균연봉 조회(부서번호 오름차순)
-- 부서번호 평균연봉(2215.45 => 2215)
SELECT e.DEPARTMENT_ID , FLOOR(AVG(e.SALARY)) AS 평균연봉
FROM EMPLOYEES e 
GROUP  BY e.DEPARTMENT_ID 
ORDER BY e.DEPARTMENT_ID ;



--동일한 직무를 가진 사원의 수 조회
-- job_id 인원수
SELECT e.JOB_ID, COUNT(e.EMPLOYEE_ID) AS 인원수
FROM EMPLOYEES e  
GROUP BY e.JOB_ID 
ORDER BY e.JOB_ID;


-- 직업 ID가 SA_MAN인 사원들의 최대 연봉보다 높게 받는 사원들의
-- last_name, job_id, salary 조회
SELECT
	e.LAST_NAME,
	e.JOB_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	SALARY >(
	SELECT
		MAX(salary)
	FROM
		EMPLOYEES e
	WHERE
		JOB_ID = 'SA_MAN');


-- 커미션을 받는 사원들의 부서와 연봉이 동일한 사원들으 last_name,
-- deptno, salary 조회
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.DEPARTMENT_ID ,
	e.SALARY) IN (
	SELECT
		DEPARTMENT_ID,
		salary
	FROM
		EMPLOYEES e
	WHERE
		COMMISSION_PCT IS NOT NULL);


-- 회사 전체 평균 연봉보다 더 버는 사원들 중 last_name에 u가 있는
-- 사원들이 근무하는 부서와 같은 부서에 근무하는 사원들의
-- 사번, last_name, salary 조회
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN (
	SELECT
		DISTINCT e.DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		e.SALARY > (SELECT round(AVG(SALARY)) FROM EMPLOYEES)
		AND e.LAST_NAME LIKE '%u%');

-- join
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
JOIN (
	SELECT
		DISTINCT e.DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		e.SALARY > (
		SELECT
			round(AVG(e. SALARY))
		FROM
			EMPLOYEES e)
		AND e.LAST_NAME LIKE '%u%') d
ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID;




-- 각 부서별 평균 연봉보다 더 받는 동일부서 사원들의 last_name, salary
-- deptno, 해당 부서의 평균연봉 조회 (부서별 평균 연봉을 기준으로 오름차순)
SELECT
	e.LAST_NAME,
	e.SALARY, e.DEPARTMENT_ID, d.AVG_SALARY
FROM
	EMPLOYEES e
JOIN (
	SELECT
		DEPARTMENT_ID,
		round(AVG(SALARY)) AS avg_salary
	FROM
		EMPLOYEES
	GROUP BY
		DEPARTMENT_ID) d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	e.SALARY > d.AVG_SALARY
ORDER BY
	d.AVG_SALARY ASC;


SELECT
	e.LAST_NAME,
	e.SALARY,
	e.DEPARTMENT_ID,
	p.DEPT_SAL_AVG
FROM
	EMPLOYEES e ,
	(
	SELECT
		e.DEPARTMENT_ID,
		round(AVG(e.SALARY)) AS dept_sal_avg
	FROM
		EMPLOYEES e
	WHERE
		e.DEPARTMENT_ID IS NOT NULL
	GROUP BY
		e.DEPARTMENT_ID) p
WHERE
	e.DEPARTMENT_ID = p.DEPARTMENT_ID
	AND DEPT_SAL_AVG < e.SALARY
ORDER BY
	e.DEPARTMENT_ID;



-- last_name 이 'Davies' 인 사람보다 나중에 고용된 사원들의 last_name, hire_date 조회
SELECT
	e.LAST_NAME,
	e.HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	e.hire_date > (
	SELECT
		HIRE_DATE
	FROM
		employees
	WHERE
		LAST_NAME = 'Davies');

-- last_name 이 'King' 인 사원을 매니저로 두고 있는 모든 사원들의 last_name, salaty 조회
SELECT
	e.LAST_NAME,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	e.MANAGER_ID IN (
	SELECT
		EMPLOYEE_ID
	FROM
		EMPLOYEES
	WHERE
		LAST_NAME = 'King');


-- last_name 이 'Hall' 인 사원과 동일한 연봉 및 커미션을 받는 사원들의 last_name, 부서번호, 연봉 조회
-- 단 'Hall' 은 제외
SELECT
	e.LAST_NAME,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(SALARY,
	NVL(commission_pct, 0)) = (
	SELECT
		salary,
		NVL(commission_pct, 0)
	FROM
		employees
	WHERE
		LAST_NAME = 'Hall')
	AND LAST_NAME != 'Hall';

SELECT
	e. last_name,
	e.department_id,
	e.salary
FROM
	EMPLOYEES e
WHERE
	(e.salary,
	NVL(e.COMMISSION_PCT, 0))
IN (
	SELECT
		e.SALARY,
		NVL(e.COMMISSION_PCT, 0)
	FROM
		EMPLOYEES e
	WHERE
		e.LAST_NAME = 'Hall')
	AND e.last_name != 'Hall';

-- last_name이 'Zlotkey'인 사원과 동일한 부서에서 근무하는 모든 사원들의 사번, 고용날짜 조회
-- 단 'Zlotkey' 제외
SELECT
	e.EMPLOYEE_ID,
	e.HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID = (
	SELECT
		DEPARTMENT_ID
	FROM
		EMPLOYEES
	WHERE
		LAST_NAME = 'Zlotkey')
	AND LAST_NAME != 'Zlotkey';


SELECT
	e.EMPLOYEE_ID,
	e.HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID IN (
	SELECT
		DEPARTMENT_ID
	FROM
		EMPLOYEES
	WHERE
		LAST_NAME = 'Zlotkey')
	AND LAST_NAME != 'Zlotkey';


-- 부서가 위치한 지역의 국가 ID 및 국가명을 조회한다
-- Location, department, countries 테이블 사용
SELECT
	*
FROM
	DEPARTMENTS d
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
JOIN COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID;

SELECT
	c.COUNTRY_ID,
	c.COUNTRY_NAME
FROM
	COUNTRIES c
WHERE
	c.COUNTRY_ID IN (
	SELECT
		DISTINCT l.COUNTRY_ID
	FROM
		DEPARTMENTS d
	JOIN LOCATIONS l ON
		d.LOCATION_ID = l.LOCATION_ID
	);

-- 위치 ID가 1700인 사원들의 연봉과 커미션을 추출한 뒤, 추출된 사원들의 연봉과 커미션이 동일한 사원정보 출력
-- 출력 : 사번, 이름(first_name + last_name), 부서번호, 급여
SELECT
	e.EMPLOYEE_ID,
	e.FIRST_NAME || ' ' || e.LAST_NAME AS full_name,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.SALARY ,
	NVL(commission_pct, 0)) IN (
	SELECT
		SALARY,
		NVL(commission_pct, 0)
	FROM
		EMPLOYEES e
	WHERE
		e.DEPARTMENT_ID IN (
		SELECT
			d.DEPARTMENT_ID
		FROM
			DEPARTMENTS d
		WHERE
			LOCATION_ID = 1700));

SELECT
	e.EMPLOYEE_ID,
	e.FIRST_NAME || ' ' || e.LAST_NAME,
	e.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
WHERE
	(e.SALARY,
	nvl(e.COMMISSION_PCT, 0))
IN (
	SELECT
		DISTINCT e.SALARY,
		nvl(e.COMMISSION_PCT, 0)
	FROM
		EMPLOYEES e
	JOIN DEPARTMENTS d ON
		e.DEPARTMENT_ID = d.DEPARTMENT_ID
	WHERE
		d.LOCATION_ID = 1700);

