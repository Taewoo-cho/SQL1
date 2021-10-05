-- 그룹함수 (다중행함수, 집계함수)
SELECT ROUND(AVG(SALARY),2) as 평균값, MAX(salary) as 최대값, MIN(salary) as 최소값, SUM(salary) as 합계
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(*) FROM employees
WHERE department_id=80;

-- 그룹함수에서는 널값을 제외하고 계산한다 (예외 * )
SELECT COUNT(department_id)
FROM employees;

-- 중복되지않은 부서의 개수 distinct // 11개의 부서
SELECT COUNT(DISTINCT department_id) 
FROM employees;

-- 널 값을 제외한 모든 직원들의 커미션 평균
SELECT AVG(commission_pct)
FROM employees; 

-- GROUP BY 절 : 특정 그룹으로 나누어서 그룹함수를 사용
SELECT department_id as 부서번호, ROUND(AVG(salary),1) as 평균급여
FROM employees
GROUP BY department_id ORDER BY 부서번호; -- 부서번호로 그룹나눔

-- 
SELECT * FROM employees WHERE department_id is null;

-- 예제1
SELECT department_id as 부서명, 
        count(department_id) as 사원수, 
        max(salary) as 최대값, 
        min(salary) as 최소값, 
        sum(salary) as 급여합계,
        ROUND(avg(salary)) as 평균값
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;


-- 예제2
SELECT department_id as 부서번호, job_id as 직업 ,manager_id as 상사번호,
        sum(salary) as 급여합계, count(department_id) as 사원수
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY 부서번호;


--예제3
SELECT ROUND(avg(max(salary)), 0) as 부서별최고월급평균,
        avg(min(salary)) as 부서별최저월급평균
FROM employees
GROUP BY department_id;



-- 그룹 함수의 조건절 HAVING
SELECT department_id as 부서번호, count(*) as 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;


-- 예제1
SELECT job_id as 직종, sum(salary) as 월급여합계
FROM employees
WHERE job_id != 'AC_MGR'
GROUP BY job_id
HAVING avg(salary) > 10000
ORDER BY 월급여합계 DESC;


--예제2
SELECT department_id as 부서번호, avg(salary) as 평균급여
FROM employees
WHERE department_id !=40
GROUP BY department_id
HAVING avg(salary) <= 7000;


-- 예제3
SELECT job_id as 직종, sum(salary) as 월급여합계
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING sum(salary) > 13000
ORDER BY 월급여합계 DESC;
