<?php
include './config.inc';
include './header.inc';

$thisid = checkGetAndPost("id");
$arr_info = GetAPITaskInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$thisid);

$action = checkGetAndPost("action");
DoUpdateAction($dbtype,$dbserver,$dbname,$dbun,$dbpw,$thisid,$action);

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
            <li><a href="./apitasks.php">API Tasks</a></li>
            <li class="active"><?php echo $arr_info["description"] ?></li>
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">

                        <div class="box box-solid box-default">
                                <div class="box-header with-border">
                                        <h3 class="box-title">API Task (<?php echo $arr_info["description"] ?>)<font size='-2'>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#edittask">Edit Task</a></font></h3>
                                </div><!-- /.box-header -->

<?php /*
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Selected API Calls</h3>

                </div><!-- /.box-header -->
*/ ?>
                <div class="box-body">
                  <table id="apicallssel" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Description</th>
			<th>Order</th>
                        <th>Method</th>
                        <th>URL</th>
			<th></th>
                        <th></th>
                        <th></th>
                        <th></th>
			<th></th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Available API Calls</h3> <?php /* <font size='-2'>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#configbox">Create New</a></font></h3> */ ?>

                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="apicalls" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Description</th>
                        <th>Method</th>
                        <th>URL</th>
			<th>Actions</th>
                      </tr>
                    </thead>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

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
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

        <!-- Modal -->
        <div class="modal fade" id="configbox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                        <div class="modal-content">
                                <form role="form">
                                        <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Edit Task Parameters</h4>
                                        </div>
                                        <div class="modal-body">
                                                <input type="hidden" value="" name="actm_id" id="actm_id">
                                                <div class="form-group">
                                                        <label>API Call Order</label>
                                                        <input type="text" class="form-control" placeholder="Order" value="" name="actm_order" id="actm_order">
                                                </div>
                                                <div class="form-group">
                                                        <label>Parameter 1</label>
                                                        <input type="text" class="form-control" placeholder="Parameter 1 (Static value to send to API Call, or variable from return. eg. %ret1%)" value="" name="actm_p1" id="actm_p1">
                                                </div>
                                                <div class="form-group">
                                                        <label>Parameter 2</label>
                                                        <input type="text" class="form-control" placeholder="Parameter 2 (Static value to send to API Call, or variable from return. eg. %ret1%)" value="" name="actm_p2" id="actm_p2">
                                                </div>
                                                <div class="form-group">
                                                        <label>Parameter 3</label>
                                                        <input type="text" class="form-control" placeholder="Parameter 3 (Static value to send to API Call, or variable from return. eg. %ret1%)" value="" name="actm_p3" id="actm_p3">
                                                </div>
                                                <div class="form-group">
                                                        <label>Return Data</label>
                                                        <input type="text" class="form-control" placeholder="Return Data (eg. COOKIE=APIC-cookie-)ret1 ; * returns all data)" value="" name="actm_ret" id="actm_ret">
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

        <!-- Modal -->
        <div class="modal fade" id="edittask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                        <div class="modal-content">
                                <form role="form">
                                        <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Edit Task</h4>
                                        </div>
                                        <div class="modal-body">
                                                <input type="hidden" value="<?php echo $arr_info["pkid"] ?>" name="gen_id" id="gen_id">
                                                <div class="form-group">
                                                        <label>Description</label>
                                                        <input type="text" class="form-control" placeholder="Task Description" value="<?php echo $arr_info["description"] ?>" name="gen_desc" id="gen_desc">
                                                </div>
                                                <div class="form-group">
                                                        <label>Family</label>
							<select class="form-control" name="api_fam" id="api_fam">
