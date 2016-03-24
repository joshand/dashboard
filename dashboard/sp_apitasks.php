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
$tid = checkGetAndPost("tid"); 
 
// DB table to use
$table = 'api_tasks'; 

// Table's primary key
$primaryKey = '`t`.`pkid`';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
if($tid=="") {
	$columns = array(
	    array( 'db' => '`t`.`pkid`',                  'dt' => 0,  'field' => 'pkid' ),
	    array( 'db' => '`t`.`description`',           'dt' => 1,  'field' => 'description' ),
            array( 'db' => '`f`.`description`',           'dt' => 2,  'field' => 'famdesc',       'as' => 'famdesc' )
	);

	$joinQuery = "FROM `{$table}` AS `t` LEFT JOIN `api_family` AS `f` ON (`t`.`fkfamily` = `f`.`pkid`)";
	$whereQuery = "";
} else {
        $columns = array(
            array( 'db' => '`c`.`pkid`',                  'dt' => 0,  'field' => 'pkid' ),
            array( 'db' => '`c`.`description`',           'dt' => 1,  'field' => 'description' ),
            array( 'db' => '`actm`.`morder`',             'dt' => 2,  'field' => 'morder' ),
            array( 'db' => '`c`.`method`',                'dt' => 3,  'field' => 'method' ),
            array( 'db' => '`c`.`url`',                   'dt' => 4,  'field' => 'url' ),
            array( 'db' => '`actm`.`id`',                 'dt' => 5,  'field' => 'id' ),
            array( 'db' => '`actm`.`parm1`',              'dt' => 6,  'field' => 'parm1' ),
            array( 'db' => '`actm`.`parm2`',              'dt' => 7,  'field' => 'parm2' ),
            array( 'db' => '`actm`.`parm3`',              'dt' => 8,  'field' => 'parm3' ),
            array( 'db' => '`actm`.`retdata`',            'dt' => 9,  'field' => 'retdata' ),
            array( 'db' => '`c`.`pkid`',                  'dt' => 10,  'field' => 'pkid' )
        );

        $joinQuery = "FROM `{$table}` AS `t` INNER JOIN `apicallstasksmap` AS `actm` ON (`t`.`pkid` = `actm`.`fkapitask`) LEFT JOIN `api_calls` AS `c` ON (`actm`.`fkapicall` = `c`.`pkid`) LEFT JOIN `api_family` AS `f` ON (`t`.`fkfamily` = `f`.`pkid`)";
        $whereQuery = "`t`.`pkid` = '$tid'";
	//SELECT * FROM api_tasks LEFT JOIN apicallstasksmap ON (api_tasks.pkid = apicallstasksmap.fkapitask) LEFT JOIN api_calls ON (apicallstasksmap.fkapicall = api_calls.pkid) WHERE (api_tasks.pkid = '0eac9c2c-c49f-11e5-9d09-02549f4e45a9') ORDER BY apicallstasksmap.morder ASC
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
