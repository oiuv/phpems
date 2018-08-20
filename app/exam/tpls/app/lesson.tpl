{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<div class="col-xs-12">
					<ol class="breadcrumb">
					  <li><a href="index.php">首页</a></li>
					  <li><a href="index.php?exam-app">考试</a></li>
					  <li><a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a></li>
					  <li class="active">课后练习</li>
					</ol>
				</div>
			</div>
			<div class="box itembox">
				<h4 class="title">课后练习</h4>
				{x2;if:$record}
				<p>系统检测到您上次做到《{x2;$knows[$record['exerknowsid']]['knows']}》的{x2;$questype[$record['exerqutype']]['questype']}第{x2;$record['exernumber']}题，点此<a class="ajax" href="index.php?exam-app-lesson-ajax-setlesson&questype={x2;$record['exerqutype']}&knowsid={x2;$record['exerknowsid']}&number={x2;$record['exernumber']}">继续练习</a></p>
				{x2;endif}
				{x2;tree:$sections,section,sid}
				<table class="table table-hover table-bordered">
					<tr class="info"><td colspan="6">{x2;v:section['section']}</td></tr>
					<tr>
						{x2;tree:$basic['basicknows'][v:section['sectionid']],know,kid}
				    	<td><a href="index.php?route=exam-app-lesson-lessonnumber&knowsid={x2;v:know}" target="lessonknows" class="ajax" onclick="javascript:$('#submodal').modal('show');">{x2;$knows[v:know]['knows']}</a></td>
				    	{x2;if:v:kid % 6 == 0}</tr><tr>{x2;endif}
				    	{x2;endtree}
				    	{x2;if:(v:kid % 6 != 0) && (v:kid/6 >= 1)}
				    	{x2;eval: v:mod = 6 - v:kid % 6;}
				    	<td colspan="{x2;v:mod}"></td>
				    	{x2;endif}
					</tr>
				</table>
				{x2;endif}
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="submodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">题型</h4>
			</div>
			<div class="modal-body">
				<div id="lessonknows"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">再看看其他的</button>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>