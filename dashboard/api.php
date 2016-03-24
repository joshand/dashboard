<?php
include 'config.inc';
include './library/common.inc';
include 'auth.inc';

$request_parts = explode('/', $_GET['url']);
if(isset($_GET['type'])) {
  $file_type     = $_GET['type'];
} else {
  $file_type     = "json";
}
$req_ver       = $request_parts[0];
$req_type      = $request_parts[1];
$req_method    = $_SERVER['REQUEST_METHOD'];
if ($req_method == 'POST' && array_key_exists('HTTP_X_HTTP_METHOD', $_SERVER)) {
  if ($_SERVER['HTTP_X_HTTP_METHOD'] == 'DELETE') {
    $req_method = 'DELETE';
  } else if ($_SERVER['HTTP_X_HTTP_METHOD'] == 'PUT') {
    $req_method = 'PUT';
  } else {
    throw new Exception("Unexpected Header");
  }
}
switch($req_method) {
  case 'DELETE':
  case 'POST':
    $req_data = cleanInputs($_POST);
    $req_file = file_get_contents("php://input");
    $req_id = $request_parts[2];
    break;
  case 'GET':
    $req_data = cleanInputs($_GET);
    $req_file = "";
    $req_id = "";
    break;
  case 'PUT':
    $req_data = cleanInputs($_GET);
    $req_file = file_get_contents("php://input");
    $req_id = $request_parts[2];
    break;
  default:
    //Invalid Method
    $req_file = "";
    $req_id = "";
    break;
}

//echo "--$req_ver--$req_method--$req_type--$file_type--$req_id--$req_file--";
$output = process_request($dbtype,$dbserver,$dbname,$dbun,$dbpw,$req_ver,$req_method,$req_type,$file_type,$req_id,$req_file,$req_data);

//Output based on request
switch($file_type) {
    case 'json':
        echo json_encode($output);
        break;
    case 'xml':
        echo xml_encode($output);
        break;
    default:
        echo $output;
}

function process_request($dbt,$dbs,$dbn,$dbu,$dbp,$req_version,$req_action,$req_method,$req_ft,$req_id,$req_file,$req_data) {
  $reqret = "";
  switch($req_version) {
    case 'v0':
      $reqret_auth = check_auth_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$req_method);
      if(array_key_exists("userpkid",$reqret_auth["dashboard"]["authentication"])) {
        $uid = $reqret_auth["dashboard"]["authentication"]["userpkid"];
      } else if(array_key_exists("collectorpkid",$reqret_auth["dashboard"]["authentication"])) {
        $uid = $reqret_auth["dashboard"]["authentication"]["collectorpkid"];
      } else {
        $uid = "";
      }
      $authstat = $reqret_auth["dashboard"]["authentication"]["response"];
      $reqret = array();
      if(strtolower($authstat)=="authorized") {
        switch($req_method) {
          case 'element':
            $reqret = process_element_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$uid);
            break;
          case 'session':
            $reqret = process_session_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$uid);
            break;
          case 'collector':
            $reqret = process_collector_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$uid);
            break;
          case 'checkin':
            $reqret = process_checkin_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$uid);
            break;
          default:
            break;
        }
      } else if(strtolower($authstat)=="unknown") {
        if($req_method=="session") {
          $reqret = process_session_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$uid);
        }
      }
      break;
    default;
      break;
  }

  if((strtolower($authstat)!="authorized") && (count($reqret)<=0)) {
    $reqret = array("dashboard"=>array("response"=>"failed","details"=>"Authorization Failed"));
  }
  return array_merge_recursive($reqret,$reqret_auth);
}

