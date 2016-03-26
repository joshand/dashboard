<?php
include '../config.inc';
include '../library/common.inc';

$tenantid = $_POST['tenant'];
if(isset($_POST['ei'])) { $ei = $_POST['ei']; } else { $ei = ""; }
$ed = $_POST['ed'];
$co = json_decode($_POST['connectors'], true);
$st = json_decode($_POST['steps'], true);
$appid = "8eb7eba9-ede9-11e5-8dec-02549f4e45a9";

$arr_res = UpdateEasyCCX($dbtype,$dbserver,$dbname,$dbun,$dbpw,$appid,$tenantid,$ei,$ed,$co,$st);

echo json_encode($arr_res);

function UpdateEasyCCX($dbt,$dbs,$dbn,$dbu,$dbp,$appid,$tenantid,$dei,$ded,$dco,$dst) {
        $str_pkid = "";
        date_default_timezone_set("America/Chicago");
        $sqldt = date("Y-m-d H:i:s");
	if($ded=="") { $ded = $sqldt; }

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	if($dei!="") {
		//want to handle differently
		$strSQL = "DELETE FROM appdata WHERE (pkid = '$dei') OR (fkxref = '$dei')";
		$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
		$strSQL = "DELETE FROM apptext WHERE (fkxref = '$dei')";
		$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	}

	$strSQL = "INSERT INTO appdata (fkapp,fktenant,fkxref,vc1,dtcreated) VALUES ('$appid','$tenantid','','$ded','$sqldt')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	if($result) {
		$strSQL = "SELECT pkid FROM appdata WHERE (dtcreated = '$sqldt')";
		$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
		$pkid = do_db_result($dbt,$result,0,"pkid");
	} else {
		return -1;
	}

	for($x=0;$x<count($dst);$x++) {
		$elemid = $dst[$x]["elemid"];
		$elemxq = $dst[$x]["elemxq"];
		$elemyq = $dst[$x]["elemyq"];
		$elemty = $dst[$x]["elemty"];
		if(isset($dst[$x]["elemtx"])) { $elemtx = $dst[$x]["elemtx"]; } else { $elemtx = ""; }

		$recid = "prompt" . str_replace("clonediv","",$elemid) . ".wav";

		$instype = 0;
		if(($elemty == "1") || ($elemty == "4") || ($elemty == 6)) { $instype = 1; }
		if($elemtx == "") { $instype = 1; }

		if($instype == 1) {
			$strSQL = "INSERT INTO appdata (fkapp,fktenant,fkxref,vc1,vc2,i1,i2,i3,dtcreated) VALUES ('$appid','$tenantid','$pkid','$elemid','$elemtx',$elemxq,$elemyq,$elemty,'$sqldt')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
		} else {
			$strSQL = "INSERT INTO appdata (fkapp,fktenant,fkxref,vc1,i1,i2,i3,dtcreated) VALUES ('$appid','$tenantid','$pkid','$elemid',$elemxq,$elemyq,$elemty,'$sqldt')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$strSQL = "INSERT INTO apptext (fkapp,fktenant,fkxref,vc1,t1) VALUES ('$appid','$tenantid','$pkid','$recid','$elemtx')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
		}
	}

	for($x=0;$x<count($dco);$x++) {
		$orgdiv = $dco[$x]["orgdiv"];
		$dstdiv = $dco[$x]["dstdiv"];
		$opoint = $dco[$x]["opoint"];
		$dpoint = $dco[$x]["dpoint"];
		$lineid = $dco[$x]["lineid"];
		$orgosx = $dco[$x]["orgosx"];
		$orgosy = $dco[$x]["orgosy"];
		$dstosx = $dco[$x]["dstosx"];
		$dstosy = $dco[$x]["dstosy"];
		$orgnum = $dco[$x]["orgnum"];

		$strSQL = "INSERT INTO appdata (fkapp,fktenant,fkxref,vc1,vc2,vc3,vc4,vc5,i1,i2,i3,i4,i5,dtcreated) VALUES ('$appid','$tenantid','$pkid','$orgdiv','$opoint','$dstdiv','$dpoint','$lineid',$orgosx,$orgosy,$dstosx,$dstosy,$orgnum,'$sqldt')";
		$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
		//echo $strSQL . "\n";
	}

        //$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
        //$arr_result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
        do_db_close($dbt,$conn);

        return Array("id" => $pkid, "name" => $ded);
}
?>
