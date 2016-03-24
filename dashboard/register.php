<?php
include 'config.inc';
include './library/common.inc';
include './library/random/random_int.php';
include './library/random/random.php';

session_start();
if(isset($_SESSION["uid"])) {
	redirect("./index.php");
}
$fname = checkGetAndPost("full_name");
$email = checkGetAndPost("email");
$password1 = checkGetAndPost("password1");
$password2 = checkGetAndPost("password2");
if($email!="") {
	$arr_msg = CheckCreateAccount($dbtype,$dbserver,$dbname,$dbun,$dbpw,$fname,$email,$password1,$password2);

	if($arr_msg[0]==1) {
		redirect("./login.php?new=1");
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
    <title>Dashboard | Registration Page</title>
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
  <body class="hold-transition register-page">
    <div class="register-box">
      <div class="register-logo">
        <a href="./index.php"><b>Dash</b>board</a>
      </div>

      <div class="register-box-body">
        <p class="login-box-msg">Register</p>
        <form action="./register.php" method="post">
          <div class="form-group has-feedback">
            <input name="full_name" type="text" class="form-control" placeholder="Full name">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input name="email" type="email" class="form-control" placeholder="Email">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input name="password1" type="password" class="form-control" placeholder="Password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input name="password2" type="password" class="form-control" placeholder="Retype password">
            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
<?php /*
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox"> I agree to the <a href="#">terms</a>
                </label>
              </div>
*/ ?>
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button name="register" type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
            </div><!-- /.col -->
          </div>
        </form>

        <a href="login.php" class="text-center">I already have an account</a>
      </div><!-- /.form-box -->
    </div><!-- /.register-box -->

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
function CheckCreateAccount($dbt,$dbs,$dbn,$dbu,$dbp,$fname,$email,$password1,$password2) {
	$retval = "";
	
	if($password1!=$password2) {
		$retval = explode(",","0,Error!,The passwords do not match. Please re-enter and try again.");
	} else if(strpos($email,"@")===false) {
		$retval = explode(",","0,Error!,Please enter a valid e-mail address and try again.");
	} else {
		$strSQL = "SELECT * FROM user WHERE (email LIKE '" . CleanSQL($email) . "')";

		$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
		$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
		$result = $arr_result[1];
		$num = $arr_result[0];
		
		if($num>0) {
			$retval = explode(",","0,Error!,An account is already registered with this e-mail address.");
		} else {
			$hashpw = password_hash($password1, PASSWORD_DEFAULT);
			//$token = strtolower(GUID());
			$strSQL = "INSERT INTO user (name,email,pwhash) VALUES ('" . CleanSQL($fname) . "','" . CleanSQL($email) . "','" . CleanSQL($hashpw) . "')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$strSQL = "SELECT pkid FROM user WHERE (email = '" . CleanSQL($email) . "')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$uid = do_db_result($dbt,$result,0,"pkid");
			
			do {
				$custnum = strtoupper(generateToken(4));
				$custnum = substr($custnum,0,4) . "-" . substr($custnum,4);
				$strSQL = "SELECT * FROM tenant WHERE (custnum = '$custnum')";
				$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
				$result = $arr_result[1];
				$num = $arr_result[0];
			} while ($num > 0);

			// Create customer (aka organization) in database and associate user account to customer account
			$strSQL = "INSERT INTO customer (description,custnum) VALUES ('" . CleanSQL($fname) . "','" . CleanSQL($custnum) . "')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

			$strSQL = "SELECT pkid FROM customer WHERE (custnum = '$custnum')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$cid = do_db_result($dbt,$result,0,"pkid");

			$strSQL = "INSERT INTO usercustomermap (fkuser,fkcustomer) VALUES ('$uid','$cid')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

			// Create tenant (aka network) in database and associate customer account to tenant
			$strSQL = "INSERT INTO tenant (description) VALUES ('" . CleanSQL($fname) . "\'s Network')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

			$strSQL = "SELECT pkid FROM tenant WHERE (description = '" . CleanSQL($fname) . "\'s Network')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			$tid = do_db_result($dbt,$result,0,"pkid");

			$strSQL = "INSERT INTO tenantmap (fktenant,fkcustomer) VALUES ('$tid','$cid')";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			
			$strSQL = "UPDATE user SET currenttenant = '$tid' WHERE pkid = '$uid'";
			$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);

			$retval = explode(",","1,,");
		}	
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

function GUID()
{
    if (function_exists('com_create_guid') === true)
    {
        return trim(com_create_guid(), '{}');
    }

    return sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
}

function generateToken($length = 20)
{
    return bin2hex(random_bytes($length));
}
?>
