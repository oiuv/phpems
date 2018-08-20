{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
	<div class="pages" id="page1">
{x2;endif}
		<div class="pagecontent">
			<header class="container-fluid" style="background-color:#337AB7;">
				<h5 class="text-center">
					<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                    {x2;$course['cstitle']}
					<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
				</h5>
			</header>
			<div class="container-fluid" id="videobar" style="display:none;">
				<div class="row-fluid">
					<div class="col-xs-12" style="background-color:#FFFFFF;margin-top:0.5rem;">
						<h4 class="title">
							{x2;$course['cstitle']}
							<a class="glyphicon glyphicon-menu-right pull-right" onclick="javascript:$.leftMenu($('#videobar'));$('#videoplatform').toggle();"></a>
						</h4>
						<ol style="padding-top:10px;" class="">
							{x2;tree:$contents['data'],content,cid}
							<li style="line-height: 3rem;margin-left:-2rem;border-bottom:1px dotted #ebebeb">
								<a data-target="courseplatform" data-page="courseplatform" href="index.php?course-phone-course&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}" class="ajax">
									{x2;v:content['coursetitle']}
									{x2;if:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 1}
									[ 已学完 ]
									{x2;elseif:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 0}
									[ 学习中 ]
									{x2;endif}
									{x2;if:$content['courseid'] == v:content['courseid']}
									<span class="pull-right" style="color:green;"><em class="glyphicon glyphicon-play-circle"></em></span>
									{x2;elseif:$cdata['lock'][v:content['courseid']]}
									<span class="pull-right" style="color:red;"><em class="glyphicon glyphicon-lock"></em></span>
									{x2;else}
									<span class="pull-right" style="color:green;"><em class="glyphicon glyphicon-facetime-video"></em></span>
									{x2;endif}

								</a>
							</li>
							{x2;endtree}
						</ol>
					</div>
				</div>
			</div>
			<div class="container-fluid" id="videoprocessbar" style="display:none;">
				<div class="row-fluid">
					<div class="col-xs-12" style="background-color:#FFFFFF;margin-top:0.5rem;">
						<h4 class="title">
							{x2;$course['cstitle']}
							<a class="glyphicon glyphicon-menu-right pull-right" onclick="javascript:$.leftMenu($('#videoprocessbar'));$('#videoplatform').toggle();"></a>
						</h4>
						<ol style="padding-top:10px;" class="">
							{x2;tree:$contents['data'],content,cid}
							<li style="line-height: 3rem;margin-left:-2rem;border-bottom:1px dotted #ebebeb">
								<a data-target="courseplatform" data-page="courseplatform" href="index.php?course-phone-course&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}" class="ajax">
									{x2;v:content['coursetitle']} 上次学习{x2;eval: echo intval($logs[v:content['courseid']]['logprogress'] / 60)}分{x2;eval: echo $logs[v:content['courseid']]['logprogress'] % 60}秒
									{x2;if:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 1}
									<span class="pull-right" style="color:green;"><em class="glyphicon glyphicon-ok"></em></span>
									{x2;elseif:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 0}
									<span class="pull-right" style="color:green;"><em class="glyphicon glyphicon-play-circle"></em></span>
									{x2;else}
									<span class="pull-right" style="color:green;"><em class="glyphicon glyphicon-time"></em></span>
									{x2;endif}
								</a>
							</li>
							{x2;endtree}
						</ol>
					</div>
				</div>
			</div>
			<div class="container-fluid" id="videoplatform">
				<div class="row-fluid">
					<h4 class="title" style="line-height:2.5em;">
						{x2;$content['coursetitle']}
					</h4>
					<p class="alert alert-danger">抱歉，手机端暂不支持查看PDF文件。</p>
					<div class="btn-group" role="group" style="margin-top:0.5em;clear:both;width:100%">
						<a class="btn btn-default col-xs-4" onclick="javascript:$.leftMenu($('#videobar'));$('#videoplatform').toggle();" class="btn btn-default">播放清单</>
						<a class="btn btn-default col-xs-4" onclick="javascript:$.leftMenu($('#videoprocessbar'));$('#videoplatform').toggle();">学习记录</>
						<a class="btn btn-default col-xs-4 ajax" href="index.php?course-phone-course-jumppaper&csid={x2;$course['csid']}" data-page="exam" data-target="exam">相关练习</a>
					</div>
					<div class="text-info" style="margin-top:0.5rem;background-color:#FFFFFF;padding:0.5rem;line-height: 2rem">{x2;realhtml:$content['coursedescribe']}</div>
				</div>
			</div>
		</div>
{x2;if:!$userhash}
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}