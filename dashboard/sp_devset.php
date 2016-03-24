<?php
include 'config.inc';
include './library/common.inc';

$dc = checkGetAndPost("devcat");
$df = checkGetAndPost("devfam");
$dp = checkGetAndPost("devpid");

if($dc!="") {
	$arr_vals = UpdateDev($dbtype,$dbserver,$dbname,$dbun,$dbpw,$dc,"typedevicefamily","fkcategory","");
} else if($df!="") {
	$arr_vals = UpdateDev($dbtype,$dbserver,$dbname,$dbun,$dbpw,$df,"typedeviceseries","fkfamily","");
} else if($dp!="") {
	$arr_vals = UpdateDevAll($dbtype,$dbserver,$dbname,$dbun,$dbpw,$dp);
}

//$tempArray = array('id' => $id, 'ip' => $ip);
echo json_encode($arr_vals);

function UpdateDev($dbt,$dbs,$dbn,$dbu,$dbp,$dbval,$dbtab,$dbfld,$matchid) {
	$arr_ret = array();
	$strSQL = "SELECT * FROM $dbtab WHERE $dbfld = " . CleanSQL($dbval);
	//echo "--$strSQL--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $result = $arr_result[1];
        $num = $arr_result[0];
        for($x=0;$x<$num;$x++) {
                $ddesc = do_db_result($dbt,$result,$x,"name");
                $did = do_db_result($dbt,$result,$x,"id");
		if($did==$matchid) { $ddesc = "*$ddesc"; }

		$arr_ret[$did] = $ddesc;
	}
	do_db_close($dbt,$conn);

	return $arr_ret;
}

function UpdateDevAll($dbt,$dbs,$dbn,$dbu,$dbp,$dbval) {
	if(is_numeric($dbval)) {
		$newdbval = intval(CleanSQL($dbval));
		if($newdbval<0) {
			$strSQL = "SELECT typedeviceseries.*,typedevicefamily.fkcategory FROM typedeviceseries INNER JOIN typedevicefamily ON (typedeviceseries.fkfamily = typedevicefamily.id) INNER JOIN typedevicecategory ON (typedevicefamily.fkcategory = typedevicecategory.id) WHERE typedeviceseries.id = " . abs($newdbval) . "";
		} else {
			$strSQL = "SELECT typedeviceseries.*,typedevicefamily.fkcategory FROM typedevicemodel INNER JOIN typedeviceseries ON (typedevicemodel.fkseries = typedeviceseries.id) INNER JOIN typedevicefamily ON (typedeviceseries.fkfamily = typedevicefamily.id) INNER JOIN typedevicecategory ON (typedevicefamily.fkcategory = typedevicecategory.id) WHERE typedevicemodel.id = $newdbval";
		}
	} else {
		$strSQL = "SELECT typedeviceseries.*,typedevicefamily.fkcategory FROM typedevicemodel INNER JOIN typedeviceseries ON (typedevicemodel.fkseries = typedeviceseries.id) INNER JOIN typedevicefamily ON (typedeviceseries.fkfamily = typedevicefamily.id) INNER JOIN typedevicecategory ON (typedevicefamily.fkcategory = typedevicecategory.id) WHERE typedevicemodel.description LIKE '" . CleanSQL($dbval) . "'";
	}
	//echo "--$strSQL--";
        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $result = $arr_result[1];
        $num = $arr_result[0];
	if($num>0) {
		$devser = do_db_result($dbt,$result,0,"id");
		$devfam = do_db_result($dbt,$result,0,"fkfamily");
		$devcat = do_db_result($dbt,$result,0,"fkcategory");
	}
	do_db_close($dbt,$conn);

	if($num>0) {
	        $arr_vals1 = UpdateDev($dbt,$dbs,$dbn,$dbu,$dbp,1,"typedevicecategory",1,$devcat);
		$arr_vals2 = UpdateDev($dbt,$dbs,$dbn,$dbu,$dbp,$devcat,"typedevicefamily","fkcategory",$devfam);
		$arr_vals3 = UpdateDev($dbt,$dbs,$dbn,$dbu,$dbp,$devfam,"typedeviceseries","fkfamily",$devser);

	        return array("devcat" => $arr_vals1, "devfam" => $arr_vals2, "devser" => $arr_vals3);
	} else {
		return array("devcat","devfam","devser");
	}
}
?>
