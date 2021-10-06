-- 조인 (join)
-- on을 사용한 기본 조인
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서이름
FROM employees e JOIN departments d
    on e.department_id = d.department_id;
    
-- where 절을 사용한 예전 조인 방법
SELECT e.employee_id as 직원번호, e.last_name as 이름, d.department_id as 부서번호, d.department_name as 부서이름
FROM employees e, departments d
WHERE e.department_id = d.department_id;


--3개 테이블 직원 부서 로케이션 테이블 조인하기
SELECT e.employee_id as 직원번호, d.department_name as 부서이름, l.city as 도시
FROM employees e
JOIN departments d ON e.department_id=d.department_id
JOIN locations l ON l.location_id = d.location_id;

-- join 이후 where절
SELECT e.employee_id, e.last_name, d.department_id, d.location_id
FROM employees e 
JOIN departments d
    ON e.department_id = d.department_id
    WHERE d.department_id =50
        AND e.salary > 5000;
        
        
-- 예제 어렵농
SELECT d.department_name as 부서명, l.city as 도시명, c.country_name as 국가명
FROM departments d
JOIN locations l ON l.location_id = d.location_id
JOIN countries c ON c.country_id = l.country_id
    WHERE (l.city = 'London' OR l.city = 'Seattle') 
        AND c.country_name LIKE 'United%';



-- 비동등조인 scott 연습문제때 다시
SELECT employee_id, first_name, salary, grade
FROM employees
JOIN salarygrade
ON salary BETWEEN losalary AND hisalary;


-- 자체 JOIN
SELECT e.last_name as 직원, m.last_name as 매니저
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

