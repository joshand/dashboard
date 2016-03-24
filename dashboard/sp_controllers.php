<?php
include 'config.inc';
 
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
 
// DB table to use
$table = 'controllers'; 

// Table's primary key
$primaryKey = '`c`.`pkid`';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
    array( 'db' => '`c`.`pkid`',                'dt' => 0,  'field' => 'pkid' ),
    array( 'db' => '`c`.`name`',                'dt' => 1,  'field' => 'name' ),
    array( 'db' => '`c`.`lanip`',               'dt' => 2,  'field' => 'lanip' ),
    array( 'db' => '`tfx`.`LabelSingular`',     'dt' => 3,  'field' => 'LabelSingular' ),
    array( 'db' => '`tdm`.`Description`',       'dt' => 4,  'field' => 'Description' )
);

$joinQuery = "FROM `{$table}` AS `c` LEFT JOIN `typedevicemodel` AS `tdm` ON (`c`.`refDeviceModel` = `tdm`.`id`) LEFT JOIN `typedeviceseries` AS `tds` ON (`tdm`.`refSeries` = `tds`.`ID`) LEFT JOIN `typefunction` AS `tfx` ON (`tds`.`refFunction` = `tfx`.`ID`)";

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
//    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery )
//    SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $sjoin, "", "" )
);
