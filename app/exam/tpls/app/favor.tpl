{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main" id="datacontent">
{x2;endif}
			<div class="box itembox" style="margin-bottom:0px;">
				<ul class="breadcrumb">
					<li>
						<span class="icon-home"></span> <a href="index.php?exam">考场选择</a>
					</li>
					<li>
						<a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a>
					</li>
					<li>
						<a href="index.php?exam-app-history&ehtype={x2;$ehtype}">考试记录</a>
					</li>
					<li class="active">
						查看解析
					</li>
				</ul>
			</div>
			<div class="box itembox" style="padding-top:24px;">
				<ul class="nav nav-tabs">
					<li{x2;if:!$type} class="active"{x2;endif}>
						<a href="index.php?exam-app-favor">普通试题</a>
					</li>
					<li{x2;if:$type} class="active"{x2;endif}>
						<a href="index.php?exam-app-favor&type=1">题冒题</a>
					</li>
				</ul>
				<form action="index.php?exam-app-favor" method="post" class="form-inline" style="padding-top:10px;">
					<blockquote class="questype">
						<table width="100%">
							<tr>
								<td width="10%">
									题型筛选：
								</td>
								<td width="80%">
									<select name="search[questype]" class="form-control" autocomplete="off">
			                        	<option value="0">请选择题型</option>
			                        	{x2;tree:$questype,quest,qid}
			                    		<option value="{x2;v:quest['questid']}"{x2;if:$search['questype'] == v:quest['questid']} selected{x2;endif}>{x2;v:quest['questype']}</option>
			                    		{x2;endtree}
			                        </select>
								</td>
								<td width="10%">
									<button class="btn btn-primary" type="submit">提交</button>
									<input type="hidden" value="{x2;$type}" name="type" />
								</td>
							</tr>
						</table>
					</blockquote>
				</form>
				{x2;if:$type}
					{x2;eval:v:ishead = 0}
					{x2;eval:v:ispre = 0}
					{x2;tree:$favors['data'],question,qid}
						{x2;if:v:pre != v:question['questionparent']}
						{x2;eval:v:ishead = 0}
						{x2;endif}
						<div class="box itembox paperexamcontent">
							{x2;if:!v:ishead}
							<h4 class="title">
								【{x2;$questype[v:question['questiontype']]['questype']}】
							</h4>
							<div class="choice">
								{x2;realhtml:v:question['qrquestion']}
							</div>
							{x2;endif}
							<blockquote style="background:#FFFFFF;border-right:1px solid #CCCCCC;border-top:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;">
								<h4 class="title">
									第{x2;eval: echo ($page-1)*20+v:qid}题
									<span class="pull-right">
										<a class="btn btn-danger qicon ajax" href="index.php?exam-app-favor-ajax-delfavor&favorid={x2;v:question['favorid']}"><i class="glyphicon glyphicon-remove"></i></a>
									</span>
								</h4>
								<div class="choice">
									{x2;realhtml:v:question['question']}
								</div>
								{x2;if:!$questypes[v:question['questiontype']]['questsort']}
								{x2;if:v:question['questionselect'] && $questype[v:question['questiontype']]['questchoice'] != 5}
								<div class="choice">
				                	{x2;realhtml:v:question['questionselect']}
				                </div>
				                {x2;endif}
			                    {x2;endif}
			                    <div class="selector" style="border-left:10px solid #EDEDED;position:relative;">
				                	<table class="table">
				                		<tr>
				                    		<td width="15%" style="border-top:0px;">正确答案：</td>
				                    		<td style="border-top:0px;">{x2;realhtml:v:question['questionanswer']}</td>
				                    	</tr>
				                    	<tr>
				                    		<td>所在章：</td>
				                    		<td>{x2;tree:v:question['qrknowsid'],knowsid,kid}{x2;$globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
				                    	</tr>
				                    	<tr>
				                    		<td>知识点：</td>
				                    		<td>{x2;tree:v:question['qrknowsid'],knowsid,kid}{x2;$globalknows[v:knowsid['knowsid']]['knows']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
				                    	</tr>
				                    	<tr>
				                    		<td>答案解析：</td>
				                    		<td>{x2;realhtml:v:question['questiondescribe']}</td>
				                    	</tr>
				                	</table>
				                </div>
							</div>
						{x2;eval:v:ishead++}
			            {x2;eval:v:pre=v:question['questionparent']}
					{x2;endtree}
					</div>
				{x2;else}
					{x2;tree:$favors['data'],question,qid}
					<div class="box itembox paperexamcontent">
						<h4 class="title">
							第{x2;eval: echo ($page-1)*20+v:qid}题【{x2;$questype[v:question['questiontype']]['questype']}】
							<span class="pull-right">
								<a class="btn btn-danger qicon ajax" href="index.php?exam-app-favor-ajax-delfavor&favorid={x2;v:question['favorid']}"><i class="glyphicon glyphicon-remove"></i></a>
							</span>
						</h4>
						<div class="choice">
							</a>{x2;realhtml:v:question['question']}
						</div>
						{x2;if:!$questype[v:question['questiontype']]['questsort']}
						{x2;if:v:question['questionselect'] && $questype[v:question['questiontype']]['questchoice'] != 5}
						<div class="choice">
		                	{x2;realhtml:v:question['questionselect']}
		                </div>
		                {x2;endif}
		                {x2;endif}
						<div class="selector decidediv" style="border-left:10px solid #CCCCCC;position:relative;">
		                	<table class="table">
		                		<tr>
		                    		<td width="15%" style="border-top:0px;">正确答案：</td>
		                    		<td style="border-top:0px;">{x2;realhtml:v:question['questionanswer']}</td>
		                    	</tr>
		                    	<tr>
		                    		<td>所在章：</td>
		                    		<td>{x2;tree:v:question['questionknowsid'],knowsid,kid}{x2;$globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
		                    	</tr>
		                    	<tr>
		                    		<td>知识点：</td>
		                    		<td>{x2;tree:v:question['questionknowsid'],knowsid,kid}{x2;$globalknows[v:knowsid['knowsid']]['knows']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
		                    	</tr>
		                    	<tr>
		                    		<td>答案解析：</td>
		                    		<td>{x2;realhtml:v:question['questiondescribe']}</td>
		                    	</tr>
		                	</table>
		                </div>
					</div>
					{x2;endtree}
				{x2;endif}
				<ul class="pagination pagination-right">{x2;$favors['pages']}</ul>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}