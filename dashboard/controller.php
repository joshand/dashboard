<?php
include 'config.inc';
include './library/common.inc';
include 'header.inc';

$thisid = checkGetAndPost("id");
$arr_devinfo = GetControllerInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$thisid);

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
            <li><a href="controllers.php">Controllers</a></li>
            <li class="active"><?php echo $arr_devinfo[13] ?></li>
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">

          <!-- Your Page Content Here -->
		<div class="box box-solid box-default">
		  <div class="box-header with-border">
		    <h3 class="box-title">Configuration<font size='-2'>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#configbox">Edit Configuration</a></font></h3>

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
                    <input type="hidden" value="<?php echo $arr_devinfo[14]; ?>" name="device_id" id="device_id">
                    <div class="form-group">
                      <label>Device Name</label>
                      <input type="text" class="form-control" placeholder="Device Name" value="<?php echo $arr_devinfo[13]; ?>" name="dev_name" id="dev_name">
                    </div>
                    <div class="form-group">
                      <label>Device Type</label>
                      <select class="form-control" name="dev_type" id="dev_type">
                      	<?php echo GetOptionDropdown($dbtype,$dbserver,$dbname,$dbun,$dbpw,"typedevicemodel", "ID", "Description", $arr_devinfo[20]); ?>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>Tags</label>
                      <input type="text" class="form-control" placeholder="Tags" value="<?php echo $arr_devinfo[3]; ?>" name="dev_tags" id="dev_tags">
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
              <dt>MAC Address:</dt>
              <dd><?php echo $arr_devinfo[0]; ?></dd>
              <dt>Serial Number:</dt>
              <dd><?php echo $arr_devinfo[1] . " <font color='gray'>(" . $arr_devinfo[2] . ")</font>"; ?></dd>
*/
?>
              <dt>Model:</dt>
              <dd><?php echo $arr_devinfo[2]; ?></dd>
              <dt>Tags:</dt>
              <dd><?php echo $arr_devinfo[3]; ?></dd>
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
              <dt>LAN IP:</dt>
              <dd><?php echo $arr_devinfo[4] . "&nbsp;&nbsp;&nbsp;(<a href=\"#\"  data-toggle=\"modal\" data-target=\"#myModal\">set IP address</a>)"; ?>

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
                    <input type="hidden" value="<?php echo $arr_devinfo[14]; ?>" name="device_id" id="device_id">
                    <div class="form-group">
                      <label>IP Address</label>
                      <input type="text" class="form-control" placeholder="IP Address" value="<?php echo $arr_devinfo[4]; ?>" name="ip_address" id="ip_address">
                    </div>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			          <button type="button" class="btn btn-primary" data-dismiss="modal" id='savebutton'>Save changes</button>
			        </div>
                    </form>
			      </div>
			    </div>
			  </div>

			  </dd>
<?php
/*
              <dt>LAN IP:</dt>
              <dd><?php echo $arr_devinfo[4] . " <font color='gray'>(via " . $arr_devinfo[5] . ")</font>&nbsp;&nbsp;&nbsp;(set IP address)"; ?></dd>
              <dd><?php echo "<font color='gray'>Gateway: " . $arr_devinfo[6] . "; Port: " . $arr_devinfo[7] . "; VLAN: " . $arr_devinfo[8] . "; DNS: " . $arr_devinfo[9] . "</font>"; ?></dd>
              <dt>Public IP:</dt>
              <dd><?php echo $arr_devinfo[10] . " <font color='gray'>(" . $arr_devinfo[11] . ")</font>"; ?></dd>
              <dt>Topology:</dt>
              <dd>&nbsp;</dd>
              <dt>RSTP root:</dt>
              <dd>&nbsp;</dd>
              <dt>PoE:</dt>
              <dd>&nbsp;</dd>
              <dt>History:</dt>
              <dd>&nbsp;</dd>
              <dt>Configuration Status:</dt>
              <dd>&nbsp;</dd>
              <dt>Current Firmware:</dt>
              <dd><?php echo $arr_devinfo[12]; ?></dd>
*/
?>
            </dl>
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
	    
	    $('#device tbody').on('click', 'tr', function () {
			var name = table.row( this ).data();
			//alert(name[0]);
			window.location.replace('#' + name[0]);
	    } );

    	$("#savebutton").click(function(){
	 	  var ip = $("#ip_address").val();
	 	  var id = $("#device_id").val();
	 	  var etype = 2;
	      console.log( id + "-" + ip);
	      $.ajax({
            datatype : "json",
	        type: 'POST',
	        url: 'sp_device_update.php',
	        data: {
	        	etype: etype,
	            id: id,
	            ip: ip
	        },
	        success: function(data){
	            var jsonData = JSON.parse(data);
	            //alert('ID: ' + jsonData.id + '\nIP: ' + jsonData.ip);
	            window.location.reload();
	        }
	      });
	    });
	} );
    </script>
  </body>
