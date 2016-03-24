<?php
include '../config.inc';
include '../../library/common.inc';
//$dodebug = 1;

$pkid = checkGetAndPost("pkid");
if($pkid!="") {
	$arr_ret = GetTextFromDB($dbtype,$dbserver,$dbname,$dbun,$dbpw,$pkid);
	$fn = $arr_ret[1];
	$fd = $arr_ret[0];
} else {
	$fd = checkGetAndPost("text");
	$fd = urldecode($text);
	$fn = checkGetAndPost("name");
}

if($dodebug!=1) {
	header("Content-Type: application/octet-stream");
	header("Content-Disposition: attachment; filename=\"" . $fn . "\"");
}

$dirname = "/var/www/uploads";
if(file_exists($dirname)) {
	$fullfn = $dirname . "/$fn";
	if(file_exists($fullfn)) {
		unlink($fullfn);
	}
	$fullfn2 = str_replace(".wav","u.wav",$fullfn);
	if(file_exists($fullfn2)) {
		unlink($fullfn2);
	}
	if($dodebug==1) { echo $fullfn . "|" . $fullfn2 . "<br>"; }
	$execstr = "pico2wave --wave=$fullfn \"$fd\" 2>&1";
	$ret = shell_exec($execstr);
	if($dodebug==1) { echo $execstr . "|" . $ret . "<br>"; }
	$execstr = "sox -v 0.9 $fullfn -r 8000 -c 1 -e u-law $fullfn2 2>&1";
	$ret = shell_exec($execstr);
	if($dodebug==1) { echo $execstr . "|" . $ret . "<br>"; }
	if(file_exists($fullfn)) {
		unlink($fullfn);
	}
	rename($fullfn2,$fullfn);
} else {
	$ret = "";
}

if($dodebug!=1) {
	$contents = file_get_contents($dirname . "/" . $fn);
	echo $contents;
}

function GetTextFromDB($dbt,$dbs,$dbn,$dbu,$dbp,$pkid) {
        $ret = "";
        $strSQL = "SELECT t1,vc1 FROM apptext WHERE pkid = '$pkid'";

        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $result = $arr_result[1];
        $num = $arr_result[0];
        if($num>0) {
                $ret1 = do_db_result($dbt,$result,0,"t1");
                $ret2 = do_db_result($dbt,$result,0,"vc1");
                $ret = Array($ret1,$ret2);
        } else {
                $ret = Array("");
        }
        do_db_close($dbt,$conn);

        return $ret;
}
?>
