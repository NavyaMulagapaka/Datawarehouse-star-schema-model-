---removing columns
alter table local_council
drop ("Locality", "Approximate List Size", "Type of Computer System", "Appointment System",
        "Leaflets","Date of Last Update","TypeofLocalCouncil");

alter table local_council
drop ("Computer Used in Consultations");

---renaming column names
alter table local_council 
RENAME COLUMN "LocalCouncil_ID" to "Local_Council_ID";

alter table local_council 
RENAME COLUMN "LocalCouncilName" to "Local_Council_Name";

alter table local_council 
RENAME COLUMN "Address Line 1" to "Address_Line_1";

alter table local_council 
RENAME COLUMN "Address Line 2" to "Address_Line_2";

select * from local_council;

---null values
----removing null values if present for local_council_name, county, town
select * from local_council where ("Local_Council_Name" is null) or ("County" is null) or ("Town" is null);

Delete from local_council where "Local_Council_ID" in (
select "Local_Council_ID" from local_council where "Local_Council_Name" is null or "County" is null or "Town" is null);

------Replacing null values with N/A in Teleplone, Fax, Bypass columns
select "Telephone#", "Fax#", "Bypass#" from local_council where ("Telephone#" is null) or ("Fax#" is null) or ("Bypass#" is null);

update local_council
set "Telephone#" = 'N/A', "Fax#" = 'N/A', "Bypass#" = 'N/A'
where ("Telephone#" is null) or ("Fax#" is null) or ("Bypass#" is null);

----Replacing null values with N/A in address_line_1, address_line_2 
select * from local_council where ("Address_Line_1") is null or ("Address_Line_2" is null);

update local_council
set "Address_Line_1" = 'N/A', "Address_Line_2" = 'N/A'
where ("Address_Line_1" is null) or ("Address_Line_2" is null);

---changing data types
alter table local_council 
add "LOCAL_COUNCIL_ID_temp" int;

update "LOCAL_COUNCIL"
set "LOCAL_COUNCIL_ID_temp" = "Local_Council_ID";

alter table "LOCAL_COUNCIL" 
drop column "Local_Council_ID";

alter table "LOCAL_COUNCIL"
rename column "LOCAL_COUNCIL_ID_temp" to "Local_Council_ID";

---adding primary key constraint
alter table local_council
add CONSTRAINT Local_Council_PK PRIMARY KEY ("Local_Council_ID");

