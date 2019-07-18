#Query 1

select deptName from dept 
where deptNo not in(select deptNo from emp);

#Query 2
select s.* from emp s,emp t 
where t.empName='Scott' AND s.job=t.job;

#Query 3
select deptName  from dept where deptNo=
(select deptNo from emp where empId= 
(select MGR from emp where empId=
(select MGR from emp where empName='Scott')));

#Query 4
select s.* from emp s,emp t ,emp y
where t.empName='Scott' AND s.job=t.job 
AND s.sal>y.sal AND y.empName='Smita';

#Query 5
select * from emp 
where job IN (select job from emp
where empName='Scott' OR empName='Smita');

#Query 6
select * from emp
where empId IN(select MGR from emp);

#Query 7
select * from emp s ,emp t
where s.MGR=t.empId AND t.empName='Scott';

#Query 8
select MAX(sal) from emp
where sal<(select MAX(sal) from emp);

#Query 9
select MAX(sal)from emp
where sal<(select MAX(sal)from emp
where sal<(select MAX(sal) from emp));

#Query 10
#select x.* from emp x,emp y
#where x.sal>y.sal AND y.job ='MANAGER';
select * from emp 
where sal> all (select sal from emp 
				where job='MANAGER');

#Query 11
select * from emp 
where sal> any (select sal from emp 
				where job='MANAGER');

#Query 12
select empId,sal,job from emp
where job='ANALYST' AND sal>any(select sal from emp 
					where job='MANAGER');

#Query 13
select dept.* from dept INNER JOIN emp
ON dept.deptNo=emp.deptNo AND emp.job='CLEARK';

#Query 14
select emp.* from emp INNER JOIN dept
ON dept.locationationation='Pune' AND emp.deptNo=dept.deptNo;

#Query 15
select * from emp 
where sal>(select avg(sal) from emp 
				where deptNo=2 );

#Query 16
select * from emp 
where sal=(select MAX(sal)from emp);

#Query 17
select * from emp 
where HireDate=(select min(HireDate) from emp);

#Query 18
select x.* from emp x,emp y
where x.sal>y.sal AND 
		y.empName='Shraddha';

#Query 19
/*select dept.deptName from dept INNER JOIN emp
ON dept.deptNo=emp.deptNo AND emp.job='ANALYST';*/
select deptName from dept 
where deptNo IN(select deptNo from emp 
					where job='ANALYST');

#Query 20
select deptName from dept 
where deptNo IN(select deptNo from emp 
					where job='salESMAN');

#Query 21
select * from emp 
where deptNo IN(select deptNo from dept 
					where locationationation like '%b%');

#Query 22
select deptName from dept 
where deptNo IN(select deptNo from emp);

#Query 23
select deptName from dept
where deptNo IN(select deptNo from emp 
				GROUP BY deptNo HAVING count(deptNo)>=2);

#Query 24
select deptName from dept
where deptNo IN(select deptNo from emp
				GROUP BY job HAVING count(job)>=2 AND job='CLEARK');

#Query 25
select empName from emp
	where sal=(select MAX(sal) from emp where deptNo IN(select deptNo from dept where deptName='ACCOUNTING'))
	AND deptNo=((select deptNo from dept where deptName='ACCOUNTING'));
	

#Query 26
select deptName from dept 
where deptNo IN(select deptNo from emp
					where Commisionision=(select max(Commisionision) from emp));


#Query 27
select empName from emp
where deptNo=(select deptNo from emp 
				where empName='Scott');

#Query 28
select * from emp 
		where deptNo IN ( select deptNo from dept 
					where deptName IN ( 'OPERATIONS','ACCOUNTING')) AND
							sal > ( select sal from emp where empName ='Scott');

#Query 29
select deptName from dept
	where deptNo IN(select deptNo from emp
				GROUP BY job HAVING count(job)>=2 AND job='salESMAN');
#Query 30
select * from emp
	where MGR is NULL;

#Query 31
select * from emp
	where empId NOT IN(select MGR from emp where MGR IS NOT NULL);

#Query 31
select * from emp 
	where MGR=(select MGR from emp where empName='Rima');

#Query 32
select * from emp 
	where deptNo IN(select deptNo from dept where deptName In('ACCOUNTING','RESEARCH'))
AND empId IN (select MGR from emp GROUP BY MGR HAVING count(*)>=2);

#Query 33
select * from emp
	where empName like 'S%'
	AND sal BETWEEN 30000 AND 60000;

#Query 34
select locationationation from dept 
	where deptNo IN(select deptNo from emp 
						where sal IN(select min(sal) from emp where sal>2000));

#Query 35
select locationationation from dept 
where  deptName='ACCOUNTING';

