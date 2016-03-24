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
//$table = 'elements';
$table = 'elements'; 

// Table's primary key
//$primaryKey = 'id';
$primaryKey = '`e`.`pkid`';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
//    array( 'db' => 'NameOrIP', 'dt' => 0 ),
//    array( 'db' => 'refTenant',  'dt' => 1 ),
//    array( 'db' => 'refDeviceModel',   'dt' => 2 ),
    array( 'db' => '`e`.`pkid`',                  'dt' => 0,  'field' => 'pkid' ),
    array( 'db' => '`e`.`NameOrIP`',            'dt' => 1,  'field' => 'NameOrIP' ), 			//,     'formatter' => function( $d, $row ) { return '<a href="$row">' . $d . '</a>';} ),
    array( 'db' => '`e`.`lanip`',               'dt' => 2,  'field' => 'lanip' ),
    array( 'db' => '`tfx`.`LabelSingular`',     'dt' => 3,  'field' => 'LabelSingular' ),
    array( 'db' => '`tdm`.`Description`',       'dt' => 4,  'field' => 'Description' ),
    array( 'db' => '`e`.`lastupdate`',           'dt' => 5,  'field' => 'lastupdate' ),
    array( 'db' => '`tds2`.`name`',              'dt' => 6,  'field' => 'altname' ,         'as' => 'altname' ),
    array( 'db' => '`tfx2`.`LabelSingular`',     'dt' => 7,  'field' => 'alttype' ,         'as' => 'alttype' )
);

$joinQuery = "FROM `{$table}` AS `e` LEFT JOIN `typedevicemodel` AS `tdm` ON (`e`.`refDeviceModel` = `tdm`.`id`) LEFT JOIN `typedeviceseries` AS `tds` ON (`tdm`.`fkseries` = `tds`.`id`) LEFT JOIN `typedevicefamily` AS `tdf` ON (`tds`.`fkfamily` = `tdf`.`id`) LEFT JOIN `typefunction` AS `tfx` ON (`tdf`.`fkfunction` = `tfx`.`id`) LEFT JOIN `typedeviceseries` AS `tds2` ON ((`e`.`refDeviceModel` * -1) = `tds2`.`id`) LEFT JOIN `typedevicefamily` AS `tdf2` ON (`tds2`.`fkfamily` = `tdf2`.`id`) LEFT JOIN `typefunction` AS `tfx2` ON (`tdf2`.`fkfunction` = `tfx2`.`id`)";
$whereQuery = "(`e`.`fktenant` = '$tid')";

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

$arr_ssp = SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery, $whereQuery );
date_default_timezone_set("America/New_York");
$rf = $arr_ssp["recordsFiltered"];
for($x=0;$x<$rf;$x++) {
        if($arr_ssp["data"][$x][5]=="0000-00-00 00:00:00") {
	  $arr_ssp["data"][$x][5] = "Never";
	} else {
	  $dbdate = new DateTime($arr_ssp["data"][$x][5]);
	  $curdate = new DateTime();
	  $interval = $dbdate->diff($curdate,true);
	  //$interval = $curdate->diff($dbdate,true);

if(1==12) {
echo "--" . $arr_ssp["data"][$x][5] . "--" . var_dump($curdate) . "--\n<br>";
var_dump($interval);
echo "<hr>";
}

	  $dout = "";
          if($interval->s > 1) { $dout = $interval->s . " seconds"; } else if($interval->s > 0) { $dout = $interval->s . " seconds"; }
          if($interval->i > 1) { $dout = $interval->i . " minutes"; } else if($interval->i > 0) { $dout = $interval->i . " minute"; }
          if($interval->h > 1) { $dout = $interval->h . " hours"; } else if($interval->h > 0) { $dout = $interval->h . " hour"; }
          if($interval->d > 1) { $dout = $interval->d . " days"; } else if($interval->d > 0) { $dout = $interval->d . " day"; }
          if($interval->m > 1) { $dout = $interval->m . " months"; } else if($interval->m > 0) { $dout = $interval->m . " month"; }
	  if($interval->y > 1) { $dout = $interval->y . " years"; } else if($interval->y > 0) { $dout = $interval->y . " year"; }

	  if($dout!="") { $arr_ssp["data"][$x][5] = "About $dout ago"; }
	}

	if($arr_ssp["data"][$x][4] == "") {
		$arr_ssp["data"][$x][4] = $arr_ssp["data"][$x][6];
		$arr_ssp["data"][$x][3] = $arr_ssp["data"][$x][7];
	}
}
 
echo json_encode(
	$arr_ssp
//    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
//    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery, $whereQuery )
//    SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $sjoin, "", "" )
);