<?php
echo GetOptionDropdown($dbtype,$dbserver,$dbname,$dbun,$dbpw,"api_family","pkid","description",$arr_info["fkfamily"]);
?>
							</select>
                                                </div>
                                        </div>
                                        <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal" id='savebutton2'>Save changes</button>
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
	$(document).ready(function() {
            var table = $('#apicalls').DataTable( {
                "processing": true,
                "serverSide": true,
                "ajax": "./sp_apicalls.php",
		"columnDefs": [
			{
				"targets": [ 0 ],
				"visible": false
			},
			{
				"targets": [ 1 ],
				"render": function ( data, type, full ) {
					// 'full' is the row's data object, and 'data' is this column's data
					//return '<a href="apicall.php?id=' + full[0] + '">' + data + '</a>';
					return data;
				}
			},
                        {
                                "targets": [ 4 ],
				"width": "10px",
                                "render": function ( data, type, full ) {
                                        // 'full' is the row's data object, and 'data' is this column's data
                                        return '<div class="btn-group open"><a class="btn btn-xs bg-olive" href="apitask.php?id=<?php echo $thisid ?>&action=add&apicall=' + full[0] + '"><i class="fa fa-plus-circle fa-fw"></i></a></div>';
                                        //return data;
                                }
                        }

		]
            });

            $('#zzzapicalls tbody').on('click', 'tr', function () {
                        var name = table.row( this ).data();
                        //alert(name[0]);
                        window.location.replace('./apicall.php?id=' + name[0]);
            } );

	    var table = $('#apicallssel').DataTable( {
	        "processing": true,
	        "serverSide": true,
	        "ajax": "./sp_apitasks.php?tid=<?php echo $thisid ?>",
		"order": [[ 2, 'asc' ], [ 1, 'asc' ]],
	        "columnDefs": [
	          {
	        	 "targets": [ 0,5,6,7,8,9 ],
	        	 "visible": false
			  },
	          {
	        	 "targets": [ 1 ],
	        	 "render": function ( data, type, full ) {
		           // 'full' is the row's data object, and 'data' is this column's data
         	  	   //return '<a href="./device.php?id=' + full[0] + '">' + data + '</a>';
			   return data;
			     }
			  },
                        {
                                "targets": [ 10 ],
				"width": "10px",
                                "render": function ( data, type, full ) {
                                        // 'full' is the row's data object, and 'data' is this column's data
                                        return '<div class="btn-group open"><a class="btn btn-xs bg-maroon" href="apitask.php?id=<?php echo $thisid ?>&action=rem&apicall=' + full[0] + '"><i class="fa fa-minus-circle fa-fw"></i></a></div>';
                                        //return data;
                                }
                        }
			]
	    } );
	    
	    $('#apicallssel tbody').on('click', 'tr', function () {
			var name = table.row( this ).data();
			//alert(name[0]);
			//window.location.replace('./device.php?id=' + name[0]);
			document.getElementById("actm_id").value = name[5];
			document.getElementById("actm_order").value = name[2];
                        document.getElementById("actm_p1").value = name[6];
                        document.getElementById("actm_p2").value = name[7];
			document.getElementById("actm_p3").value = name[8];
                        document.getElementById("actm_ret").value = name[9];

			showTheModal();
	    } );

		function showTheModal() {
			$('#configbox').modal();
		}

		$('#configbox').on('shown.bs.modal', function (e) {
			//do nothing?
		})

               $("#savebutton1").click(function(){
                        var ai = $("#actm_id").val();
                        var ao = $("#actm_order").val();
                        var a1 = $("#actm_p1").val();
                        var a2 = $("#actm_p2").val();
			var a3 = $("#actm_p3").val();
                        var ar = $("#actm_ret").val();

                        //console.log( sn + "-" + te);
                        $.ajax({
                                datatype : "json",
                                type: 'POST',
                                url: 'sp_actm.php',
                                data: {
                                        ai: ai,
                                        ao: ao,
                                        a1: a1,
                                        a2: a2,
					a3: a3,
                                        ar: ar
                                },
                                success: function(data){
                                        //var jsonData = JSON.parse(data);
                                        //alert('ID: ' + jsonData.id + '\nIP: ' + jsonData.ip);
                                        //if (jsonData.id) {
                                                window.location.reload();
                                        //}
                                }
                        });
                });

                $("#savebutton2").click(function(){
                        var gi = $("#gen_id").val();
                        var gd = $("#gen_desc").val();
			var ext1 = $("#api_fam").val();
                        var tb = "api_tasks";
                        //console.log( sn + "-" + te);
                        $.ajax({
                                datatype : "json",
                                type: 'POST',
                                url: 'sp_new_gen.php',
                                data: {
                                        tb: tb,
                                        gd: gd,
					gi: gi,
					e1: ext1,
					e1f: "fkfamily"
                                },
                                success: function(data){
                                        var jsonData = JSON.parse(data);
                                        //alert('ID: ' + jsonData.id + '\nIP: ' + jsonData.ip);
                                        if (jsonData.id) {
                                                //window.location.reload();
                                                window.location.replace('./apitask.php?id=' + jsonData.id);
                                        }
                                }
                        });
                });

	});
    </script>
  </body>
</html>

<?php
function GetAPITaskInfo($dbt,$dbs,$dbn,$dbu,$dbp,$tid) {
        $str_pkid = "";
        $strSQL = "SELECT api_tasks.* FROM api_tasks WHERE (api_tasks.pkid = '" . CleanSQL($tid) . "')";
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

function DoUpdateAction($dbt,$dbs,$dbn,$dbu,$dbp,$tid,$act) {
	if($act!="") {
        	$apiid = checkGetAndPost("apicall");
        	if($act=="add") {
			$strSQL = "SELECT * FROM apicallstasksmap WHERE (fkapicall = '$apiid') AND (fkapitask = '$tid')";
                        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
			$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
			$num = $arr_result[0];
        		if($num==0) {
                		$strSQL = "INSERT INTO apicallstasksmap (morder,fkapicall,fkapitask) VALUES (0,'$apiid','$tid')";
                		$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
			}
                	do_db_close($dbt,$conn);
        	} else {
			$strSQL = "DELETE FROM apicallstasksmap WHERE (fkapicall = '$apiid') AND (fkapitask = '$tid')";
                        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
                        $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
                        do_db_close($dbt,$conn);
        	}
	}

	return 0;
}

function GetOptionDropdown($dbt,$dbs,$dbn,$dbu,$dbp,$sqltable,$sqlidfield,$sqldisplayfield,$currentvalue) {
        $retval = "";
        $strSQL = "SELECT $sqlidfield,$sqldisplayfield FROM $sqltable";
        //echo "--$currentvalue--";

        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
        $result = $arr_result[1];
        $num = $arr_result[0];
        for($x=0;$x<$num;$x++) {
                $resid = do_db_result($dbt,$result,$x,$sqlidfield);
                $resdesc = do_db_result($dbt,$result,$x,$sqldisplayfield);
                if($currentvalue==$resid) { $seltag = " selected"; } else { $seltag = ""; }

                $retval .= "<option value='$resid'$seltag>$resdesc</option>\n";
        }

        return $retval;
}

?>

