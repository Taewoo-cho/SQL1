/*
    주석단축키 ctrl + /
*/

-- 1. 테이블의 모든 행과 열을 읽어오기, 명령문 실행은 ctrl enter
-- * 은 전체열 명령문 끝에는 세미콜론이 있어야한다..
SELECT * FROM departments;

--  2. 특정열만 조회하기
SELECT department_id, department_name FROM departments;
SELECT employee_id, first_name, last_name FROM employees;

-- 3. 별칭 붙이기 (열의 이름) - as 생략가능
SELECT department_id as 부서번호, department_name 부서이름 from departments;

-- 4.산술 연산자 + - * /
SELECT first_name 이름, job_id 직책, salary-100 월급
FROM employees;

-- 월급에 100씩 뺀 열을 만들기
SELECT first_name 이름, job_id 직책, salary-100 월급
FROM employees;

--월급에 10% 뺀열 만들기
SELECT first_name 이름, job_id 직책, salary 월급, salary-salary/10 as 차감후월급
FROM employees;

SELECT 
    last_name, 
    first_name, 
    job_id 
    salary, 
    (salary-1000)*0.05 as 보너스 
FROM employees;

-- distinct 중복값 제거
SELECT distinct job_id
FROM employees;

-- 예제1
SELECT employee_id, first_name, last_name FROM employees;

-- 예제2
SELECT first_name, salary, salary*1.1 as 뉴셀러리 FROM employees;

-- 예제3
SELECT 
    employee_id as 사원번호, 
    first_name as 이름,
    last_name as 성
    FROM employees;
    
-- 연결 연산자 ||
SELECT LAST_NAME || ' ia a ' || JOB_ID AS 직업정보
FROM EMPOYEES;
