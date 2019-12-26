{x2;if:!$userhash}
{x2;include:header}
{x2;eval: v:signPackage = v:this->G->make('jssdk','user')->GetSignPackage();}
<body>
<div id="content">
    <div class="pages" id="page1">
{x2;endif}
    	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-home"></em>
				<span class="ttlo">PHPEMS模拟考试系统</span>
				<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
			</h5>
		</header>
    	<div class="container-fluid" style="overflow:hidden;margin-top:1rem;margin-bottom:0.4rem;">
			<div class="swiper-container">
	    		<div class="swiper-wrapper">
		    		{x2;tree:$contents[2]['data'],content,cid}
		    		<div class="swiper-slide">
		    			<a href="index.php?content-phone-content&contentid={x2;v:content['contentid']}" class="ajax" data-page="rollpage" data-target="rollpage">
		    				<img src="{x2;v:content['contentthumb']}">
		    			</a>
		    		</div>
		    		{x2;endtree}
	    		</div>
	    		<div class="swiper-pagination"></div>
	    	</div>
		</div>
		<div class="container-fluid">
			<div style="clear:both;overflow:hidden;" class="items">
				<div class="col-xs-4" style="padding:0.2rem;">
					<div class="text-center" style="background:#712704;height:14rem;padding:0.2rem;">
						<a href="index.php?exam-phone-index" class="ajax" data-page="exam" data-target="exam">
							<h5>在线考试</h5>
							<p style="font-size:1rem;">在线练习 模拟考试</p>
							<p>
								<img src="app/core/styles/img/item.png" style="width:6rem;"/>
							</p>
						</a>
					</div>
				</div>
				<div class="col-xs-4" style="padding:0.2rem;">
					<div class="text-center" style="background:#04477C;height:14rem;padding:0.2rem;">
						<a class="ajax" href="index.php?course-phone-index" data-target="course" data-page="course">
							<h5>视频课程</h5>
							<p style="font-size:1rem;">课程课件 在线学习</p>
							<p>
								<img src="app/core/styles/img/item.png" style="width:6rem;"/>
							</p>
						</a>
					</div>
				</div>
				<div class="col-xs-4" style="padding:0.2rem;">
					<div class="text-center" style="background:#036803;height:14rem;padding:0.2rem;">
						<a href="index.php?content-phone-category" data-target="contentcategory" data-page="contentcategory" class="ajax">
							<h5>考试资讯</h5>
							<p style="font-size:1rem;">考试资讯 相关信息</p>
							<p>
								<img src="app/core/styles/img/item.png" style="width:6rem;"/>
							</p>
						</a>
					</div>
				</div>
			</div>
			<h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
				<span class="pull-left" style="width:35%"><hr /></span>
				<span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">热门考场</span>
				<span class="pull-right" style="width:35%"><hr /></span>
			</h4>
			<div style="clear:both;padding:1.5rem;background-color:#FFFFFF;margin-bottom:1rem;" class="col-xs-12">
				{x2;tree:$basics['basic'],basic,bid}
				<div class="media">
					<div class="media-body">
						<h5 class="media-heading"><a href="index.php?exam-phone-index-setCurrentBasic&basicid={x2;v:basic['basicid']}" class="ajax" data-target="basic" data-page="basic">{x2;v:basic['basic']}</a></h5>
						<p style="font-size:1rem;">{x2;v:basic['basicdescribe']}</p>
					</div>
				</div>
				{x2;endtree}
			</div>
			<!--
			<div>
				<h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
					<span class="pull-left" style="width:35%"><hr /></span>
					<span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">视频课程</span>
					<span class="pull-right" style="width:35%"><hr /></span>
				</h4>
			</div>
			<div style="clear:both;padding:1.5rem;background-color:#FFFFFF;margin-bottom:1rem;" class="col-xs-12">
				{x2;tree:$courses['data'],course,cid}
				<div class="media">
					<a class="pull-left ajax" href="index.php?course-phone-course&csid={x2;v:course['csid']}" data-target="coursecontent" data-page="coursecontent" style="width:8rem;">
						<img src="{x2;v:course['csthumb']}" style="width:8rem;" alt="{x2;v:course['cstitle']}">
					</a>
					<div class="media-body">
						<h5 class="media-heading"><a class="ajax" href="index.php?course-phone-course&csid={x2;v:course['csid']}" data-target="coursecontent" data-page="coursecontent">{x2;v:course['cstitle']}</a></h5>
						<p style="font-size:1rem;">{x2;substring:v:course['csdescribe'],81} </p>
					</div>
				</div>
				{x2;endtree}
			</div>
			-->
			{x2;tree:$contents,contents,cid}
			{x2;if:v:key != 2}
			<div>
				<h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
					<span class="pull-left" style="width:35%"><hr /></span>
					<span class="col-xs-4 text-center" style="width:30%;line-height:4rem;"><a href="">{x2;substring:$rcats[v:key]['catname'],15}</a></span>
					<span class="pull-right" style="width:35%"><hr /></span>
				</h4>
			</div>
			<div style="clear:both;padding:1.5rem;background-color:#FFFFFF;margin-bottom:1rem;" class="col-xs-12">
				{x2;tree:v:contents['data'],content,cid}
				<div class="media">
					<div class="media-body">
						<h5 class="media-heading"><a class="ajax" href="index.php?content-phone-content&contentid={x2;v:content['contentid']}" data-target="contentpage" data-page="contentpage">{x2;v:content['contenttitle']}</a></h5>
						<p style="font-size:1rem;">{x2;substring:v:content['contentdescribe'],81} </p>
					</div>
				</div>
				{x2;endtree}
			</div>
			{x2;endif}
			{x2;endtree}
		</div>
		</div>
		<script>
			$(function(){
				var mySwiper = new Swiper('.swiper-container',{
					"pagination":".swiper-pagination",
					"loop":true,
					"autoplay": 3000,
					"observer":true,
					"observeParents":true
				});
			});
		</script>
		{x2;include:footer}
{x2;if:!$userhash}
    </div>
</div>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
	wx.config({
        debug: false,
        appId: '{x2;v:signPackage['appId']}',
        timestamp: {x2;v:signPackage['timestamp']},
		nonceStr: '{x2;v:signPackage['nonceStr']}',
        signature: '{x2;v:signPackage['signature']}',
        jsApiList:  ['onMenuShareTimeline','onMenuShareAppMessage']
    });
</script>
</body>
</html>
{x2;endif}