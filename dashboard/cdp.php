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
            <li class="active">Collaborative Development Platform</li>
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">

              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Collaborative Development Platform</h3>

                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="apicalls" class="table table-bordered table-striped">
                    <thead>
                      	<tr>
                        	<th>Functions</th>
                      	</tr>
                        <tr>
                                <td><a href='devicecategories.php'>Device Categories</a></td>
                        </tr>
                        <tr>
                                <td><a href='devicefamilies.php'>Device Families</a></td>
                        </tr>
                        <tr>
                                <td><a href='deviceseries.php'>Device Series</a></td>
                        </tr>
                        <tr>
                                <td><a href='apifamilies.php'>Consumed API Families</a></td>
                        </tr>
			<tr>
				<td><a href='apicalls.php'>Consumed API Calls</a></td>
			</tr>
			<tr>
				<td><a href='apitasks.php'>Consumed API Tasks</a></td>
			</tr>
                        <tr>
                                <td><a href='apitaskgroups.php'>Consumed API Task Groups</a></td>
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
					<h4 class="modal-title" id="myModalLabel">New API Call</h4>
				</div>
				<form role="form">
					<div class="modal-body">
						<div class="form-group">
							<label>New API Call Description</label>
							<input type="text" class="form-control" placeholder="Description" name="gen_desc" id="gen_desc">
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
    </script>
  </body>
</html>

