

--예제1
SELECT 
    * FROM EMPLOYEES 
    WHERE employee_id=100; 
    
--예제2
SELECT 
    * FROM EMPLOYEES
    WHERE FIRST_NAME='david';
    
--예제3
select * FROM EMPLOYEES
    WHERE EMPLOYEE_ID <=105;
    
--예제4
SELECT * FROM job_history
    WHERE start_date > '2006/03/03';

--예제5
SELECT * FROM departments 
    WHERE location_id != 1700;
    
--    논리 연산자 AND or NOT
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60 OR (DEPARTMENT_ID=80 AND SALARY>10000);

SELECT *
FROM employees
WHERE NOT (hire_date > '2004/01/01' OR salary > 5000);

-- 예제1
SELECT * FROM employees
    WHERE salary>4000 and job_id='IT_PROG';
    
--예제2
SELECT * FROM employees
    WHERE salary>4000 and 
    (job_id='IT_PROG' or job_id='FI_ACCOUNT');
    
-- IN 연산자 : ()안의 값과 같을때 OR로 변경  
-- 예제1
SELECT *
    FROM EMPLOYEES
    WHERE salary in (10000, 17000, 24000);
    
-- 예제2
SELECT *
    FROM employees
    WHERE department_id not in (30, 50, 80, 100, 110);
    
-- BETWEEN  사잇값

-- 예제1
SELECT *
    FROM employees
    WHERE salary BETWEEN 10000 AND 20000;
    
-- 예제2    
SELECT *
    FROM employees
    WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/30';
    
-- 예제3   
SELECT *
    FROM employees
    WHERE salary NOT BETWEEN 7000 AND 17000;
    
-- LIKE 연산자 
-- 'B%"  대문자 B로 시작하는 무언가
-- '%b%' 문자열 중간에 b가 있으면 전부 출력
-- '_ _ _y' 끝자리가 y 앞 3자리글자

-- 예제1
SELECT *
    FROM employees
    WHERE job_id LIKE '%AD%';
    
-- 예제2
SELECT *
    FROM employees
    WHERE job_id LIKE '%AD___';

-- 예제3
SELECT *
    FROM employees
    WHERE phone_number like '%1234';

-- 예제4
SELECT *
    FROM employees
    WHERE phone_number not like '%3%' and phone_number like '%9';

-- 예제5
SELECT *
    FROM employees
    WHERE job_id like '%MGR5' or job_id like '%ASST%';
    
-- NULL 이란? : 입력되지않은 사용할 수 없는 값이고 0 또는 ' ' 와 같은 공백이 아니다.
-- 널값을 검색하기 위해 is NULL 명령어가 존재
SELECT * FROM employees WHERE commission_pct is null; 

 

    
    
    
