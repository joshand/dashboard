<?php
include 'header.inc';
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
            <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Account</li>
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">

              <!-- Custom Tabs -->
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab_1" data-toggle="tab">Account</a></li>
                  <li><a href="#tab_2" data-toggle="tab">Organization</a></li>
                  <li><a href="#tab_3" data-toggle="tab">Networks</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">

              <!-- Horizontal Form -->
              <div class="box box-solid box-default">
                <div class="box-header with-border">
                  <h3 class="box-title">Account</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="full_name" class="col-sm-2 control-label">Name</label>
                      <div class="col-sm-10">
                        <input name="full_name" type="text" class="form-control" id="full_name" placeholder="Full Name" value="<?php echo $arr_userinfo[0]; ?>">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="email" class="col-sm-2 control-label">Email</label>
                      <div class="col-sm-10">
                        <input name="email" type="email" class="form-control" id="email" placeholder="Email" value="<?php echo $arr_userinfo[3]; ?>">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="current_password" class="col-sm-2 control-label">Current Password</label>
                      <div class="col-sm-10">
                        <input name="current_password" type="password" class="form-control" id="current_password" placeholder="Current Password">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="new_password" class="col-sm-2 control-label">New Password</label>
                      <div class="col-sm-10">
                        <input name="new_password" type="password" class="form-control" id="new_password" placeholder="New Password">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="confirm_password" class="col-sm-2 control-label">Confirm Password</label>
                      <div class="col-sm-10">
                        <input name="confirm_password" type="password" class="form-control" id="confirm_password" placeholder="Confirm Password">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                </form>
              </div><!-- /.box -->

                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2">

              <div class="box box-solid box-default">
                <div class="box-header with-border">
                  <h3 class="box-title">Organization</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="full_name" class="col-sm-2 control-label">Name</label>
                      <div class="col-sm-10">
                        <input name="full_name" type="text" class="form-control" id="full_name" placeholder="Full Name" value="<?php echo $arr_userinfo[2]; ?>">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="cust_num" class="col-sm-2 control-label">Customer Number</label>
                      <div class="col-sm-10">
                        <input name="cust_num" type="email" class="form-control" id="cust_num" placeholder="Customer Number" value="<?php echo $arr_userinfo[1]; ?>" disabled>
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                </form>
              </div><!-- /.box -->
              
              <div class="box box-solid box-default">
                <div class="box-header with-border">
                  <h3 class="box-title">Administrators</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="admins" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Privilege</th>
                      </tr>
                    </thead>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->


                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3">

              <div class="box box-solid box-default">
                <div class="box-header with-border">
                  <h3 class="box-title">Networks</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="networks" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Name</th>
                      </tr>
                    </thead>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->


                  </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
              </div><!-- nav-tabs-custom -->

          <!-- Your Page Content Here -->

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
	    var table = $('#networks').DataTable( {
	        "processing": true,
	        "serverSide": true,
	        "ajax": "./sp_networks.php?uid=<?php echo $arr_userinfo[4]; ?>&cid=<?php echo $arr_userinfo[5]; ?>",
	        "columnDefs": [
	          {
	        	 "targets": [ 0 ],
	        	 "visible": false
			  },
	          {
	        	 "targets": [ 1 ],
	        	 "render": function ( data, type, full ) {
		           // 'full' is the row's data object, and 'data' is this column's data
         	  	   return '<a href="./network.php?id=' + full[0] + '">' + data + '</a>';
			     }
			  }
			]
	    } );

	    var table = $('#admins').DataTable( {
	        "processing": true,
	        "serverSide": true,
	        "ajax": "./sp_admins.php?uid=<?php echo $arr_userinfo[4]; ?>&cid=<?php echo $arr_userinfo[5]; ?>",
	        "columnDefs": [
	          {
	        	 "targets": [ 0 ],
	        	 "visible": false
			  },
	          {
	        	 "targets": [ 1 ],
	        	 "render": function ( data, type, full ) {
		           // 'full' is the row's data object, and 'data' is this column's data
         	  	   return '<a href="./admin.php?id=' + full[0] + '">' + data + '</a>';
			     }
			  }
			]
	    } );
	    
	    $('#networks tbody').on('click', 'tr', function () {
			var name = table.row( this ).data();
			//alert(name[0]);
			window.location.replace('./network.php?id=' + name[0]);
	    } );

	    $('#admins tbody').on('click', 'tr', function () {
			var name = table.row( this ).data();
			//alert(name[0]);
			window.location.replace('./admin.php?id=' + name[0]);
	    } );
	} );
    </script>
  </body>
</html>
