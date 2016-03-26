<?php
include '../config.inc';
include '../../library/common.inc';

$pkid = checkGetAndPost("pkid");
$fd = "";
$estack = Array("clonediv1");
do {
	$arr_fd = GetElement($dbtype,$dbserver,$dbname,$dbun,$dbpw,$pkid,$estack);
	$fd .= $arr_fd[0];
	$estack = $arr_fd[1];
} while (count($estack)>0);
$arr_hf = GetHeadAndFoot($dbtype,$dbserver,$dbname,$dbun,$dbpw,$pkid);

$fd = $arr_hf[0] . $fd;
$fd = $fd . $arr_hf[1];

if(1==2) {
	$deb = $fd;
	$deb = str_replace(">","&gt;",$deb);
	$deb = str_replace("<","&lt;",$deb);
	$deb = str_replace("\r\n","<br>",$deb);
	$deb = str_replace(" ", "-", $deb);
	echo $deb;
}

header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename=\"" . $arr_hf[2] . "\"");

echo $fd;

function GetHeadAndFoot($dbt,$dbs,$dbn,$dbu,$dbp,$pkid) {
        $ret1 = "<easyccx>\r\n";
        $strSQL = "SELECT * FROM appdata WHERE (fkxref = '$pkid') AND (i3 = 1) AND (i5 = 0)";  //object type 1 is an entry point; 5 to avoid mismatch

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $result = $arr_result[1];
        $num = $arr_result[0];

        if($num>0) {
		$ret1 .= "  <inputnumbers>" . $num . "</inputnumbers>\r\n";
        }

        $strSQL = "SELECT * FROM appdata WHERE (pkid = '$pkid') AND (fkxref = '')";
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $result = $arr_result[1];
        $num = $arr_result[0];
        if($num>0) {
		$appname = do_db_result($dbt,$result,0,"vc1");
		$appname = str_replace(" ", "", $appname);
		$fn = strtolower($appname) . ".xml";
	}
	do_db_close($dbt,$conn);

	$ret2 = "</easyccx>";
        return Array($ret1,$ret2,$fn);
}

function GetElement($dbt,$dbs,$dbn,$dbu,$dbp,$pkid,$elemstack) {
	$ename = array_shift($elemstack);
	$ret = "  <input>\r\n";
	$itype = "";
        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);

	$strSQL = "SELECT * FROM appdata WHERE (pkid = '$pkid') AND (fkxref = '')";
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$appname = do_db_result($dbt,$result,0,"vc1");
		$appname = str_replace(" ", "", $appname);

		$strSQL = "SELECT * FROM appdata WHERE (fkxref = '$pkid') AND (vc1 = '$ename') ORDER BY vc3 ASC";
		$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
		$result = $arr_result[1];
		$num = $arr_result[0];
		for($x=0;$x<$num;$x++) {
			$i3 = do_db_result($dbt,$result,$x,"i3");
			$i5 = do_db_result($dbt,$result,$x,"i5");
			$vc2 = do_db_result($dbt,$result,$x,"vc2");
			$vc3 = do_db_result($dbt,$result,$x,"vc3");
			if($vc3=="") {
				$promptnum = str_replace("clonediv", "", $ename);
				$enewname = $ename;
				$hasprompt = 0;
				$hasqueue = "";
				$hasvalue = "";
				switch ($i3) {
					case "1":
						$itype = "";		//incoming call; don't need a type for this one
						$enewname = $promptnum;
						$hasvalue = $vc2;
						break;
					case "2":
						$itype = "menu";
						$hasprompt = 1;
						break;
					case "3":
						$itype = "prompt";
						$hasprompt = 1;
						break;
					case "4":
						$itype = "transfer";
						$hasvalue = $vc2;
						break;
					case "5":
						$itype = "extdial";
						$hasprompt = 1;
						break;
                                        case "6":
                                                $itype = "acd";
                                                $hasqueue = $vc2;
                                                break;
					default:
						$itype = "unknown";
						break;
				}

                                $ret .= "    <name>" . $enewname . "</name>\r\n";
                                if($itype!="") { $ret .= "    <type>" . $itype . "</type>\r\n"; }
				if($hasvalue!="") { $ret .= "    <number>" . $hasvalue . "</number>\r\n"; }
                                if($hasprompt==1) { $ret .= "    <prompt>" . $appname . "/prompt" . $promptnum . ".wav</prompt>\r\n"; }
				if($hasqueue!="") { $ret .= "    <queue>" . $hasqueue . "</queue>\r\n"; }
			}
			if($vc3!="") {
				$ret .= "    <outputs>\r\n";
				$ret .= "      <number>" . $i5 . "</number>\r\n";
				$ret .= "      <output>" . $vc3 . "</output>\r\n";
				$ret .= "    </outputs>\r\n";
				array_push($elemstack,$vc3);
			}
		}
		$ret .= "  </input>\r\n";
	}

	return Array($ret,$elemstack);
}
?>
