/*
The stored procedure for updating the rating of sailor for each reservation done by the coustomer 
wherer the sailor id will be passed as the parameter 
*/

Delimiter $$

create procedure UPDT(IN S int)
begin 

update Sailors set Srating=Srating+1 where Sid=s;

end $$
Delimiter ;