// @@auth
function check_auth_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$req_method) {
  $reqret1 = "";
  $reqret2 = "";
  $reqret3 = "";
  $reqret4 = "";

  if($req_ft!="xml") {
    $arr_data = json_decode($req_file,true);
  } else {
    $arr_data = xml_decode($req_file);
  }
  if($req_action=="GET") {
    if(isset($_GET['token'])) {
      $gettoken = $_GET['token'];
      $arr_data = array("authentication"=>array("token"=>$gettoken));
    } else if(isset($_GET['collector'])) {
      $getcolid = $_GET['collector'];
      $arr_data = array("collector"=>array("id"=>$getcolid));
    }
  }

  if(count($arr_data)>0) {
    if(array_key_exists("authentication",$arr_data)) {
      if(array_key_exists("token",$arr_data["authentication"])) {
        $atoken = $arr_data["authentication"]["token"];
        $sel = substr($atoken,0,12);
        $val = substr($atoken,13,24);

        $userid = CheckToken($dbt,$dbs,$dbn,$dbu,$dbp,"",$atoken,$sel,$val);
        if($userid=="0") {
          $reqret1 = "unauthorized";
          $reqret2 = "Token Authentication Failed";
        } else {
          $reqret1 = "authorized";
          $reqret2 = "Token Authentication Passed";
          $reqret4 = "userpkid";
          $reqret3 = $userid;
        }
      }
    } else if(array_key_exists("collector",$arr_data)) {
      if(array_key_exists("id",$arr_data["collector"])) {
        $col_id = $arr_data["collector"]["id"];

        $strSQL = "SELECT pkid FROM elements WHERE serialnum = '$req_id'";
        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $num = $arr_result[0];
        $result = $arr_result[1];
        if($num>0) {
          $elempkid = do_db_result($dbt,$result,0,"pkid");
        } else {
          $elempkid = "";
        }

        $strSQL = "SELECT pkid,colauth FROM collector WHERE colid = '$col_id'";
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $num = $arr_result[0];
        $result = $arr_result[1];
        if($num>0) {
          $colpkid = do_db_result($dbt,$result,0,"pkid");
          $colauth = do_db_result($dbt,$result,0,"colauth");
        } else {
          $strSQL2 = "INSERT INTO collector (colid) VALUES ('$col_id')";
          $result = do_db_query($conn,$strSQL2,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
          $num = $arr_result[0];
          $result = $arr_result[1];
          if($num>0) {
            $colpkid = do_db_result($dbt,$result,0,"pkid");
          } else {
            $colpkid = "";
          }
          $colauth = 0;
        }
        if($colauth=="0") {
          $reqret1 = "unauthorized";
          $reqret2 = "Collector Authentication Failed";
        } else {
          $reqret1 = "authorized";
          $reqret2 = "Collector Authentication Passed";
          $reqret4 = "collectorpkid";
          $reqret3 = $colpkid;
        }

	if($elempkid!="") {
          $strSQL = "SELECT id FROM collectorelementmap WHERE (fkcollector = '$colpkid') AND (fkelement = '$elempkid')";
          $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
          $num = $arr_result[0];
          if($num<=0) {
            $strSQL = "INSERT INTO collectorelementmap (fkcollector,fkelement) VALUES ('$colpkid','$elempkid')";
            $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          }
        }
      do_db_close($dbt,$conn);
      }
    } else if(array_key_exists("credentials",$arr_data)) {
      $reqret1 = "unknown";
      $reqret2 = "Login Attempt";
    } else {
      $reqret1 = "unauthorized";
      $reqret2 = "No Authentication Parameters Provided";
    }
  } else {
    $reqret1 = "unauthorized";
    $reqret2 = "No Authentication Parameters Provided";
  }

  $arr_reqret = array("dashboard"=>array("authentication"=>array("response"=>$reqret1, "detail"=>$reqret2)));
  if($reqret3!="") {
    $arr_reqret["dashboard"]["authentication"][$reqret4] = $reqret3;
  }
  return $arr_reqret;
}

// @@element
function process_element_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$userid) {
  $reqret1 = "failed";
  $reqret2 = "";

  $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);

  $strSQL = "SELECT pkid FROM elements WHERE serialnum = '$req_id'";
  $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
  $num = $arr_result[0];
  $result = $arr_result[1];
  if($num>0) {
    $elempkid = do_db_result($dbt,$result,0,"pkid");
  }
  //do_db_close($dbt,$conn);

  switch($req_action) {
    case 'PUT':
      if($req_ft!="xml") {
        $arr_data = json_decode($req_file,true);
      } else {
        $arr_data = xml_decode($req_file);
      }

      if(array_key_exists("zzz_disabled__id",$arr_data["collector"])) {
        $col_id = $arr_data["collector"]["id"];

        $strSQL = "SELECT pkid,colauth FROM collector WHERE colid = '$col_id'";
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $num = $arr_result[0];
        $result = $arr_result[1];
        if($num>0) {
          $colpkid = do_db_result($dbt,$result,0,"pkid");
          $colauth = do_db_result($dbt,$result,0,"colauth");
        } else {
          $strSQL2 = "INSERT INTO collector (colid) VALUES ('$col_id')";
          $result = do_db_query($conn,$strSQL2,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $colpkid = do_db_result($dbt,$result,0,"pkid");
          $colauth = 0;
        }

        $strSQL = "SELECT id FROM collectorelementmap WHERE (fkcollector = '$colpkid') AND (fkelement = '$elempkid')";
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $num = $arr_result[0];
        if($num<=0) {
          $strSQL = "INSERT INTO collectorelementmap (fkcollector,fkelement) VALUES ('$colpkid','$elempkid')";
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
        }
        do_db_close($dbt,$conn);
      }

      $strSQLupd = "";
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"hostname","NameOrIP");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"version","firmware");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"ipaddress","lanip");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"subnetmask","subnetmask");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"dg","dg");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"iptype","lantype");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"dg_interface_vlan","dgvlan");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"dg_interface_mac_address","macaddress");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"model","LOOKUP_MODEL");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"element",$elempkid,$arr_data,"dg_interface","LOOKUP_INTERFACE");

      //if(array_key_exists("hostname",$arr_data["element"])) { $hname = $arr_data["element"]["hostname"]; } else { $hname = ""; }
      //if($hname!="") { $strSQLupd .= "NameOrIP = '$hname', "; }

      $usrip = get_ip_address();

      $strSQLupd = trim($strSQLupd);
      if(substr($strSQLupd,-1)==",") {
        $strSQLupd .= " lastupdateip='$usrip'";
        //$strSQLupd = substr($strSQLupd,0,strlen($strSQLupd)-1);
      }

      $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
      $strSQL = "SELECT pkid FROM elements WHERE serialnum = '$req_id'";
      $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
      $num = $arr_result[0];

      if($num>0) {
        $strSQL = "UPDATE elements SET $strSQLupd WHERE serialnum = '$req_id'";
        $colauth=1;    //Remove this; authentication moved
        if($colauth!=0) {
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          //$rowsaff = mysql_affected_rows();
          if($result) {
            $reqret1 = "success";
            $reqret2 = "SQL Success: " . $strSQL;
          } else {
            $reqret1 = "failed";
            $reqret2 = "SQL Error: " . $strSQL;
          }
        } else {
          $reqret1 = "unauthorized";
          $reqret2 = "SQL Not Processed";
        }
      } else {
        $reqret2 = $strSQL;
      }
      do_db_close($dbt,$conn);

      //echo "--$hname--";
      //var_dump($arr_data); 
      //echo "--$strSQL--";
    default:
      break;
  }

  $arr_reqret = array("dashboard"=>array("response"=>$reqret1, "query"=>$reqret2));
  return $arr_reqret;
}

function checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,$group,$elempkid,$arr_input,$arrkey,$dbfield) {
  $retval = "";

if(array_key_exists($arrkey,$arr_input[$group])) { 
    $cuq_val = $arr_input[$group][$arrkey];

    if(($dbfield=="LOOKUP_MODEL") || ($dbfield=="LOOKUP_INTERFACE")) {
      if($dbfield=="LOOKUP_MODEL") {
        $strSQL = "SELECT refdevicemodel FROM typedevicemodelsearch WHERE searchstring LIKE '$cuq_val'";
      } else if($dbfield=="LOOKUP_INTERFACE") {
        $strSQL = "SELECT pkid FROM elementports WHERE description LIKE '$cuq_val'";
      }
      $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
      $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp); 
      $result = $arr_result[1];
      $num = $arr_result[0];
      if($num>0) {
        if($dbfield=="LOOKUP_MODEL") {
          $refid = do_db_result($dbt,$result,0,"refdevicemodel");
          $retval = "refDeviceModel = '$refid', ";
        } else if($dbfield=="LOOKUP_INTERFACE") {
          $refid = do_db_result($dbt,$result,0,"pkid");
          $retval = "fkdgport = '$refid', ";
        }
      } else {
        if($dbfield=="LOOKUP_MODEL") {
          $strSQL = "INSERT INTO typedevicemodel (refSeries,Description,imagename) VALUES ('0','$cuq_val','')";
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $strSQL = "SELECT ID FROM typedevicemodel WHERE Description = '$cuq_val'";
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $modelid = do_db_result($dbt,$result,0,"ID");
          $strSQL = "INSERT INTO typedevicemodelsearch (searchstring,refdevicemodel) VALUES ('$cuq_val',$modelid)";
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $retval = "refDeviceModel = '$modelid', ";
        } else if($dbfield=="LOOKUP_INTERFACE") {
          $strSQL = "INSERT INTO elementports (fkelement,num,inttype,description) VALUES ('$elempkid',0,0,'$cuq_val')";
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $strSQL = "SELECT pkid FROM elementports WHERE description = '$cuq_val'";
          $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
          $intid = do_db_result($dbt,$result,0,"pkid");
          $retval = "fkdgport = '$intid', ";
        }
      }
      do_db_close($dbt,$conn);
    } else {
      if(strtolower($arrkey)=="iptype") {
        if(strtolower($cuq_val)=="static") {
          $cuq_val = "2";
        } else if(strtolower($cuq_val)=="unknown") {
          $cuq_val = "0";
        } else {
          $cuq_val = "1";
        }
      }
      if(strtolower($arrkey)=="authorized") {
        if(strtolower($cuq_val)=="true") {
          $cuq_val = "1";
        } else {
          $cuq_val = "0";
        }
      }

      if($cuq_val!="") { $retval = "$dbfield = '$cuq_val', "; }
    }
  } else {
    $cuq_val = "";
  }

  return $retval;
}

