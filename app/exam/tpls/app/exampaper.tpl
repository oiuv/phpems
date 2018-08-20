{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid" id="datacontent">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<div class="col-xs-12">
					<ol class="breadcrumb">
					  <li><a href="index.php">首页</a></li>
					  <li><a href="index.php?exam-app">考试</a></li>
					  <li><a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a></li>
					  <li class="active">{x2;$data['currentbasic']['basic']}</li>
					</ol>
				</div>
			</div>
			<div class="box itembox">
				<h4 class="title">模拟考试</h4>
				<div class="alert alert-info">
					<ul class="list-unstyled">
	                	<li><b>1、</b>点击考试名称按钮进入答题界面，考试开始计时。</li>
	                	<li><b>2、</b>在随机考试过程中，您可以通过顶部的考试时间来掌握自己的做题时间。</li>
	                	<li><b>3、</b>提交试卷后，可以通过“查看答案和解析”功能进行总结学习。</li>
	                	<li><b>4、</b>系统自动记录模拟考试的考试记录，学员考试结束后可以进入“答题记录”功能进行查看。</li>
	                </ul>
                </div>
                <div class="col-xs-12" style="padding-left:0px;">
        			{x2;tree:$exams['data'],exam,eid}
					<div class="col-xs-3" style="width:20%">
						{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['child'][v:exam['examid']] >= $data['currentbasic']['basicexam']['examnumber']}
							<a action-before="clearStorage" href="index.php?exam-app-exampaper-selectquestions&examid={x2;v:exam['examid']}" class="thumbnail ajax" style="position:relative;">
							<img src="app/core/styles/img/opened.png" style="position:absolute;right:4px;top:4px;">
						{x2;else}
							<a action-before="clearStorage" href="index.php?exam-app-exampaper-selectquestions&examid={x2;v:exam['examid']}" class="thumbnail ajax" style="position:relative;">
						{x2;endif}
							<img src="app/core/styles/img/item.jpg" alt="" width="100%">
						</a>
						<h5 class="text-center">
							{x2;v:exam['exam']}
						</h5>
					</div>
					{x2;if:v:eid % 5 == 0}
					<div class="col-xs-12"><hr /></div>
					{x2;endif}
					{x2;endtree}
					<ul class="pagination pull-right">{x2;$exams['pages']}</ul>
                </div>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>