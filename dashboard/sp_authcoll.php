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
$cid = checkGetAndPost("cid"); 
$uid = checkGetAndPost("uid");
$eid = checkGetAndPost("eid");

if($cid=="") {
	$table = 'collector';

	$primaryKey = '`c`.`pkid`';

        $columns1 = array(
            array( 'db' => '`c`.`pkid`',                  'dt' => 0,  'field' => 'pkid' ),
            array( 'db' => '`c`.`description`',           'dt' => 1,  'field' => 'cd',         'as' => 'cd' ),
            array( 'db' => '`cu`.`description`',          'dt' => 2,  'field' => 'description' )
        );
        $columns2 = array(
            array( 'db' => '`c`.`pkid`',                  'dt' => 0,  'field' => 'pkid' ),
            array( 'db' => '`c`.`description`',           'dt' => 1,  'field' => 'cd',         'as' => 'cd' ),
            array( 'db' => '`t`.`description`',           'dt' => 2,  'field' => 'description' )
        );

        $joinQuery1 = "FROM `{$table}` AS `c` INNER JOIN `customer` AS `cu` ON (`c`.`fkcustomer` = `cu`.`pkid`) INNER JOIN `usercustomermap` AS `ucm` ON (`ucm`.`fkcustomer` = `cu`.`pkid`)";
        $whereQuery1 = "`ucm`.`fkuser` = '$uid'";

        $joinQuery2 = "FROM `{$table}` AS `c` INNER JOIN `tenant` AS `t` ON (`c`.`fktenant` = `t`.`pkid`) INNER JOIN `elements` AS `e` ON (`c`.`fktenant` = `e`.`fkTenant`)";
	$whereQuery2 = "`e`.`pkid` = '$eid'";
} else {
	// DB table to use
	$table = 'collectorelementmap'; 

	// Table's primary key
	$primaryKey = '`cem`.`id`';
 
	// Array of database columns which should be read and sent back to DataTables.
	// The `db` parameter represents the column name in the database, while the `dt`
	// parameter represents the DataTables column identifier. In this case simple
	// indexes
	$columns1 = array(
	    array( 'db' => '`c`.`pkid`',                  'dt' => 0,  'field' => 'pkid' ),
	    array( 'db' => '`c`.`description`',           'dt' => 1,  'field' => 'cd',         'as' => 'cd' ),
	    array( 'db' => '`cu`.`description`',          'dt' => 2,  'field' => 'description' )
	);
	$columns2 = array(
	    array( 'db' => '`c`.`pkid`',                  'dt' => 0,  'field' => 'pkid' ),
	    array( 'db' => '`c`.`description`',           'dt' => 1,  'field' => 'cd',         'as' => 'cd' ),
	    array( 'db' => '`t`.`description`',           'dt' => 2,  'field' => 'description' )
	);
	
	$joinQuery1 = "FROM `{$table}` AS `cem` LEFT JOIN `collector` AS `c` ON (`cem`.`fkcollector` = `c`.`pkid`) INNER JOIN `customer` AS `cu` ON (`c`.`fkcustomer` = `cu`.`pkid`)";
	$joinQuery2 = "FROM `{$table}` AS `cem` LEFT JOIN `collector` AS `c` ON (`cem`.`fkcollector` = `c`.`pkid`) INNER JOIN `tenant` AS `t` ON (`c`.`fktenant` = `t`.`pkid`)";
	$whereQuery1 = "`cem`.`fkelement` = '$cid'";
	$whereQuery2 = $whereQuery1;
}

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
for($x1=0;$x1<$rf1;$x1++) {
        $arr_ssp1["data"][$x1][2] = "Customer: " . $arr_ssp1["data"][$x1][2];
}

$arr_ssp2 = SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns2, $joinQuery2, $whereQuery2 );
$rt2 = $arr_ssp2["recordsTotal"];
$rf2 = $arr_ssp2["recordsFiltered"];
for($x2=0;$x2<$rf2;$x2++) {
        $arr_ssp2["data"][$x2][2] = "Tenant: " . $arr_ssp2["data"][$x2][2];
}
$newrd=array_merge($arr_ssp1["data"],$arr_ssp2["data"]);
$newrt=$rt1+$rt2;
$newrf=$rf1+$rf2;

$new_arrssp = array("draw" => 0, "recordsTotal" => $newrt, "recordsFiltered" => $newrf, "data" => $newrd);

echo json_encode(
        $new_arrssp
);

