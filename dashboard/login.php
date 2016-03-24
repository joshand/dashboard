<?php
include 'config.inc';
include './library/common.inc';
include 'auth.inc';
//include './library/random/random_int.php';
//include './library/random/random.php';

session_start();
//if(isset($_SESSION["uid"])) {
//	redirect("./index.php");
//}
$checknew = checkGetAndPost("new");
if($checknew=="1") {
	    echo "                  <div class=\"callout callout-success\">";
	    echo "                    <h4>Success!</h4>";
	    echo "                    <p>Account created successfully. Please sign in with your credentials.</p>";
	    echo "                  </div>";
}

$checkact = checkGetAndPost("action");
if($checkact=="logoff") {
        if(isset($_COOKIE["token"])) {
	  $token = $_COOKIE["token"];
	  $sel = substr($token,0,12);
	  $val = substr($token,13,24);
	  ClearToken($dbtype,$dbserver,$dbname,$dbun,$dbpw,"",$token,$sel,$val);
	  unset($_COOKIE["token"]);
	}
	if(isset($_SESSION["uid"])) { unset($_SESSION["uid"]); }
	setcookie("token", "", time()-3600, "/");

	if(isset($_COOKIE["uid"])) { unset($_COOKIE["uid"]); }
	setcookie("uid", "", time()-3600, "/");
}

//if(isset($_SESSION["uid"])) {
//        redirect("./index.php");
//}
if(isset($_COOKIE["token"])) {
        $token = $_COOKIE["token"];
        $sel = substr($token,0,12);
        $val = substr($token,13,24);

        $userid = CheckToken($dbtype,$dbserver,$dbname,$dbun,$dbpw,"",$token,$sel,$val);
        //echo "----------------$token\n<br>----------------$sel--$val--$userid--";
        if($userid!="0") {
                $_SESSION["uid"] = $userid;
		redirect("./index.php");
        } else {
                //redirect("./login.php");
        }
}

$email = checkGetAndPost("email");
$password = checkGetAndPost("password");
if($email!="") {
	$arr_msg = CheckCreds($dbtype,$dbserver,$dbname,$dbun,$dbpw,$email,$password);

	if($arr_msg[0]==1) {
		$do_rem = checkGetAndPost("do_remember");
		$sel = generateToken(6);
		$val = generateToken(12);
		$token = $sel . ":" . $val;
		//SetToken($dbtype,$dbserver,$dbname,$dbun,$dbpw,$sel,$val,$arr_msg[3],time()+60*60*24*30);
		if($do_rem!="") {
			//setcookie("uid",$arr_msg[3],time()+60*60*24*7);
			setcookie("token",$token,time()+60*60*24*7);
	                SetToken($dbtype,$dbserver,$dbname,$dbun,$dbpw,$sel,$val,$arr_msg[3],time()+60*60*24*30);
		} else {
			//setcookie("uid",$arr_msg[3],false);
			setcookie("token",$token,0);
                	SetToken($dbtype,$dbserver,$dbname,$dbun,$dbpw,$sel,$val,$arr_msg[3],time()+60*60*24);
		}
		redirect("./index.php");
	} else {
		$err_title = $arr_msg[1];
		$err_text = $arr_msg[2];

	    echo "              <div class=\"callout callout-danger\">";
	    echo "                <h4>$err_title</h4>";
	    echo "                <p>$err_text</p>";
	    echo "              </div>";
	}
}
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="./adminlte/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="./adminlte/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="./index.php"><b>Dash</b>board</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>
        <form action="./login.php" method="post">
          <div class="form-group has-feedback">
            <input name="email" type="email" class="form-control" placeholder="Email">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input name="password" type="password" class="form-control" placeholder="Password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input name="do_remember" type="checkbox" value="1"> Remember Me
                </label>
              </div>
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
            </div><!-- /.col -->
          </div>
        </form>

        <!--<div class="social-auth-links text-center">-->
        <!--  <p>- OR -</p>-->
        <!--  <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>-->
        <!--  <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google+</a>-->
        <!--</div>- /.social-auth-links -->

        <a href="#">I forgot my password</a><br>
        <a href="register.php" class="text-center">Register</a>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="./adminlte/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="./adminlte/plugins/iCheck/icheck.min.js"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
  </body>
</html>

<?php
function zzCheckCreds($dbt,$dbs,$dbn,$dbu,$dbp,$email,$password) {
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

// $url should be an absolute url
function redirect($url){
    if (headers_sent()){
      die('<script type="text/javascript">window.location=\''.$url.'\';</script>');
    }else{
      header('Location: ' . $url);
      die();
    }
}

function zzgenerateToken($length = 20)
{
    return bin2hex(random_bytes($length));
}

function zzSetToken($dbt,$dbs,$dbn,$dbu,$dbp,$sel,$val,$uid,$exp) {
	$valhash = hash("sha256",$val);
	date_default_timezone_set("America/Chicago");
	$sqlexp = date("Y-m-d H:i:s",$exp);
	$strSQL = "INSERT INTO auth_token (selector,token,userid,expires) VALUES ('$sel','$valhash','$uid','$sqlexp')";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

	$sqlcur = date("Y-m-d H:i:s");
	$strSQL = "DELETE FROM auth_token WHERE (expires < '$sqlcur')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	
	$usrip = get_ip_address();
	$geoip = DoGet("http://freegeoip.net/json/$usrip","");
	$arr_vals = json_decode($geoip, true);
	$geoloc = trim($arr_vals["city"] . ", " . $arr_vals["region_code"]);
	if($geoloc==",") { $geoloc = ""; }
	$strSQL = "INSERT INTO userlogon (fkuserid,ipaddr,loc,dtlogin) VALUES ('$uid','$usrip','" . CleanSQL($geoloc) . "','$sqlcur')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "DELETE FROM userlogon WHERE (fkuserid = '$uid') AND (dtlogin <= (SELECT dtlogin FROM (SELECT dtlogin FROM userlogon ORDER BY dtlogin DESC LIMIT 1 OFFSET 3) foo))";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	do_db_close($dbt,$conn);
	return 0;
}

function zzClearToken($dbt,$dbs,$dbn,$dbu,$dbp,$uid,$token,$sel,$val) {
	$strSQL = "DELETE FROM auth_token WHERE (selector = '" . CleanSQL($sel) . "')";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	do_db_close($dbt,$conn);
}

?>
