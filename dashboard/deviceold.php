<?php
include 'config.inc';
include 'header.inc';

$thisid = checkGetAndPost("id");
$arr_devinfo = GetDeviceInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$thisid);

$action = checkGetAndPost("action");
DoUpdateAction($dbtype,$dbserver,$dbname,$dbun,$dbpw,$thisid,$action);

if($action=="") {
	$tab1act = " class=\"active\"";
	$tab7act = "";
	$tab1actc = " active";
	$tab7actc = "";
} else {
	$tab1act = "";
        $tab7act = " class=\"active\"";
	$tab1actc = "";
	$tab7actc = " active";
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
            <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="devices.php">Devices</a></li>
            <li class="active"><?php echo $arr_devinfo["NameOrIP"] ?></li>
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">
          <!-- Your Page Content Here -->
            <!-- Custom Tabs -->
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li<?php echo $tab1act; ?>><a href="#tab_1" data-toggle="tab">General</a></li>
                  <li><a href="#tab_2" data-toggle="tab">Switching</a></li>
                  <li><a href="#tab_3" data-toggle="tab">Routing</a></li>
                  <li><a href="#tab_4" data-toggle="tab">Wireless</a></li>
                  <li><a href="#tab_5" data-toggle="tab">Collaboration</a></li>
                  <li><a href="#tab_6" data-toggle="tab">Compute</a></li>
                  <li<?php echo $tab7act; ?>><a href="#tab_7" data-toggle="tab">Management</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane<?php echo $tab1actc; ?>" id="tab_1">

		    <div class="box box-solid box-default">
		      <div class="box-header with-border">
		        <h3 class="box-title">Configuration<font size='-2'>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#configbox">Edit Configuration</a></font></h3>
		        <div class="box-tools pull-right">
		          <!-- Buttons, labels, and many other things can be placed here! -->
		          <!-- Here is a label for example -->
		          <!--<span class="label label-primary">Label</span>-->
		        </div><!-- /.box-tools -->
		      </div><!-- /.box-header -->
                      <div class="box-body">
                        <dl class="dl-horizontal">
                          <dt>MAC Address:</dt>
                          <dd><?php echo $arr_devinfo["macaddress"]; ?></dd>
                          <dt>Serial Number:</dt>
                          <dd><?php echo $arr_devinfo["serialnum"] . " <font color='gray'>(" . $arr_devinfo["moddesc"] . ")</font>"; ?></dd>
                          <dt>Tags:</dt>
                          <dd><?php echo $arr_devinfo["tag"]; ?></dd>
                        </dl>
                      </div><!-- /.box-body -->
		    </div><!-- /.box -->

		    <div class="box box-solid box-default">
		      <div class="box-header with-border">
		        <h3 class="box-title">Status</h3>
		        <div class="box-tools pull-right">
		          <!-- Buttons, labels, and many other things can be placed here! -->
		          <!-- Here is a label for example -->
		          <!--<span class="label label-primary">Label</span>-->
		        </div><!-- /.box-tools -->
		      </div><!-- /.box-header -->
                      <div class="box-body">
                        <dl class="dl-horizontal">
<?php
/*
              <dt>LAN IP:</dt>
              <dd><//?//php echo $arr_devinfo["lanip"] . " <font color='gray'>(via " . $arr_devinfo["lantypedesc"] . ")</font>";
		//echo "&nbsp;&nbsp;&nbsp;(<a href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\">set IP address</a>)";
//?//>

			  </dd>
              <dd><//?//php echo "<font color='gray'>Gateway: " . $arr_devinfo["dg"] . "; Port: " . $arr_devinfo["description"] . "; VLAN: " . $arr_devinfo["dgvlandesc"] . "; DNS: " . $arr_devinfo["dnsdesc"] . "</font>"; ?//></dd>
              <dt>Public IP:</dt>
              <dd><//?//php echo $arr_devinfo["wanip"] . " <font color='gray'>(" . $arr_devinfo["wanfqdn"] . ")</font>"; ?>//</dd>
              <dt>Current Firmware:</dt>
              <dd><//?//php echo $arr_devinfo["firmware"]; ?//></dd>
*/
?>
<?php
	if($arr_devinfo["mgmttype"]!="") {
		echo "<dt>Remote Console:</dt>\n";
		echo "<dd><a target=\"_blank\" href=\"connect.php?ip=" . $arr_devinfo["lanip"] . "&type=" . $arr_devinfo["mgmttype"] . "\">Access</a>";
	}
?>
                        </dl>
                      </div><!-- /.box-body -->
		    </div><!-- /.box -->
		
		    <div class="box box-solid box-default">
		      <div class="box-header with-border">
		        <h3 class="box-title">Interfaces</h3>
		        <div class="box-tools pull-right">
		          <!-- Buttons, labels, and many other things can be placed here! -->
		          <!-- Here is a label for example -->
		          <!--<span class="label label-primary">Label</span>-->
		        </div><!-- /.box-tools -->
		      </div><!-- /.box-header -->
                      <div class="box-body">
                        <dl class="dl-horizontal">
                          <?php echo GetDeviceImage($dbtype,$dbserver,$dbname,$dbun,$dbpw,$arr_devinfo["pkid"]); ?>
                        </dl>
                      </div><!-- /.box-body -->
		    </div><!-- /.box -->

                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2">
                    Add Switching specific configuration here.
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3">
                    Add Routing specific configuration here.
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_4">
                    Add Wireless specific configuration here.
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_5">
                    Add Collaboration specific configuration here.
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_6">
                    Add Compute specific configuration here.
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane<?php echo $tab7actc; ?>" id="tab_7">

                    <div class="box box-solid box-default">
                      <div class="box-header with-border">
                        <h3 class="box-title">Associated Collectors</h3>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                        <table id="authcoll" class="table table-bordered table-striped">
                          <thead>
                            <tr>
                              <th>ID</th>
                              <th>Name</th>
                              <th>Description</th>
			      <th>Actions</th>
                            </tr>
                          </thead>
                        </table>
                      </div><!-- /.box-body -->
                    </div><!-- /.box -->

                    <div class="box box-solid box-default">
                      <div class="box-header with-border">
                        <h3 class="box-title">Available Collectors</h3>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                        <table id="availcoll" class="table table-bordered table-striped">
                          <thead>
                            <tr>
                              <th>ID</th>
                              <th>Name</th>
                              <th>Description</th>
                              <th>Actions</th>
                            </tr>
                          </thead>
                        </table>
                      </div><!-- /.box-body -->
                    </div><!-- /.box -->

                  </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
              </div><!-- nav-tabs-custom -->


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
                          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                  <h4 class="modal-title" id="myModalLabel">Set IP Address</h4>
                                </div>
                                <div class="modal-body">
                    <form role="form">
                    <input type="hidden" value="<?php echo $arr_devinfo["pkid"]; ?>" name="device_id" id="device_id">
                    <div class="form-group">
                      <label>IP Type</label>
                      <select class="form-control" name="ip_type" id="ip_type">
                        <option value='1'<?php if($arr_devinfo["lantype"]=="1") { echo " selected"; } ?> >DHCP</option>
                        <option value='2'<?php if($arr_devinfo["lantype"]=="2") { echo " selected"; } ?> >Static IP</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>VLAN</label>
                      <input type="text" class="form-control" placeholder="VLAN" value="<?php echo $arr_devinfo["dgvlan"]; ?>" name="ip_vlan" id="ip_vlan">
                    </div>
                    <div class="form-group">
                      <label>IP Address</label>
                      <input type="text" class="form-control" placeholder="IP Address" value="<?php echo $arr_devinfo["lanip"]; ?>" name="ip_address" id="ip_address">
                    </div>
                    <div class="form-group">
                      <label>Subnet Mask</label>
                      <input type="text" class="form-control" placeholder="Subnet Mask" value="<?php echo $arr_devinfo["subnetmask"]; ?>" name="ip_mask" id="ip_mask">
                    </div>
                    <div class="form-group">
                      <label>Gateway</label>
                      <input type="text" class="form-control" placeholder="Gateway" value="<?php echo $arr_devinfo["dg"]; ?>" name="ip_dgw" id="ip_dgw">
                    </div>
                    <div class="form-group">
                      <label>Primary DNS</label>
                      <input type="text" class="form-control" placeholder="Primary DNS" value="<?php echo $arr_devinfo["dns"]; ?>" name="ip_dns1" id="ip_dns1">
                    </div>
                    <div class="form-group">
                      <label>Secondary DNS</label>
                      <input type="text" class="form-control" placeholder="Secondary DNS" value="<?php echo $arr_devinfo["dns2"]; ?>" name="ip_dns2" id="ip_dns2">
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


                          <!-- Modal -->
                          <div class="modal fade" id="configbox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                  <h4 class="modal-title" id="myModalLabel">Edit Configuration</h4>
                                </div>
                                <div class="modal-body">
                    <form role="form">
                    <input type="hidden" value="<?php echo $arr_devinfo["pkid"]; ?>" name="device_id" id="device_id">
                    <div class="form-group">
                      <label>Device Name</label>
                      <input type="text" class="form-control" placeholder="Device Name" value="<?php echo $arr_devinfo["NameOrIP"]; ?>" name="dev_name" id="dev_name">
                    </div>
                    <div class="form-group">
                      <label>IP Address</label>
                      <input type="text" class="form-control" placeholder="IP Address" value="<?php echo $arr_devinfo["lanip"]; ?>" name="ip_address" id="ip_address">
                    </div>
                    <div class="form-group">
                      <label>Serial Number</label>
                      <input type="text" class="form-control" placeholder="Serial Number" value="<?php echo $arr_devinfo["serialnum"]; ?>" name="dev_sn" id="dev_sn">
                    </div>
                    <div class="form-group">
                      <label>Device Type</label>
                      <select class="form-control" name="dev_type" id="dev_type">
                        <?php
                                echo GetOptionDropdown($dbtype,$dbserver,$dbname,$dbun,$dbpw,"typedevicemodel", "ID", "Description", $arr_devinfo["refDeviceModel"]);
                        ?>
                      </select>

                      Testing/Not Implemented:<br>
                    </div>
                    <div class="form-group">
                          <label>Device PID/Model</label>
                      <div class="row">
                        <div class="col-xs-5">
                          <input type="text" class="form-control" placeholder="Device PID" value="<?php echo $arr_devinfo["moddesc"]; ?>" name="dev_pid" id="dev_pid">
                          <br>
                          <div id="dev_pid_note" name="dev_pid_note"></div>
                        </div>
                        <div class="col-xs-5">
                          <select class="form-control" name="dev_cat" id="dev_cat"><option>Device Category</option>
                            <?php
                                echo GetOptionDropdown($dbtype,$dbserver,$dbname,$dbun,$dbpw,"typedevicecategory", "id", "name", "");
                            ?>
                          </select>
                          <select class="form-control" name="dev_fam" id="dev_fam"><option>Device Family</option>
                          </select>
                          <select class="form-control" name="dev_series" id="dev_series"><option>Device Series</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>Tags</label>
                      <input type="text" class="form-control" placeholder="Tags" value="<?php echo $arr_devinfo["tag"]; ?>" name="dev_tags" id="dev_tags">
                    </div>
                    <div class="form-group">
                      <label>Username</label>
                      <input type="text" class="form-control" placeholder="Username" value="<?php echo $arr_devinfo["username"]; ?>" name="dev_un" id="dev_un">
                    </div>
                    <div class="form-group">
                      <label>Password</label>
                      <input type="password" class="form-control" placeholder="Password" value="<?php echo $arr_devinfo["password"]; ?>" name="dev_pw" id="dev_pw">
                    </div>
                    <div class="form-group">
                      <label>Access Type</label>
                      <input type="text" class="form-control" placeholder="Access Type (telnet or ssh)" value="<?php echo $arr_devinfo["mgmttype"]; ?>" name="dev_mt" id="dev_mt">
                    </div>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                  <button type="button" class="btn btn-primary" data-dismiss="modal" id='savebutton1'>Save changes</butt
on>
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
	    var table = $('#device').DataTable( {
	        "processing": true,
	        "serverSide": true,
	        "ajax": "./sp_device.php",
	        "columnDefs": [
	          {
	        	 "targets": [ 0 ],
	        	 "visible": false
			  },
	          {
	        	 "targets": [ 1 ],
	        	 "render": function ( data, type, full ) {
		           // 'full' is the row's data object, and 'data' is this column's data
         	  	   return '<a href="#' + full[0] + '">' + data + '</a>';
			     }
			  }
			]
	    } );

		var table = $('#authcoll').DataTable( {
			"processing": true,
			"serverSide": true,
			"ajax": "./sp_authcoll.php?cid=<?php echo $thisid ?>",
			"columnDefs": [
				{
					"targets": [ 0 ],
					"visible": false
				},
				{
					"targets": [ 1 ],
					"render": function ( data, type, full ) {
						// 'full' is the row's data object, and 'data' is this column's data
						return data;
					}
				},
				{
					"targets": [ 3 ],
					"width": "100px",
					"render": function ( data, type, full ) {
						// 'full' is the row's data object, and 'data' is this column's data
						return '<div class="btn-group open"><a class="btn btn-xs bg-maroon" href="device.php?id=<?php echo $thisid ?>&action=rem&coll=' + full[0] + '"><i class="fa fa-minus-circle fa-fw"></i></a></div>';
					}
				}
			]
		} );

    		var table = $('#availcoll').DataTable( {
            		"processing": true,
            		"serverSide": true,
            		"ajax": "./sp_authcoll.php?uid=<?php echo $arr_userinfo[4]; ?>&eid=<?php echo $arr_devinfo["pkid"]; ?>",
            		"columnDefs": [
                		{
                            		"targets": [ 0 ],
                            		"visible": false
                    		},
                    		{
                            		"targets": [ 1 ],
                            		"render": function ( data, type, full ) {
                                    		// 'full' is the row's data object, and 'data' is this column's data
                                    		return data;
                            		}
                    		},
                    		{
                            		"targets": [ 3 ],
                            		"width": "100px",
                            		"render": function ( data, type, full ) {
                                    		// 'full' is the row's data object, and 'data' is this column's data
                                    		return '<div class="btn-group open"><a class="btn btn-xs bg-olive" href="device.php?id=<?php echo $thisid ?>&action=add&coll=' + full[0] + '"><i class="fa fa-plus-circle fa-fw"></i></a></div>';
                            		}
                    		}
			]
        	} );

	    $('#device tbody').on('click', 'tr', function () {
			var name = table.row( this ).data();
			//alert(name[0]);
			window.location.replace('#' + name[0]);
	    } );
	    
    	$("#savebutton1, #savebutton2").click(function(){
	 	  var ip = $("#ip_address").val();
	 	  var vl = $("#ip_vlan").val();
	 	  var sm = $("#ip_mask").val();
	 	  var id = $("#device_id").val();
	 	  var dn = $("#dev_name").val();
	 	  var dt = $("#dev_tags").val();
	 	  var dg = $("#ip_dgw").val();
	 	  var d1 = $("#ip_dns1").val();
	 	  var d2 = $("#ip_dns2").val();
	 	  var it = $("#ip_type").val();
	 	  var sn = $("#dev_sn").val();
	 	  var dy = $("#dev_type").val();
		  var duser = $("#dev_un").val();
		  var dpass = $("#dev_pw").val();
		  var dtype = $("#dev_mt").val();
		  var dtypa = $("#dev_at").val();
	 	  var etype = 1;
	      console.log( id + "-" + ip);
	      $.ajax({
            datatype : "json",
	        type: 'POST',
	        url: 'sp_device_update.php',
	        data: {
	        	etype: etype,
	            id: id,
	            ip: ip,
	            vl: vl,
	            sm: sm,
	            dn: dn,
	            dt: dt,
	            dg: dg,
	            d1: d1,
	            d2: d2,
	            it: it,
	            sn: sn,
	            dy: dy,
		    duser: duser,
		    dpass: dpass,
		    dtype: dtype,
		    dtypa: dtypa
	        },
	        success: function(data){
	            //var jsonData = JSON.parse(data);
	            //alert('ID: ' + jsonData.id + '\nIP: ' + jsonData.ip);
	            window.location.reload();
	        }
	      });
	    });
	} );

	$(document).on("change", '#dev_cat', function(e) {
		var devcat = $(this).val();

		$.ajax({
			type: "POST",
			data: {devcat: devcat},
			url: 'sp_devset.php',
			dataType: 'json',
			success: function(json) {
                                var $el = $("#dev_series");
                                $el.empty();
                                $el.append($("<option></option>")
                                        .attr("value", '').text('Device Series')
                                );

				var $el = $("#dev_fam");
				$el.empty();
				$el.append($("<option></option>")
					.attr("value", '').text('Device Family')
				);
				$.each(json, function(value, key) {
					$el.append($("<option></option>")
						.attr("value", value).text(key)
					);
				});
			}
		});
	});

        $(document).on("change", '#dev_fam', function(e) {
                var devfam = $(this).val();

                $.ajax({
                        type: "POST",
                        data: {devfam: devfam},
                        url: 'sp_devset.php',
                        dataType: 'json',
                        success: function(json) {
                                var $el = $("#dev_series");
                                $el.empty();
                                $el.append($("<option></option>")
                                        .attr("value", '').text('Device Series')
                                );
                                $.each(json, function(value, key) {
                                        $el.append($("<option></option>")
                                                .attr("value", value).text(key)
                                        );
                                });
                        }
                });
        });
        $(document).on("change", '#dev_pid', function(e) {
                var devpid = $(this).val();

                $.ajax({
                        type: "POST",
                        data: {devpid: devpid},
                        url: 'sp_devset.php',
                        dataType: 'json',
                        success: function(json) {
				UpdateDeviceLists(json);
/*
                                //var $el = $("#dev_pid_note");
				//newdata = JSON.stringify(json);
				//document.getElementById("dev_pid_note").innerHTML=newdata;
				//var newdata = JSON.parse(newdata);
				//var x = json.devcat.length;
				//alert(x);
				//for(i=0; i<newdata.devcat.length; i++) {
				//	alert(newdata.devcat[i]);
				//}
				if(json.length) {
					//Do nothing, no values returned
					document.getElementById("dev_pid_note").innerHTML="<font color='red'>No Match Found</font>";
				} else {
					document.getElementById("dev_pid_note").innerHTML="";
                                	var $el = $("#dev_cat");
                                	$el.empty();
                                	$el.append($("<option></option>")
                                	        .attr("value", '').text('Device Category')
                                	);
                                	$.each(json.devcat, function(value, key) {
						var key2 = key;
						if(key2.substring(0,1)=="*") {
							key2 = key2.substring(1);
							var optsel = " selected";
						} else {
							var optsel = "";
						}
                                	        $el.append($("<option" + optsel + "></option>")
                                	                .attr("value", value).text(key2)
                                	        );
                                	});

                                	var $el = $("#dev_fam");
                                	$el.empty();
                                	$el.append($("<option></option>")
                                	        .attr("value", '').text('Device Family')
                                	);
                                	$.each(json.devfam, function(value, key) {
                                               var key2 = key;
                                                if(key2.substring(0,1)=="*") {
                                                        key2 = key2.substring(1);
                                                        var optsel = " selected";
                                                } else {
                                                        var optsel = "";
                                                }
                                	        $el.append($("<option" + optsel + "></option>")
                                	                .attr("value", value).text(key2)
                                	        );
                                	});

                                	var $el = $("#dev_series");
                                	$el.empty();
                                	$el.append($("<option></option>")
                                	        .attr("value", '').text('Device Series')
                                	);
                                	$.each(json.devser, function(value, key) {
                                               var key2 = key;
                                                if(key2.substring(0,1)=="*") {
                                                        key2 = key2.substring(1);
                                                        var optsel = " selected";
                                                } else {
                                                        var optsel = "";
                                                }
                                	        $el.append($("<option" + optsel + "></option>")
                                	                .attr("value", value).text(key2)
                                	        );
                                	});
				}
*/
                        }
                });
        });

	function UpdateDeviceLists(json) {
        	if(json.length) {
                	//Do nothing, no values returned
                        document.getElementById("dev_pid_note").innerHTML="<font color='red'>No Match Found</font>";
                } else {
                        document.getElementById("dev_pid_note").innerHTML="";
                        var $el = $("#dev_cat");
                        $el.empty();
                       	$el.append($("<option></option>")
                        	.attr("value", '').text('Device Category')
                        );
                        $.each(json.devcat, function(value, key) {
                        	var key2 = key;
                                if(key2.substring(0,1)=="*") {
                                	key2 = key2.substring(1);
                                        var optsel = " selected";
                                } else {
                                        var optsel = "";
                                }
                                $el.append($("<option" + optsel + "></option>")
                                	.attr("value", value).text(key2)
                                );
                        });

                                        var $el = $("#dev_fam");
                                        $el.empty();
                                        $el.append($("<option></option>")
                                                .attr("value", '').text('Device Family')
                                        );
                                        $.each(json.devfam, function(value, key) {
                                               var key2 = key;
                                                if(key2.substring(0,1)=="*") {
                                                        key2 = key2.substring(1);
                                                        var optsel = " selected";
                                                } else {
                                                        var optsel = "";
                                                }
                                                $el.append($("<option" + optsel + "></option>")
                                                        .attr("value", value).text(key2)
                                                );
                                        });

                                        var $el = $("#dev_series");
                                        $el.empty();
                                        $el.append($("<option></option>")
                                                .attr("value", '').text('Device Series')
                                        );
                                        $.each(json.devser, function(value, key) {
                                               var key2 = key;
                                                if(key2.substring(0,1)=="*") {
                                                        key2 = key2.substring(1);
                                                        var optsel = " selected";
                                                } else {
                                                        var optsel = "";
                                                }
                                                $el.append($("<option" + optsel + "></option>")
                                                        .attr("value", value).text(key2)
                                                );
                                        });
				}
	}
    </script>
  </body>
