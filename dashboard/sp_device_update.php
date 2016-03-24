<?php
include 'config.inc';
include './library/common.inc';

$etype = $_POST['etype'];
$id = $_POST['id'];
$ip = $_POST['ip'];
$vl = $_POST['vl'];
$sm = $_POST['sm'];
$dn = $_POST['dn'];
$dt = "";	//$_POST['dt'];
$dg = $_POST['dg'];
$d1 = $_POST['d1'];
$d2 = $_POST['d2'];
$it = $_POST['it'];
$sn = $_POST['sn'];
$dy = "";	//$_POST['dy'];
$duser = $_POST['duser'];
$dpass = $_POST['dpass'];
$dtype = $_POST['dtype'];
$dtypa = "";	//$_POST['dtypa'];
$dpid = $_POST['dpid'];
$dser = $_POST['dser'];

UpdateDeviceInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$id,$ip,$etype,$vl,$sm,$dn,$dt,$dg,$d1,$d2,$it,$sn,$dy,$duser,$dpass,$dtype,$dtypa,$dpid,$dser);

//$tempArray = array('id' => $id, 'ip' => $ip);
//echo json_encode($tempArray);

function UpdateDeviceInfo($dbt,$dbs,$dbn,$dbu,$dbp,$did,$dip,$etype,$dvl,$dsm,$ddn,$ddt,$ddg,$dd1,$dd2,$dit,$dsn,$ddy,$dun,$dpw,$dty,$dta,$dpid,$dser) {
	$str_pkid = "";
	if($dser=="Device Series") { $dser = "0"; }
	if($dpid=="") {
		$dser = "-" . $dser;
	} else {
		$strSQL = "SELECT * FROM typedevicemodel WHERE description LIKE '" . CleanSQL($dpid) . "'";
		$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        	$result = $arr_result[1];
        	$num = $arr_result[0];
		if($num>0) {
			$tdmid = do_db_result($dbt,$result,0,"id");
			$tdmser = do_db_result($dbt,$result,0,"fkseries");
			if($tdmser=="0") {
				if($dser!="0") {
					$strSQL = "UPDATE typedevicemodel SET fkseries = " . CleanSQL($dser) . " WHERE id = " . $tdmid;
					$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
				}
			}
		} else {
			$strSQL = "INSERT INTO typedevicemodel (fkseries,description) VALUES (" . CleanSQL($dser) . ",'" . CleanSQL($dpid) . "')";
echo "--$strSQL--";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$strSQL = "SELECT id FROM typedevicemodel WHERE (fkseries = " . CleanSQL($dser) . ") AND (description = '" . CleanSQL($dpid) . "')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$tdmid = do_db_result($dbt,$result,0,"id");
		}
		$dser = $tdmid;
	}
	if($etype=="1") {
		//echo "--DVL=$dvl--";
		if(($dvl=="0") || ($dvl=="")) { $dvl="-1"; }
		$strSQL = "UPDATE elements SET lanip = '" . CleanSQL($dip) . "',NameOrIP = '" . CleanSQL($ddn) . "',serialnum = '" . CleanSQL($dsn) . "',refDeviceModel = '" . CleanSQL($dser) . "',username = '" . CleanSQL($dun) . "',password = '" . CleanSQL($dpw) . "',mgmttype = '" . CleanSQL($dty) . "' WHERE pkid = '" . CleanSQL($did) . "'";
		echo "--SQL=$strSQL--";
	} else {
		$strSQL = "UPDATE controllers SET lanip = '" . CleanSQL($dip) . "' WHERE pkid = '" . CleanSQL($did) . "'";
	}
	//echo "--$strSQL--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	do_db_close($dbt,$conn);

	return 0;
}
?>
