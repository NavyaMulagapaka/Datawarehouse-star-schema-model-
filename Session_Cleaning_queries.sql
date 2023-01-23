select * from "SESSION";

---removing columns
alter table "SESSION"
drop ("EmployeeCovered","DoPrint");

---renaming column names
alter TABLE "SESSION"
rename COLUMN "SessionID" to "Session_ID";

alter TABLE "SESSION"
rename COLUMN "RequestID" to "Temp_Request_ID";

alter TABLE "SESSION"
rename COLUMN "TempID" to "Temp_ID";

alter TABLE "SESSION"
rename COLUMN "SessionDate" to "Session_Date";

alter TABLE "SESSION"
rename COLUMN "SessionStart" to "Session_Start";

alter TABLE "SESSION"
rename COLUMN "SessionEnd" to "Session_End";

alter TABLE "SESSION"
rename COLUMN "Type" to "Type_Of_Cover_ID";

----changing data type from varchar to int for session_id column
alter table "SESSION" 
add "Session_ID_temp" int;

update "SESSION"
set "Session_ID_temp" = "Session_ID";

alter table "SESSION" 
drop column "Session_ID";

alter table "SESSION"
rename column "Session_ID_temp" to "Session_ID";

----change data type from varchar to int for temp_id column
alter table "SESSION" 
add "Temp_ID_temp" int;

update "SESSION"
set "Temp_ID_temp" = "Temp_ID";

alter table "SESSION" 
drop column "Temp_ID";

alter table "SESSION"
rename column "Temp_ID_temp" to "Temp_ID";

----changing data type from varchar to int for temp_request_id column
alter table "SESSION" 
add "Request_ID_temp" int;

update "SESSION"
set "Request_ID_temp" = "Temp_Request_ID";

alter table "SESSION" 
drop column "Temp_Request_ID";

alter table "SESSION"
rename column "Request_ID_temp" to "Temp_Request_ID";

---changing datatype from varchar to int for Type_of_Cover_Id column

alter table "SESSION" 
add "Type_Of_Cover_ID_temp" int;

update "SESSION"
set "Type_Of_Cover_ID_temp" = "Type_Of_Cover_ID";

alter table "SESSION" 
drop column "Type_Of_Cover_ID";

alter table "SESSION"
rename column "Type_Of_Cover_ID_temp" to "Type_Of_Cover_ID";

---checking for null values and updating accordingly
select * from "SESSION" where ("Type_Of_Cover_ID" is null) or ("Temp_Request_ID" is null) ;
-- change the null values to 0. because datatype is number
update "SESSION"
set "Type_Of_Cover_ID" = 0
where "Type_Of_Cover_ID" is null;

select * from "SESSION" where "Type_Of_Cover_ID" = 0;

---Updating null values for session_end and session_start with dates becasue data type is date
select * from "SESSION" where ("Session_Start" is null) or ("Session_End" is null);

update "SESSION"
set  "Session_Start" = '30-DEC-99', "Session_End" = '30-DEC-99'
where "Session_Start" is null or "Session_End" is null;

select * from "SESSION" where "Status" is null;

----adding primary key constraint to session_id
alter table "SESSION"
ADD CONSTRAINT Session_ID_PK PRIMARY KEY ("Session_ID");

