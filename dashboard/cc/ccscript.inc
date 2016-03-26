var style = document.createElement('style');
document.head.appendChild(style);

var matchingElements = [];
var allElements = document.getElementsByTagName('*');
for (var i = 0, n = allElements.length; i < n; i++) {
    var attr = allElements[i].getAttribute('data-tooltip');
    if (attr) {
        allElements[i].addEventListener('mouseover', hoverEvent);
    }
}

function hoverEvent(event) {
    event.preventDefault();
    x = event.x - this.offsetLeft;
    y = event.y - this.offsetTop;
    // Make it hang below the cursor a bit.
    y += 10;

    style.innerHTML = '*[data-tooltip]::after { left: ' + x + 'px; top: ' + y + 'px  }'
}

    //Counter
    counter = 0;
    ocounter = 0;
    dcounter = 0;
    lcounter = 0;
    var connectors = new Array();
    scounter = 0;
    var steps = new Array();
    //Make element draggable
    $(".drag").draggable({
        helper: 'clone',
        containment: 'frame',
        //When first dragged
        stop: function (ev, ui) {
            var pos = $(ui.helper).offset();
            objName = "#clonediv" + counter
            $(objName).css({
                "left": pos.left,
                "top": pos.top
            });
            $(objName).removeClass("drag");
            //When an existiung object is dragged
            $(objName).draggable({
                containment: 'parent',
		drag: function (ev, ui) {
		    var pos = $(ui.helper).offset();
		    var elid = (ui.helper).attr('id');
                    //console.log(pos.left + "_" + pos.top + "_" + elid);
		    //var p = $('#frame');
		    //var pos = p.position();
		    //console.log(pos.top);

			var scrollTop     = $(window).scrollTop(),
			    elementOffset = $('#frame').offset().top,
			    distance      = (elementOffset - scrollTop);
			pageoffset = elementOffset;
		    for(i=1; i<connectors.length; i++) {
			od = connectors[i]["orgdiv"];
			dd = connectors[i]["dstdiv"];
			if((dd==elid) || (od==elid)) {
                    		var orgdiv = document.getElementById(od);
                    		var orgrec = orgdiv.getBoundingClientRect();
				//var p = $('#frame');
				//var pos = p.position();
				//console.log(pos.left + "_" + pos.top);
				//console.log(orgrec.left + "_" + orgrec.top);
				////var divleft = orgrec.left - pos.left;
				////var divtop = orgrec.top - pos.top;
				//console.log(divleft + "_" + divtop + "\n" + connectors[i]["orgosx"] + "_" + connectors[i]["orgosy"]);
            			var oX = parseInt(connectors[i]["orgosx"]) + orgrec.left; 
            			var oY = parseInt(connectors[i]["orgosy"]) + (orgrec.top - distance + pageoffset);

                                var dstdiv = document.getElementById(dd);
                                var dstrec = dstdiv.getBoundingClientRect();
                                ////var ddivleft = dstrec.left - pos.left;
                                ////var ddivtop = dstrec.top - pos.top;
				var dX = parseInt(connectors[i]["dstosx"]) + dstrec.left;
				var dY = parseInt(connectors[i]["dstosy"]) + (dstrec.top - distance + pageoffset);
//console.log("O:" + orgrec.left + "_" + orgrec.top + "\n" + connectors[i]["orgosx"] + "_" + connectors[i]["orgosy"] + "\n" + oX + "_" + oY);
//console.log("D:" + dstrec.left + "_" + dstrec.top + "\n" + connectors[i]["dstosx"] + "_" + connectors[i]["dstosy"] + "\n" + dX + "_" + dY);
            			var len = Math.sqrt((dX - oX) * (dX - oX)
            			    + (dY - oY) * (dY - oY));

            			var ang = 180 / 3.1415 * Math.acos((dY - oY) / len);
            			if(dX > oX)
            			    ang *= -1;
//console.log(originX + "_" + originY + "_" + len + "_" + ang);
//console.log(connectors[i]["lineid"]);
//var lid = $('#' + connectors[i]["lineid"]);
//console.log(lid);
            			$('#' + connectors[i]["lineid"])
				    .css('top', oY)
				    .css('left', oX)
            			    .css('height', len)
            			    .css('-webkit-transform', 'rotate(' + ang + 'deg)')
            			    .css('-moz-transform', 'rotate(' + ang + 'deg)')
            			    .css('-o-transform', 'rotate(' + ang + 'deg)')
            			    .css('-ms-transform', 'rotate(' + ang + 'deg)')
            			    .css('transform', 'rotate(' + ang + 'deg)');
			}
		    }
		},
                stop: function (ev, ui) {
                    var pos = $(ui.helper).offset();
                    //console.log($(this).attr("id"));
                    //console.log(pos.left + "_" + pos.top)
                    //console.log(pos.top)
                }
            });
        }
    });
    //Make element droppable
    $("#frame").droppable({
        drop: function (ev, ui) {
	    //console.log(ui.draggable.attr('id'));
            if (ui.draggable.attr('id').search(/drag[0-9]/) != -1) {
                counter++;
                var element = $(ui.draggable).clone();
                element.addClass("tempclass");
                $(this).append(element);
                $(".tempclass").attr("id", "clonediv" + counter);
                $("#clonediv" + counter).removeClass("tempclass");
                //Get the dynamically item id
                draggedNumber = ui.draggable.attr('id').search(/drag([0-9])/)
                //itemDragged = "dragged" + RegExp.$1
		itemDragged = "dragged"
                //console.log(itemDragged)
                $("#clonediv" + counter).addClass(itemDragged);
		var pos = $(ui.helper).offset();
		//var pos = $("#frame").offset();
		//var pos = jQuery('#frame').offset();
		$("#clonediv" + counter).css({
		   "position": "absolute",
		   "left": ui.position.left,
		   "top": ui.position.top
		});
                scounter++;
                steps[scounter] = {};
                steps[scounter]["elemid"] = "clonediv" + counter;
                steps[scounter]["elemxq"] = ui.position.left;
                steps[scounter]["elemyq"] = ui.position.top;
		steps[scounter]["elemty"] = ui.draggable.attr('id').replace("drag","");
		console.log(steps);

		var hidstr1 = ui.draggable.attr('id');
		var hidstr2 = hidstr1.replace("drag","hidden");
		element[0].innerHTML = document.getElementById(hidstr2).innerHTML;
		//console.log($(".clonediv" + counter))
		//console.log($(".hidden1"))
		//console.log(pos.left)
		//console.log(pos.top)
	    }
        }
    });

    $(document).change(function(ev) {
	var elem = ev.target.id;
	var newdata = document.getElementById(elem).value;
	console.log(elem + "::" + newdata);
	if(elem.search("textbox") >= 0) {
		var aid = elem.replace("textbox", "");
		steps[aid]["elemtx"] = newdata;
		//console.log(steps);
	}
    });

    $('#save').bind('mouseup', function(ev) {
	DoSaveBox();
    });
    $('#load').bind('mouseup', function(ev) {
	DoLoadBox();
    });
    $('#new').bind('mouseup', function(ev) {
        DoNewBox();
    });
    //$('#deploy').bind('mouseup', function(ev) {
    //    DoDeployBox();
    //});

    $('#frame').bind('mouseup', function(ev) {
	var opoint = ev.target.className;
	clickpoint = ev.target.id;
	console.log(clickpoint);
	if(clickpoint == "textbox") {
		ev.target.id = "textbox0";
		var utag = findUpTag(document.getElementById("textbox0"), "clonediv")
		var uid = utag.id;
		var tid = "textbox" + uid.replace("clonediv", "");
		ev.target.id = tid;
		//console.log(document.getElementById(tid));
	}

	if(opoint == "origin-point") {
		ocounter++;
                //console.log("origin-click");
		ev.target.id = "opoint" + ocounter;
    var linkLine = $('<div id="new-link-line"></div>').appendTo('body');
    var origin = $(this);
	var otop = ev.pageY;
	var oleft = ev.pageX;
    linkLine
        .css('top', otop)
        .css('left', oleft);

    $(document).mousemove(function linkMouseMoveEvent(event) {
        if($('#new-link-line').length > 0) {
            //var originX = origin.offset().left + origin.outerWidth() / 2;
            //var originY = origin.offset().top + origin.outerHeight() / 2;
	    var originX = oleft + 3;
	    var originY = otop + 5;

            var length = Math.sqrt((event.pageX - originX) * (event.pageX - originX)
                + (event.pageY - originY) * (event.pageY - originY));

            var angle = 180 / 3.1415 * Math.acos((event.pageY - originY) / length);
            if(event.pageX > originX)
                angle *= -1;

            $('#new-link-line')
                .css('height', length)
                .css('-webkit-transform', 'rotate(' + angle + 'deg)')
                .css('-moz-transform', 'rotate(' + angle + 'deg)')
                .css('-o-transform', 'rotate(' + angle + 'deg)')
                .css('-ms-transform', 'rotate(' + angle + 'deg)')
                .css('transform', 'rotate(' + angle + 'deg)');
        }
    });

    $(document).bind('mousedown.link', function(event) {
	event.stopPropagation()
        switch(event.which){
            case 1:
                if($(event.target).hasClass("drop-point")){
                  $(document).unbind('mousemove.link').unbind('click.link').unbind('keydown.link');
                    //console.log("unlinked");
                    $('#new-link-line').addClass("connected-link-line");
		    lcounter++;
                    $('#new-link-line').addClass("line" + lcounter);
                    $('#new-link-line').attr("id","line" + lcounter);
		    if(event.target.id=="") {
			dcounter++;
			event.target.id = "dpoint" + dcounter;
			conn_dst = findUpTag(document.getElementById("dpoint" + dcounter), "clonediv")
			var dstpnt = document.getElementById("dpoint" + dcounter);
		    } else {
			conn_dst = findUpTag(document.getElementById(event.target.id), "clonediv")
			var dstpnt = document.getElementById(event.target.id)
		    }
		    conn_org = findUpTag(document.getElementById("opoint" + ocounter), "clonediv")
		    //conn_dst = findUpTag(document.getElementById("dpoint" + dcounter), "clonediv")
		    var orgdiv = document.getElementById(conn_org.id);
		    var orgrec = orgdiv.getBoundingClientRect();
		    var orgpnt = document.getElementById("opoint" + ocounter);
		    var opnrec = orgpnt.getBoundingClientRect();

                    var dstdiv = document.getElementById(conn_dst.id);
                    var dstrec = dstdiv.getBoundingClientRect();
                    //var dstpnt = document.getElementById("dpoint" + dcounter);
                    var dpnrec = dstpnt.getBoundingClientRect();
                    connectors[lcounter] = {};
                    connectors[lcounter]["orgdiv"] = conn_org.id;
                    connectors[lcounter]["dstdiv"] = conn_dst.id;
		    connectors[lcounter]["opoint"] = "opoint" + ocounter;
		    connectors[lcounter]["dpoint"] = "dpoint" + dcounter;
                    connectors[lcounter]["lineid"] = "line" + lcounter;
		    connectors[lcounter]["orgosx"] = opnrec.left - orgrec.left + (opnrec.width / 2);
		    connectors[lcounter]["orgosy"] = opnrec.top - orgrec.top + (opnrec.height / 2);
                    connectors[lcounter]["dstosx"] = dpnrec.left - dstrec.left + (dpnrec.width / 2);
                    connectors[lcounter]["dstosy"] = dpnrec.top - dstrec.top + (dpnrec.height / 2);
		    connectors[lcounter]["orgnum"] = clickpoint.replace("point","");
		    //console.log(orgdiv);
		    console.log(connectors);
                }
		$(document).unbind('mousedown.link');
                break;
            default:
                // Cancel on right click
                endLinkMode();
                removeLine();
        }
    });

    $(document).bind('keydown.link', function(event) {
        // ESCAPE key pressed
        if(event.keyCode == 27) {
            endLinkMode();
            removeLine();
        }
    });


	}
    });
    $("#easyccxsavebtn").click(function(){
	var ei = $("#easyccxid").val();
	var ed = $("#easyccxdesc").val();
	$.ajax({
	    datatype : "json",
	    type: 'POST',
		url: './cc/ccsave.php',
		data: {
		    tenant: '<?php echo $arr_userinfo[6]; ?>',
		    ei: ei,
		    ed: ed,
		    connectors: JSON.stringify(connectors),
		    steps: JSON.stringify(steps)
		},
		success: function(data) {
		    //console.log(data);
		    var jsonData = JSON.parse(data);
		    if (jsonData.id) {
			document.getElementById("scriptpkid").value = jsonData.id;
			document.getElementById("easyccxid").value = jsonData.id;
			//$("#easyccxid").val(jsonData.id);
			document.getElementById("appstatus").innerHTML = "<b>" + jsonData.name + "</b><br>&nbsp;";
			//alert("Saved Successfully\n" + jsonData.id + "\n" + jsonData.name + "\n" + document.getElementById("appstatus").value);
			//window.location.replace('./apitask.php?id=' + jsonData.id);
		    }
		}
	});
    });

	$("#deploy").click(function(){
		var sid = document.getElementById("scriptpkid").value;
		var did = "<?php echo $arr_devinfo["pkid"]; ?>";
		var dnm = "<?php echo $arr_devinfo["NameOrIP"]; ?>";
		$.ajax({
			datatype : "json",
			type: "POST",
			url: "./cc/ccdeploy.php",
			data: {
				sid: sid,
				did: did,
				dnm: dnm
			},
			success: function(data) {
				//console.log(data);
				//var jsonData = JSON.parse(data);
				//var arrLen = jsonData.length;
				basestr = document.getElementById("appstatus").innerHTML;
				var basearr = basestr.split("<br>");
				basestr = basearr[0] + "<br>";

				window.pollingPeriod = 1000;
				window.progressInterval;

				//for(var i = 0; i < arrLen; i++) {
				//	var itempkid = jsonData[i];
					$.getJSON("./cc/checktask.php?list=" + data, function(data) {
						clearInterval(window.progressInterval);
						$('#appstatus').html(basestr + data.status);
					}).error(function(data) {
						clearInterval(window.progressInterval);
						$('#appstatus').html(basestr + "Error");
					});

					window.progressInterval = setInterval(updateProgress,window.pollingPeriod);
					//console.log(jsonData[i]);
				//}
			}
		});
	});
			
