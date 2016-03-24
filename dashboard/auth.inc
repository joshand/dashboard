<?php
include './library/random/random_int.php';
include './library/random/random.php';

function CheckCreds($dbt,$dbs,$dbn,$dbu,$dbp,$email,$password) {
	$retval = "";
	
	if(1==1) {
		$strSQL = "SELECT pwhash,pkid FROM user WHERE (email LIKE '" . CleanSQL($email) . "')";

		$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
		$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
		$result = $arr_result[1];
		$num = $arr_result[0];
		
		if($num>0) {
			$pwhash = do_db_result($dbt,$result,0,"pwhash");
			$uid = do_db_result($dbt,$result,0,"pkid");
			//$token = do_db_result($dbt,$result,0,"token");
			if (password_verify($password, $pwhash)) {
				$retval = explode(",","1,,,$uid");
			} else {
				$retval = explode(",","0,Error!,Invalid user name or password.,");
			}
		} else {
			$retval = explode(",","0,Error!,Invalid user name or password.,");
		}
		do_db_close($dbt,$conn);
	}

	return $retval;
}

function generateToken($length = 20)
{
    return bin2hex(random_bytes($length));
}

function SetToken($dbt,$dbs,$dbn,$dbu,$dbp,$sel,$val,$uid,$exp) {
	$valhash = hash("sha256",$val);
	date_default_timezone_set("America/New_York");
	$sqlexp = date("Y-m-d H:i:s",$exp);
	$sqlnow = date("Y-m-d H:i:s");

        $usrip = get_ip_address();
        $geoip = DoGet("http://freegeoip.net/json/$usrip","");
        $arr_vals = json_decode($geoip, true);
        $geoloc = trim($arr_vals["city"] . ", " . $arr_vals["region_code"]);
        if($geoloc==",") { $geoloc = ""; }
	//$usragent = $_SERVER['HTTP_USER_AGENT'];
	//$ua=getBrowser();
	//$usragent = $ua['name'] . " on " . $ua['platform'];
	$usragent = getBrowser($_SERVER['HTTP_USER_AGENT']) . " on " . getOS($_SERVER['HTTP_USER_AGENT']);

	$strSQL = "INSERT INTO auth_token (selector,token,userid,dtlogin,expires,ipaddr,loc,useragent) VALUES ('$sel','$valhash','$uid','$sqlnow','$sqlexp','$usrip','$geoloc','$usragent')";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

	$sqlcur = date("Y-m-d H:i:s");
	$strSQL = "DELETE FROM auth_token WHERE (expires < '$sqlcur')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	
//	$usrip = get_ip_address();
//	$geoip = DoGet("http://freegeoip.net/json/$usrip","");
//	$arr_vals = json_decode($geoip, true);
//	$geoloc = trim($arr_vals["city"] . ", " . $arr_vals["region_code"]);
//	if($geoloc==",") { $geoloc = ""; }

	$strSQL = "INSERT INTO userlogon (fkuserid,ipaddr,loc,dtlogin) VALUES ('$uid','$usrip','" . CleanSQL($geoloc) . "','$sqlcur')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "DELETE FROM userlogon WHERE (fkuserid = '$uid') AND (dtlogin <= (SELECT dtlogin FROM (SELECT dtlogin FROM userlogon ORDER BY dtlogin DESC LIMIT 1 OFFSET 3) foo))";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	do_db_close($dbt,$conn);
	return 0;
}

function ClearToken($dbt,$dbs,$dbn,$dbu,$dbp,$uid,$token,$sel,$val) {
        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "SELECT userid FROM auth_token WHERE (selector = '" . CleanSQL($sel) . "')";
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$tuid = do_db_result($dbt,$result,0,"userid");
		$strSQL = "DELETE FROM auth_token WHERE (selector = '" . CleanSQL($sel) . "')";
		$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	} else {
		$tuid = "";
	}
	do_db_close($dbt,$conn);

	return $tuid;
}

function CheckToken($dbt,$dbs,$dbn,$dbu,$dbp,$uid,$token,$sel,$val) {
	$retval = "";
	$strSQL = "SELECT * FROM auth_token WHERE (selector = '" . CleanSQL($sel) . "')";		// AND (userid = '" . CleanSQL($uid) . "')";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num<=0) {
		$retval = "0";
	} else {
		$token = do_db_result($dbt,$result,0,"token");
		$userid = do_db_result($dbt,$result,0,"userid");

		$valhash = hash("sha256",$val);
		if(hash_equals($token,$valhash)) {
			$retval = $userid;
		} else {
			$retval = "0";
		}
	}
	do_db_close($dbt,$conn);

	return $retval;
}

