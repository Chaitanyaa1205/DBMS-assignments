echo "use HRS" > boat_sh.sql
echo "old table"
echo "select * from sailors;" >> boat_sh.sql

echo "bid  |  sid  |  dor"
read bi
read si
read d
echo "insert into reserve values('$bi','$si','$d');" >> boat_sh.sql
echo "select * from sailors;" >> boat_sh.sql
sudo mysql -u root < boat_sh.sql
echo "done"

'''
  old table
bid  |  sid  |  dor
103
1
2023-03-13
[sudo] password for student: 
sid	sname	srating
1	chetan	16
2	abhi	21
sid	sname	srating
1	chetan	17
2	abhi	21
done

'''
