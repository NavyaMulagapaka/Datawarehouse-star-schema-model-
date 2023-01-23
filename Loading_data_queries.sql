------Local Council table loading data
DECLARE

CURSOR c_local_council IS
SELECT "Local_Council_ID", "Local_Council_Name", "Address_Line_1", "Address_Line_2", "Town", "County", "Postcode", "Telephone#", "Fax#", "Bypass#" FROM "LOCAL_COUNCIL";

BEGIN

FOR r_local_council IN c_local_council LOOP
INSERT INTO "Local_Council_Dim" VALUES( r_local_council."Local_Council_ID", r_local_council."Local_Council_Name", r_local_council."Address_Line_1", r_local_council."Address_Line_2", r_local_council."Town", r_local_council."County", r_local_council."Postcode",
r_local_council."Telephone#",r_local_council."Fax#", r_local_council."Bypass#");
END LOOP;

END;

-------Type of temp cover table loading data
DECLARE

CURSOR c_TYPE_OF_TEMP_COVER IS
SELECT "Type_Of_Cover_ID", "Cover_Description" FROM "TYPE_OF_TEMP_COVER";

BEGIN

FOR r_TYPE_OF_TEMP_COVER IN c_TYPE_OF_TEMP_COVER LOOP
INSERT INTO "Type_of_Temp_Cover_Dim" VALUES (r_TYPE_OF_TEMP_COVER."Type_Of_Cover_ID", r_TYPE_OF_TEMP_COVER."Cover_Description");

END LOOP;

END;

-------Temp table loading data
DECLARE

CURSOR c_TEMP IS
SELECT "Temp_ID", "First_Name", "Last_Name", "Address_Line_1", "Address_Line_2",
           "Town", "County", "Postcode", "Tel#6ome", "Fax#Home", "Tel#Work", "Fax#Work", "Mobile_Phone#" FROM "TEMP";

BEGIN

FOR r_TEMP IN c_TEMP LOOP
INSERT INTO "Temp_Dim" VALUES (r_TEMP."Temp_ID", r_TEMP."First_Name", r_TEMP."Last_Name", r_TEMP."Address_Line_1", r_TEMP."Address_Line_2",
           r_TEMP."Town", r_TEMP."County", r_TEMP."Postcode", r_TEMP."Tel#6ome", r_TEMP."Fax#Home", r_TEMP."Tel#Work", r_TEMP."Fax#Work", r_TEMP."Mobile_Phone#");

END LOOP;

END;

--------Temp request table loading data
DECLARE

CURSOR c_TEMP_REQUEST IS
SELECT "Temp_Request_ID", "Local_Council_ID","Request_Date" FROM "TEMP_REQUEST";

BEGIN

FOR r_TEMP_REQUEST IN c_TEMP_REQUEST LOOP
INSERT INTO "Temp_Request_Dim" VALUES ( r_TEMP_REQUEST."Temp_Request_ID",r_TEMP_REQUEST."Local_Council_ID", r_TEMP_REQUEST."Request_Date");

END LOOP;

END;

-------session fact and time dim tables loading
DECLARE
 Cursor c_session is
 SELECT s."Session_ID" as "Session_ID", t."Temp_Request_ID" as "Temp_Request_ID",
s."Temp_ID" as "Temp_ID", s."Type_Of_Cover_ID" as "Type_Of_Cover_ID",
t."Local_Council_ID" as "Local_Council_ID", t."Request_Date" as "Request_Date",
s."Status" as "Status", s."Session_Date" as "Session_Date",
to_char(s."Session_Start", 'hh24:mi:ss') as "Session_Start",
 to_char(s."Session_End", 'hh24:mi:ss') as "Session_End" FROM "SESSION"  s, "TEMP_REQUEST"  t
 WHERE s."Temp_Request_ID" = t."Temp_Request_ID";
 
 BEGIN
 
 FOR r_session in c_session
 LOOP
 insert into "Session_fact_DW" values(
 r_session."Session_ID", r_session."Temp_Request_ID",
 r_session."Temp_ID", r_session."Type_Of_Cover_ID",r_session."Local_Council_ID",
 SESSION_TIME_SEQ.nextval, r_session."Status", r_session."Session_Date",
 r_session."Session_Start", r_session."Session_End");

 insert into "Time_Dim" values(
 TIME_DIM_SEQUENCE.nextval, r_session."Session_Date", r_session."Request_Date",
 to_char(r_session."Session_Date",'WW'),to_char(r_session."Request_Date",'WW'),
 to_char(r_session."Session_Date",'MON'),to_char(r_session."Request_Date",'MON'));

 END LOOP;
 
END;
----------------

commit;
