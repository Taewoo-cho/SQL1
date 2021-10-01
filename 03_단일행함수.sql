-- 단일행 함수

--문자변환(데이터는 대소문자를 구분한다)
SELECT last_name as 이름, lower(last_name) as lower적용,
UPPER(last_name) as UPPER적용
FROM employees;

-- 문자 조작 함수
SELECT SUBSTR('ABCDEFG', 3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG', 'D') 
FROM DUAL;
SELECT TRIM('   헬로우   '), '   헬로우   ' FROM DUAL;

-- 문자함수 예제
SELECT department_id, last_name FROM employees
WHERE lower(last_name) = 'higgins';

SELECT last_name, CONCAT('직업명이 ', job_id) as 직업명 
FROM employees
WHERE SUBSTR(job_id, 4,3) = 'REP';

-- 문자열 가장 끝 문자 (-1은 문자열의 가장 끝)
SELECT last_name, SUBSTR(last_name, -1,1)
FROM employees;

-- 문자열 바꾸기
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

--예제1
SELECT last_name as 이름, lower(last_name) as lower적용,
UPPER(last_name) as UPPER적용, UPPER(email) as 이메일,
INITCAP(email) as INICAP 적용
FROM employees;

-- 예제2
SELECT job_id as 직업명, 
SUBSTR(job_id, 1,2) as 앞의2개 
FROM employees;


-- 숫자타입함수의 종류
-- 반올림 함수 ROUND(숫자, 자릿수), 자릿수가 없음녀 정수로 반올림, DUAL은 더미테이블
SELECT ROUND(15.193), ROUND(15.193,0), ROUND(15.193,1), ROUND(15.193,2) FROM DUAL;

-- 직원번호가 짝수번인 직원들만 출력
SELECT employee_id as 짝수번째 last_name
FROM employees
WHERE MOD(employee_id, 2)=0 // 직원번호를 2로 나눴을때 나머지가 0
ORDER by 1;

-- 예제1
SELECT salary, ROUND(salary/30,0) as 정수,  ROUND(salary/30,1) as 소수1자리,
ROUND(salary/30, -1) as 반올림
FROM employees;
 


