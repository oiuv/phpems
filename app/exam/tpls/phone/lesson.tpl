	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				课后练习
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			{x2;if:$record}
			<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem">
				<p>系统检测到您上次做到《{x2;$knows[$record['exerknowsid']]['knows']}》的{x2;$questype[$record['exerqutype']]['questype']}第{x2;$record['exernumber']}题，点此<a data-page="paper" data-target="paper" class="ajax text-danger" href="index.php?exam-phone-lesson-ajax-setlesson&questype={x2;$record['exerqutype']}&knowsid={x2;$record['exerknowsid']}&number={x2;$record['exernumber']}">继续练习</a></p>
			</div>
			{x2;endif}
			<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;margin-bottom:0.5rem;">
				{x2;tree:$sections,section,sid}
				<table class="table table-hover table-bordered">
					<tr class="info"><td colspan="2">{x2;v:section['section']}</td></tr>
					<tr>
						{x2;tree:$basic['basicknows'][v:section['sectionid']],know,kid}
				    	<td><a href="index.php?exam-phone-lesson-lessonnumber&knowsid={x2;v:know}" data-page="lessonpaper" data-target="lessonpaper" class="ajax">{x2;$knows[v:know]['knows']}</a></td>
				    	{x2;if:v:kid % 2 == 0}</tr><tr>{x2;endif}
				    	{x2;endtree}
				    	{x2;if:(v:kid % 2 != 0) && (v:kid/6 >= 1)}
				    	{x2;eval: v:mod = 2 - v:kid % 2;}
				    	<td colspan="{x2;v:mod}"></td>
				    	{x2;endif}
					</tr>
				</table>
				{x2;endif}
			</div>
		</div>
	</div>