#Query 36
select locationationation from dept 
		where deptNo IN(select deptNo from emp GROUP BY deptNo HAVING count(*)>3);

#Query 37
select * from emp 
where job!=(select job from emp where empName='Jon')
AND sal>(select sal from emp where empName='Scott');

#Query 38
select * from emp
	where deptNo IN(select deptNo from dept 
					where locationationation=(select locationationation from dept 
									where deptNo=(select deptNo from emp 
												where empId=(select MGR from emp 
															where empName='Shraddha'))));

#Query 39
select job from emp 
	where MGR=(select MGR from emp where empName='Jon');

#Query 40
select empName ,HireDate ,Commisionision from emp 
	where empId =(select MGR from emp 
			where empName = 'Shraddha');

#Query 41
select COUNT(empName) from emp 
	where sal<(select sal from emp 
		where empId=(select MGR from emp where empName='Jon'));

#Query 42
select * from emp
	where Commisionision=0 AND deptNo IN(select deptNo from dept where locationationation='Mumbai');

#Query 43
select * from emp 
	where  sal>(select avg(sal) from emp 
					GROUP BY (deptNo) 
					HAVING deptNo=(select deptNo from dept 
												where deptName='salES'))
		AND deptNo=(select deptNo from dept 
												where deptName='salES');

#Query 44
 select empName from emp 
	where deptNo =(select deptNo from dept 
				where deptName='RESEARCH') 
				AND empId IN (select MGR from emp);
#Query 45
select deptName from dept
where deptNo IN(select deptNo from emp
				where Commisionision>0);

#Query 46
select deptName from dept
where deptNo=(select deptNo from emp 
			where sal=(select MAX(sal) from emp) AND MGR IS NULL);
				
#Query 47
select * from emp
where MGR=(select empId from emp where empName='Smita')
AND Commisionision=0;

#Query 48
select deptName,locationationation from dept 
	where deptNo IN(select deptNo from emp 
					where empId IN(select empId from emp 
							where MGR In(select MGR from emp 
								where job='salESMAN')));

#Query 49
select deptName ,locationation from dept where deptNo IN (select deptNo from emp where job='CLERK' AND MGR IN (select empId from emp where empName='Blake' )
   AND  sal<(select sal from emp where empName='MARTIN'));

#Query 50
  select empName from emp where MGR != (select empId from emp where job='PRESIDENT') AND Commision Is NOT NULL
  AND sal> ALL(select MAX(sal) from emp where job='CLERK' );

#Query 51
  select * from emp where HireDate>ALL(select MIN(HireDate)+(365*2) from emp) AND sal>(select sal from emp where empName='Blake');

#Query 52
  select locationation from dept where deptNo IN( select deptNo from emp where MGR =(select empId from emp where empName='Blake'));

#Query 53
select * from emp 
where job=(select job from emp 
where empName='Jon') 
AND sal<(select sal from  emp 
where empName='Scott');

#Query 54
select sal*12  AS fIRST_YEAR_sal,deptName,locationation from emp,dept where emp.deptNo=dept.deptNo AND empName='Shraddha';

#Query 55
 select sal*12 AS ANUAL_sal, empName from emp where deptNo IN(2,3) AND deptNo IN (select deptNo from emp GROUP BY deptNo HAVING COUNT(*)>=3);

#Query 56
select deptName from dept where deptNo=(select deptNo from emp where sal=(select avg(sal) from emp where sal<(select avg(sal)from emp)) AND sal=(select MAX(sal) from emp where sal<(select MAX(sal) from emp where sal<(select MAX(sal)from emp))));

#Query 57
select * from emp where sal < ANY(select sal from emp where job='salESMAN');

#Query 58
  select * from emp where HireDate < (select MAX(HireDate) from emp);

#Query 59
  select * from emp where HireDate < (select MAX(HireDate) from emp);


#Query 60
select MIN(sal) from emp where sal > (select MIN(sal) from emp where sal > (select MIN(sal) from emp));

#Query 61
 select * from emp where sal > ANY (select sal from emp where job ='MANAGER');

#Query 62
 select empName from emp where HireDate > (select MIN(HireDate)+(365*4) from emp) AND sal< (select sal from emp where empName='BLAKE');

#Query 63
 select deptName, deptNo from dept where location ='NEW YORK';

#Query 64
  select * from emp where deptNo=20 ORDER BY sal DESC;

#Query 65
select * from emp where HireDate IN (select MIN(HireDate) from emp where HireDate > (select MIN(HireDate) from emp));
#Query 66
select location from emp,dept where emp.deptNo=dept.deptNo AND empName LIKE 'A%' AND sal BETWEEN 1000 AND 3000;
#Query 67
 select deptName from dept where deptNo IN (select deptNo from emp where MGR IN (select empId from emp where empName='BLAKE'));

