<?php
include 'config.inc';
include 'minheader.inc';

$thisip = checkGetAndPost("ip");
$thistype = checkGetAndPost("type");
$arr_thistype = explode(":",$thistype);
if(count($arr_thistype)>1) {
	$thistype = $arr_thistype[0];
	$thisport = $arr_thistype[1];
	$thisip = "172.17.42.1";			//if a port is stored, assume it's a serial console using ser2net
} else {
        if($thistype=="telnet") {
                $thisport = "23";
        } else if($thistype=="ssh") {
                $thisport = "22";
        } else if($thistype=="http") {
                $thisport = "80";
        } else if($thistype=="https") {
                $thisport = "443";
        }
}

if(($thistype=="telnet") || ($thistype=="ssh")) {
        $thismode = 1;
} else {
        $thismode = 2;
}

//$arr_devinfo = GetDeviceInfo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$thisid);
?>

<body>
  <div id="gateone"></div><iframe src="./connecting.php" id="frame" width="100%" height="100%" frameborder="0"></iframe>
</body>

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
    <!-- GateOne -->
    <script src="https://<?php echo $dbspub; ?>:8443/static/gateone.js"></script>
    <!-- page script -->
    <script>
	var timeout = 1;
	var conntimeout = 16000;
	var srcip = "173.37.200.6";
	var jsondata = {"remotehost":"<?php echo $thisip; ?>","remoteport":<?php echo $thisport; ?>,"timeout":timeout,"sourceip":srcip};
	$.ajax({
		url: "http://connect.greenlightcontrol.com/api/v1/createtunnel/",
		type: "post",
		data: JSON.stringify(jsondata),
		headers: {
			Authorization: "Token 96c10f6c4f100220de346b78d257e82474c3a3fb",
			"Content-Type": "application/json"
		},
		dataType: "json",
		success: function(data) {
			var strmode = "<?php echo $thismode; ?>";
			var strdata = JSON.stringify(data);
			var strdata = JSON.parse(strdata);
			//alert(strdata);
			var strport = strdata.port;
			var strsvr = strdata.server; 
	  		//alert( "success\n"+strport+"\n"+strsvr );
			var iframe = $('#frame');
			iframe.attr("src","./connecting.php?ip=" + strsvr + "&port=" + strport);
                        if(strmode=="1") {
                                var newurl = "https://<?php echo $dbspub; ?>:8443/?ssh=<?php echo $thistype; ?>://admin@"+strsvr+":"+strport+"&ssh_once=true";
	                        setTimeout(function(){ LoadIFrame(newurl); }, conntimeout);
                        } else {
                                var newurl = "<?php echo $thistype; ?>://"+strsvr+":"+strport;
	                        setTimeout(function(){ DoRedirect(newurl); }, conntimeout);
                        }
			//setTimeout(function(){ LoadIFrame(newurl); }, conntimeout);
			//iframe.attr("src",newurl);
			//alert(newurl);
		}
	})
   
	function LoadIFrame(ifurl) {
		window.location.replace(ifurl);
		//not always working
		//var iframe = $('#frame');
		//iframe.attr("src",ifurl);
		//can't get this to work
		//GateOne.init({url: ifurl});
	}

	function DoRedirect(ifurl) {
		window.location.replace(ifurl);
	}
    </script>
  </body>
</html>
