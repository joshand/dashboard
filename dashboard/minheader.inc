<?php
header('Access-Control-Allow-Origin: *');
include 'config.inc';
include './library/common.inc';
include 'auth.inc';

session_start();
	$token = $_COOKIE["token"];
	$sel = substr($token,0,12);
	$val = substr($token,13,24);

	$userid = CheckToken($dbtype,$dbserver,$dbname,$dbun,$dbpw,"",$token,$sel,$val);
	//echo "----------------$token\n<br>----------------$sel--$val--$userid--";
	if($userid!="0") {
		$_SESSION["uid"] = $userid;
	} else {
		redirect("./login.php");
	}

$arr_userinfo = GetUserInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,"");
	
// $url should be an absolute url
function redirect($url){
    if (headers_sent()){
      die('<script type="text/javascript">window.location=\''.$url.'\';</script>');
    }else{
      header('Location: ' . $url);
      die();
    }
}

function old_hash_equals($a, $b) {
   	return substr_count($a ^ $b, "\0") * 2 === strlen($a . $b);
}

function GetUserInfo($dbt,$dbs,$dbn,$dbu,$dbp,$uid) {
	$retval = "";
	if($uid=="") {
		if(isset($_SESSION["uid"])) { $newuid = $_SESSION["uid"]; } else { return 0; }
	} else {
		$newuid = $uid;
	}

	$strSQL = "SELECT user.name,user.email,user.pkid AS userpkid,user.currenttenant,customer.description,customer.custnum,customer.pkid AS custpkid,tenant.pkid AS tenpkid FROM user LEFT JOIN usercustomermap ON (user.pkid = usercustomermap.fkuser) LEFT JOIN customer ON (usercustomermap.fkcustomer = customer.pkid) LEFT JOIN tenantmap ON (customer.pkid = tenantmap.fkcustomer) LEFT JOIN tenant ON (tenantmap.fktenant = tenant.pkid) WHERE (user.pkid = '$newuid')";
	//echo "---------$strSQL--";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$name = do_db_result($dbt,$result,0,"name");
		$description = do_db_result($dbt,$result,0,"description");
		$custnum = do_db_result($dbt,$result,0,"custnum");
		$email = do_db_result($dbt,$result,0,"email");
		$userpkid = do_db_result($dbt,$result,0,"userpkid");
		$custpkid = do_db_result($dbt,$result,0,"custpkid");
		$currenttenant = do_db_result($dbt,$result,0,"currenttenant");

		//failsafe to ensure there is always a current tenant selected for a user. probably not needed.
		$tenpkid = do_db_result($dbt,$result,0,"tenpkid");
		if($currenttenant=="") {
			$strSQL2 = "UPDATE user SET currenttenant = '$tenpkid' WHERE pkid = '$newuid'";
			$result = do_db_query($conn,$strSQL2,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$currenttenant=$tenpkid;
		}
		
		$retval = "$name,$custnum,$description,$email,$userpkid,$custpkid,$currenttenant";
	} else {
		if($uid=="") { unset($_SESSION["uid"]); }
		return 0;
	}
	do_db_close($dbt,$conn);

	return explode(",",$retval);
}

?>