function updateProgress() {
	$.getJSON('/uploads/progress.json',function(data) {
		var newpct = data.percentComplete;
		if(newpct!=1) {
			var pctout = "Deploying... " + parseInt(newpct*100) + "%";
			$('#appstatus').html(basestr + pctout);
		}
	}).error(function(data) {
		clearInterval(window.progressInterval);
		$('#appstatus').html(basestr + "Error.");
	});
}

function removeLine(){
    $('#new-link-line').remove();
}

function endLinkMode() {
    $('#opoint' + ocounter).attr("id","point" + (ocounter-1));
    ocounter--;
    $(document).unbind('mousemove.link').unbind('click.link').unbind('keydown.link');
}

function findUpTag(el, tag) {
    while (el.parentNode) {
        el = el.parentNode;
	elid = el.id;
        if (elid.indexOf(tag) > -1)
            return el;
    }
    return null;
}

function DoSaveBox() {
	$('#easyccxmodalsave').modal();
}

function DoSave() {
	var sdesc = $("#easyccxdesc").val();
	//for(i=1; i<connectors.length; i++) {
	//}
}

function DoLoadBox() {
	console.log("load");
}

function DoLoad() {
	console.log("load");
}

function DoNewBox() {
	console.log("new");
}

function DoDeployBox() {
	var sval = document.getElementById("scriptpkid").value;
	console.log("deploy\n" + sval);
}
