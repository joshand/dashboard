<?php
include './config.inc';
include './header.inc';

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
            <li class="active">Device Series</li>
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">

              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Device Series<font size='-2'>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#configbox">Create New</a></font></h3>

                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="devsers" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Description</th>
			<th>Family</th>
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
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">New Device Series</h4>
				</div>
				<form role="form">
					<div class="modal-body">
						<div class="form-group">
							<label>Device Series Description</label>
							<input type="text" class="form-control" placeholder="Description" name="gen_desc" id="gen_desc">
						</div>
                    				<div class="form-group">
                      					<label>Device Family</label>
                      					<select class="form-control" name="dev_fam" id="dev_fam">
                        				<?php
                                				echo GetOptionDropdown($dbtype,$dbserver,$dbname,$dbun,$dbpw,"typedevicefamily", "id", "name", "");
                        				?>
                      					</select>
                    				</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" id='savebutton1'>Create New</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

        <!-- Modal -->
        <div class="modal fade" id="configbox2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                        <div class="modal-content">
                                <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Edit Device Series</h4>
                                </div>
                                <form role="form">
                                        <div class="modal-body">
                                                <input type="hidden" value="" name="edit_id" id="edit_id">
                                                <div class="form-group">
                                                        <label>Device Series Description</label>
                                                        <input type="text" class="form-control" placeholder="Description" name="edit_desc" id="edit_desc">
                                                </div>
                                                <div class="form-group">
                                                        <label>Device Family</label>
                                                        <select class="form-control" name="edit_fam" id="edit_fam">
                                                        <?php
                                                                echo GetOptionDropdown($dbtype,$dbserver,$dbname,$dbun,$dbpw,"typedevicefamily", "id", "name", "");
                                                        ?>
                                                        </select>
                                                </div>
                                                <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id='savebutton2'>Save</button>
                                                </div>
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
	    var table = $('#devsers').DataTable( {
	        "processing": true,
	        "serverSide": true,
	        "ajax": "./sp_devdetails.php?type=s",
	        "columnDefs": [
	          	{
	        	 	"targets": [ 0,3 ],
	        	 	"visible": false
			},
	          	{
	        	 	"targets": [ 1 ],
	        	 	"render": function ( data, type, full ) {
					// 'full' is the row's data object, and 'data' is this column's data
					return data;
				}
			}
			]
	    } );
	    
            $('#devsers tbody').on('click', 'tr', function () {
                        var name = table.row( this ).data();
                        //alert(name[0]);
                        //window.location.replace('./apifamily.php?id=' + name[0]);
                        document.getElementById("edit_desc").value = name[1];
                        document.getElementById("edit_id").value = name[0];
                        document.getElementById("edit_fam").value = name[3];
                        showTheModal();
            } );

                function showTheModal() {
                        $('#configbox2').modal();
                }


		$("#savebutton1").click(function(){
			var gd = $("#gen_desc").val();
			var tb = "typedeviceseries";
			var ext1 = $("#dev_fam").val();
			//console.log( sn + "-" + te);
			$.ajax({
				datatype : "json",
				type: 'POST',
				url: 'sp_new_gen.php',
				data: {
					tb: tb,
					gd: gd,
					e1: ext1,
					e1f: "fkfamily"
				},
				success: function(data){
					var jsonData = JSON.parse(data);
					//alert('ID: ' + jsonData.id + '\nIP: ' + jsonData.ip);
					if (jsonData.id) {
						window.location.reload();
						//window.location.replace('./apicall.php?id=' + jsonData.id);
					}
				}
			});
		});

                $("#savebutton2").click(function(){
                        var gi = $("#edit_id").val();
                        var gd = $("#edit_desc").val();
                        var tb = "typedeviceseries";
                        var ext1 = $("#edit_fam").val();
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
                                                window.location.reload();
                                                //window.location.replace('./apicall.php?id=' + jsonData.id);
                                        }
                                }
                        });
                });

	} );
    </script>
  </body>
</html>

<?php
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
