<?php
include '../config.inc';
include '../library/common.inc';

//$pkid = checkGetAndPost("id");
$idlist = checkGetAndPost("list");
$appid = "8eb7eba9-ede9-11e5-8dec-02549f4e45a9";

$arr_res = CheckTask($dbtype,$dbserver,$dbname,$dbun,$dbpw,$idlist);

echo json_encode($arr_res);

function CheckTask($dbt,$dbs,$dbn,$dbu,$dbp,$pkidlist) {
	if($pkidlist=="") {
		return "Error: ID Required";
	}
        $ret = "";
        date_default_timezone_set("America/Chicago");

	$arr_pkid = json_decode($pkidlist);
	$strSQL = "SELECT * FROM taskqueue WHERE ";
	for($x=0;$x<count($arr_pkid);$x++) {
		$strSQL .= "(pkid = '" . $arr_pkid[$x] . "')";
		if(($x+1)!=count($arr_pkid)) {
			$strSQL .= " OR ";
		}
	}
	//echo $strSQL;

	$time = time();
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$donecount = 0;
	while(1==1) {
		//$strSQL = "SELECT status FROM taskqueue WHERE (pkid = '$pkid')";
		$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
		$result = $arr_result[1];
		$num = $arr_result[0];
		$lastdonecount = $donecount;
		$donecount = 0;
		for($x=0;$x<$num;$x++) {
			$stat = do_db_result($dbt,$result,$x,"status");
			$pkid = do_db_result($dbt,$result,$x,"pkid");
			if($stat==3) {
				$donecount++;
			}

			//echo "--$x--$time--$pkid--$donecount--$num--" . $donecount/$num . "--$stat--<br>";
		}
		if($donecount>$lastdonecount) { $time = time(); }
		//echo "--$donecount--<br>";

		if((time() - $time) >= 60) {
			$ret = "Timeout";
			break;
		}
		file_put_contents('/var/www/html/uploads/progress.json',json_encode(array("percentComplete"=>$donecount/$num)));
		if($donecount>=$num) {
			$ret = "Deployed!";
			break;
		}
		sleep(5);
	}
        do_db_close($dbt,$conn);

        return Array("status" => $ret);
}
?>
