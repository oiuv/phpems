	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				模拟考试
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
				{x2;tree:$exams['data'],exam,eid}
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem 0rem;">
					<div class="col-xs-4">
						<a action-before="clearStorage" data-page="paper" data-target="paper" href="index.php?exam-phone-exampaper-selectquestions&examid={x2;v:exam['examid']}" class="ajax" style="position:relative;">
							<img src="app/core/styles/img/item.jpg" alt="" style="width:10rem;margin-top:0.5rem">
						</a>
					</div>
					<div class="col-xs-8" style="padding:0.2rem;">
						<div class="text-left" style="padding:0.2rem;">
							<a action-before="clearStorage" data-page="paper" data-target="paper" href="index.php?exam-phone-exampaper-selectquestions&examid={x2;v:exam['examid']}" class="ajax" style="position:relative;">
								<h5>{x2;v:exam['exam']}</h5>
								<p style="font-size:1rem;">总分：{x2;v:exam['examsetting']['score']} 及格分：{x2;v:exam['examsetting']['passscore']}</p>
							</a>
						</div>
					</div>
				</div>
				{x2;endtree}
				<ul class="pagination pull-right">
                    {x2;$exams['pages']}
				</ul>
			</div>
		</div>
	</div>