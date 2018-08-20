	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				正式考试
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
				<p class="alert alert-danger" style="margin-top:1rem;">本考场开启时间
					{x2;if:$data['currentbasic']['basicexam']['opentime']['start'] && $data['currentbasic']['basicexam']['opentime']['end']}
					{x2;date:$data['currentbasic']['basicexam']['opentime']['start'],'Y-m-d H:i:s'} - {x2;date:$data['currentbasic']['basicexam']['opentime']['end'],'Y-m-d H:i:s'}{x2;else}不限{x2;endif} ；
					考试次数 {x2;if:$data['currentbasic']['basicexam']['examnumber']}{x2;$data['currentbasic']['basicexam']['examnumber']}{x2;else}不限{x2;endif} ；
					抽卷规则 {x2;if:$data['currentbasic']['basicexam']['selectrule']}系统随机抽卷{x2;else}用户手选试卷{x2;endif}。
				</p>
				{x2;if:$data['currentbasic']['basicexam']['opentime']['start'] && $data['currentbasic']['basicexam']['opentime']['end']}
                	{x2;if:$data['currentbasic']['basicexam']['opentime']['start'] <= TIME && $data['currentbasic']['basicexam']['opentime']['end'] >= TIME}
                		{x2;if:$sessionvars}
	                	<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem 0rem;">
							<div class="col-xs-4">
								<a href="index.php?exam-phone-recover" class="ajax" data-page="paper" data-target="paper">
									<img src="app/core/styles/img/item.jpg" alt="" style="width:10rem;margin-top:0.5rem">
								</a>
							</div>
							<div class="col-xs-8">
								<a href="index.php?exam-phone-recover" class="ajax" data-page="paper" data-target="paper"><h5 class="title" style="margin-top:0px;">意外续考</h5></a>
								<p>
									<a href="index.php?exam-phone-recover" class="btn btn-primary ajax" data-page="paper" data-target="paper">继续考试</a>&nbsp;&nbsp;
									<a href="index.php?exam-phone-recover-clearexamsession" class="btn btn-danger ajax" msg="放弃考试会删除此次考试会话并不能恢复，确认要放弃吗？">放弃考试</a>
								</p>
							</div>
						</div>
	                	{x2;else}

                		{x2;if:$data['currentbasic']['basicexam']['selectrule']}
	                		{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['all'] >= $data['currentbasic']['basicexam']['examnumber']}
							<div class="text-center"><a class="btn" href="javascript:;">您的考试次数已经用完</a></div>
							{x2;else}
							<div class="text-center"><a action-before="clearStorage" class="ajax btn btn-primary btn-block" data-page="paper" data-target="paper" href="index.php?exam-phone-exam-selectquestions&examid={x2;v:exam['examid']}" action-before="clearStorage">开始考试</a></div>
							{x2;endif}
                		{x2;else}
                			{x2;tree:$exams['data'],exam,eid}
                			<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem 0rem;">
								<div class="col-xs-4">
									{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['child'][v:exam['examid']] >= $data['currentbasic']['basicexam']['examnumber']}
									<a href="javascript:;">
									{x2;else}
									<a action-before="clearStorage" href="index.php?exam-phone-exam-selectquestions&examid={x2;v:exam['examid']}" class="ajax" data-page="paper" data-target="paper">
									{x2;endif}
										<img src="app/core/styles/img/item.jpg" alt="" style="width:10rem;margin-top:0.5rem">
									</a>
								</div>
								<div class="col-xs-8" style="padding:0.2rem;">
									<div class="text-left" style="padding:0.2rem;">
										{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['child'][v:exam['examid']] >= $data['currentbasic']['basicexam']['examnumber']}
										<a href="javascript:;">
										{x2;else}
										<a action-before="clearStorage" href="index.php?exam-phone-exam-selectquestions&examid={x2;v:exam['examid']}" class="ajax" data-page="paper" data-target="paper">
										{x2;endif}
											<h5>{x2;v:exam['exam']}</h5>
											{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['child'][v:exam['examid']] >= $data['currentbasic']['basicexam']['examnumber']}
											<p style="font-size:1rem;" class="text-danger">考试次数已用完</p>
											{x2;else}
											<p style="font-size:1rem;">总分：{x2;v:exam['examsetting']['score']} 及格分：{x2;v:exam['examsetting']['passscore']}</p>
											{x2;endif}
										</a>
									</div>
								</div>
							</div>
							{x2;endtree}
							<ul class="pagination pull-right">
								{x2;$exams['pages']}
							</ul>
                		{x2;endif}

                		{x2;endif}
                	{x2;else}
                		<p class="alert">本考场开放考试时间为：{x2;date:$data['currentbasic']['basicexam']['opentime']['start'],'Y-m-d H:i:s'} - {x2;date:$data['currentbasic']['basicexam']['opentime']['end'],'Y-m-d H:i:s'}，目前不是考试时间，请在规定时间内前来考试哦。</p>
                	{x2;endif}
                {x2;else}
                	{x2;if:$sessionvars}
                	<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem 0rem;">
						<div class="col-xs-4">
							<a href="index.php?exam-phone-recover" class="ajax" data-page="paper" data-target="paper">
								<img src="app/core/styles/img/item.jpg" alt="" style="width:10rem;margin-top:0.5rem">
							</a>
						</div>
						<div class="col-xs-8">
							<a href="index.php?exam-phone-recover" class="ajax" data-page="paper" data-target="paper"><h5 class="title" style="margin-top:0px;">意外续考</h5></a>
							<p>
								<a href="index.php?exam-phone-recover" class="btn btn-primary ajax" data-page="paper" data-target="paper">继续考试</a>&nbsp;&nbsp;
								<a href="index.php?exam-phone-recover-clearexamsession" class="btn btn-danger ajax" msg="放弃考试会删除此次考试会话并不能恢复，确认要放弃吗？">放弃考试</a>
							</p>
						</div>
					</div>
                	{x2;else}
                	{x2;if:$data['currentbasic']['basicexam']['selectrule']}
                		{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['all'] >= $data['currentbasic']['basicexam']['examnumber']}
						<div class="text-center"><a class="btn" href="javascript:;">您的考试次数已经用完</a></div>
						{x2;else}
						<div class="text-center"><a class="ajax btn btn-primary btn-block" data-page="paper" data-target="paper" href="index.php?exam-phone-exam-selectquestions&examid={x2;v:exam['examid']}" action-before="clearStorage">开始考试</a></div>
						{x2;endif}
            		{x2;else}
            			{x2;tree:$exams['data'],exam,eid}
						<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem 0rem;">
							<div class="col-xs-4">
								{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['child'][v:exam['examid']] >= $data['currentbasic']['basicexam']['examnumber']}
								<a href="javascript:;">
								{x2;else}
								<a action-before="clearStorage" href="index.php?exam-phone-exam-selectquestions&examid={x2;v:exam['examid']}" class="ajax" data-page="paper" data-target="paper">
								{x2;endif}
									<img src="app/core/styles/img/item.jpg" alt="" style="width:10rem;margin-top:0.5rem">
								</a>
							</div>
							<div class="col-xs-8" style="padding:0.2rem;">
								<div class="text-left" style="padding:0.2rem;">
									{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['child'][v:exam['examid']] >= $data['currentbasic']['basicexam']['examnumber']}
									<a href="javascript:;">
									{x2;else}
									<a action-before="clearStorage" href="index.php?exam-phone-exam-selectquestions&examid={x2;v:exam['examid']}" class="ajax" data-page="paper" data-target="paper">
									{x2;endif}
										<h5>{x2;v:exam['exam']}</h5>
										{x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['child'][v:exam['examid']] >= $data['currentbasic']['basicexam']['examnumber']}
										<p style="font-size:1rem;" class="text-danger">考试次数已用完</p>
										{x2;else}
										<p style="font-size:1rem;">总分：{x2;v:exam['examsetting']['score']} 及格分：{x2;v:exam['examsetting']['passscore']}</p>
										{x2;endif}
									</a>
								</div>
							</div>
						</div>
						{x2;endtree}
						<ul class="pagination pull-right">
							{x2;$exams['pages']}
						</ul>
            		{x2;endif}
            		{x2;endif}
                {x2;endif}
			</div>
		</div>
	</div>