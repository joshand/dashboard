<?php
include '../config.inc';
include '../../library/common.inc';

$pkid = checkGetAndPost("pkid");
$arr_ret = GetAppFromDB($dbtype,$dbserver,$dbname,$dbun,$dbpw,$pkid);
$fn = $arr_ret[1];
$fd = $arr_ret[0];

header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename=\"" . $fn . "\"");
echo $fd;

function GetAppFromDB($dbt,$dbs,$dbn,$dbu,$dbp,$pkid) {
	$ret = "";
	$strSQL = "SELECT b1,vc1 FROM appblob WHERE pkid = '$pkid'";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$ret1 = do_db_result($dbt,$result,0,"b1");
		$ret2 = do_db_result($dbt,$result,0,"vc1");
		$ret = Array($ret1,$ret2);
	} else {
		$ret = Array("");
	}
	do_db_close($dbt,$conn);

	return $ret;
}
?>
