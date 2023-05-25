mysql> use emp;
Database changed
mysql> select * from info;
+-----+---------+---------+
| eid | ename   | esal    |
+-----+---------+---------+
|   1 | chetan  | 382.014 |
|   2 | om      | 2323.43 |
|   3 | tejas   | 3445.45 |
|   4 | kaushal |     456 |
|   5 | tushar  |     356 |
|   6 | manoj   |    2345 |
|   7 | tushar  |     345 |
+-----+---------+---------+
7 rows in set (0.00 sec)

mysql> insert into info values(8,'abhi',2345.65);
Query OK, 1 row affected (0.01 sec)

mysql> delete from info where esal=356;
Query OK, 1 row affected (0.01 sec)

mysql> update info set esal=345.34 where ename='chetan';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from info;
+-----+---------+---------+
| eid | ename   | esal    |
+-----+---------+---------+
|   1 | chetan  |  345.34 |
|   2 | om      | 2323.43 |
|   3 | tejas   | 3445.45 |
|   4 | kaushal |     456 |
|   6 | manoj   |    2345 |
|   7 | tushar  |     345 |
|   8 | abhi    | 2345.65 |
+-----+---------+---------+
7 rows in set (0.00 sec)

mysql> select count(eid) from info;
+------------+
| count(eid) |
+------------+
|          7 |
+------------+
1 row in set (0.01 sec)

mysql> select count(*) from info;
+----------+
| count(*) |
+----------+
|        7 |
+----------+
1 row in set (0.00 sec)

mysql> select avg(esal) from info;
+--------------------+
| avg(esal)          |
+--------------------+
| 1657.9813973563057 |
+--------------------+
1 row in set (0.00 sec)

mysql> select avg(eid) from info;
+----------+
| avg(eid) |
+----------+
|   4.4286 |
+----------+
1 row in set (0.00 sec)

mysql> select min(esal) from info;
+-----------+
| min(esal) |
+-----------+
|       345 |
+-----------+
1 row in set (0.00 sec)

mysql> select max(esal) from info;
+-----------+
| max(esal) |
+-----------+
|   3445.45 |
+-----------+
1 row in set (0.00 sec)

mysql> select ename from info where esal=(select min(esal) from info);
+--------+
| ename  |
+--------+
| tushar |
+--------+
1 row in set (0.00 sec)

mysql> select * from info;
+-----+----------+---------+
| eid | ename    | esal    |
+-----+----------+---------+
|   1 | chetan   |  345.34 |
|   2 | om       | 2323.43 |
|   3 | tejas    | 3445.45 |
|   4 | kaushal  |     456 |
|   5 | ysah     | 2334.53 |
|   6 | manoj    |    2345 |
|   7 | tushar   |     345 |
|   8 | abhi     | 2345.65 |
|   9 | shunbham |    1094 |
|  10 | shoam    |    4594 |
+-----+----------+---------+
10 rows in set (0.00 sec)

mysql> select * from dinfo;
+------+------+-------+
| eid  | dno  | dname |
+------+------+-------+
|    1 |   10 | comp  |
|    3 |   11 | it    |
|    4 |   12 | ece   |
|    2 |   15 | civil |
|    6 |   16 | comp  |
|    8 |   17 | civil |
|    9 |   18 | comp  |
|   11 |   22 | ece   |
|   15 |   42 | it    |
|   16 |   43 | comp  |
+------+------+-------+
10 rows in set (0.00 sec)

mysql> select dinfo.dname,info.ename from dinfo inner join info on info.eid=dinfo.eid;
+-------+----------+
| dname | ename    |
+-------+----------+
| comp  | chetan   |
| it    | tejas    |
| ece   | kaushal  |
| civil | om       |
| comp  | manoj    |
| civil | abhi     |
| comp  | shunbham |
+-------+----------+
7 rows in set (0.00 sec)

mysql> select dinfo.dname,info.ename from dinfo left join info on info.eid=dinfo.eid;
+-------+----------+
| dname | ename    |
+-------+----------+
| comp  | chetan   |
| it    | tejas    |
| ece   | kaushal  |
| civil | om       |
| comp  | manoj    |
| civil | abhi     |
| comp  | shunbham |
| ece   | NULL     |
| it    | NULL     |
| comp  | NULL     |
+-------+----------+
10 rows in set (0.00 sec)

mysql> select dinfo.dname,info.ename from dinfo right join info on info.eid=dinfo.eid;
+-------+----------+
| dname | ename    |
+-------+----------+
| comp  | chetan   |
| civil | om       |
| it    | tejas    |
| ece   | kaushal  |
| NULL  | ysah     |
| comp  | manoj    |
| NULL  | tushar   |
| civil | abhi     |
| comp  | shunbham |
| NULL  | shoam    |
+-------+----------+
10 rows in set (0.00 sec)

mysql> create view esal as select * from info where esal<=1000;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from esal;
+-----+---------+--------+
| eid | ename   | esal   |
+-----+---------+--------+
|   1 | chetan  | 345.34 |
|   4 | kaushal |    456 |
|   7 | tushar  |    345 |
+-----+---------+--------+
3 rows in set (0.00 sec)

Delimiter //
create function add_status(s int)
returns varchar(10) deterministic
begin
declare sta varchar(10);
if s<=1000 then 
set sta='low';
elseif(s>1000 and s<3000) then
set sta='medium';
else
set sta='high';
end if;
return(sta);
end //
Delimiter ;

mysql> select ename,add_status(esal) from info;
+----------+------------------+
| ename    | add_status(esal) |
+----------+------------------+
| chetan   | low              |
| om       | medium           |
| tejas    | high             |
| kaushal  | low              |
| ysah     | medium           |
| manoj    | medium           |
| tushar   | low              |
| abhi     | medium           |
| shunbham | medium           |
| shoam    | high             |
+----------+------------------+
10 rows in set (0.00 sec)