// @@checkin
function process_checkin_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$userid) {
  $reqret1 = "failed";
  $reqret2 = "";
  $arr_reqret = array();

  $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
  date_default_timezone_set("America/New_York");

  switch($req_action) {
    case 'GET':
      $acttimeout = time()-60*10;
      $sqltimeout = date("Y-m-d H:i:s",$acttimeout);
      $strSQL = "SELECT api_calls.*,apicallstasksmap.parm1,apicallstasksmap.parm2,apicallstasksmap.parm3,apicallstasksmap.retdata,elements.lanip,elements.username,elements.password,taskqueue.pkid as taskpkid,taskqueue.qval1,taskqueue.qval2,taskqueue.qval3 FROM collectorelementmap LEFT JOIN elements ON (elements.pkid = collectorelementmap.fkelement) LEFT JOIN taskqueue ON (taskqueue.fkelement = collectorelementmap.fkelement) LEFT JOIN api_tasks ON (taskqueue.fkapitask = api_tasks.pkid) LEFT JOIN apicallstasksmap ON (apicallstasksmap.fkapitask = api_tasks.pkid) LEFT JOIN api_calls ON (apicallstasksmap.fkapicall = api_calls.pkid) WHERE (collectorelementmap.fkcollector = '$userid') AND ((taskqueue.status = 1) OR ((taskqueue.status = 2) AND (taskqueue.starttime < '$sqltimeout') AND (NOT taskqueue.singleuse = 1))) ORDER BY taskqueue.pkid ASC,apicallstasksmap.morder ASC";
      $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
      $num = $arr_result[0];
      $result = $arr_result[1];
      if($num>0) {
        $arr_reqret = array("dashboard"=>array("response"=>"success","action_count"=>$num,"dbtime"=>$sqltimeout));
      } else {
        $arr_reqret = array("dashboard"=>array("response"=>"success","action_count"=>0,"dbtime"=>$sqltimeout));
      }

      for($x=0;$x<$num;$x++) {
        $ipadd = do_db_result($dbt,$result,$x,"lanip");
        $username = do_db_result($dbt,$result,$x,"username");
        $password = do_db_result($dbt,$result,$x,"password");
        $api_url = do_db_result($dbt,$result,$x,"url");
        $api_content = do_db_result($dbt,$result,$x,"content_type");
        $api_soap = do_db_result($dbt,$result,$x,"soap_action");
        $api_creds = do_db_result($dbt,$result,$x,"credentials");
        $api_cookie = do_db_result($dbt,$result,$x,"cookie");
        $api_message = do_db_result($dbt,$result,$x,"message");
	$api_fk = do_db_result($dbt,$result,$x,"filekey");
        $parm1 = do_db_result($dbt,$result,$x,"parm1");
        $parm2 = do_db_result($dbt,$result,$x,"parm2");
	$parm3 = do_db_result($dbt,$result,$x,"parm3");
        $qval1 = do_db_result($dbt,$result,$x,"qval1");
        $qval2 = do_db_result($dbt,$result,$x,"qval2");
        $qval3 = do_db_result($dbt,$result,$x,"qval3");
        $retdata = do_db_result($dbt,$result,$x,"retdata");
        $urlmethod = do_db_result($dbt,$result,$x,"method");
        $taskpkid = do_db_result($dbt,$result,$x,"taskpkid");

        //echo "--$ipadd--$username--$password--$api_url--$api_content--$api_soap--$api_creds--$api_message--$parm1--$parm2";
        $api_newurl = str_replace("%ip%",$ipadd,$api_url);
        $api_newurl = str_replace("%port%","8443",$api_newurl);
        $api_newurl = str_replace("%1%",$parm1,$api_newurl);
        $api_newurl = str_replace("%2%",$parm2,$api_newurl);
        $api_newurl = str_replace("%3%",$parm3,$api_newurl);
	$api_newurl = str_replace("%q1%",$qval1,$api_newurl);
        $api_newurl = str_replace("%q2%",$qval2,$api_newurl);
        $api_newurl = str_replace("%q3%",$qval3,$api_newurl);
        $api_newcreds = str_replace("%un%",$username,$api_creds);
        $api_newcreds = str_replace("%pw%",$password,$api_newcreds);
        $api_newmsg = str_replace("%1%",$parm1,$api_message);
        $api_newmsg = str_replace("%2%",$parm2,$api_newmsg);
	$api_newmsg = str_replace("%3%",$parm3,$api_newmsg);
        $api_newmsg = str_replace("%q1%",$qval1,$api_newmsg);
        $api_newmsg = str_replace("%q2%",$qval2,$api_newmsg);
        $api_newmsg = str_replace("%q3%",$qval3,$api_newmsg);
        $api_newmsg = str_replace("%un%",$username,$api_newmsg);
        $api_newmsg = str_replace("%pw%",$password,$api_newmsg);
	$api_newmsg = str_replace("%ip%",$ipadd,$api_newmsg);
        $api_newcookie = str_replace("%1%",$parm1,$api_cookie);
	$api_fk = str_replace("%1%",$parm1,$api_fk);
	$api_fk = str_replace("%2%",$parm2,$api_fk);
	$api_fk = str_replace("%3%",$parm3,$api_fk);
	$api_fk = str_replace("%q1%",$qval1,$api_fk);
	$api_fk = str_replace("%q2%",$qval2,$api_fk);
	$api_fk = str_replace("%q3%",$qval3,$api_fk);

        //echo "--$api_newurl--$api_newcreds--$api_newmsg--";

        $xd = $x+1;
        // Not base64 encoding to obfuscate, just want to make sure stuff is less likely to get mangled in transmission
        $arr_reqret["dashboard"]["action"]["a$xd"]["taskpkid"]=$taskpkid;
        $arr_reqret["dashboard"]["action"]["a$xd"]["method"]=$urlmethod;
        $arr_reqret["dashboard"]["action"]["a$xd"]["url"]=base64_encode($api_newurl);
        $arr_reqret["dashboard"]["action"]["a$xd"]["content_type"]=base64_encode($api_content);
        $arr_reqret["dashboard"]["action"]["a$xd"]["soap_action"]=base64_encode($api_soap);
        $arr_reqret["dashboard"]["action"]["a$xd"]["creds"]=base64_encode($api_newcreds);
        $arr_reqret["dashboard"]["action"]["a$xd"]["msg"]=base64_encode($api_newmsg);
        $arr_reqret["dashboard"]["action"]["a$xd"]["ret"]=base64_encode($retdata);
        $arr_reqret["dashboard"]["action"]["a$xd"]["cookie"]=base64_encode($api_newcookie);
	$arr_reqret["dashboard"]["action"]["a$xd"]["filepair"]=base64_encode($api_fk);
      }

      $sqlnow = date("Y-m-d H:i:s");
      $strSQL = "SELECT taskqueue.pkid as taskpkid FROM collectorelementmap LEFT JOIN elements ON (elements.pkid = collectorelementmap.fkelement) LEFT JOIN taskqueue ON (taskqueue.fkelement = collectorelementmap.fkelement) WHERE (collectorelementmap.fkcollector = '$userid') AND ((taskqueue.status = 1) OR (taskqueue.status = 2))";
      $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
      $num = $arr_result[0];
      $result = $arr_result[1];
      for($x=0;$x<$num;$x++) {
        $taskpkid = do_db_result($dbt,$result,$x,"taskpkid");
        $strSQL2 = "UPDATE taskqueue SET status = 2, starttime = '$sqlnow' WHERE pkid = '$taskpkid'";
        $result2 = do_db_query($conn,$strSQL2,0,$dbt,$dbs,$dbn,$dbu,$dbp);
      }
      break;
    case 'POST':
      if($req_ft!="xml") {
        $arr_data = json_decode($req_file,true);
      } else {
        $arr_data = xml_decode($req_file);
      }

      $tid = $arr_data["checkin"]["taskresult"]["pkid"];
      $tdata = base64_decode($arr_data["checkin"]["taskresult"]["data"]);
      $tdata = str_replace("'", "\"", $tdata);

      $sqlnow = date("Y-m-d H:i:s");
      $strSQL = "UPDATE taskqueue SET status = 3, endtime = '$sqlnow', result = '$tdata' WHERE pkid = '$tid'";
      $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
      //$row_c = do_db_rowaffect($dbt,$conn);
      if($result) {
        $reqret1 = "success";
        $reqret2 = "SQL Success: " . $strSQL;
      } else {
        $reqret1 = "failed";
        $reqret2 = "SQL Failed: " . $strSQL;
      }

      $arr_reqret = array("dashboard"=>array("response"=>$reqret1, "details"=>$reqret2));

      break;
    default:
      break;
  }

  do_db_close($dbt,$conn);

  return($arr_reqret);
}

