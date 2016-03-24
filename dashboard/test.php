<?php
include 'config.inc';
include '../library/common.inc';

//$ret = DoGet($url,"");

//$msg = getCUCMSQLmsg("SELECT * FROM device WHERE Name LIKE 'SEP%'","11.0");
//$req = DoPost("https://10.94.238.25:8443/axl/",$msg,"","CUCM:DB ver=11.0","axlctiadmin:4xlct14dm1n","0");
$msg = getCUCMPhonemsg("11.0");
$req = DoPost("https://10.94.238.25:8443/axl/",$msg,"","CUCM:DB ver=11.0 listPhone","axlctiadmin:4xlct14dm1n","0");

$dcount = 0;
do {
	$dcount++;
	$device = getXmlValueByTag($req,"name","",$dcount);
	if($device!="") {
		$model = getXmlValueByTag($req,"model","",$dcount);
		$lname = getXmlValueByTag($req,"locationName","",$dcount);
		echo "--$dcount--$device--$model--$lname--\n<br>";
	}
} while ($device!="");

echo "<hr>";
echo str_replace(">","&gt;",str_replace("<","&lt;",$req));

function getCIMCAuthmsg($struser,$strpass) {
	$retmsg = "<aaaLogin inName=\"$struser\" inPassword=\"$strpass\"></aaaLogin>";

	return $retmsg;
}

function getCIMCFaultmsg($authcookie) {
	$retmsg = "<configResolveClass cookie='$authcookie' classId='faultInst' inHierarchical='true'></configResolveClass>";

	return $retmsg;
}

function getVMWareHelloMessage($user,$pass,$sesmgr) {
	$msg = "";
	$msg .= "<soap:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n";
	$msg .= "  <soap:Body>\n";
	$msg .= "    <Login xmlns=\"urn:internalvim25\">\n";
	$msg .= "      <_this xsi:type=\"SessionManager\" type=\"SessionManager\" serverGuid=\"\">$sesmgr</_this>\n";
	$msg .= "      <userName>$user</userName>\n";
	$msg .= "      <password>$pass</password>\n";
	$msg .= "      <locale>en_US</locale>\n";
	$msg .= "    </Login>\n";
	$msg .= "  </soap:Body>\n";
	$msg .= "</soap:Envelope>\n";

	return $msg;
}

function extractVMwareCookie($resp) {
	// get cookie
	// multi-cookie variant contributed by @Combuster in comments
	preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $resp, $matches);
	$cookies = array();
	foreach($matches[1] as $item) {
	    parse_str($item, $cookie);
	    $cookies = array_merge($cookies, $cookie);
	}

	//return $cookies;
	if(isset($cookies["vmware_soap_session"])) {
		return "vmware_soap_session=".$cookies["vmware_soap_session"];
	} else {
		return "";
	}
}

