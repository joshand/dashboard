<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css" />

<style>
.drag { width: 40px; height: 40px; border: 1px solid gray; }
.dbutton { width: 40px; height: 40px; border: 1px solid gray; }
.dblank { width: 20px; height: 40px; border: none; }
.dragged { width: 90px; height: 80px; border: none; }
#frame { height: 800px; border: black 1px solid;}

.origin-point {
    color: white; 
    font-weight: bold; 
    background-color: #06a; 
    text-align: center; 
    line-height: 15px; 
    height: 15px; 
    width: 15px; 
}

.drop-point {
    color: white; 
    font-weight: bold; 
    background-color: #f6a; 
    text-align: center; 
    line-height: 15px; 
    height: 15px; 
    width: 15px; 
}

#new-link-line {
    position: absolute;
    width: 3px;
    background-color: #06a;
    z-index: 100;
    -webkit-transform-origin: top left;
    -moz-transform-origin: top left;
    -o-transform-origin: top left;
    -ms-transform-origin: top left;
    transform-origin: top left;
}
.connected-link-line {
    position: absolute;
    width: 3px;
    background-color: #06a;
    z-index: 100;
    -webkit-transform-origin: top left;
    -moz-transform-origin: top left;
    -o-transform-origin: top left;
    -ms-transform-origin: top left;
    transform-origin: top left;
}
</style>

<?php /*
                    <div class="box box-solid box-default">
                      <div class="box-header with-border">
                        <h3 class="box-title">Contact Center</h3>
                        <div class="box-tools pull-right">
                          <!-- Buttons, labels, and many other things can be placed here! -->
                          <!-- Here is a label for example -->
                          <!--<span class="label label-primary">Label</span>-->
                        </div><!-- /.box-tools -->
                      </div><!-- /.box-header -->
                      <div class="box-body">
*/ ?>
<div id="noshow" style="display:none">
        <table>
                <tr>
                        <td>
                                <div id="hidden1" class="drag">
                                        <div class="box box-info" style="width:150px">
                                                <div class="box-header with-border">
                                                        <h3 class="box-title"><i class="fa fa-phone"></i>&nbsp;&nbsp;Inbound</h3>
                                                </div>
                                                <div class="box-body">
                                                        <div class="row">
                                                                <div class="col-md-12" data-tooltip="The number or extension that this script will answer on.">
                                                                  <input id="textbox" class="form-control" type="text" placeholder="Number or Extension">
                                                                </div>
                                                        </div>
                                                        <div class="row">
								<br>
                                                                <div class="col-md-4">&nbsp;</div>
								<div class="col-md-4"><div id="point0" class="origin-point">&nbsp;</div></div> 
                                                                <div class="col-md-4">&nbsp;</div>
                                                        </div>
                                                </div><!-- /.box-body -->
                                        </div><!-- /.box -->
                                </div>
                        </td>
                        <td>
                                <div id="hidden2" class="drag">
              				<div class="box box-success" style="width:400px">
                				<div class="box-header with-border">
							<div class="row">
							  <div class="col-md-6">
                  					    <h3 class="box-title"><i class="fa fa-list-ol"></i>&nbsp;&nbsp;Menu</h3>
							  </div>
							  <div class="col-xs-1"><div class="drop-point">&nbsp;</div></div>
							  <div class="col-md-4">&nbsp;</div>
							  <div class="col-xs-1">&nbsp;</div>
							</div>
                				</div>
                				<div class="box-body">
							<div class="row">
								<div class="col-md-12" data-tooltip="Enter the text for the prompt. The text will be converted to an audio prompt via Text-to-Speech.">
                  						  <input id="textbox" class="form-control" type="text" placeholder="Prompt Text">
								</div>
							</div>
							<div class="row">
                                                                <br>
                                                                <div class="col-xs-1"><div id="point1" class="origin-point">1</div></div>
								<div class="col-xs-1"><div id="point2" class="origin-point">2</div></div>      
                                                                <div class="col-xs-1"><div id="point3" class="origin-point">3</div></div>
                                                                <div class="col-xs-1"><div id="point4" class="origin-point">4</div></div>
                                                                <div class="col-xs-1"><div id="point5" class="origin-point">5</div></div>
                                                                <div class="col-xs-1"><div id="point6" class="origin-point">6</div></div>
                                                                <div class="col-xs-1"><div id="point7" class="origin-point">7</div></div>
                                                                <div class="col-xs-1"><div id="point8" class="origin-point">8</div></div>
                                                                <div class="col-xs-1"><div id="point9" class="origin-point">9</div></div>
                                                                <div class="col-xs-1"><div id="point10" class="origin-point">*</div></div>
                                                                <div class="col-xs-1"><div id="point0" class="origin-point">0</div></div>
                                                                <div class="col-xs-1"><div id="point11" class="origin-point">#</div></div>
							</div>
                				</div><!-- /.box-body -->
              				</div><!-- /.box -->
                                </div>
                        </td>
                        <td>
                                <div id="hidden3" class="drag">
                                        <div class="box box-primary" style="width:300px">
                                                <div class="box-header with-border">
                                                        <div class="row">
                                                          <div class="col-md-5">
							    <h3 class="box-title"><i class="glyphicon glyphicon-volume-up"></i>&nbsp;Prompt</h3>
                                                          </div>
                                                          <div class="col-md-4"><div class="drop-point">&nbsp;</div></div>
                                                          <div class="col-md-3">&nbsp;</div>
                                                        </div>
                                                </div>
                                                <div class="box-body">
                                                        <div class="row">
                                                                <div class="col-md-12" data-tooltip="Enter the text for the prompt. The text will be converted to an audio prompt via Text-to-Speech.">
                                                                  <input id="textbox" class="form-control" type="text" placeholder="Prompt Text">
                                                                </div>
                                                        </div>
                                                </div><!-- /.box-body -->
                                        </div><!-- /.box -->
                                </div>
                        </td>
                        <td>
                                <div id="hidden4" class="drag">
                                        <div class="box box-warning" style="width:150px">
                                                <div class="box-header with-border">
                                                        <div class="row">
                                                          <div class="col-md-9">
							    <h3 class="box-title"><i class="fa fa-mail-forward"></i>&nbsp;&nbsp;Transfer</h3>
                                                          </div>
                                                          <div class="col-md-1"><div class="drop-point">&nbsp;</div></div>
                                                        </div>
                                                </div>
                                                <div class="box-body">
                                                        <div class="row">
                                                                <div class="col-md-12" data-tooltip="Extension or Number to Transfer to.">
                                                                  <input id="textbox" class="form-control" type="text" placeholder="Number">
                                                                </div>
                                                        </div>
                                                </div><!-- /.box-body -->
                                        </div><!-- /.box -->
                                </div>
                        </td>
                        <td>
                                <div id="hidden5" class="drag">
                                        <div class="box box-warning" style="width:225px">
                                                <div class="box-header with-border">
                                                        <div class="row">
                                                          <div class="col-md-9">
                                                            <h3 class="box-title"><i class="glyphicon glyphicon-th"></i>&nbsp;Extension Dial</h3>
                                                          </div>
                                                          <div class="col-md-1"><div class="drop-point">&nbsp;</div></div>
                                                        </div>
                                                </div>
                                                <div class="box-body">
                                                        <div class="row">
                                                                <div class="col-md-12" data-tooltip="Enter the text for the prompt. The text will be converted to an audio prompt via Text-to-Speech.">
                                                                  <input id="textbox" class="form-control" type="text" placeholder="Prompt Text">
                                                                </div>
                                                        </div>
                                                </div><!-- /.box-body -->
                                        </div><!-- /.box -->
                                </div>
                        </td>
                </tr>
        </table>
