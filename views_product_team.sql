create or replace view "product_stats"."vw_omnichannel_stats" as (
select 
       "_id.uniqueid",
       "workspaceid",
       "_id.host",
       "livechatenabled", 
       CASE WHEN "totallivechat" = '' THEN 0 ELSE CAST("totallivechat" AS INT) END "totallivechat", 
       CASE WHEN "totallivechatagents" = '' THEN 0 ELSE CAST("totallivechatagents" AS INT) END "totallivechatagents",
       CASE WHEN "totallivechatmessages" = '' THEN 0 ELSE CAST("totallivechatmessages" AS INT) END "totallivechatmessages",
       CASE WHEN "totallivechatvisitors" = '' THEN 0 ELSE CAST("totallivechatvisitors" AS INT) END "totallivechatvisitors",
       cast("day" as int) as day,
       cast("month" as int) as month,
       cast("year" as int) as year,
       cast(substring(createdat, 1, 11) as date) as createdat 
from product_stats.db_stats_collector
order by createdat desc)


create or replace view "product_stats"."vw_product_stats" as (
select 
       "_id.uniqueid",
       "workspaceid",
       "_id.host",
       CASE WHEN "totalchannelmessages" = '' THEN 0 ELSE CAST("totalchannelmessages" AS BIGINT) END "totalchannelmessages", 
       CASE WHEN "totalchannels" = '' THEN 0 ELSE CAST("totalchannels" AS BIGINT) END "totalchannels", 
       CASE WHEN "totalconnectedusers" = '' THEN 0 ELSE CAST("totalconnectedusers" AS BIGINT) END "totalconnectedusers", 
       CASE WHEN "totaldirect" = '' THEN 0 ELSE CAST("totaldirect" AS BIGINT) END "totaldirect", 
       CASE WHEN "totaldirectmessages" = '' THEN 0 ELSE CAST("totaldirectmessages" AS BIGINT) END "totaldirectmessages", 
       CASE WHEN "totaldiscussions" = '' THEN 0 ELSE CAST("totaldiscussions" AS BIGINT) END "totaldiscussions", 
       CASE WHEN "totalmessages" = '' THEN 0 ELSE CAST("totalmessages" AS BIGINT) END "totalmessages", 
       CASE WHEN "totalprivategroupmessages" = '' THEN 0 ELSE CAST("totalprivategroupmessages" AS BIGINT) END "totalprivategroupmessages", 
       CASE WHEN "totalprivategroups" = '' THEN 0 ELSE CAST("totalprivategroups" AS BIGINT) END "totalprivategroups", 
       CASE WHEN "totalrooms" = '' THEN 0 ELSE CAST("totalrooms" AS BIGINT) END "totalrooms", 
       CASE WHEN "totalthreads" = '' THEN 0 ELSE CAST("totalthreads" AS BIGINT) END "totalthreads", 
       CASE WHEN "totalusers" = '' THEN 0 ELSE CAST("totalusers" AS BIGINT) END "totalusers", 
       CASE WHEN "uploadstotal" = '' THEN 0 ELSE CAST("uploadstotal" AS BIGINT) END "uploadstotal", 
       CASE WHEN "uploadstotalsize" = '' THEN 0 ELSE CAST("uploadstotalsize" AS BIGINT) END "uploadstotalsize", 
       CASE WHEN "maxroomusers" = '' THEN 0 ELSE CAST("maxroomusers" AS BIGINT) END "maxroomusers", 
       CASE WHEN "nonactiveusers" = '' THEN 0 ELSE CAST("nonactiveusers" AS BIGINT) END "nonactiveusers", 
	   CASE WHEN "activeusers" = '' THEN 0 ELSE CAST("activeusers" AS BIGINT) END "activeusers", 
       CASE WHEN "offlineusers" = '' THEN 0 ELSE CAST("offlineusers" AS BIGINT) END "offlineusers", 
       CASE WHEN "onlineusers" = '' THEN 0 ELSE CAST("onlineusers" AS BIGINT) END "onlineusers",
       CASE WHEN "awayusers" = '' THEN 0 ELSE CAST("awayusers" AS BIGINT) END "awayusers", 
       CASE WHEN "avgchannelusers" = '' THEN 0 ELSE CAST("avgchannelusers" AS DECIMAL) END "avgchannelusers", 
       CASE WHEN "avgprivategroupusers" = '' THEN 0 ELSE CAST("avgprivategroupusers" AS DECIMAL) END "avgprivategroupusers",
       cast("day" as int) as day,
       cast("month" as int) as month,
       cast("year" as int) as year,
       cast(substring(createdat, 1, 11) as date) as createdat 
from product_stats.db_stats_collector
WHERE "_id.host" not in ('https://chat.gomoney.me/')
order by createdat desc)


