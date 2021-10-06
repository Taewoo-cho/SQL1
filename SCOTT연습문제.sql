--연습문제 1~10
--1
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO=10;

--2
SELECT ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE EMPNO=7369;

--3
SELECT *
FROM EMP
WHERE ENAME='ALLEN';

--4
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE HIREDATE='1981/02/20';

--5
SELECT *
FROM EMP
WHERE JOB NOT IN( 'MANAGER');

--6
SELECT *
FROM EMP
WHERE HIREDATE >= '1981/04/02';

--7
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL >= 800;

--8
SELECT *
FROM EMP
WHERE DEPTNO >= 20;

--9
SELECT *
FROM EMP
WHERE ENAME > 'K';

--10
SELECT *
FROM EMP
WHERE HIREDATE < '81/12/09';

--11
SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO <= 7698;

--12
SELECT ENAME, SAL, DEPTNO, HIREDATE
FROM EMP
WHERE HIREDATE >= '81/04/02' AND HIREDATE <='82/12/09'; 

--13
SELECT ename, job, sal
FROM emp
WHERE (sal BETWEEN 1600 AND 3000) AND job='MANAGER';

--14
SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--15
SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';

--16
SELECT *
FROM EMP
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

--17
SELECT *
FROM EMP
WHERE job IN('MANAGER', 'SALESMAN');

--18
SELECT ename, empno, deptno
FROM EMP
WHERE deptno NOT IN(20,30);

--19
SELECT ename, empno, hiredate, deptno
FROM EMP
WHERE ename LIKE 'S%';

--20
SELECT *
FROM EMP
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';

--21
SELECT *
FROM EMP
WHERE ename LIKE '%S%';

--22
SELECT *
FROM EMP
WHERE ename LIKE 'M____N';

--23
SELECT *
FROM EMP
WHERE ename LIKE '_A%';

--24
SELECT *
FROM EMP
WHERE comm IS NULL;

--25
SELECT *
FROM EMP
WHERE comm IS NOT NULL;

--26
SELECT ename, deptno, sal
FROM emp
WHERE (sal >= 1500) AND (deptno=30); 

--27
SELECT empno, ename, deptno
FROM emp
WHERE ename like 'K%' OR deptno = 30;

--28
SELECT *
FROM emp
WHERE (sal >= 1500) AND (deptno=30) AND (job = 'MANAGER'); 

--29
SELECT *
FROM emp
WHERE deptno=30 ORDER BY empno;

--30
SELECT *
FROM emp
ORDER BY sal DESC;

--31
SELECT *
FROM emp
ORDER BY deptno, sal DESC;

--32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename, sal DESC;

--33
SELECT ename, sal, ROUND(sal*0.13) as BONUS, deptno
FROM emp
WHERE deptno=10;

--34
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm,0) as TOTAL
FROM emp
ORDER BY TOTAL DESC;

--35
SELECT ename, sal, TO_CHAR(ROUND(sal*0.15, 2),'$999.9') as 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

--36 count가 사용되어서 group by 그리고 집계함수에 대한 조건에 having 절
SELECT d.dname as 부서명, COUNT(e.empno) as 사원수
FROM emp e JOIN dept d ON e.deptno = d.deptno
group by d.dname
HAVING COUNT(e.empno) >= 5;

--37 group by 당 하나의 결과
SELECT e.job, sum(e.sal)
FROM emp e JOIN dept d ON e.deptno = d.deptno
WHERE e.job NOT IN 'SALESMAN'
GROUP BY e.job
having sum(e.sal) > 5000;

--38 테이블에 겹치는거 없음
SELECT empno, ename, sal, grade
FROM emp
JOIN salgrade
ON sal BETWEEN losal AND hisal;

--39 count는 null을 세지않음
SELECT DEPTNO, COUNT(empno), count(comm)
FROM emp
GROUP BY DEPTNO;

--40
SELECT ename, deptno,
    DECODE(deptno, 10, '총무부',
                    20, '개발부',
                    30, '영업부' ) as 부서명
FROM emp;