</div>

<input type="text" name="scriptpkid" id="scriptpkid" style="display:none">

<div id="storage">
	<table>
		<tr>
                        <td>
                                <div id="new" class="dbutton" data-tooltip="New">
                                        <i class="fa fa-sticky-note-o"></i>
                                </div>
                        </td>
                        <td>
                                <div id="load" class="dbutton" data-tooltip="Open">
                                        <i class="fa fa-folder-open-o"></i>
                                </div>
                        </td>
                        <td>
                                <div id="save" class="dbutton" data-tooltip="Save">
                                        <i class="fa fa-save"></i>
                                </div>
                        </td>
                        <td>
                                <div id="deploy" class="dbutton" data-tooltip="Deploy">
                                        <i class="glyphicon glyphicon-log-in"></i>
                                </div>
                        </td>
                        <td>
                                <div class="dblank">
                                        &nbsp;
                                </div>
                        </td>
			<td>
				<div id="drag1" class="drag">
					<i class="fa fa-phone"></i>
				</div>
			</td>
			<td>
				<div id="drag2" class="drag">
					<i class="fa fa-list-ol"></i>
				</div>
			</td>
			<td>
				<div id="drag3" class="drag">
					<i class="glyphicon glyphicon-volume-up"></i>
				</div>
			</td>
                        <td>
                                <div id="drag4" class="drag">
                                        <i class="fa fa-mail-forward"></i>
                                </div>
                        </td>
			<td>
				<div id="drag5" class="drag">
					<i class="glyphicon glyphicon-th"></i>
				</div>
			</td>
		</tr>
	</table>
</div>
<br style="clear:both">
<div id="frame">
        <p>&nbsp;</p>
</div>

<?php /*
		</div>
	      </div>
*/ ?>

        <!-- Save Modal -->
        <div class="modal fade" id="easyccxmodalsave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                        <div class="modal-content">
                                <form role="form">
                                        <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Save Script</h4>
                                        </div>
                                        <div class="modal-body">
                                                <div class="form-group">
                                                        <label>Description</label>
                                                        <input type="text" class="form-control" placeholder="Description" value="" name="easyccxdesc" id="easyccxdesc">
                                                </div>
                                        </div>
                                        <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal" id='easyccxsavebtn'>Save</button>
                                        </div>
                                </form>
                        </div>
                </div>
        </div>

