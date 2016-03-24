<?php
include 'config.inc';
include './library/common.inc';

$te = checkGetAndPost("te");
$sn = checkGetAndPost("sn");

ClaimDevice($dbtype,$dbserver,$dbname,$dbun,$dbpw,$te,$sn);

//$tempArray = array('id' => $id, 'ip' => $ip);
//echo json_encode($tempArray);

function ClaimDevice($dbt,$dbs,$dbn,$dbu,$dbp,$tid,$dsn) {
	$str_pkid = "";
	$strSQL = "SELECT * FROM elements WHERE serialnum = '" . CleanSQL($dsn) . "'";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$strSQL = "UPDATE elements SET fktenant = '" . CleanSQL($tid) . "' WHERE serialnum = '" . CleanSQL($dsn) . "'";
	} else {
		$strSQL = "INSERT INTO elements (fktenant,serialnum,NameOrIP) VALUES ('" . CleanSQL($tid) . "','" . CleanSQL($dsn) . "','Unknown')";
	}
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

	do_db_close($dbt,$conn);

	return 0;
}
?>