function getVMwareInfo($propcol,$propsettype,$objsettype,$objsetid,$pathset,$inclselect) {
	$msg = "";
	$msg .= "<soap:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">";
	$msg .= "  <soap:Body>";
	$msg .= "    <RetrievePropertiesEx xmlns=\"urn:internalvim25\">";
	$msg .= "      <_this type=\"PropertyCollector\">$propcol</_this>";
	$msg .= "        <specSet>";
	$msg .= "          <propSet>";
	$msg .= "            <type>$propsettype</type>";
	if($pathset=="") {
		$msg .= "            <all>true</all>";
	} else {
		$msg .= "            <all>false</all>";
		$msg .= "              <pathSet>$pathset</pathSet>";
	}
	$msg .= "          </propSet>";
	$msg .= "          <objectSet>";
	$msg .= "            <obj type=\"$objsettype\">".$objsetid."</obj>";
	if($inclselect==1) {
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>folderTraversalSpec</name>";
		$msg .= "              <type>Folder</type>";
		$msg .= "              <path>childEntity</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>folderTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>datacenterHostTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>datacenterVmTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>datacenterDatastoreTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>datacenterNetworkTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>computeResourceRpTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>computeResourceHostTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>hostVmTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>resourcePoolVmTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>datacenterDatastoreTraversalSpec</name>";
		$msg .= "              <type>Datacenter</type>";
		$msg .= "              <path>datastoreFolder</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>folderTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>datacenterNetworkTraversalSpec</name>";
		$msg .= "              <type>Datacenter</type>";
		$msg .= "              <path>networkFolder</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>folderTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>datacenterVmTraversalSpec</name>";
		$msg .= "              <type>Datacenter</type>";
		$msg .= "              <path>vmFolder</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>folderTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>datacenterHostTraversalSpec</name>";
		$msg .= "              <type>Datacenter</type>";
		$msg .= "              <path>hostFolder</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>folderTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>computeResourceHostTraversalSpec</name>";
		$msg .= "              <type>ComputeResource</type>";
		$msg .= "              <path>host</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>computeResourceRpTraversalSpec</name>";
		$msg .= "              <type>ComputeResource</type>";
		$msg .= "              <path>resourcePool</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>resourcePoolTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>resourcePoolVmTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>resourcePoolTraversalSpec</name>";
		$msg .= "              <type>ResourcePool</type>";
		$msg .= "              <path>resourcePool</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>resourcePoolTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>resourcePoolVmTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>hostVmTraversalSpec</name>";
		$msg .= "              <type>HostSystem</type>";
		$msg .= "              <path>vm</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "              <selectSet>";
		$msg .= "                <name>folderTraversalSpec</name>";
		$msg .= "              </selectSet>";
		$msg .= "            </selectSet>";
		$msg .= "            <selectSet xsi:type=\"TraversalSpec\">";
		$msg .= "              <name>resourcePoolVmTraversalSpec</name>";
		$msg .= "              <type>ResourcePool</type>";
		$msg .= "              <path>vm</path>";
		$msg .= "              <skip>false</skip>";
		$msg .= "            </selectSet>";
	}
	$msg .= "          </objectSet>";
	$msg .= "        </specSet>";
	$msg .= "        <options>";
	$msg .= "        </options>";
	$msg .= "    </RetrievePropertiesEx>";
	$msg .= "  </soap:Body>";
	$msg .= "</soap:Envelope>";
		
	return $msg;
}

function getCUCMSQLmsg($strSQL,$strVer) {
	$retmsg = "";
	$retmsg .= "<SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\">\n";
	$retmsg .= "<SOAP-ENV:Body>\n";
	$retmsg .= "<axlapi:executeSQLQuery sequence=\"1\" xmlns:axlapi=\"http://www.cisco.com/AXL/API/$strVer\" xmlns:axl=\"http://www.cisco.com/AXL/API/$strVer\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.cisco.com/AXL/API/$strVer axlsoap.xsd\">\n";
	$retmsg .= "<sql>$strSQL</sql>\n";
	$retmsg .= "</axlapi:executeSQLQuery>\n";
	$retmsg .= "</SOAP-ENV:Body>\n";
	$retmsg .= "</SOAP-ENV:Envelope>\n";

	return $retmsg;
}

function getCUCMRIS($strclass,$strstatus,$strname) {
	//$strclass = Any,Phone,Gateway,H323,Cti,VoiceMail,MediaResources,SIPTrunk,HuntList,Unknown
	//$strstatus = Any,Registered,UnRegistered,Rejected,PartiallyRegistered,Unknown
	//$strname = *
	//select by = Name,IPV4Address,IPV6Address,DirNumber,Description
	$retmsg = "";
	$retmsg .= "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
	$retmsg .= "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n";
	$retmsg .= "<soapenv:Body>\n";
	$retmsg .= "<ns1:SelectCmDevice soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns1=\"http://schemas.cisco.com/ast/soap/\">\n";
	$retmsg .= "<CmSelectionCriteria href=\"#id0\"/>\n";
	$retmsg .= "</ns1:SelectCmDevice>\n";
	$retmsg .= "<multiRef xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"http://schemas.cisco.com/ast/soap/\" id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CmSelectionCriteria\">\n";
	$retmsg .= "<MaxReturnedDevices xsi:type=\"xsd:unsignedInt\">1000</MaxReturnedDevices>\n";
	$retmsg .= "<Class xsi:type=\"xsd:string\">$strclass</Class>\n";
	$retmsg .= "<Model xsi:type=\"xsd:unsignedInt\">255</Model>\n";
	$retmsg .= "<Status xsi:type=\"xsd:string\">$strstatus</Status>\n";
	$retmsg .= "<NodeName xsi:type=\"xsd:string\" xsi:nil=\"true\"/>\n";
	$retmsg .= "<SelectBy xsi:type=\"xsd:string\">Name</SelectBy>\n";
	$retmsg .= "<SelectItems soapenc:arrayType=\"ns2:SelectItem[1]\" xsi:type=\"soapenc:Array\">\n";
	$retmsg .= "<item><Item>$strname</Item></item>\n";
	$retmsg .= "</SelectItems>\n";
	$retmsg .= "</multiRef>\n";
	$retmsg .= "</soapenv:Body>\n";
	$retmsg .= "</soapenv:Envelope>\n";

	return $retmsg;
}

