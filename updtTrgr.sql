/* Trigger for calling the procedure in which the rating of the sailor will be incremented for each reservation 
for sailor id passed as an argument in procedure 
*/

Delimiter $$
create trigger boatTrgr

before insert on Reserve 
for each row 
begin 
call UPDT(new.sid);

end $$
Delimiter ;

