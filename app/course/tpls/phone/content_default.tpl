{x2;include:header}
<body>
<link href="app/core/styles/js/video-js/video-js.css" rel="stylesheet" type="text/css">
<script src="app/core/styles/js/video-js/video.js"></script>
<script>
    videojs.options.flash.swf = "app/core/styles/js/video-js/video-js.swf";
</script>
{x2;include:nav}
<div class="row-fluid">
	<div class="container-fluid">
		<div class="span9">
			<div class="examcontent">
				<ul class="breadcrumb" style="margin:0px">
					<li>
						<span class="icon-home"></span> <a href="index.php">主页</a> <span class="divider">/</span>
					</li>
					{x2;tree:$catbread,cb,cbid}
					<li><a href="index.php?course-app-category&catid={x2;v:cb['catid']}">{x2;v:cb['catname']}</a> <span class="divider">/</span></li>
					{x2;endtree}
					<li><a href="index.php?course-app-category&catid={x2;$cat['catid']}">{x2;$cat['catname']}</a><span class="divider">/</span></li>
					<li><a href="index.php?course-app-course&csid={x2;$course['csid']}">{x2;$course['cstitle']}</a><span class="divider">/</span></li>
					<li class="active">{x2;$content['coursetitle']}</li>
				</ul>
			</div>
			<div class="examcontent">
				<div class="exambox">
					<div class="examform">
						<div>
							<div style="width:800px;margin:auto;">
							  <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="800" height="450" poster="http://video-js.zencoder.com/oceans-clip.png" data-setup="{'example_option':true}">
							    <source src="{x2;$content['course_files']}" type='video/mp4' />
							  </video>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="examcontent">
				<div class="exambox">
					<div class="examform">
						<h5 class="title text-center">{x2;$content['coursetitle']}</h5>
						<div id="contentTxt">
							{x2;realhtml:$content['coursedescribe']}
						</div>
						<p class="text-right">发布时间：{x2;date:$content['courseinputtime'],'Y-m-d'}</p>
						<div  style="margin-top:20px;border-top:1px solid #dddddd;padding-top:20px;">
							<div class="bshare-custom pull-right">
								<a class="bshare-qzone" title="分享到QQ空间"></a>
								<a class="bshare-sinaminiblog" title="分享到新浪微博"></a>
								<a class="bshare-renren" title="分享到人人网"></a>
								<a class="bshare-qqmb" title="分享到腾讯微博"></a>
								<a class="bshare-neteasemb" title="分享到网易微博"></a>
								<a class="bshare-more bshare-more-icon more-style-addthis" title="更多平台"></a>
								<span class="BSHARE_COUNT bshare-share-count">0</span>
							</div>
							<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
							<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="span3 examcontent">
			<div class="exambox">
				<div class="examform">
					<h5 class="title"><a href="index.php?course-app-course&csid={x2;$course['csid']}">{x2;$course['cstitle']}</a></h5>
					<ul>
						{x2;tree:$contents['data'],content,cid}
						<li>
							{x2;if:v:content['courseid'] == $content['courseid']}
							<span class="text-warning">{x2;v:content['coursetitle']}</span>
							<script src="index.php?course-app-course-coursejs&contentid={x2;v:content['courseid']}"></script>
							{x2;else}
							<a href="index.php?course-app-content&contentid={x2;v:content['courseid']}" title="{x2;v:content['coursetitle']}">{x2;v:content['coursetitle']}</a>
							<script src="index.php?course-app-course-coursejs&contentid={x2;v:content['courseid']}"></script>
							{x2;endif}
						</li>
						{x2;endtree}
					</ul>
					<div class="pagination pagination-right">
						<ul>{x2;$categorys['pages']}</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>