/* 
This is the trigger program where when we update the value in one table then it will be udated in another table 
like here if we update student table data then it will be updated into the Book_status table as follows 
*/
Delimiter $$
create trigger Trgr
 
before Insert on student
for each row
begin 

insert into book_status(rno,bid,status) values(new.rno,new.bid,'I');
end $$
Delimiter ;


