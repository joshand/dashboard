<?php
include 'config.inc';
//include './library/common.inc';
include 'minheader.inc';

$tb = checkGetAndPost("tb");
$gd = checkGetAndPost("gd");
$gi = checkGetAndPost("gi");
$e1 = checkGetAndPost("e1");
$e1f = checkGetAndPost("e1f");
$e2 = checkGetAndPost("e2");
$e2f = checkGetAndPost("e2f");

if ($gi!="") {
	$ret = UpdRecord($dbtype,$dbserver,$dbname,$dbun,$dbpw,$tb,$gd,$userid,$gi,$e1,$e1f,$e2,$e2f);
} else if ($gd!="") {
	$ret = NewRecord($dbtype,$dbserver,$dbname,$dbun,$dbpw,$tb,$gd,$userid,$e1,$e1f,$e2,$e2f);
} else {
	$ret = "";
}

$tempArray = array('id' => $ret);
echo json_encode($tempArray);

function NewRecord($dbt,$dbs,$dbn,$dbu,$dbp,$tbl,$dsc,$uid,$e1,$e1f,$e2,$e2f) {
        if(($e1!="") && ($e1f!="")) {
                $extupf = ",$e1f";
		$extupd = ",'" . CleanSQL($e1) . "'";
                if(($e2!="") && ($e2f!="")) {
                	$extupf .= ",$e2f";
                	$extupd .= ",'" . CleanSQL($e2) . "'";
                }
        } else {
		$extupf = "";
                $extupd = "";
        }

	$str_pkid = "";
	date_default_timezone_set("America/Chicago");
	$sqldt = date("Y-m-d H:i:s");

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "INSERT INTO $tbl (description,dtcreated,dtcreateduid$extupf) VALUES ('" . CleanSQL($dsc) . "','$sqldt','$uid'$extupd)";
        $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	if($result) {
                $dfld = "description";
		$dfid = "pkid";
        } else {
	        $strSQL = "INSERT INTO $tbl (name,dtcreated,dtcreateduid$extupf) VALUES ('" . CleanSQL($dsc) . "','$sqldt','$uid'$extupd)";
        	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
		$dfld = "name";
		$dfid = "id";
	}
	$strSQL = "SELECT $dfid FROM $tbl WHERE ($dfld = '" . CleanSQL($dsc) . "') AND (dtcreated = '$sqldt')";
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$pkid = do_db_result($dbt,$result,0,$dfid);
	} else {
		$pkid = "";
	}
	do_db_close($dbt,$conn);

	return $pkid;
}

function UpdRecord($dbt,$dbs,$dbn,$dbu,$dbp,$tbl,$dsc,$uid,$recid,$e1,$e1f,$e2,$e2f) {
	if(($e1!="") && ($e1f!="")) {
		$extupd = ",$e1f = '" . CleanSQL($e1) . "'";
		if(($e2!="") && ($e2f!="")) {
			$extupd .= ",$e2f = '" . CleanSQL($e2) . "'";
		}
	} else {
		$extupd = "";
	}
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "UPDATE $tbl SET description = '" . CleanSQL($dsc) . "'$extupd WHERE pkid = '" . CleanSQL($recid) . "'";
        $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	if(!$result) {
	        $strSQL = "UPDATE $tbl SET name = '" . CleanSQL($dsc) . "'$extupd WHERE id = '" . CleanSQL($recid) . "'";
	        $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	}
	do_db_close($dbt,$conn);

	return $recid;
}
?>
