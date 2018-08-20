{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
	<div class="pages" id="basic">
{x2;endif}
		<div class="pagecontent">
			<header class="container-fluid" style="background-color:#337AB7;">
				<h5 class="text-center">
					<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
					{x2;$data['currentbasic']['basic']}
					<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
				</h5>
			</header>
			<h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
				<span class="pull-left" style="width:35%"><hr /></span>
				<span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">学习考试</span>
				<span class="pull-right" style="width:35%"><hr /></span>
			</h4>
			<div class="container-fluid">
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem">
					{x2;if:!$data['currentbasic']['basicexam']['model'] || $data['currentbasic']['basicexam']['model'] == 1}
					<div class="col-xs-4">
						<a href="index.php?exam-phone-lesson" class="thumbnail ajax" style="border:0px;" data-target="lesson" data-page="lesson">
							<img src="app/core/styles/img/t1.png" alt="" width="100%">
						</a>
						<h5 class="text-center">课后练习</h5>
					</div>
					<div class="col-xs-4">
						<a href="index.php?exam-phone-exercise" class="thumbnail ajax" style="border:0px;" data-target="exercise" data-page="exercise">
							<img src="app/core/styles/img/t4.png" alt="" width="100%">
						</a>
						<h5 class="text-center">强化训练</h5>
					</div>
					<div class="col-xs-4">
						<a href="index.php?exam-phone-exampaper" class="thumbnail ajax" style="border:0px;" data-target="exampaper" data-page="exampaper">
							<img src="app/core/styles/img/t2.png" alt="" width="100%">
						</a>
						<h5 class="text-center">模拟考试</h5>
					</div>
					{x2;endif}
					{x2;if:!$data['currentbasic']['basicexam']['model'] || $data['currentbasic']['basicexam']['model'] == 2}
					<div class="col-xs-4">
						<a href="index.php?exam-phone-exam" class="thumbnail ajax" style="border:0px;" data-target="exams" data-page="exams">
							<img src="app/core/styles/img/t3.png" alt="" width="100%">
						</a>
						<h5 class="text-center">正式考试</h5>
					</div>
					{x2;endif}
				</div>
			</div>
			<h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
				<span class="pull-left" style="width:35%"><hr /></span>
				<span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">改错复习</span>
				<span class="pull-right" style="width:35%"><hr /></span>
			</h4>
			<div class="container-fluid">
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;margin-bottom:0.5rem">
                    {x2;if:!$data['currentbasic']['basicexam']['model'] || $data['currentbasic']['basicexam']['model'] == 1}
					<div class="col-xs-4">
						<a href="index.php?exam-phone-history" class="thumbnail ajax" style="border:0px;" data-target="history" data-page="history">
							<img src="app/core/styles/img/t5.png" alt="" width="100%">
						</a>
						<h5 class="text-center">考试记录</h5>
					</div>
					<div class="col-xs-4">
						<a href="index.php?exam-phone-favor" class="thumbnail ajax" style="border:0px;" data-target="favor" data-page="favor">
							<img src="app/core/styles/img/t6.png" alt="" width="100%">
						</a>
						<h5 class="text-center">习题收藏</h5>
					</div>
                    {x2;endif}
					<div class="col-xs-4">
						<a href="index.php?exam-phone-score" class="thumbnail ajax" style="border:0px;" data-target="scores" data-page="scores">
							<img src="app/core/styles/img/t8.png" alt="" width="100%">
						</a>
						<h5 class="text-center">成绩单</h5>
					</div>
                    {x2;if:!$data['currentbasic']['basicexam']['model'] || $data['currentbasic']['basicexam']['model'] == 1}
					<div class="col-xs-4">
						<a href="index.php?exam-phone-questions" class="thumbnail ajax" style="border:0px;" data-target="questions" data-page="questions">
							<img src="app/core/styles/img/t9.png" alt="" width="100%">
						</a>
						<h5 class="text-center">题库</h5>
					</div>
					{x2;endif}
				</div>
			</div>
			{x2;include:footer}
		</div>
	{x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}