function getOS($user_agent) { 
    $os_platform    =   "Unknown OS Platform";
    $os_array       =   array(
                            '/windows nt 10/i'     =>  'Windows 10',
                            '/windows nt 6.3/i'     =>  'Windows 8.1',
                            '/windows nt 6.2/i'     =>  'Windows 8',
                            '/windows nt 6.1/i'     =>  'Windows 7',
                            '/windows nt 6.0/i'     =>  'Windows Vista',
                            '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
                            '/windows nt 5.1/i'     =>  'Windows XP',
                            '/windows xp/i'         =>  'Windows XP',
                            '/windows nt 5.0/i'     =>  'Windows 2000',
                            '/windows me/i'         =>  'Windows ME',
                            '/win98/i'              =>  'Windows 98',
                            '/win95/i'              =>  'Windows 95',
                            '/win16/i'              =>  'Windows 3.11',
                            '/macintosh|mac os x/i' =>  'Mac OS X',
                            '/mac_powerpc/i'        =>  'Mac OS 9',
                            '/linux/i'              =>  'Linux',
                            '/ubuntu/i'             =>  'Ubuntu',
                            '/iphone/i'             =>  'iPhone',
                            '/ipod/i'               =>  'iPod',
                            '/ipad/i'               =>  'iPad',
                            '/android/i'            =>  'Android',
                            '/blackberry/i'         =>  'BlackBerry',
                            '/webos/i'              =>  'Mobile'
                        );

    foreach ($os_array as $regex => $value) { 
        if (preg_match($regex, $user_agent)) {
            $os_platform    =   $value;
        }
    }   

    return $os_platform;
}

function getBrowser($user_agent) {
    $browser        =   "Unknown Browser";
    $browser_array  =   array(
                            '/msie/i'       =>  'Internet Explorer',
                            '/firefox/i'    =>  'Firefox',
                            '/safari/i'     =>  'Safari',
                            '/chrome/i'     =>  'Chrome',
                            '/edge/i'       =>  'Edge',
                            '/opera/i'      =>  'Opera',
                            '/netscape/i'   =>  'Netscape',
                            '/maxthon/i'    =>  'Maxthon',
                            '/konqueror/i'  =>  'Konqueror',
                            '/mobile/i'     =>  'Handheld Browser'
                        );

    foreach ($browser_array as $regex => $value) { 
        if (preg_match($regex, $user_agent)) {
            $browser    =   $value;
        }
    }

    return $browser;
}

function getBrowser2() 
{ 
    $u_agent = $_SERVER['HTTP_USER_AGENT']; 
    $bname = 'Unknown';
    $platform = 'Unknown';
    $version= "";

    //First get the platform?
    if (preg_match('/linux/i', $u_agent)) {
        $platform = 'linux';
    }
    elseif (preg_match('/macintosh|mac os x/i', $u_agent)) {
        $platform = 'mac';
    }
    elseif (preg_match('/windows|win32/i', $u_agent)) {
        $platform = 'windows';
    }
    
    // Next get the name of the useragent yes seperately and for good reason
    if(preg_match('/MSIE/i',$u_agent) && !preg_match('/Opera/i',$u_agent)) 
    { 
        $bname = 'Internet Explorer'; 
        $ub = "MSIE"; 
    } 
    elseif(preg_match('/Firefox/i',$u_agent)) 
    { 
        $bname = 'Mozilla Firefox'; 
        $ub = "Firefox"; 
    } 
    elseif(preg_match('/Chrome/i',$u_agent)) 
    { 
        $bname = 'Google Chrome'; 
        $ub = "Chrome"; 
    } 
    elseif(preg_match('/Safari/i',$u_agent)) 
    { 
        $bname = 'Apple Safari'; 
        $ub = "Safari"; 
    } 
    elseif(preg_match('/Opera/i',$u_agent)) 
    { 
        $bname = 'Opera'; 
        $ub = "Opera"; 
    } 
    elseif(preg_match('/Netscape/i',$u_agent)) 
    { 
        $bname = 'Netscape'; 
        $ub = "Netscape"; 
    } 
    
    // finally get the correct version number
    $known = array('Version', $ub, 'other');
    $pattern = '#(?<browser>' . join('|', $known) .
    ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
    if (!preg_match_all($pattern, $u_agent, $matches)) {
        // we have no matching number just continue
    }
    
    // see how many we have
    $i = count($matches['browser']);
    if ($i != 1) {
        //we will have two since we are not using 'other' argument yet
        //see if version is before or after the name
        if (strripos($u_agent,"Version") < strripos($u_agent,$ub)){
            $version= $matches['version'][0];
        }
        else {
            $version= $matches['version'][1];
        }
    }
    else {
        $version= $matches['version'][0];
    }
    
    // check if we have a number
    if ($version==null || $version=="") {$version="?";}
    
    return array(
        'userAgent' => $u_agent,
        'name'      => $bname,
        'version'   => $version,
        'platform'  => $platform,
        'pattern'    => $pattern
    );
} 
?>
