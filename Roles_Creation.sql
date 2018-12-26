
//-----------------------------------------------------------------------------------------------
//Purpose: Purpose of this script is to setup multiple roles and respective security
//Description: Below script will create Admin, Analyst, Dev, Tester, Reader, Operator and Proxy accounts.
//             An user for each role is created for testing purpose
//             Hierarchical setup of roles is performed based on below order
//             Sysadmin-->Admin-->Dev-->Analyst-->Tester-->Reader
//             Sysadmin-->Admin-->Proxy-->Operator
//Version-------------Name------------------Date--------------------Description-----------------
//1.0                 Vijaybabu Nakkonda    23-Dec-2018             Initial Version
//-----------------------------------------------------------------------------------------------

//Create multiple security roles
use role securityadmin;
Create or Replace Role BI_Admin comment='Created to manage BI_Admin activities';
Create or Replace Role BI_Analyst comment='Created to managed BI_Analyst activities';
Create or Replace Role BI_Dev comment='Created to managed BI_Devlopment activities';
Create or Replace Role BI_Tester comment='Created to managed BI Test activities';
Create or Replace Role BI_Reader comment='Created to managed BI Reader activities';
Create or Replace Role BI_Operator comment='Created to managed Job Operator activities';
Create or Replace Role BI_Proxy comment='Created to managed BI_Proxy activities';

//create bi users
create or replace user usr_BI_Admin password = 'usr_BI_Admin' default_role = BI_Admin must_change_password = false;
create or replace user usr_BI_Analyst password = 'usr_BI_Analyst' default_role = BI_Analyst must_change_password = false;
create or replace user usr_BI_Dev password = 'usr_BI_Dev' default_role = BI_Dev must_change_password = false;
create or replace user usr_BI_Tester password = 'usr_BI_Tester' default_role = BI_Tester must_change_password = false;
create or replace user usr_BI_Reader password = 'usr_BI_Reader' default_role = BI_Reader must_change_password = false;
create or replace user usr_BI_Operator password = 'usr_BI_Operator' default_role = BI_Operator must_change_password = false;
create or replace user usr_BI_Proxy password = 'usr_BI_Proxy' default_role = BI_Proxy must_change_password = false;

//assign users to bi_admin role 
grant role BI_Admin to user usr_BI_Admin;
grant role BI_Analyst to user usr_BI_Analyst;
grant role BI_Dev to user usr_BI_Dev; 
grant role BI_Tester to user usr_BI_Tester;
grant role BI_Reader to user usr_BI_Reader;
grant role BI_Operator to user usr_BI_Operator;
grant role BI_Proxy to user usr_BI_Proxy;

//Hierarchal security setup
  //SYSADMIN has access to objects created by BI_Admin except BI_Admin
  grant role BI_Admin to role SYSADMIN;
  
  //BI_Admin has access to objects created by all other roles
  grant role BI_Analyst,BI_Dev,BI_Tester,BI_Reader,BI_Operator,BI_Proxy to role BI_Admin;
  
  //BI_Dev has access to objects created by all other roles except BI_Admin
  grant role BI_Analyst,BI_Tester,BI_Reader,BI_Operator,BI_Proxy to role BI_Dev;
  //BI_Proxy has access to objects created by all other roles except BI_Admin and BI_Dev
  grant role BI_Analyst,BI_Tester,BI_Reader,BI_Operator to role BI_Proxy;
  
  //BI_Analyst has access to objects created by BI_Tester
  grant role BI_Tester to role BI_Analyst;

//To check hierarchal secrity setup
//show grants on role BI_Tester;
//show users