function getCUCMPhonemsg($strVer) {
	$retmsg = "";
	$retmsg .= "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns=\"http://www.cisco.com/AXL/API/$strVer\">\n";
	$retmsg .= "<soapenv:Body>\n";
    $retmsg .= "  <ns:listPhone sequence=\"1\">\n";
    $retmsg .= "     <searchCriteria>\n";
    $retmsg .= "           <name>SEP%</name>\n";
    $retmsg .= "      </searchCriteria>\n";
    $retmsg .= "      <returnedTags>\n";
    $retmsg .= "           <name/>\n";
    $retmsg .= "           <model/>\n";
    $retmsg .= "           <locationName/>\n";
    $retmsg .= "      </returnedTags>\n";
    $retmsg .= "  </ns:listPhone>\n";
	$retmsg .= "</soapenv:Body>\n";
	$retmsg .= "</soapenv:Envelope>\n";

	return $retmsg;

}

function getCUCMSvcmsg() {
	$retmsg = "";
	$retmsg .= "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:soap=\"http://schemas.cisco.com/ast/soap\">\n";
	$retmsg .= "   <soapenv:Header/>\n";
	$retmsg .= "   <soapenv:Body>\n";
	$retmsg .= "      <soap:soapGetStaticServiceList>\n";
	$retmsg .= "         <soap:ServiceInformationResponse>test</soap:ServiceInformationResponse>\n";
	$retmsg .= "      </soap:soapGetStaticServiceList>\n";
	$retmsg .= "   </soapenv:Body>\n";
	$retmsg .= "</soapenv:Envelope>\n";

	return $retmsg;
}

function getCUCMSvcStatmsg($svcname) {
	$retmsg = "";
	$retmsg .= "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
	$retmsg .= "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:soap=\"http://schemas.cisco.com/ast/soap\">\n";
	$retmsg .= "   <soapenv:Header/>\n";
	$retmsg .= "   <soapenv:Body>\n";
	$retmsg .= "      <soap:soapGetServiceStatus>\n";
	if(strpos($svcname,"~")===false) {
		$retmsg .= "         <soap:ServiceStatus>$svcname</soap:ServiceStatus>\n";
	} else {
		$arrmsg = explode("~",$svcname);
		for($x=0;$x<count($arrmsg);$x++) {
			$retmsg .= "         <soap:ServiceStatus>" . $arrmsg[$x] . "</soap:ServiceStatus>\n";
		}
	}
	$retmsg .= "      </soap:soapGetServiceStatus>\n";
	$retmsg .= "   </soapenv:Body>\n";
	$retmsg .= "</soapenv:Envelope>\n";

	return $retmsg;
}

function getCUCMFilemsg($fn) {
	$retmsg = "";
	$retmsg .= "<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:soap=\"http://schemas.cisco.com/ast/soap/\">\n";
	$retmsg .= "   <soapenv:Header/>\n";
	$retmsg .= "   <soapenv:Body>\n";
	$retmsg .= "      <soap:GetOneFile soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">\n";
	$retmsg .= "         <FileName>$fn</FileName>\n";
	$retmsg .= "      </soap:GetOneFile>\n";
	$retmsg .= "   </soapenv:Body>\n";
	$retmsg .= "</soapenv:Envelope>\n";

	return $retmsg;
}

