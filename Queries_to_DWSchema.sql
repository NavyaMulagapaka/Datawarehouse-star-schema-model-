---------------- QUERIES for the DW schema
----------------The number of sessions filled by type of temp cover by month
SELECT
COUNT(sf."Session_ID") Num_of_Session, ttc."Cover_Description", t."Session_Month"
FROM
"Session_fact_DW" sf, "Type_of_Temp_Cover_Dim" ttc, "Time_Dim" t
WHERE
sf."Type_of_Cover_ID" = ttc."Type_of_Cover_ID" AND sf."Time_ID" = t."Time_ID" AND sf."Status" =
'booked'
GROUP BY
ttc."Cover_Description", t."Session_Month";


-------The number of temp care worker requests made by council for each week
SELECT
lc."Local_Council_name", t."Request_week", COUNT(sf."Temp_Request_ID") Num_of_temp_request
FROM
"Session_fact_DW" sf, "Local_Council_Dim" lc, "Time_Dim" t
WHERE
sf."Time_ID" = t."Time_ID" AND sf."Local_Council_ID" = lc."Local_Council_ID"
GROUP BY
t."Request_week" , lc."Local_Council_name";


---------The number of temp care worker requests filled by county for each month
SELECT 
lc."County", t."Session_Month", COUNT(sf."Temp_Request_ID") Num_of_temp_request
FROM 
"Session_fact_DW" sf, "Local_Council_Dim" lc, "Time_Dim" t
WHERE
sf."Time_ID" = t."Time_ID" AND sf."Local_Council_ID" = lc."Local_Council_ID"  AND sf."Status" = 'booked'
GROUP BY
lc."County", t."Session_Month";


--------- The number temp care worker requests filled by council each week
SELECT
lc."Local_Council_name", t."Session_week", COUNT(sf."Temp_Request_ID") Num_of_temp_request
FROM
"Session_fact_DW" sf, "Local_Council_Dim" lc, "Time_Dim" t
WHERE
sf."Time_ID" = t."Time_ID" AND sf."Local_Council_ID" = lc."Local_Council_ID" AND sf."Status" = 'booked'
GROUP BY
t."Session_week" , lc."Local_Council_name";

-----------------The number of temp care worker requests which were cancelled each month
SELECT
lc."Local_Council_name", t."Session_Month", COUNT(sf."Temp_Request_ID") Num_of_temp_request
FROM
"Session_fact_DW" sf, "Local_Council_Dim" lc, "Time_Dim" t
WHERE
(sf."Time_ID" = t."Time_ID") AND (sf."Local_Council_ID" = lc."Local_Council_ID") AND (sf."Status" = 'Branch Cancelled') OR
(sf."Status" = 'Temp Cancelled')
GROUP BY
t."Session_Month" , lc."Local_Council_name";
