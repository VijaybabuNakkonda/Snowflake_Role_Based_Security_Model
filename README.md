# Snowflake_Role_Based_Security_Model
Snowflake role based security model

Introduction: An exercise to apply role based security model on snowflake database is performed. Few custom roles are created and database level security is applied.

Read Snowflake access control overview to understand standard roles from Snowflake.
https://docs.snowflake.net/manuals/user-guide/security-access-control-overview.html

To understand access control privileges refer below link.
https://docs.snowflake.net/manuals/user-guide/security-access-control-privileges.html

User management is performed only by a SECURITYADMIN.
Six levels of security assumed to manage Snowflake dataplatform development and operations 

BI_Admin - Full access on database.
BI_Dev   - Full access on databse.
BI_Proxy - Full access on databse.
BI_Analyst - Read public schema objects and create own schema objects 
BI_Tester - Read public schema objects and create own schema objects
BI_Reader - Only reader access
BI_Operator - to execute jobs / pipes

Files uploaded
1. Roles_Creation.sql     - Create Roles and users with hierarchal role security
2. Database_Security.sql  - Assign role based security access to database, warehouse, tables and views  