create or replace view "product_stats"."vw_product_general_information" as (
select 
       "_id.uniqueid",
       "workspaceid",
       "_id.host",
       "version",
       "enterpriseready",
       "federatedusers",
       "federatedservers",
       "deploy.method",
       "deploy.platform",
       "readreceiptsenabled",
       "readreceiptsdetailed",
       "mongoversion",
       CAST(SUBSTRING("_updatedat", 1, 11) as date) as updatedat,
       CASE WHEN "installedat" = '' THEN NULL ELSE CAST(SUBSTRING("installedat", 1, 11) as date) END as "installedat",
       CASE WHEN "lastlogin" = '' THEN NULL ELSE CAST(SUBSTRING("lastlogin", 1, 11) as date) END as "lastlogin",
       CASE WHEN "lastmessagesentat" = '' THEN NULL ELSE CAST(SUBSTRING("lastmessagesentat", 1, 11) as date) END as "lastmessagesentat",
       CAST("day" as int) as day,
       CAST("month" as int) as month,
       CAST("year" as int) as year,
       CAST(substring(createdat, 1, 11) as date) as createdat 
from product_stats.db_stats_collector
order by createdat desc)


create or replace view "product_stats"."vw_product_apps" as (
select 
       "_id.uniqueid",
       "workspaceid",
       "_id.host",
       "apps.engineversion", 
       "apps.isenabled", 
       "apps.totalactive", 
       "apps.totalfailed", 
       "apps.totalinstalled", 
       cast("day" as int) as day,
       cast("month" as int) as month,
       cast("year" as int) as year,
       cast(substring(createdat, 1, 11) as date) as createdat 
from product_stats.db_stats_collector
order by createdat desc)

create or replace view "product_stats"."vw_product_wizard" as (
select 
       "_id.uniqueid",
       "workspaceid",
       "_id.host",
       "wizard.country", 
       "wizard.industry", 
       "wizard.language", 
       "wizard.organizationtype", 
       "wizard.servertype", 
       "wizard.size", 
       cast("day" as int) as day,
       cast("month" as int) as month,
       cast("year" as int) as year,
       cast(substring(createdat, 1, 11) as date) as createdat 
from product_stats.db_stats_collector
order by createdat desc)


   SELECT
     a.total
   , b."total_version4.4"
   , c."total_workspacenotnull_allversions"
   , d."total_workspacenotnull_version4.4"
   , "trim"(a.installedat) installedat
   FROM
     ((((
      SELECT
        "count"(distinct "_id.host") total
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      GROUP BY "substring"(installedat, 1, 11)
   )  a
   FULL JOIN (
      SELECT
        "count"(distinct "_id.host") "total_version4.4"
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      WHERE (version LIKE '4.4%')
      GROUP BY "substring"(installedat, 1, 11)
   )  b ON (a.installedat = b.installedat))
   FULL JOIN (
      SELECT
        "count"(distinct "_id.host") "total_workspacenotnull_allversions"
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      WHERE (NOT ("workspaceid" IN ('')))
      GROUP BY "substring"(installedat, 1, 11)
   )  c ON (a.installedat = c.installedat))
   FULL JOIN (
      SELECT
        "count"(distinct "_id.host") "total_workspacenotnull_version4.4"
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      WHERE ((NOT ("workspaceid" IN (''))) AND ("version" LIKE '4.4%'))
      GROUP BY "substring"(installedat, 1, 11)
   )  d ON (a.installedat = d.installedat))
   WHERE (NOT ("trim"(a.installedat) IN ('0001-01-01')))
   ORDER BY installedat DESC
   
   
CREATE OR REPLACE VIEW "product_stats". "vw_product_activation_indicator" AS (
SELECT
     a.total
   , b."total_version4.4"
   , c."total_workspacenotnull_allversions"
   , d."total_workspacenotnull_version4.4"
   , "trim"(a.installedat) installedat
   FROM
     ((((
      SELECT
        "count"(distinct "_id.host") total
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      GROUP BY "substring"(installedat, 1, 11)
   )  a
   FULL JOIN (
      SELECT
        "count"(distinct "_id.host") "total_version4.4"
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      WHERE (version LIKE '4.4%')
      GROUP BY "substring"(installedat, 1, 11)
   )  b ON (a.installedat = b.installedat))
   FULL JOIN (
      SELECT
        "count"(distinct "_id.host") "total_workspacenotnull_allversions"
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      WHERE (NOT ("workspaceid" IN ('')))
      GROUP BY "substring"(installedat, 1, 11)
   )  c ON (a.installedat = c.installedat))
   FULL JOIN (
      SELECT
        "count"(distinct "_id.host") "total_workspacenotnull_version4.4"
      , "substring"(installedat, 1, 11) installedat
      FROM
        db_stats_collector
      WHERE ((NOT ("workspaceid" IN (''))) AND ("version" LIKE '4.4%'))
      GROUP BY "substring"(installedat, 1, 11)
   )  d ON (a.installedat = d.installedat))
   WHERE (NOT ("trim"(a.installedat) IN ('0001-01-01')))
   ORDER BY installedat DESC)