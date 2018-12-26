//-----------------------------------------------------------------------------------------------
//Purpose: Purpose of this script is to grant database, table and view security w.r.t to roles
//Description: Database, Table and view security access to corresponding roles.

//Version-------------Name------------------Date--------------------Description-----------------
//1.0                 Vijaybabu Nakkonda    23-Dec-2018             Initial Version
//-----------------------------------------------------------------------------------------------
//Parameters
set Database_Name='Test_Database'
set Warehouse_Name='Compute_WH'


//-------Database privileges security setup

grant usage,monitor,create schema   on database identifier($Database_Name) to role BI_Admin;
grant usage,monitor,create schema   on database identifier($Database_Name) to role BI_Analyst;
grant usage,monitor,create schema   on database identifier($Database_Name) to role BI_Dev;
grant usage,monitor,create schema   on database identifier($Database_Name) to role BI_Tester;
grant usage,monitor,create schema   on database identifier($Database_Name) to role BI_Proxy;
grant usage,monitor                 on database identifier($Database_Name) to role BI_Reader;
grant usage,monitor                 on database identifier($Database_Name) to role BI_Operator;

// to test this security execute the below script
// show schemas             - to test usage security setup
// desc database <dbname>   - to test monitor security setup
// create schema myschema   - to test create schema security setup

//-------Warehouse privileges security setup
grant modify,monitor,operate,usage  on warehouse identifier($Warehouse_Name) to role BI_Admin;
grant modify,monitor,operate,usage  on warehouse identifier($Warehouse_Name) to role BI_Dev;
grant usage                         on warehouse iden   tifier($Warehouse_Name) to role BI_Analyst;
grant usage                         on warehouse identifier($Warehouse_Name) to role BI_Tester;
grant usage                         on warehouse identifier($Warehouse_Name) to role BI_Proxy;
grant usage                         on warehouse identifier($Warehouse_Name) to role BI_Reader;
grant usage                         on warehouse identifier($Warehouse_Name) to role BI_Operator;

// to test this security execute the below script
// To test Usage    - try to create a temp table and insert a row, run any query. Query uses warehouse power.
// To test Modify   - try to modify warehouse capacity using Alter warehouse command and set properties 
// To    - to test create schema security setup

grant select on all tables in schema t1.public to role BI_Analyst;

//-------Public schema security setup on Database
grant all on schema t1.public    to role BI_Admin;
grant all on schema t1.public    to role BI_Dev;
grant all on schema t1.public    to role BI_Proxy;
grant usage on schema t1.public  to role BI_Analyst;
grant usage on schema t1.public  to role BI_Tester;
grant usage on schema t1.public  to role BI_Operator;
grant usage on schema t1.public  to role BI_Reader;


//----------Table access
//----------After every table creation below scripts need to rerun so that new table read access are given to other roles
grant all on all tables in schema t1.public  to role BI_Dev;
grant all on all tables in schema t1.public  to role BI_Proxy;

grant select on all tables in schema t1.public  to role BI_Analyst;
grant select on all tables in schema t1.public  to role BI_Tester;
grant select on all tables in schema t1.public  to role BI_Operator;
grant select on all tables in schema t1.public  to role BI_Reader;

//----------View access
//----------After every table creation below scripts need to rerun so that new table read access are given to other roles
grant select on all views in schema t1.public  to role BI_Dev;
grant select on all views in schema t1.public  to role BI_Proxy;
grant select on all views in schema t1.public  to role BI_Analyst;
grant select on all views in schema t1.public  to role BI_Tester;
grant select on all views in schema t1.public  to role BI_Operator;
grant select on all views in schema t1.public  to role BI_Reader;