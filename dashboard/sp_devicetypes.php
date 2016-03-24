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
$tid = checkGetAndPost("id"); 
 
// DB table to use
$table = 'typedeviceseries'; 

// Table's primary key
$primaryKey = '`tds`.`id`';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
if($tid=="") {
	$columns = array(
	    array( 'db' => '`tds`.`id`',                  'dt' => 0,  'field' => 'id' ),
	    array( 'db' => '`tds`.`name`',                'dt' => 1,  'field' => 'sername',       'as' => 'sername' ),
            array( 'db' => '`tdf`.`name`',                'dt' => 2,  'field' => 'famname',       'as' => 'famname' ),
            array( 'db' => '`tdc`.`name`',                'dt' => 3,  'field' => 'catname',       'as' => 'catname' )
	);

	$joinQuery = "FROM `{$table}` AS `tds` LEFT JOIN `apifamilydeviceseriesmap` AS `afdsm` ON (`afdsm`.`fkdevicefamily` = `tds`.`id`) LEFT JOIN `typedevicefamily` AS `tdf` ON (`tdf`.`id` = `tds`.`fkfamily`) LEFT JOIN `typedevicecategory` AS `tdc` ON (`tdc`.`id` = `tdf`.`fkcategory`)";
	$whereQuery = "";
} else {
        $columns = array(
            array( 'db' => '`tds`.`id`',                  'dt' => 0,  'field' => 'id' ),
            array( 'db' => '`tds`.`name`',                'dt' => 1,  'field' => 'sername',       'as' => 'sername' ),
            array( 'db' => '`tdf`.`name`',                'dt' => 2,  'field' => 'famname',       'as' => 'famname' ),
            array( 'db' => '`tdc`.`name`',                'dt' => 3,  'field' => 'catname',       'as' => 'catname' )
        );

        $joinQuery = "FROM `{$table}` AS `tds` LEFT JOIN `apifamilydeviceseriesmap` AS `afdsm` ON (`afdsm`.`fkdevicefamily` = `tds`.`id`) LEFT JOIN `typedevicefamily` AS `tdf` ON (`tdf`.`id` = `tds`.`fkfamily`) LEFT JOIN `typedevicecategory` AS `tdc` ON (`tdc`.`id` = `tdf`.`fkcategory`)";
        $whereQuery = "`afdsm`.`fkapifamily` = '$tid'";
}

//echo "--$joinQuery--<br>--$whereQuery--<br>";

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

echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery, $whereQuery )
);
