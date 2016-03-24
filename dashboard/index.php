<?php
include 'header.inc';

//handle tenant change. should be reworked completely to not call index. ideally use ajax call to handle server side, then refresh the page (or redirect)
$newtenant = checkGetAndPost("tenant");
if($newtenant!="") {
	SetTenant($dbtype,$dbserver,$dbname,$dbun,$dbpw,$newtenant,$arr_userinfo);
	redirect("./index.php");
}

function SetTenant($dbt,$dbs,$dbn,$dbu,$dbp,$tid,$arr_ui) {
	$strSQL = "UPDATE user SET currenttenant = '$tid' WHERE pkid = '" . $arr_ui[4] . "'";
	//echo "----------$strSQL---";
	$conn = do_db_connect($dbt,$dbs,$dbn,$dbu,$dbp);
	$result = do_db_query($conn,$strSQL,0,$dbt,$dbs,$dbn,$dbu,$dbp);
	do_db_close($dbt,$conn);
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
            <li class="active"><i class="fa fa-dashboard"></i> Home</li>
            <!-- nothing -->
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">

          <!-- Your Page Content Here -->

        </section><!-- /.content -->
  
<?php
include 'footer.inc';
?>