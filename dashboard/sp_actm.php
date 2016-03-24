<?php
include 'config.inc';
include './library/common.inc';

$ai = checkGetAndPost("ai");
$ao = checkGetAndPost("ao");
$a1 = checkGetAndPost("a1");
$a2 = checkGetAndPost("a2");
$a3 = checkGetAndPost("a3");
$ar = checkGetAndPost("ar");

if($ai!="") {
	UpdateACTMInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$ai,$ao,$a1,$a2,$a3,$ar);
}

//$tempArray = array('id' => $id, 'ip' => $ip);
//echo json_encode($tempArray);

function UpdateACTMInfo($dbt,$dbs,$dbn,$dbu,$dbp,$dai,$dao,$da1,$da2,$da3,$dar) {
	$str_pkid = "";
	$strSQL = "UPDATE apicallstasksmap SET morder = '" . CleanSQL($dao) . "',parm1 = '" . CleanSQL($da1) . "',parm2 = '" . CleanSQL($da2) . "',parm3 = '" . CleanSQL($da3) . "',retdata = '" . CleanSQL($dar) . "' WHERE id = '" . CleanSQL($dai) . "'";
	//echo "--$strSQL--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	do_db_close($dbt,$conn);

	return 0;
}
?>
