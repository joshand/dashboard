<?php
require('../../library/tropo-webapi-php-master/tropo.class.php');
include '../../library/common2.inc';
include '../config.inc';

$debug = checkGetAndPost("debug");

$ret = DoTropo($dbtype,$dbserver,$dbname,$dbun,$dbpw,$debug);

function DoTropo($dbt,$dbs,$dbn,$dbu,$dbp,$deb) {
	//$tnum = "+19138379999";
	$tnum = "sip:9300@ec2-52-27-156-220.us-west-2.compute.amazonaws.com:19999";
	$options = array();
	if($deb!=1) {
		$tropo = new Tropo();
		$tropo->say("Transferring you now, please wait");
		$tropo->transfer($tnum,$options);
		$tropo->RenderJson();
	} else {
		echo "--$tnum--";
	}
}
?>