#Query 68
select locationation from dept 
	where deptNo IN(select deptNo from emp 
					where empId IN(select empId from emp 
							where MGR In(select MGR from emp 
								where empName='Rima')));
#Query 69
select empName,sal from emp where HireDate  IN (select MAX(HireDate)-(365*2) from emp);

#Query 70
 select empName,job, deptName,E.deptNo from emp E,dept D where E.deptNo=D.deptNo AND E.Commision IS NULL;

#Query 71
 select * from emp,dept where emp.deptNo=dept.deptNo AND Commision IN (select MAX(Commision) from emp);

#Query 72
select * from emp where Commision IS NOT NULL AND HireDate <(select MAX(HireDate) from emp)
   AND deptNo IN(select deptNo from dept where deptName='salES');

#Query 73
select deptName,MGR from emp E,dept D where E.deptNo= D.deptNo AND empId IN (select MGR from emp where empId IN (select MGR from emp where empName='WARD'));

#Query 74
select D.deptName,MAX(E.Commision) from emp E,dept D where E.deptNo=D.deptNo AND E.sal> ALL(select AVG(sal) from emp where job='ClERK'  GROUP BY job  );

#Query 75
select empName,location from emp E,dept D where E.deptNo=D.deptNo AND HireDate =(select MAX(HireDate)
from emp);

#Query 76
select deptNo from dept where deptNo IN(select deptNo from dept where deptName='salES') AND  deptNo IN
(select deptNo from emp where job='MANAGER');

#Query 77
select deptName from dept where deptNo IN( select deptNo from emp where
sal =( select MIN( sal) from emp where MGR IS NOT NULL));

#Query 78
select D.deptName,E.HireDate from emp E, dept D where E.deptNo=D.deptNo AND E.deptNo IN (select deptNo from dept where deptName='salES');

#Query 79
select deptName,location from dept where deptNo=(select deptNo from emp where job='PRESIDENT');

#Query 80
select deptName from dept where deptNo IN (select deptNo from emp where sal IN (select MAX(sal) from emp where sal IN(select sal from emp where sal<3000)));

#Query 81
select deptName from dept where deptNo IN (select deptNo from emp where MGR IN( select empId from
emp where empName='ADAMS'));

#Query 82
select * from emp where HireDate IN (select MAX(HireDate) from emp);

#Query 83
select * from emp where sal>(select AVG(sal) from emp where deptNo=30);


#Query 84
 select COUNT(*) from emp where deptNo IN(select deptNo from dept where deptName='RESEARCH') AND sal< ANY(select sal from emp where deptNo=10);

#Query 85
select deptName from dept where deptNo IN (select deptNo from emp where job='CLERK');

#Query 86
select deptName from dept where deptName LIKE '%L%';

#Query 87
  select * from emp where HireDate>(select HireDate from emp where empName='BLAKE');

#Query 88
select deptName from dept where deptNo IN (select deptNo from emp GROUP BY deptNo HAVING COUNT(*)
BETWEEN 3 AND 5);

#Query 89
select location from dept where deptNo IN (select deptNo from emp where MGR IN (select empId from emp where sal >2000));

#Query 90
select empName, deptName from emp, dept where emp.deptNo = dept.deptNo AND deptName LIKE '%E%E%';

#Query 91
select empName,sal from emp where sal>ANY(select sal from emp where job='ANALYST');

#Query 92
 select * from emp where deptNo IN(select deptNo from dept where location='CHICAGO');
#Query 93
select * from emp where sal = ( select MIN (sal) from emp where deptNo=(select deptNo from dept
 where deptName='RESEARCH'));

#Query 94
select deptName from dept where deptNo IN(select deptNo from emp where job='salESMAN');

#Query 95
select deptName from dept where deptNo IN (select deptNo from emp GROUP BY deptNo HAVING COUNT(*)>=3);

#Query 96
select empName from emp where deptNo IN(select deptNo from dept where deptName IN('ACCOUNTING','RESEARCH')) AND
 empId IN(select MGR from emp GROUP BY MGR HAVING COUNT(*)>=2);

#Query 97
select empName,job,location from emp E,dept D where E.deptNo=D.deptNo AND job='MANAGER'AND location='CHICAGO';


#Query 98
select empName,deptName from emp E,dept D where E.deptNo=D.deptNo AND E.sal IN(select MAX(sal) from emp where sal<(select MAX(sal) from emp)
 AND location='DALLAS');

#Query 99
select empName from emp where deptNo IN(select deptNo from dept where deptName IN('salES','RESEARCH'))
AND empId IN(select MGR from emp GROUP BY MGR HAVING COUNT(*)>=2);
