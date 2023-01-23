--Removing Columns
alter table temp_request
drop ("Start date", "End date","Monday AM", "Monday PM",
"Tuesday AM","Tuesday PM","Wednesday AM", "Wednesday PM",
"Thursday AM", "Thursday PM", "Friday AM", "Friday PM",
"Saturday AM","Request Status", "Number of weeks", "Comments");

-- renaming the column names
alter table TEMP_REQUEST
rename column "TempRequestID" to "Temp_Request_ID";

alter table TEMP_REQUEST
rename column "LocalCouncil_ID" to "Local_Council_ID";

alter table TEMP_REQUEST
rename column "Request date" to "Request_Date";

---changing data types from VARCHAR to INT for temp_request_id

alter table "TEMP_REQUEST" 
add "TEMP_REQUEST_ID_temp" int;

update "TEMP_REQUEST"
set "TEMP_REQUEST_ID_temp" = "Temp_Request_ID";

alter table "TEMP_REQUEST" 
drop column "Temp_Request_ID";

alter table "TEMP_REQUEST"
rename column "TEMP_REQUEST_ID_temp" to "Temp_Request_ID";

---changing data types from varchar to int for local_counci_id
alter table "TEMP_REQUEST" 
add "LOCAL_COUNCIL_ID_temp" int;

update "TEMP_REQUEST"
set "LOCAL_COUNCIL_ID_temp" = "Local_Council_ID";

alter table "TEMP_REQUEST" 
drop column "Local_Council_ID";

alter table "TEMP_REQUEST"
rename column "LOCAL_COUNCIL_ID_temp" to "Local_Council_ID";

select * from TEMP_REQUEST;

---adding primary key constraint
alter table TEMP_REQUEST
add CONSTRAINT Temp_Request_ID_PK PRIMARY KEY ("Temp_Request_ID");