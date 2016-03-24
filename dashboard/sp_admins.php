<?php
include 'config.inc';
include './library/common.inc';
 
/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simply to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See http://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - http://datatables.net/license_mit
 */
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */
$uid = checkGetAndPost("uid"); 
$cid = checkGetAndPost("cid"); 

// DB table to use
//$table = 'elements';
$table = 'customer'; 

// Table's primary key
//$primaryKey = 'id';
$primaryKey = '`c`.`pkid`';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns1 = array(
    array( 'db' => '`u`.`pkid`',                'dt' => 0,  'field' => 'pkid' ),
    array( 'db' => '`u`.`name`',                'dt' => 1,  'field' => 'name' ),
    array( 'db' => '`u`.`email`',               'dt' => 2,  'field' => 'email' ),
    array( 'db' => '`t`.`description`',         'dt' => 3,  'field' => 'description' )
);
$columns2 = array(
    array( 'db' => '`u`.`pkid`',                'dt' => 0,  'field' => 'pkid' ),
    array( 'db' => '`u`.`name`',                'dt' => 1,  'field' => 'name' ),
    array( 'db' => '`u`.`email`',               'dt' => 2,  'field' => 'email' )
);

//query1 = select customer.*,user.name,user.email,tenant.description from customer left join usercustomermap on (usercustomermap.fkcustomer = customer.pkid) left join user on (usercustomermap.fkuser = user.pkid) left join tenantmap on (tenantmap.fkcustomer = customer.pkid) left join tenant on (tenantmap.fktenant = tenant.pkid) where (customer.pkid = 'ac1ecd58-b766-11e5-8b39-296fb12cc761')
//query2 = select u2.name as orgusername, u2.email as orguseremail, user.name as tenantusername, user.email as tenantuseremail, tenant.description from customer left join tenantmap on (customer.pkid = tenantmap.fkcustomer) left join tenant on (tenantmap.fktenant = tenant.pkid) left join tenantmap as t2 on (t2.fktenant = tenant.pkid) left join user on (t2.fkuser = user.pkid) left join usercustomermap on (usercustomermap.fkcustomer = customer.pkid) left join user as u2 on (u2.pkid = usercustomermap.fkuser) where (customer.pkid = 'ac1ecd58-b766-11e5-8b39-296fb12cc761')
//query3 = select user.pkid, user.name, user.email, tenant.description from customer left join tenantmap on (customer.pkid = tenantmap.fkcustomer) left join tenant on (tenantmap.fktenant = tenant.pkid) left join tenantmap as t2 on (t2.fktenant = tenant.pkid) left join user on (t2.fkuser = user.pkid) where (customer.pkid = 'ac1ecd58-b766-11e5-8b39-296fb12cc761') and (user.pkid is not null)
// union select user.pkid, user.name, user.email, 'Organization' as description from customer left join usercustomermap on (customer.pkid = usercustomermap.fkcustomer) left join user on (usercustomermap.fkuser = user.pkid) where (customer.pkid = 'ac1ecd58-b766-11e5-8b39-296fb12cc761')
$joinQuery1 = "FROM `{$table}` AS `c` LEFT JOIN `tenantmap` AS `tm1` ON (`c`.`pkid` = `tm1`.`fkcustomer`) LEFT JOIN `tenant` AS `t` ON (`t`.`pkid` = `tm1`.`fktenant`) LEFT JOIN `tenantmap` AS `tm2` ON (`tm2`.`fktenant` = `t`.`pkid`) LEFT JOIN `user` AS `u` ON (`tm2`.`fkuser` = `u`.`pkid`)";
$whereQuery1 = "((`c`.`pkid` = '$cid') AND (`u`.`pkid` IS NOT NULL))";
$joinQuery2 = "FROM `{$table}` AS `c` LEFT JOIN `usercustomermap` AS `ucm` ON (`c`.`pkid` = `ucm`.`fkcustomer`) LEFT JOIN `user` AS `u` ON (`u`.`pkid` = `ucm`.`fkuser`)";
$whereQuery2 = "(`c`.`pkid` = '$cid')";

// SQL server connection information
$sql_details = array(
    'user' => $dbun,
    'pass' => $dbpw,
    'db'   => $dbname,
    'host' => $dbserver
);
 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 
require( './adminlte/ssp.class.php' );
 
$arr_ssp1 = SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns1, $joinQuery1, $whereQuery1 );
$rt1 = $arr_ssp1["recordsTotal"];
$rf1 = $arr_ssp1["recordsFiltered"];

$arr_ssp2 = SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns2, $joinQuery2, $whereQuery2 );
$rt2 = $arr_ssp2["recordsTotal"];
$rf2 = $arr_ssp2["recordsFiltered"];
for($x2=0;$x2<$rf2;$x2++) {
	$arr_ssp2["data"][$x2][3] = "Organization";
	//$rd2 = $arr_ssp2["data"][$x2];
	//$rd2[3] = "Organization";
	//var_dump($rd2);
}
$newrd=array_merge($arr_ssp1["data"],$arr_ssp2["data"]);
$newrt=$rt1+$rt2;
$newrf=$rf1+$rf2;

$new_arrssp = array("draw" => 0, "recordsTotal" => $newrt, "recordsFiltered" => $newrf, "data" => $newrd);
//echo "--$rt1--$rt2--$newrt--$rf1--$rf2--$newrf--";
//var_dump($newrd);

echo json_encode(
	$new_arrssp
//    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
    //SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery1, $whereQuery1 )
//    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns2, $joinQuery2, $whereQuery2 )
//    SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $sjoin, "", "" )
);
