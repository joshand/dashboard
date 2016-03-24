<?php
include './config.inc';
include './header.inc';

$thisid = checkGetAndPost("id");
$arr_info = GetAPICallInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$thisid);

$action = checkGetAndPost("action");
if($action=="copy") {
	$arr_info = DoCopyAPI($dbtype,$dbserver,$dbname,$dbun,$dbpw,$arr_info,$thisid);
}

?>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				&nbsp; <!--Header-->
				<small>&nbsp;</small> <!--Desc-->
			</h1>
			<ol class="breadcrumb">
				<li><a href="./index.php"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="./cdp.php">Collaborative Development Platform</a></li>
				<li><a href="./apicalls.php">API Calls</a></li>
				<li class="active"><?php echo $arr_info["description"] ?></li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<!-- Horizontal Form -->
			<div class="box box-solid box-default">
				<div class="box-header with-border">
					<h3 class="box-title">API Call (<?php echo $arr_info["description"] ?>)</h3>
				</div><!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal">
					<div class="box-body">
						<input type="hidden" value="<?php echo $arr_info["pkid"]; ?>" name="gen_id" id="gen_id">
						<div class="form-group">
							<label for="gen_desc" class="col-sm-2 control-label">Description:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="Description" value="<?php echo str_replace("\"","&quot;",$arr_info["description"]); ?>" name="gen_desc" id="gen_desc">
							</div>
						</div>
						<div class="form-group">
							<label for="api_method" class="col-sm-2 control-label">HTTP(S) Method:</label>
                        		        	<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="Method (eg. GET or POST)" value="<?php echo $arr_info["method"]; ?>" name="api_method" id="api_method">
							</div>
						</div>
						<div class="form-group">
							<label for="api_url" class="col-sm-2 control-label">HTTP(S) URL:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="URL (Use %ip% variable. eg: https://%ip%/sdk)" value="<?php echo $arr_info["url"]; ?>" name="api_url" id="api_url">
							</div>
						</div>
						<div class="form-group">
							<label for="api_ctype" class="col-sm-2 control-label">Content-Type:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="Content-Type (eg: text/xml, text/json or application/json)" value="<?php echo $arr_info["content_type"]; ?>" name="api_ctype" id="api_ctype">
							</div>
						</div>
						<div class="form-group">
							<label for="api_saction" class="col-sm-2 control-label">SOAP-Action:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="SOAP-Action (eg: urn:internalvim25/4.1 or CUCM:DB ver=11.0)" value="<?php echo $arr_info["soap_action"]; ?>" name="api_saction" id="api_saction">
							</div>
						</div>
						<div class="form-group">
							<label for="api_creds" class="col-sm-2 control-label">Credentials:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="Credentials (Use %un% and %pw% variables. eg: %un%:%pw% for Basic Auth" value="<?php echo $arr_info["credentials"]; ?>" name="api_creds" id="api_creds">
							</div>
						</div>
						<div class="form-group">
							<label for="api_cookie" class="col-sm-2 control-label">Cookie:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="Cookie (Typically comes from login return variable, eg: %1%)" value="<?php echo $arr_info["cookie"]; ?>" name="api_cookie" id="api_cookie">
							</div>
						</div>
						<div class="form-group">
							<label for="api_message" class="col-sm-2 control-label">Message:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="10" placeholder="Message Body (Request content, typically in XML or JSON format. Some requests may need to include %un% or %pw% variables for authentication or return variables such as %1%.)" name="api_message" id="api_message"><?php echo $arr_info["message"]; ?></textarea>
							</div>
						</div>
                                                <div class="form-group">
                                                        <label for="api_fk" class="col-sm-2 control-label">File Key:</label>
                                                        <div class="col-sm-10">
							<input type="text" class="form-control" placeholder="File Key; not the actual file, but the first part of the key:value pair used in a multi-part form" value="<?php echo $arr_info["filekey"]; ?>" name="api_fk" id="api_fk">
                                                        </div>
                                                </div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" id='savebutton1'>Save changes</button>
						</div>
					</div>
				</form>
			</div>
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->

	<!-- Main Footer -->
	<footer class="main-footer">
		<!-- To the right -->
		<div class="pull-right hidden-xs">
			&nbsp; <!-- Make a wish? -->
		</div>
		<!-- Default to the left -->
	</footer>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
		</ul>
	</aside><!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
	</div><!-- ./wrapper -->

	<!-- Modal -->
	<div class="modal fade" id="configbox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Edit Configuration</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" value="" name="device_id" id="device_id">
						<div class="form-group">
							<label>Device Name</label>
							<input type="text" class="form-control" placeholder="Device Name" value="" name="dev_name" id="dev_name">
						</div>
						<div class="form-group">
							<label>Serial Number</label>
							<input type="text" class="form-control" placeholder="Serial Number" value="" name="dev_sn" id="dev_sn">
						</div>
						<div class="form-group">
							<label>Device Type</label>
							<select class="form-control" name="dev_type" id="dev_type">
							</select>
						</div>
						<div class="form-group">
							<label>Tags</label>
							<input type="text" class="form-control" placeholder="Tags" value="" name="dev_tags" id="dev_tags">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" id='savebutton1'>Save changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 2.1.4 -->
	<script src="./adminlte/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="./adminlte/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="./adminlte/plugins/fastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./adminlte/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./adminlte/dist/js/demo.js"></script>
	<!-- page script -->
	<script>
		$("#savebutton1").click(function(){
			var gi = $("#gen_id").val();
			var gd = $("#gen_desc").val();
                        var am = $("#api_method").val();
                        var au = $("#api_url").val();
                        var ac = $("#api_ctype").val();
                        var as = $("#api_saction").val();
                        var ar = $("#api_creds").val();
                        var ak = $("#api_cookie").val();
                        var ag = $("#api_message").val();
			var fk = $("#api_fk").val();
			//console.log( sn + "-" + te);
			$.ajax({
				datatype : "json",
				type: 'POST',
				url: 'sp_apicall.php',
				data: {
					gi: gi,
					gd: gd,
                                        am: am,
                                        au: au,
                                        ac: ac,
                                        as: as,
                                        ar: ar,
                                        ak: ak,
                                        ag: ag,
					fk: fk
				},
				success: function(data){
                                        var jsonData = JSON.parse(data);
                                        //alert('ID: ' + jsonData.id + '\nIP: ' + jsonData.ip);
                                        if (jsonData.id) {
                                                //window.location.reload();
                                                window.location.replace('./apicall.php?id=' + jsonData.id);
                                        }
				}
			});
		});
	</script>