</html>

<?php
function GetControllerInfo($dbt,$dbs,$dbn,$dbu,$dbp,$did) {
	$str_pkid = "";
	$strSQL = "SELECT controllers.*,typedevicemodel.description AS moddesc,devicetags.tag FROM controllers LEFT JOIN typedevicemodel ON (controllers.refDeviceModel = typedevicemodel.ID) LEFT JOIN devicetags ON (controllers.pkid = devicetags.fkelement) WHERE (controllers.pkid = '" . CleanSQL($did) . "')";
	//echo "--$strSQL--";

	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$arr_result = do_db_query($conn,$strSQL,1,$dbt,$dbs,$dbn,$dbu,$dbp);
	$result = $arr_result[1];
	$num = $arr_result[0];
	if($num>0) {
		$devnam = do_db_result($dbt,$result,0,"name");
		//$devmac = do_db_result($dbt,$result,0,"macaddress");
		//$devsnm = do_db_result($dbt,$result,0,"serialnum");
		$devmod = do_db_result($dbt,$result,0,"moddesc");
		$devmid = do_db_result($dbt,$result,0,"refDeviceModel");
		$devtag = do_db_result($dbt,$result,0,"tag");
		$devlip = do_db_result($dbt,$result,0,"lanip");
		//$devlti = do_db_result($dbt,$result,0,"lantype");		//1=DHCP, 2=Static IP
		//if($devlti=="1") { $devlty = "DHCP"; } else { $devlty = "Static IP"; }
		//$devldg = do_db_result($dbt,$result,0,"dg");
		//$devprt = do_db_result($dbt,$result,0,"description");
		//$devvln = do_db_result($dbt,$result,0,"dgvlan");		//-1 = Routed Port
		//if($devvln=="-1") {
		//	$devvln = "N/A, Routed Port";
		//	$devvll = "";
		//} else {
		//	$devvll = $devvln;
		//}
		//$devpnd = do_db_result($dbt,$result,0,"dns");
		//if($devpnd=="") { $devdns = "None"; } else { $devdns = $devpnd; }
		//$devwip = do_db_result($dbt,$result,0,"wanip");
		//$devwnm = do_db_result($dbt,$result,0,"wanfqdn");
		//$devfmw = do_db_result($dbt,$result,0,"firmware");
		$devpkd = do_db_result($dbt,$result,0,"pkid");
		//$devsnd = do_db_result($dbt,$result,0,"dns2");
		//$devmsk = do_db_result($dbt,$result,0,"subnetmask");
	}
	do_db_close($dbt,$conn);

	return explode("~", "~~$devmod~$devtag~$devlip~~~~~~~~~$devnam~$devpkd~devsnd~devmsk~~~~$devmid");
}

function GetOptionDropdown($dbt,$dbs,$dbn,$dbu,$dbp,$sqltable,$sqlidfield,$sqldisplayfield,$currentvalue) {
	$retval = "";
	$strSQL = "SELECT $sqlidfield,$sqldisplayfield FROM $sqltable";
	echo "--$currentvalue--";

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

function junk() {
	$reqmsg = createHelloMessage($sun,$spw);
	$retval = sendRequest($sip.":".$sprt,$reqmsg,"");

	$retcookie = extractCookie($retval);

	$reqmsg = GetTaskStatus($tid);
	$retval = sendRequest($sip.":".$sprt,$reqmsg,$retcookie);
}
?>
