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
INITCAP(email) as INICAP적용
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

-- 날짜형 함수, sysdate는 현재 날짜를 의미, ROUND(날짜, 소수점):반올림, BETWEEN 차이
SELECT SYSDATE 현재날짜, ROUND(SYSDATE, 'DD') 일, ROUND(SYSDATE, 'MM') 월,  ROUND(SYSDATE, 'YY') 년,
ROUND(MONTHS_BETWEEN('2021/10/05', '2021/06/10'), 1) 월차이
FROM DUAL;
 
-- 날짜에 더하기 빼기를 하면 => 실제 날짜가 더하거나 빠진다
SELECT SYSDATE 오늘날짜, SYSDATE+1 내일날짜, SYSDATE-1 어제날짜
FROM DUAL;

-- 예제1
SELECT SYSDATE, HIRE_DATE, MONTHS_BETWEEN(SYSDATE, HIRE_DATE) as 적용결과
FROM employees 
WHERE department_id=100;

-- 예제2
SELECT HIRE_DATE, ADD_MONTHS(HIRE_DATE, +3) as 더하기_3개월, ADD_MONTHS(HIRE_DATE, -3) as 빼기_3개월
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

-- 변환형 함수
-- 숫자를 문자로 변환
SELECT 
    TO_CHAR( 12345678 , '999,999,999') as 콤마형식,
    TO_CHAR( 12345678.678 , '999,999,999.9999') as 콤마소수점형식,
    TO_CHAR( 12345678 , '$999,999,999') as 달러형식,
    TO_CHAR( 12345678 , 'L999,999,999') as  L 로컬통화
FROM DUAL;

-- 날짜를 문자로 변환
SELECT 
    TO_CHAR( SYSDATE , 'YYYY/MM/DD') as 날짜표시,
    TO_CHAR( SYSDATE , 'YYYY/MM/DD HH24:MI:SS') as 시간표시
FROM DUAL;

-- 예제1
SELECT 
    employee_id, TO_CHAR( HIRE_DATE, 'MM/DD') as 입사일
    FROM employees
    WHERE department_id=100;

-- 예제2
SELECT
    first_name as 이름, TO_CHAR(salary, '$999,999,999.99') as 월급
    FROM employees
    WHERE salary > 10000
    ORDER BY salary DESC;
    
-- 문자열을 날짜로 변환
SELECT TO_DATE('2011/01/01', 'YYYY/MM/DD')
FROM DUAL;

-- 문자열을 숫자로 변환
SELECT TO_NUMBER('4567344')+1000000
FROM DUAL;
    
-- null값 관련 함수
-- NVL(값, 0 ) 만약 값이 널이면 0으로 변환 // NVL2(값, 첫번째, 두번째) 널값이아니면 첫번째, 널값이면 두번째
SELECT last_name, NVL2(manager_id,1, 0) as 매니저
FROM employees WHERE last_name= 'King';

-- 예제1
SELECT 
    last_name as 이름, 
    salary as 월급, NVL(commission_pct, 0) as 커미션, 
    (salary*12)+(salary*12*NVL(commission_pct, 0)) as 연봉
FROM employees
ORDER BY 연봉 DESC;

-- 예제2
SELECT 
    last_name as 이름, 
    salary as 월급, NVL(commission_pct, 0) as 커미션, 
    (salary*12)+(salary*12*NVL(commission_pct, 0)) as 연봉,
    NVL2(commission_pct, 'SAL+COMM', 'SAL') as 연봉계산
FROM employees
ORDER BY 연봉 DESC;


-- decode 함수: 조건에 따라 데이터를 다른 값이나 컬럼값으로 추출할 수 있다
SELECT last_name as 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG',   salary * 1.10,
                   'ST_CLERK',  salary * 1.15,
                   'SA_REP',    salary * 1.28,
                                salary) "수정월급"
FROM employees
ORDER BY job_id;

-- 예제1
SELECT last_name as 이름, job_id as 직무, salary,
    DECODE( TRUNC(salary/2000), 0, 0.00,
                                1, 0.09,
                                2, 0.20,
                                3, 0.30,
                                4, 0.40,
                                5, 0.42,
                                6, 0.44,
                                    0.45
                                        ) 세율
FROM employees;

-- case함수 DECODE함수가 하지못하는 비교연산의 단점 해결
SELECT last_name as 이름, job_id, salary,
       CASE WHEN salary<5000  THEN 'Low'
            WHEN salary<10000 THEN 'Medium'
            WHEN salary<20000 THEN 'Good'
            ELSE                   'Excellent'
        END "급여수준"
FROM employees;

--예제
SELECT employee_id, first_name, last_name, salary,
        CASE WHEN salary>9000 THEN '상위급여'
             WHEN salary>6000 THEN '중위급여'
             ELSE                  '하위급여'
        END 급여등급
FROM employees
WHERE job_id='IT_PROG';
