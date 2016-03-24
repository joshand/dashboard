<?php
include 'config.inc';
include './library/common.inc';
include 'auth.inc';

session_start();
//if(isset($_SESSION["uid"])) {
if(1==2) {
	//already authenticated
	//echo "----------------" . $_SESSION["uid"] . "--";
} else {
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
}

$arr_userinfo = GetUserInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,"");
	
function zzCheckToken($dbt,$dbs,$dbn,$dbu,$dbp,$uid,$token,$sel,$val) {
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

function GetNetworksDropdown($dbt,$dbs,$dbn,$dbu,$dbp,$sqlquery,$sqlidfield,$sqldisplayfield,$currentvalue) {
	$retval = "";

	$retval .= "              <li class=\"dropdown tasks-menu\">";
	$retval .= "                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">";
	$retval .= "                  <i class=\"fa fa-clone\"></i>";
	//$retval .= "                  <span class=\"label label-danger\">9</span>";
	$retval .= "                </a>";
	$retval .= "                <ul class=\"dropdown-menu\">";
	$retval .= "                  <li>";
	$retval .= "                    <ul class=\"menu\">";

	$strSQL = $sqlquery;
	//echo "--$currentvalue--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	for($x=0;$x<$num;$x++) {
		$resid = do_db_result($dbt,$result,$x,$sqlidfield);
		$resdesc = do_db_result($dbt,$result,$x,$sqldisplayfield);
		if($currentvalue==$resid) { $seltag = "fa-chevron-circle-right text-yellow"; } else { $seltag = "fa-cloud text-aqua"; }

		$retval .= "                      <li>";
		$retval .= "                        <a href=\"./index.php?tenant=$resid\">";
		$retval .= "                          <i class=\"fa $seltag\"></i> $resdesc";
		$retval .= "                        </a>";
		$retval .= "                      </li>";
		//$retval .= "<option value='$resid'$seltag>$resdesc</option>\n";
	}

	$retval .= "                    </ul>";
	$retval .= "                  </li>";
	$retval .= "                </ul>";
	$retval .= "              </li>";
	
	return $retval;
}
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="adminlte/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="adminlte/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="adminlte/dist/css/skins/skin-blue.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <style>
*[data-tooltip] {
    position: relative;
}

*[data-tooltip]::after {
    content: attr(data-tooltip);
    
    position: absolute;
    top: -20px;
    right: -20px;
    width: 150px;
    
    pointer-events: none;
    opacity: 0;
    -webkit-transition: opacity .15s ease-in-out;
    -moz-transition: opacity .15s ease-in-out;
    -ms-transition: opacity .15s ease-in-out;
    -o-transition: opacity .15s ease-in-out;
    transition: opacity .15s ease-in-out;
    
    display: block;
    color: black;
    font-size: 12px;
    line-height: 16px;
    background: #fefdcd;
    padding: 2px 2px;
    border: 1px solid #c0c0c0;
    box-shadow: 2px 4px 5px rgba(0, 0, 0, 0.4);
}

*[data-tooltip]:hover::after {
    opacity: 1;
}
</style>
  </head>
  <body class="hold-transition skin-blue sidebar-collapse sidebar-mini">
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="index.php" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b></b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Dash</b>board</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <?php echo GetNetworksDropdown($dbtype,$dbserver,$dbname,$dbun,$dbpw,"SELECT tenant.pkid,tenant.description FROM tenant LEFT JOIN tenantmap ON (tenant.pkid = tenantmap.fktenant) LEFT JOIN customer ON (customer.pkid = tenantmap.fkcustomer) LEFT JOIN user ON (user.pkid = tenantmap.fkuser) WHERE ((customer.pkid = '" . $arr_userinfo[5] . "') OR (user.pkid = '" . $arr_userinfo[4] . "'))", "pkid", "description", $arr_userinfo[6]); ?>

              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <!--<img src="adminlte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">-->
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs"><?php echo $arr_userinfo[0]; ?></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <!--<img src="adminlte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">-->
                    <p>
                      <?php echo $arr_userinfo[0]; ?>
                      <small>Customer Number: <?php echo $arr_userinfo[1]; ?></small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="./account.php" class="btn btn-default btn-flat">Account</a>
                    </div>
                    <div class="pull-right">
                      <a href="./login.php?action=logoff" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>

            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- search form (Optional) -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="treeview">
              <a href="devices.php">
                <i class="fa fa-laptop"></i> <span>Manage Devices</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
            </li>
<?php
/*
            <li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Network</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Monitor <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Clients</a></li>
            	    <li><a href="#"><i class="fa fa-circle-o"></i> Topology</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Packet Capture</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Event Log</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Summary Report</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Configure <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> General</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Add Devices</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Switches</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Monitor <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Switches</a></li>
            	    <li><a href="#"><i class="fa fa-circle-o"></i> Switch Ports</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> DHCP Servers</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Configure <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> IPv4 ACL</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Access Policies</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Port Schedules</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Switch Settings</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>Orgnization</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Monitor <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Overview</a></li>
            	    <li><a href="#"><i class="fa fa-circle-o"></i> Change log</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Login attempts</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Security report</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Location analytics</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Config. templates</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Configure <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Settings</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Config. sync</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> MDM</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Administrators</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> License Info</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Create Network</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Inventory</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-book"></i> <span>Help</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Get help</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Cases</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> New features</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Firewall info</a></li>
              </ul>
            </li>
*/
?>
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>
