	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				我的收藏
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
					<ul class="nav nav-pills">
						<li{x2;if:!$type} class="active"{x2;endif}>
							<a href="index.php?exam-phone-favor" class="ajax">普通试题</a>
						</li>
						<li{x2;if:$type} class="active"{x2;endif}>
							<a href="index.php?exam-phone-favor&type=1" class="ajax">题冒题</a>
						</li>
					</ul>
				</div>
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
					<form action="index.php?exam-phone-favor" method="post" class="form-inline" style="padding-top:10px;" data-target="favor">
						<blockquote class="questype">
							<table width="100%">
								<tr>
									<td width="70%">
										<select name="search[questype]" class="form-control" autocomplete="off">
				                        	<option value="0">请选择题型</option>
				                        	{x2;tree:$questype,quest,qid}
				                    		<option value="{x2;v:quest['questid']}"{x2;if:$search['questype'] == v:quest['questid']} selected{x2;endif}>{x2;v:quest['questype']}</option>
				                    		{x2;endtree}
				                        </select>
									</td>
									<td width="30%">
										<button class="btn btn-primary pull-right" type="submit">提交</button>
										<input type="hidden" value="{x2;$type}" name="type" />
									</td>
								</tr>
							</table>
						</blockquote>
					</form>
				</div>
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
					{x2;if:$type}
						{x2;eval:v:ishead = 0}
						{x2;eval:v:ispre = 0}
						{x2;tree:$favors['data'],question,qid}
							{x2;if:v:pre != v:question['questionparent']}
							{x2;eval:v:ishead = 0}
							{x2;endif}
							<div class="paperexamcontent">
								{x2;if:!v:ishead}
								<h4 class="title">
									【{x2;$questype[v:question['questiontype']]['questype']}】
								</h4>
								<div class="choice">
									{x2;realhtml:v:question['qrquestion']}
								</div>
								{x2;endif}
								<hr />
								<div style="padding:0rem 1.5rem;">
									<h4 class="title">
										第{x2;eval: echo ($page-1)*20+v:qid}题
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
				                    <div class="selector" style="margin-top:0.5rem;">
					                	<table class="table table-hover table-bordered">
					                		<tr class="info">
					                    		<td style="border-top:0px;">正确答案：</td>
					                    	</tr>
					                    	<tr>
					                    		<td style="border-top:0px;">{x2;realhtml:v:question['questionanswer']}</td>
					                    	</tr>
					                    	<tr class="info">
					                    		<td>所在章：</td>
					                    	</tr>
					                    	<tr>
					                    		<td>{x2;tree:v:question['qrknowsid'],knowsid,kid}{x2;$globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
					                    	</tr>
					                    	<tr class="info">
					                    		<td>知识点：</td>
					                    	</tr>
					                    	<tr>
					                    		<td>{x2;tree:v:question['qrknowsid'],knowsid,kid}{x2;$globalknows[v:knowsid['knowsid']]['knows']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
					                    	</tr>
					                    	<tr class="info">
					                    		<td>答案解析：</td>
					                    	</tr>
					                    	<tr>
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
						<div class="paperexamcontent">
							<h4 class="title">
								第{x2;eval: echo ($page-1)*20+v:qid}题【{x2;$questype[v:question['questiontype']]['questype']}】
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
							<div class="selector decidediv" style="margin-top:0.5rem;">
			                	<table class="table table-hover table-bordered">
			                		<tr class="info">
			                    		<td style="border-top:0px;">正确答案：</td>
			                    	</tr>
			                    	<tr>
			                    		<td style="border-top:0px;">{x2;realhtml:v:question['questionanswer']}</td>
			                    	</tr>
			                    	<tr class="info">
			                    		<td>所在章：</td>
			                    	</tr>
			                    	<tr>
			                    		<td>{x2;tree:v:question['questionknowsid'],knowsid,kid}{x2;$globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
			                    	</tr>
			                    	<tr class="info">
			                    		<td>知识点：</td>
			                    	</tr>
			                    	<tr>
			                    		<td>{x2;tree:v:question['questionknowsid'],knowsid,kid}{x2;$globalknows[v:knowsid['knowsid']]['knows']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
			                    	</tr>
			                    	<tr class="info">
			                    		<td>答案解析：</td>
			                    	</tr>
			                    	<tr>
			                    		<td>{x2;realhtml:v:question['questiondescribe']}</td>
			                    	</tr>
			                	</table>
			                </div>
						</div>
						{x2;endtree}
					{x2;endif}
					<ul class="pagination pagination-right">{x2;$favors['pages']}</ul>
				</div>
			</div>
		</div>
	</div>