function parseCUCMSyslog($syslog,$nodeid) {
	$arr_req = explode("%UC_RTMT-2-RTMT_ALERT",$syslog);
	//echo "~~" . count($arr_req) . "~~";
	$errcount = 0;
	$applist = "";
	$retlist = "";
	for($x=count($arr_req)-1;$x>=0;$x--) {
		//echo "==$x==";
		$str_eloc = strpos($arr_req[$x],"RTMT Alert");
		if($str_eloc===false) {
			//echo "--$str_eloc--NA--";
			$err_str = "";
			break;
		} else {
			$err_str = substr($arr_req[$x],0,$str_eloc);
			//echo "--$str_eloc--$err_str--<br>";
			$errcount++;

			$arr_err_str = explode("][",$err_str);
			//echo "--" . $arr_err_str[1] . "--<br>";

			$arr2_err_str = explode("#012",$arr_err_str[1]);

			$isnode = 1;
			$str_nodid = "";
			$str_msgst = "";
			$str_appid = "";
			$str_clsid = "";
			$str_tstmp = "";
			$str_sevmt = "";
			$str_mtevt = "";
			$str_aldet = "";
			for($y=0;$y<count($arr2_err_str);$y++) {
				//echo "--$y--" . $arr2_err_str[$y] . "--";
				$arr_fldval_pair = explode(":",$arr2_err_str[$y]);

				if(trim($arr_fldval_pair[0])=="NodeID") {
					$str_nodid = trim($arr_fldval_pair[1]);
					if(strtoupper($str_nodid)!=strtoupper($nodeid)) {
						$isnode = 0;
					}
				} else if(trim($arr_fldval_pair[0])=="MessageString") {
					$str_msgst = trim(str_replace("MessageString :","",$arr2_err_str[$y]));
				} else if(trim($arr_fldval_pair[0])=="AppID") {
					$str_appid = trim(str_replace("AppID :","",$arr2_err_str[$y]));
				} else if(trim($arr_fldval_pair[0])=="ClusterID") {
					$str_clsid = trim(str_replace("ClusterID :","",$arr2_err_str[$y]));
				} else if(trim($arr_fldval_pair[0])=="TimeStamp") {
					$str_tstmp = trim(str_replace("TimeStamp :","",$arr2_err_str[$y]));
				} else if(trim($arr_fldval_pair[0])=="SeverityMatch") {
					$str_sevmt = trim(str_replace("SeverityMatch :","",$arr2_err_str[$y]));
				} else if(trim($arr_fldval_pair[0])=="MatchedEvent") {
					$str_mtevt .= "{" . trim(str_replace("MatchedEvent :","",$arr2_err_str[$y])) . "}";
				} else if($y==0) {
					$str_aldet = trim(str_replace("AlertDetail=","",$arr2_err_str[$y]));
				}
				//echo "~~" . $arr_fldval_pair[0] . "~~" . $arr2_err_str[$y] . "~~<br>";
			}
			//echo "<br>";
			if($str_msgst=="") {
				if(strpos($str_aldet,"SyslogSeverityMatchFound")===false) {
					//do nothing
				} else {
					$str_aldet = "SyslogSeverityMatchFound";
				}
				$str_msgst = $str_aldet;
				$str_msgst_ext = $str_aldet . " " . $str_mtevt;
			} else {
				$str_msgst_ext = $str_msgst . " {" . $str_aldet . "}";
			}

			if($isnode==1) {
				if(strpos($applist,"~$str_appid~")===false) {
					$applist .= "~$str_appid~";
					//echo "--$isnode--$str_nodid--$str_appid--$str_msgst--$str_tstmp--$applist--<br>";
					$retlist .= $str_appid . " ($str_msgst @ $str_tstmp) \n";
				} else {
					//ignore, similar error already shown.
				}
			}
			//echo "[" . $arr_err_str[1] . "]<br>";
		}
	}

	return $retlist;
}
?>
