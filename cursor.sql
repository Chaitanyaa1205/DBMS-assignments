Delimiter // 
create procedure Copy_data()

begin 

   declare vfinished int default 0;
   declare no int ;
   declare n varchar(100);
   declare s varchar(100);
   
   declare  emp_cursor cursor for select * from Emp;
   declare continue handler for not found set vfinished =1;
   
   
   
open emp_cursor;
getdata:loop

   fetch emp_cursor into no,n,s;
   if vfinished =1 then 
   leave getdata;
   end if;
   
   
   insert into Emp_Bkp values(no,n,s);
   end loop getdata;
   close emp_cursor;
   end ;
   // 
   Delimiter ;
  
   
/*
mysql> desc Emp;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| Eno   | int          | YES  |     | NULL    |       |
| Ename | varchar(100) | YES  |     | NULL    |       |
| esal  | int          | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> source /home/student/cursor.sql;
Query OK, 0 rows affected (0.12 sec)


mysql> call Copy_data();
Query OK, 0 rows affected (0.36 sec)
 
 mysql> select * from Emp;
+------+-----------+------+
| Eno  | Ename     | esal |
+------+-----------+------+
|    1 | chaitanya | 5000 |
|    2 | abhi      | 4000 |
|    3 | kaushal   | 8000 |
|    3 | kaushal   | 8000 |
+------+-----------+------+
4 rows in set (0.00 sec)

mysql> select * from Emp_Bkp;
+------+-----------+------+
| Eno  | Ename     | esal |
+------+-----------+------+
|    1 | chaitanya | 5000 |
|    2 | abhi      | 4000 |
|    3 | kaushal   | 8000 |
|    3 | kaushal   | 8000 |
+------+-----------+------+
4 rows in set (0.00 sec)
*/
