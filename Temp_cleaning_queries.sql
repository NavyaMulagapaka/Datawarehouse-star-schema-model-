select * from temp;
---removing columns
alter TABLE temp
DROP ("Title", "Date application was sent","Gender","Current Status","Date of birth",
    "Nationality","Use of a car","Qualification Year","Qualification Place",
    "Type of Cover Preferred","Monday AM","Monday PM","Tuesday AM","Tuesday PM",
    "Wednesday AM","Wednesday PM","Thursday AM","Thursday PM","Friday AM","Friday PM",
    "Saturday AM","Temp Registration Status","Date application received","TempStatus");
--rename column names
alter TABLE temp
rename COLUMN "TempID" to "Temp_ID";

alter TABLE temp
rename COLUMN "First Name" to "First_Name";

alter TABLE temp
rename COLUMN "Last Name" to "Last_Name";

alter TABLE temp
rename COLUMN "Address Line 4" to "Address_Line_1";

alter TABLE temp
rename COLUMN "Address Line 2" to "Address_Line_2";

alter TABLE temp
rename COLUMN "Mobile Phone#" to "Mobile_Phone#";

----changing data type of temp_id from binary_double to int
alter table temp 
add Temp_ID_temp int;

update temp
set Temp_ID_temp = "Temp_ID";

alter table temp
drop column "Temp_ID";

alter table temp
rename column Temp_ID_temp to "Temp_ID";

-----null values 
----removing rows where first name is null
select * from TEMP where "First_Name" is null;

delete from "TEMP" where "Temp_ID" in (select "Temp_ID" from "TEMP" where "First_Name" is null);
----updating N/A in place of null values in Address_Line_1 and Address_Line_2 columns
select * from temp where ("Address_Line_1") is null or ("Address_Line_2" is null);

update temp
set "Address_Line_1" = 'N/A', "Address_Line_2" = 'N/A'
where ("Address_Line_1" is null) or ("Address_Line_2" is null);

------updating N/A in place of null values in Town, county, post code columns
select * from temp where ("Town" is null) or ("County" is null) or ("Postcode" is null);

update temp
set "Town" = 'N/A', "County" = 'N/A', "Postcode" = 'N/A'
where ("Town" is null) or ("County" is null) or ("Postcode" is null);

------updating N/A in place of null values for Tel#6ome, Fax#Home, Tel#Work, Fax#Work, Mobile_Phone# columns
select * from temp where ("Tel#6ome" is null) or ("Fax#Home" is null) or ("Tel#Work" is null)or ("Fax#Work" is null) or ("Mobile_Phone#" is null);

update temp
set "Tel#6ome" = 'N/A', "Fax#Home" = 'N/A', "Tel#Work" = 'N/A', "Fax#Work" = 'N/A', "Mobile_Phone#" = 'N/A'
where ("Tel#6ome" is null) or ("Fax#Home" is null) or ("Tel#Work" is null)or ("Fax#Work" is null) or ("Mobile_Phone#" is null);

-----Checking if in appropriate values are present in first name column a
select * from "TEMP" where "First_Name" like '.%';

delete from "TEMP" where "Temp_ID" in (select "Temp_ID" from "TEMP" where "First_Name" like '.%');

----adding primary key constraint to temp_id
alter table temp
add constraint Temp_ID_pk primary key ("Temp_ID");
