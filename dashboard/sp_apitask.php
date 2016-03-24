<?php
include 'config.inc';
include './library/common.inc';

$gi = $_POST['gi'];
$gd = $_POST['gd'];
$am = $_POST['am'];
$au = $_POST['au'];
$ac = $_POST['ac'];
$as = $_POST['as'];
$ar = $_POST['ar'];
$ak = $_POST['ak'];
$ag = $_POST['ag'];

UpdateAPICallInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$gi,$gd,$am,$au,$ac,$as,$ar,$ak,$ag);

//$tempArray = array('id' => $id, 'ip' => $ip);
//echo json_encode($tempArray);

function UpdateAPICallInfo($dbt,$dbs,$dbn,$dbu,$dbp,$dgi,$dgd,$dam,$dau,$dac,$das,$dar,$dak,$dag) {
	$str_pkid = "";
	$strSQL = "UPDATE api_calls SET description = '" . CleanSQL($dgd) . "',method = '" . CleanSQL($dam) . "',url = '" . CleanSQL($dau) . "',content_type = '" . CleanSQL($dac) . "',soap_action = '" . CleanSQL($das) . "',credentials = '" . CleanSQL($dar) . "',cookie = '" . CleanSQL($dak) . "',message = '" . CleanSQL($dag) . "' WHERE pkid = '" . CleanSQL($dgi) . "'";
	//echo "--$strSQL--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	do_db_close($dbt,$conn);

	return 0;
}
?>
