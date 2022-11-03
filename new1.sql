declare
cursor c_zip is
select * from unformatted_number;
vr_zip c_zip%rowtype;
p_phone_no unformatted_number.phone_number%TYPE;

begin
open c_zip;
fetch c_zip into vr_zip;
while c_zip%found
loop

p_phone_no := vr_zip.phone_number;

p_phone_no := '(' || substr(p_phone_no, 1, 3) ||
                ') ' || substr(p_phone_no, 4, 3) ||
                     '-' || substr(p_phone_no, 7);
insert into formatted_number values (vr_zip.id, p_phone_no);
commit;
dbms_output.put_line(vr_zip.id );
fetch c_zip into vr_zip;
end loop;


end;
/