// @@collector
function process_collector_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$userid) {
  $reqret1 = "failed";
  $reqret2 = "";

  $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);

  $strSQL = "SELECT pkid FROM collector WHERE colid = '$req_id'";
  $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
  $num = $arr_result[0];
  $result = $arr_result[1];
  if($num>0) {
    $colpkid = do_db_result($dbt,$result,0,"pkid");
  } else {
    if(isset($_GET['rc'])) {
      $rcval = $_GET['rc'];
    } else {
      $rcval = "0";
    }
    $strSQL2 = "INSERT INTO collector (colid,realcollector) VALUES ('$req_id','$rcval')";
    $result = do_db_query($conn,$strSQL2,0,$dbt,$dbs,$dbn,$dbu,$dbp);
    $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
    $num = $arr_result[0];
    $result = $arr_result[1];
    $colpkid = do_db_result($dbt,$result,0,"pkid");
  }
  //do_db_close($dbt,$conn);

  switch($req_action) {
    case 'PUT':
      if($req_ft!="xml") {
        $arr_data = json_decode($req_file,true);
      } else {
        $arr_data = xml_decode($req_file);
      }

      $strSQLupd = "";
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"collector",$colpkid,$arr_data,"description","description");
      $strSQLupd .= checkUpdateQuery($dbt,$dbs,$dbn,$dbu,$dbp,"collector",$colpkid,$arr_data,"authorized","colauth");

      $usrip = get_ip_address();
      $strSQLupd = trim($strSQLupd);
      if(substr($strSQLupd,-1)==",") {
        $strSQLupd .= " lastupdateip='$usrip', colauthuid='$userid'";
        //$strSQLupd = substr($strSQLupd,0,strlen($strSQLupd)-1);
      }

      $strSQL = "UPDATE collector SET $strSQLupd WHERE pkid = '$colpkid'";
      $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
      if($result) {
        $reqret1 = "success";
        $reqret2 = "SQL Success: " . $strSQL;
      } else {
        $reqret1 = "failed";
        $reqret2 = "SQL Failed: " . $strSQL;
      }
      do_db_close($dbt,$conn);

      $arr_reqret = array("dashboard"=>array("response"=>$reqret1, "details"=>$reqret2));
      if($colpkid!="") {
        $arr_reqret["dashboard"]["collectorpkid"] = $colpkid;
      }
      return $arr_reqret;

      break;
    default:
      break;
  }

  return 0;
}

