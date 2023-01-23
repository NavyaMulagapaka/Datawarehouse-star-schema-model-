select * from type_of_temp_cover;

---changing column names
alter TABLE type_of_temp_cover
rename COLUMN "TypeofCoverID" to "Type_Of_Cover_ID";

alter TABLE type_of_temp_cover
rename COLUMN "CoverDescription" to "Cover_Description";

----changing data type from varchar to int
alter table "TYPE_OF_TEMP_COVER" 
add "Type_Of_Cover_ID_temp" int;

update "TYPE_OF_TEMP_COVER"
set "Type_Of_Cover_ID_temp" = "Type_Of_Cover_ID";

alter table "TYPE_OF_TEMP_COVER" 
drop column "Type_Of_Cover_ID";

alter table "TYPE_OF_TEMP_COVER"
rename column "Type_Of_Cover_ID_temp" to "Type_Of_Cover_ID";

-----session table which has type of cover column with zero values are
select * from "SESSION" where "Type_Of_Cover_ID" = 0;

----adding type of cover with id as 0 in to the table with description as 

insert into TYPE_OF_TEMP_COVER ("Type_Of_Cover_ID", "Cover_Description") values (0,'Not_Mentioned');

---addiing primary key constraint to type_cover_id
alter table TYPE_OF_TEMP_COVER
ADD CONSTRAINT Type_Of_Cover_ID_PK PRIMARY KEY ("Type_Of_Cover_ID");