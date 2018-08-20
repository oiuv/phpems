{x2;if:!$userhash}
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
						<li><a href="index.php?course">课程</a></li>
						{x2;tree:$catbread,cb,cbid}
						<li><a href="index.php?course-app-category&catid={x2;v:cb['catid']}">{x2;v:cb['catname']}</a></li>
						{x2;endtree}
						<li class="active">{x2;$cat['catname']}</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="main" id="datacontent">
{x2;endif}
			<div class="col-xs-8" style="padding-left:0px;position:relative;">
				<div class="box itembox" style="height:auto;width:800px;top:0px;z-index:99">
					<h4 class="title" style="line-height:2.5em;">
						{x2;$content['coursetitle']}
					</h4>
					{x2;if:$content['course_files'] || $content['course_oggfile'] || $content['course_webmfile']}
					<div style="margin-top:10px;" controls="true" width="100%" height="450" id="movieplatform">
					</div>
					{x2;else}
					<embed src="{x2;$content['course_youtu']}" allowFullScreen="true" quality="high" width="100%" height="450" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>
					{x2;endif}
					<blockquote style="margin-top:10px;" class="text-info">{x2;realhtml:$content['coursedescribe']}</blockquote>
				</div>
			</div>
			<div class="col-xs-4 pull-right" style="padding-right:0px;">
				<div class="box itembox" style="padding-top:10px;">
					<h4 class="title">{x2;$course['cstitle']}</h4>
					<div>
						{x2;realhtml:$course['csdescribe']}
					</div>
				</div>
				{x2;tree:$contents['data'],content,cid}
				<div class="box" style="padding-top:10px;">
					<div class="col-xs-3">
						<a target="datacontent" href="index.php?course-app-course&page={x2;$page}&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}" class="ajax">
							<img src="{x2;v:content['coursethumb']}" alt="" width="100%">
						</a>
					</div>
					<div class="col-xs-9">
						<a target="datacontent" href="index.php?course-app-course&page={x2;$page}&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}" class="ajax">
							<h4 class="title" style="margin-top:0px;">
							{x2;if:$content['courseid'] == v:content['courseid']}
							<span style="color:green;"><em class="glyphicon glyphicon-play-circle"></em></span>
							{x2;endif}
							{x2;if:$cdata['lock'][v:content['courseid']]}
							<span style="color:red;"><em class="glyphicon glyphicon-lock"></em></span>
							{x2;endif}
							{x2;v:content['coursetitle']}
							{x2;if:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 1}
							<span class="pull-right" style="color:green;">已学完</span>
							{x2;elseif:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 0}
							<span class="pull-right" style="color:green;">上次学习{x2;eval: echo intval($logs[v:content['courseid']]['logprogress'] / 60)}分{x2;eval: echo $logs[v:content['courseid']]['logprogress'] % 60}秒</span>
							{x2;else}
							<span class="pull-right" style="color:green;">未学习</span>
							{x2;endif}
							</h4>
						</a>
						<p style="font-size:13px;">{x2;realsubstring:v:content['coursedescribe'],90}</p>
					</div>
				</div>
				{x2;endtree}
				<ul class="pagination pull-right">{x2;$contents['pages']}</ul>
			</div>
			{x2;if:$content['course_files'] || $content['course_oggfile'] || $content['course_webmfile']}
			<script type="text/javascript">
                var cksetting = {
                    container: '#movieplatform',
                    variable: "ckplayeritem",
                    live:false,
					{x2;if:$logs[$content['courseid']]['logprogress']}
					seek:{x2;$logs[$content['courseid']]['logprogress']},
					{x2;endif}
                    video:'{x2;$content['course_files']}{x2;$content['course_oggfile']}{x2;$content['course_webmfile']}'
                };
                var ckplayeritem = new ckplayer(cksetting);
                //ckplayeritem.videoSeek = function(){return false;}
                ckplayeritem.addListener('ended',function(){
                    $.get('index.php?course-app-course-endstatus&courseid={x2;$content['courseid']}&'+Math.random());
                });
				ckplayeritem.addListener('time',function(time){
                    ckplayeritem.currenttime = time;
                });
				clearInterval($.recordVideo);
				$.recordVideo = setInterval(function(){
					$.get('index.php?course-app-course-recordtime&courseid={x2;$content['courseid']}&time='+ckplayeritem.currenttime+'&'+Math.random());
				},20000);
			</script>
			{x2;endif}
			<div class="modal fade" id="submodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">Note</h4>
						</div>
						<div class="modal-body">
							<form id="notepform" method="post" action="index.php?course-app-course-setcourse">
								<textarea name="note" class="jckeditor">{x2;$cnote['clsnote']}</textarea>
								<input type="hidden" name="cnoteid" value="{x2;$cnote['clsid']}"/>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" onclick="javascript:$('#notepform').submit();" class="btn btn-primary">Save</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Hide</button>
						</div>
					</div>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}