// @@session
function process_session_v0($dbt,$dbs,$dbn,$dbu,$dbp,$req_action,$req_ft,$req_id,$req_file,$req_data,$userid) {
  $reqret1 = "";
  $reqret2 = "";
  $reqret3 = "";
  switch($req_action) {
    case 'POST':
      if($req_ft!="xml") {
        $arr_data = json_decode($req_file,true);
      } else {
        $arr_data = xml_decode($req_file);
      }

      if((array_key_exists("username",$arr_data["credentials"])) && (array_key_exists("password",$arr_data["credentials"]))) {
        $authun = $arr_data["credentials"]["username"];
        $authpw = $arr_data["credentials"]["password"];
        $arr_msg = CheckCreds($dbt,$dbs,$dbn,$dbu,$dbp,$authun,$authpw);
        if($arr_msg[0]==1) {
          $sel = generateToken(6);
          $val = generateToken(12);
          $token = $sel . ":" . $val;
          SetToken($dbt,$dbs,$dbn,$dbu,$dbp,$sel,$val,$arr_msg[3],time()+60*60*24*30);
          $reqret1 = "success";
          $reqret2 = "Authentication Successful";
          $reqret3 = $token;
        } else {
          $reqret1 = "failed";
          $reqret2 = "Invalid Username or Password";
        }
      } else {
        $reqret1 = "failed";
        $reqret2 = "Incomplete or Incorrect Request";
      }

      $arr_reqret = array("dashboard"=>array("response"=>$reqret1, "detail"=>$reqret2));
      if($reqret3!="") {
        $arr_reqret["dashboard"]["token"] = $reqret3;
        $arr_reqret["dashboard"]["userpkid"] = $arr_msg[3];
      }
      return $arr_reqret;

      break;
    case 'DELETE':
      $token = $req_id;
      $sel = substr($token,0,12);
      $val = substr($token,13,24);
      $uid = ClearToken($dbt,$dbs,$dbn,$dbu,$dbp,"",$token,$sel,$val);
      if($uid=="") { $reqret1 = "failed"; } else { $reqret1 = "success"; }
      $arr_reqret = array("dashboard"=>array("response"=>$reqret1));
      if($uid!="") { $arr_reqret["dashboard"]["userpkid"] = $uid; }
      return $arr_reqret;

      break;
    case 'GET':
      $strSQL = "SELECT * FROM auth_token WHERE (userid = '$userid')";
      $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
      $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
      $result = $arr_result[1];
      $num = $arr_result[0];
      $arr_reqret = array("dashboard"=>array("response"=>"success","result_count"=>$num));
      for($x=0;$x<$num;$x++) {
        $sessionpkid = do_db_result($dbt,$result,$x,"pkid");
        $startdate = do_db_result($dbt,$result,$x,"dtlogin");
        $expdate = do_db_result($dbt,$result,$x,"expires");
        $ipaddr = do_db_result($dbt,$result,$x,"ipaddr");
        $iploc = do_db_result($dbt,$result,$x,"loc");
        $useragt = do_db_result($dbt,$result,$x,"useragent");

	$xd = $x+1;
        $arr_reqret["dashboard"]["results"]["r$xd"]["pkid"]=$sessionpkid;
        $arr_reqret["dashboard"]["results"]["r$xd"]["session_start"]=$startdate;
        $arr_reqret["dashboard"]["results"]["r$xd"]["session_end"]=$expdate;
        $arr_reqret["dashboard"]["results"]["r$xd"]["ip_address"]=$ipaddr;
        $arr_reqret["dashboard"]["results"]["r$xd"]["ip_location"]=$iploc;
        $arr_reqret["dashboard"]["results"]["r$xd"]["user_agent"]=$useragt;
      }
      do_db_close($dbt,$conn);
      return($arr_reqret);

      break;
    default:
      return array("dashboard"=>array("response"=>"unknown"));
      break;
  }
}

function xml_encode($output) {
	return $output;
}

function xml_decode($output) {
	return $output;
}

function cleanInputs($data) {
  $clean_input = Array();
  if (is_array($data)) {
    foreach ($data as $k => $v) {
      $clean_input[$k] = cleanInputs($v);
    }
  } else {
    $clean_input = trim(strip_tags($data));
  }
  return $clean_input;
}

function LookupBlob($dbt,$dbs,$dbn,$dbu,$dbp,$blobvar) {
	$bdata = "";
	$blobarr = explode("\"",$blobvar);
	$blobpkid = $blobarr[1];

	$strSQL = "SELECT * FROM appblob WHERE (pkid = '$blobpkid')";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$bdata = base64_encode(do_db_result($dbt,$result,0,"b1"));
	} else {
		$bdata = "";
	}
	do_db_close($dbt,$conn);

	return $bdata;
}
?>