</body>
</html>

<?php
function GetAPICallInfo($dbt,$dbs,$dbn,$dbu,$dbp,$tid) {
	$str_pkid = "";
	$strSQL = "SELECT api_calls.* FROM api_calls WHERE (api_calls.pkid = '" . CleanSQL($tid) . "')";
	//echo "--$strSQL--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$arr_vals = do_db_result($dbt,$result,0,"");
	}
	do_db_close($dbt,$conn);

	return $arr_vals; 
}

function DoCopyAPI($dbt,$dbs,$dbn,$dbu,$dbp,$arr_apidata,$tid) {
	$str_pkid = "";
        date_default_timezone_set("America/Chicago");
        $sqldt = date("Y-m-d H:i:s");

        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$strSQL = "INSERT INTO api_calls (description,method,url,content_type,soap_action,credentials,cookie,return_header,message,filekey,dtcreated,dtcreateduid) VALUES ('" . $arr_apidata["description"] . " (Copy)" . "','" . $arr_apidata["method"] . "','" . $arr_apidata["url"] . "','" . $arr_apidata["content_type"] . "','" . $arr_apidata["soap_action"] . "','" . $arr_apidata["credentials"] . "','" . $arr_apidata["cookie"] . "','" . $arr_apidata["return_header"] . "','" . str_replace("'","\'",$arr_apidata["message"]) . "','" . $arr_apidata["filekey"] . "','$sqldt','$tid')";
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	echo "---------------------------$strSQL--";

        $strSQL = "SELECT api_calls.* FROM api_calls WHERE (dtcreated = '$sqldt') AND (dtcreateduid = '$tid')";
        //echo "---------------------------$strSQL--";

        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $result = $arr_result[1];
        $num = $arr_result[0];
        if($num>0) {
                $arr_vals = do_db_result($dbt,$result,0,"");
        }
        do_db_close($dbt,$conn);

        return $arr_vals;
}
?>
