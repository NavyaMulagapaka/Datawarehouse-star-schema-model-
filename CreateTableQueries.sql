----Creating Local council dimension table
CREATE TABLE "Local_Council_Dim" (
  "Local_Council_ID" integer,
  "Local_Council_name" varchar2(255),
  "Address_Line_1" varchar2(50),
  "Address_Line_2" varchar2(50),
  "Town" varchar2(50),
  "County" varchar2(50),
  "Postcode" varchar2(9),
  "Telephone#" varchar2(50),
  "Fax#" varchar2(50),
  "Bypass#" varchar2(50),
  PRIMARY KEY ("Local_Council_ID")
);

-----Creating Temp dimension table
CREATE TABLE "Temp_Dim" (
  "Temp_ID" integer,
  "First_Name" varchar2(50),
  "Last_Name" varchar2(50),
  "Address_Line_1" varchar2(50),
  "Address_Line_2" varchar2(50),
  "Town" varchar2(50),
  "County" varchar2(50),
  "Postcode" varchar2(9),
  "Tel#6ome" varchar2(50),
  "Fax#Home" varchar2(50),
  "Tel#Work" varchar2(50),
  "Fax#Work" varchar2(50),
  "Mobile_Phone#" varchar2(50),
  PRIMARY KEY ("Temp_ID")
);

-----Creating Type of cover dimension table
CREATE TABLE "Type_of_Temp_Cover_Dim" (
  "Type_of_Cover_ID" integer,
  "Cover_Description" varchar2(30),
  PRIMARY KEY ("Type_of_Cover_ID")
);

-----------Creating Temp request dimension table
CREATE TABLE "Temp_Request_Dim" (
  "Temp_Request_ID" integer,
  "Local_Council_ID" integer,
  "Request_Date" date,
  PRIMARY KEY ("Temp_Request_ID")
);

-------------Creating Time dimension table
CREATE TABLE "Time_Dim" (
  "Time_ID" integer,
  "Session_Date" date,
  "Request_Date" date,
  "Session_week" integer,
  "Request_week" integer,
  "Session_Month" varchar2(20),
  "Request_Month" varchar2(20),
  PRIMARY KEY ("Time_ID")
);

----------------Creating Session fact table
CREATE TABLE "Session_fact_DW" (
  "Session_ID" integer,
  "Temp_Request_ID" integer,
  "Temp_ID" integer,
  "Type_of_Cover_ID" integer,
  "Local_Council_ID" integer,
  "Time_ID" integer,
  "Status" varchar2(50),
  "Session_Date" date,
  "Session_Start" varchar2(20),
  "Session_End" varchar2(20),
  PRIMARY KEY ("Session_ID")
);

CREATE INDEX "FK" ON "Session_fact_DW" ("Temp_Request_ID", "Temp_ID", "Type_of_Cover_ID",
"Local_Council_ID", "Time_ID");