--08장 문제풀이

SELECT * FROM EMP;
SELECT * FROM DEPT;

--1-1ANS
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E NATURAL JOIN DEPT D
WHERE SAL > 2000;

--1-2ANS
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON ( E.DEPTNO = D.DEPTNO AND E.SAL > 2000 )
--ORDER BY SAL
;

--1 TEACHER--------------------------------------------------------------------------------------------
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL > 2000;

-- NATURAL JOIN 에서 같이 사용하는 이름은 구분자를 뺀다
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E NATURAL JOIN DEPT D
WHERE SAL > 2000;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D ON (E.DEPTNO= D.DEPTNO)
WHERE SAL > 2000;

--2ANS
SELECT E.DEPTNO, D.DNAME, 
        TRUNC(AVG(E.SAL)) AS AVG_SAL,  
        MAX(E.SAL) AS MAX_SAL, 
        MIN(E.SAL) AS  MIN_SAL,
        COUNT(E.DEPTNO) AS CNT
FROM EMP E NATURAL JOIN DEPT D
WHERE E.DEPTNO= D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME;

--2-2ANS
SELECT E.DEPTNO, D.DNAME, 
        TRUNC(AVG(E.SAL)) AS AVG_SAL,  
        MAX(E.SAL) AS MAX_SAL, 
        MIN(E.SAL) AS  MIN_SAL,
        COUNT (E.DEPTNO) AS CNT
FROM EMP E RIGHT OUTER JOIN DEPT D ON ( E.DEPTNO = D.DEPTNO )
GROUP BY E.DEPTNO, D.DNAME;
--ORDER BY SAL

-- 2 TEACHER--------------------------------------------------------------------------------------------
--ORACLE
SELECT D.DEPTNO, D.DNAME,
        TRUNC(AVG(E.SAL)) AS AVG_SAL,  
        MAX(E.SAL) AS MAX_SAL, 
        MIN(E.SAL) AS  MIN_SAL,
        COUNT (*) AS CNT
FROM EMP E JOIN DEPT D ON ( E.DEPTNO = D.DEPTNO )
GROUP BY D.DEPTNO, D.DNAME;

--ANSI
SELECT D.DEPTNO, D.DNAME,
        TRUNC(AVG(E.SAL)) AS AVG_SAL,  
        MAX(E.SAL) AS MAX_SAL, 
        MIN(E.SAL) AS  MIN_SAL,
        COUNT (*) AS CNT
FROM EMP E,DEPT D
WHERE  E.DEPTNO = D.DEPTNO 
GROUP BY D.DEPTNO, D.DNAME;



---3Q
--ORACLE
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE  E.DEPTNO (+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

--ANSI
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.ENAME;

--Q4
SELECT DEPTNO, DNAME, EMPNO, ENAME, MGR, SAL, DEPTNO_1, LOSAL, HISAL, GRADE, MGR_EMPNO, MGR_ENAME

SELECT * FROM EMP;