</html>

<?php
function GetDeviceInfo($dbt,$dbs,$dbn,$dbu,$dbp,$did) {
	$str_pkid = "";
	$strSQL = "SELECT elements.*,elementports.description,typedevicemodel.description AS moddesc,devicetags.tag FROM elements LEFT JOIN elementports ON (elements.fkdgport = elementports.pkid) LEFT JOIN typedevicemodel ON (elements.refDeviceModel = typedevicemodel.ID) LEFT JOIN devicetags ON (elements.pkid = devicetags.fkelement) WHERE (elements.pkid = '" . CleanSQL($did) . "')";
	//echo "--$strSQL--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$devattr = do_db_result($dbt,$result,0,"");
		if($devattr["lantype"]==1) {
			$devattr["lantypedesc"] = "DHCP";
		} else if($devattr["lantype"]==2) {
			$devattr["lantypedesc"] = "Static IP";
		} else {
			$devattr["lantypedesc"] = "Unknown";
		}
		if($devattr["dgvlan"]==-1) {
			$devattr["dgvlandesc"] = "N/A, Routed Port";
		} else {
			$devattr["dgvlandesc"] = $devattr["dgvlan"];
		}
		if($devattr["dns"]=="") {
			$devattr["dnsdesc"] = "None";
		} else {
			$devattr["dnsdesc"] = $devattr["dns"];
		}
	} else {
		$devattr = array();
	}
	do_db_close($dbt,$conn);

	return $devattr;
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

