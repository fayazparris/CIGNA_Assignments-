You 15-10-2025 16:08 • 
Parris, H Fayaz
CREATE TABLE Dept (
Deptno NUMBER PRIMARY KEY,
Dname VARCHAR2(50),
Loc VARCHAR2(50)
);

CREATE TABLE Emps (
Empno NUMBER PRIMARY KEY,
Ename VARCHAR2(50),
Job VARCHAR2(50),
Sal NUMBER(10, 2),
Deptno NUMBER,
CONSTRAINT fk_dept FOREIGN KEY (Deptno) REFERENCES Dept(Deptno)
);

INSERT INTO Dept (Deptno, Dname, Loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO Dept (Deptno, Dname, Loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO Dept (Deptno, Dname, Loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO Dept (Deptno, Dname, Loc) VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7839, 'KING', 'PRESIDENT', 5000, 10);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7566, 'JONES', 'MANAGER', 2975, 20);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7698, 'BLAKE', 'MANAGER', 2850, 30);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7782, 'CLARK', 'MANAGER', 2450, 10);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7788, 'SCOTT', 'ANALYST', 3000, 20);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7902, 'FORD', 'ANALYST', 3000, 20);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7844, 'TURNER', 'SALESMAN', 1500, 30);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7900, 'JAMES', 'CLERK', 950, 30);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7654, 'MARTIN', 'SALESMAN', 1250, 30);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7499, 'ALLEN', 'SALESMAN', 1600, 30);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7521, 'WARD', 'SALESMAN', 1250, 30);
INSERT INTO Emps (Empno, Ename, Job, Sal, Deptno) VALUES (7934, 'MILLER', 'CLERK', 1300, 10);

SELECT Ename, Dname
FROM Emps
JOIN Dept ON Emps.Deptno = Dept.Deptno;

SELECT Ename, Job, Loc
FROM Emps
JOIN Dept ON Emps.Deptno = Dept.Deptno;

SELECT Ename
FROM Emps
WHERE Deptno = (SELECT Deptno FROM Dept WHERE Dname = 'SALES');

SELECT Ename, Dname, Loc
FROM Dept
LEFT JOIN Emps ON Dept.Deptno = Emps.Deptno;

SELECT Dname, Ename
FROM Emps
RIGHT JOIN Dept ON Emps.Deptno = Dept.Deptno;

SELECT Dname, SUM(Sal) AS TotalSalary
FROM Emps
JOIN Dept ON Emps.Deptno = Dept.Deptno
GROUP BY Dname;

SELECT Dname, COUNT(*) AS NumEmployees
FROM Emps
JOIN Dept ON Emps.Deptno = Dept.Deptno
GROUP BY Dname
HAVING COUNT(*) > 3;

SELECT Ename
FROM Emps
WHERE Deptno IN (
SELECT Deptno
FROM Dept
WHERE Loc = (SELECT Loc FROM Dept WHERE Dname = 'ACCOUNTING')
);

SELECT e.Deptno, e.Ename, e.Sal
FROM Emps e
WHERE e.Sal = (
SELECT MAX(Sal)
FROM Emps
WHERE Deptno = e.Deptno
);

SELECT Ename, Sal, Deptno
FROM Emps e1
WHERE Sal > (
SELECT AVG(Sal)
FROM Emps e2
WHERE e2.Deptno = e1.Deptno
);
