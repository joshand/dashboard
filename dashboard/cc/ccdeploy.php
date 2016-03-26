<?php
include '../config.inc';
include '../library/common.inc';

$devpkid = $_POST['did'];
$scrpkid = $_POST['sid'];
$devname = $_POST['dnm'];

$arr_res = DeployCCXScript($dbtype,$dbserver,$dbname,$dbun,$dbpw,$devpkid,$devname,$scrpkid);

echo json_encode($arr_res);

function DeployCCXScript($dbt,$dbs,$dbn,$dbu,$dbp,$did,$dnm,$sid) {
	$arr_tasklist = Array();
        date_default_timezone_set("America/Chicago");
        $sqldt = date("Y-m-d H:i:s");

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "SELECT * FROM appdata WHERE (pkid = '$sid')";
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$dirname = do_db_result($dbt,$result,0,"vc1");
		$dirname = str_replace(" ","",$dirname);
	} else {
		$dirname = "newtest";
	}

	for($x=0;$x<=2;$x++) {
		$filequery = "";
		$filename = "";

		if($x==0) {
			$newdesc = $dnm . " Script Upload";
			$apitask = "c695492a-efdf-11e5-8dec-02549f4e45a9";
			$filequery = "SELECT pkid,vc1 FROM appblob WHERE pkid = '82f1b34a-efee-11e5-8dec-02549f4e45a9'";
			$fileval = "vc1";
			$pkidval = "pkid";
			$url = "http://ec2-52-27-156-220.us-west-2.compute.amazonaws.com/dashboard/cc/dlapp.php?pkid=";
		} else if($x==1) {
			$newdesc = $dnm . " Prompt Upload";
			$apitask = "593bad3d-f05d-11e5-8dec-02549f4e45a9";
			$filequery = "SELECT pkid,vc1 FROM apptext WHERE fkxref = '$sid'";
			$fileval = "vc1";
			$pkidval = "pkid";
			$url = "http://ec2-52-27-156-220.us-west-2.compute.amazonaws.com/dashboard/cc/dltts.php?pkid=";
		} else if($x==2) {
			$newdesc = $dnm . " Document Upload";
			$apitask = "b405ae49-f05c-11e5-8dec-02549f4e45a9";
			$filename = "EasyCCX.xml";
			$url = "http://ec2-52-27-156-220.us-west-2.compute.amazonaws.com/dashboard/cc/dlxml.php?pkid=$sid";
		}

		if(1==1) {
			$strSQL = "DELETE FROM taskqueue WHERE (fkapitask = '$apitask') AND (fkelement = '$did')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
		}

		if($filequery!="") {
			$arr_result = do_db_query($conn,$filequery,1,$dbt,$dbs,$dbn,$dbu,$dbp);
			$result = $arr_result[1];
			$num = $arr_result[0];
			for($y=0;$y<$num;$y++) {
				$pkid = do_db_result($dbt,$result,$y,$pkidval);
				$fn = do_db_result($dbt,$result,$y,$fileval);
				$newurl = $fn . "-)" . $url . $pkid;
				$strSQL = "INSERT INTO taskqueue (description,fkapitask,qval1,qval2,qval3,fkelement,singleuse,status,dtcreated) VALUES ('$newdesc','$apitask','$dirname','$fn','$newurl','$did',1,1,'$sqldt')";
				//echo $strSQL;
				$result2 = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
				$strSQL_ap = "SELECT pkid FROM taskqueue WHERE (dtcreated = '$sqldt') AND (qval3 = '$newurl')";
				$result_ap = do_db_query($conn,$strSQL_ap,0,$dbt,$dbs,$dbn,$dbu,$dbp);
				if($result_ap) {
					$addpkid = do_db_result($dbt,$result_ap,0,"pkid");
					array_push($arr_tasklist, $addpkid);
				}
			}
		} else {
			$newurl = $filename . "-)" . $url;
			$strSQL = "INSERT INTO taskqueue (description,fkapitask,qval1,qval2,qval3,fkelement,singleuse,status,dtcreated) VALUES ('$newdesc','$apitask','$dirname','$filename','$newurl','$did',1,1,'$sqldt')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$strSQL_ap = "SELECT pkid FROM taskqueue WHERE (dtcreated = '$sqldt') AND (qval3 = '$newurl')";
			$result_ap = do_db_query($conn,$strSQL_ap,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			if($result_ap) {
				$addpkid = do_db_result($dbt,$result_ap,0,"pkid");
				array_push($arr_tasklist, $addpkid);
			}
		}
	}

	$strSQL = "SELECT * FROM appdata WHERE (fkxref = '$sid') AND (i3 = 1) AND (vc3 = '')";
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
                $extnum = do_db_result($dbt,$result,0,"vc2");
	} else {
		$extnum = "9301";
	}

	$newdesc = $dnm . " Application Creation";
	$apitask = "ad4f62f4-f0bb-11e5-8dec-02549f4e45a9";
	$filename = "EasyCCX.aef";
	$strSQL = "DELETE FROM taskqueue WHERE (fkapitask = '$apitask') AND (fkelement = '$did')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "INSERT INTO taskqueue (description,fkapitask,qval1,qval2,qval3,fkelement,singleuse,status,dtcreated) VALUES ('$newdesc','$apitask','$dirname','$filename','$extnum','$did',1,1,'$sqldt')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

	$strSQL_ap = "SELECT pkid FROM taskqueue WHERE (dtcreated = '$sqldt') AND (qval3 = '$extnum')";
	$result_ap = do_db_query($conn,$strSQL_ap,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	if($result_ap) {
		$addpkid = do_db_result($dbt,$result_ap,0,"pkid");
		array_push($arr_tasklist, $addpkid);
	}

	do_db_close($dbt,$conn);

        return $arr_tasklist;
}
?>
