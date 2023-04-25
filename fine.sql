/*
Procedure to Find the Fine and status of the book issued from the library with the trigger which is present in another file   
in this file the stored procedure is present 
*/
Delimiter $$
create procedure FINE(IN r int,IN b int,IN dr date )
begin 
Declare di date ;
Declare amt float;
Declare n int;

update student set dor=dr where rno=r and bid=b;
select doi into di from student where rno=r and bid=b;
set n=DATEDIFF(dr,di);

if (n<10) then 
set amt=0;
update book_status set fine = 0, status = 'R' where rno=r and bid=b;

elseif n>10 and n<40 then
set amt=n*5;
update book_status set fine=amt, status='R' where rno=r and bid=b; 

elseif n>40 then
set amt=n*10;
update book_status set fine=amt , status='R' where rno=r and bid=b; 
  
end if;
end $$
Delimiter ;
