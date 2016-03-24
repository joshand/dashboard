<?php
include 'config.inc';
include 'minheader.inc';

$thisip = checkGetAndPost("ip");
$thisport = checkGetAndPost("port");

if($thisip!="") {
	echo "<html><body>Connecting to $thisip on port $thisport...</body></html>";
} else {
	echo "<html><body>Setting up connection; please wait...</body></html>";
}
?>