function GetDeviceImage($dbt,$dbs,$dbn,$dbu,$dbp,$did) {
	$retval = "";
	$strSQL = "SELECT elements.pkid,typedevicemodel.imagename,typedevicemodelslot.toppx,typedevicemodelslot.leftpx,tdm2.imagename AS imagename2 FROM elements LEFT JOIN typedevicemodel ON (elements.refDeviceModel = typedevicemodel.ID) LEFT JOIN modules ON (elements.pkid = modules.fkelement) LEFT JOIN typedevicemodelslot ON (modules.refdevicemodelslot = typedevicemodelslot.ID) LEFT JOIN typedevicemodel AS tdm2 ON (modules.refDeviceModel = tdm2.ID) WHERE (elements.pkid = '" . CleanSQL($did) . "')";
	//echo "--$strSQL--\n";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	$retval .= "              <div style=\"position: relative; left: 0; top: 0;\">\n";
	for($x=0;$x<$num;$x++) {
		$imagename = do_db_result($dbt,$result,$x,"imagename");
		$imagename2 = do_db_result($dbt,$result,$x,"imagename2");
		$toppx = do_db_result($dbt,$result,$x,"toppx");
		$leftpx = do_db_result($dbt,$result,$x,"leftpx");
		//echo "--$x--$imagename--\n<br>";

		$retval .= "                <img src=\"./images/$imagename\" style=\"position: relative; top: 0; left: 0;\">\n";
		if($imagename2!="") {
			$retval .= "                <img src=\"./images/$imagename2\" style=\"position: absolute; top: " . $toppx . "px; left: " . $leftpx . "px;\">\n";
		}
	}
	$retval .= "              </div>\n";

	//$retval .= "              <div style=\"position: relative; left: 0; top: 0;\">\n";
	//$retval .= "                <img src=\"./images/CISCO2921.jpg\" style=\"position: relative; top: 0; left: 0;\">\n";
	//$retval .= "                <img src=\"./images/ucs-e160d-m2.jpg\" style=\"position: absolute; top: 70px; left: 3px;\">\n";
	//$retval .= "              </div>\n";

	return $retval;
}

function DoUpdateAction($dbt,$dbs,$dbn,$dbu,$dbp,$eid,$act) {
        if($act!="") {
                $colid = checkGetAndPost("coll");
                if($act=="add") {
                        $strSQL = "SELECT * FROM collectorelementmap WHERE (fkcollector = '$colid') AND (fkelement = '$eid')";
                        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
                        $arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
                        $num = $arr_result[0];
                        if($num==0) {
                                $strSQL = "INSERT INTO collectorelementmap (fkcollector,fkelement) VALUES ('$colid','$eid')";
                                $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
                        }
                        do_db_close($dbt,$conn);
                } else {
                        $strSQL = "DELETE FROM collectorelementmap WHERE (fkcollector = '$colid') AND (fkelement = '$eid')";
                        $conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
                        $result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
                        do_db_close($dbt,$conn);
                }
        }

        return 0;
}

?>
