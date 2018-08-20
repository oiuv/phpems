{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a></li>
							<li>题冒题管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						题冒题管理
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-teach-rowsquestions-addquestionrows&page={x2;$page}{x2;$u}">题冒添加</a>
					</h4>
			        <form action="index.php?exam-teach-rowsquestions" method="post" class="form-inline">
						<table class="table">
							<tr>
								<td>
									试题ID：
								</td>
								<td>
									<input name="search[questionid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['questionid']}"/>
								</td>
								<td>
									录入时间：
								</td>
								<td>
									<input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
								</td>
								<td>
									关键字：
								</td>
								<td>
									<input class="form-control" name="search[keyword]" size="15" type="text" value="{x2;$search['keyword']}"/>
								</td>
							</tr>
					        <tr>
								<td>
									科目：
								</td>
								<td>
					        		<select name="search[questionsubjectid]" class="combox form-control" target="sectionselect" refUrl="?exam-teach-questions-ajax-getsectionsbysubjectid&subjectid={value}">
					        		<option value="0">选择科目</option>
							  		{x2;tree:$subjects,subject,sid}
							  		<option value="{x2;v:subject['subjectid']}"{x2;if:v:subject['subjectid'] == $search['questionsubjectid']} selected{x2;endif}>{x2;v:subject['subject']}</option>
							  		{x2;endtree}
							  		</select>
					        	</td>
					        	<td>
									章节：
								</td>
								<td>
							  		<select name="search[questionsectionid]" class="combox form-control" id="sectionselect" target="knowsselect" refUrl="?exam-teach-questions-ajax-getknowsbysectionid&sectionid={value}">
							  		<option value="0">选择章节</option>
							  		{x2;if:$sections}
							  		{x2;tree:$sections,section,sid}
							  		<option value="{x2;v:section['sectionid']}"{x2;if:v:section['sectionid'] == $search['questionsectionid']} selected{x2;endif}>{x2;v:section['section']}</option>
							  		{x2;endtree}
							  		{x2;endif}
							  		</select>
					        	</td>
					        	<td>
									知识点：
								</td>
								<td>
							  		<select name="search[questionknowsid]" id="knowsselect" class="form-control">
								  		<option value="">选择知识点</option>
								  		{x2;if:$knows}
								  		{x2;tree:$knows,know,kid}
								  		<option value="{x2;v:know['knowsid']}"{x2;if:v:know['knowsid'] == $search['questionknowsid']} selected{x2;endif}>{x2;v:know['knows']}</option>
								  		{x2;endtree}
								  		{x2;endif}
							  		</select>
					        	</td>
							</tr>
							<tr>
								<td>
									录入人：
								</td>
					        	<td>
					        		<input class="form-control" name="search[username]" size="15" type="text" value="{x2;$search['username']}"/>
					        	</td>
					        	<td>
									试题类型：
								</td>
								<td>
									<select name="search[questiontype]" class="form-control">
								  		<option value="0">类型不限</option>
								  		{x2;tree:$questypes,questype,qid}
								  		<option value="{x2;v:questype['questid']}">{x2;v:questype['questype']}</option>
								  		{x2;endtree}
							  		</select>
								</td>
								<td>
									难度：
								</td>
								<td>
									<select name="search[qrlevel]" class="form-control">
								  		<option value="0">难度不限</option>
										<option value="1"{x2;if:$search['qrlevel'] == 1} selected{x2;endif}>易</option>
										<option value="2"{x2;if:$search['qrlevel'] == 2} selected{x2;endif}>中</option>
										<option value="3"{x2;if:$search['qrlevel'] == 3} selected{x2;endif}>难</option>
							  		</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button class="btn btn-primary" type="submit">搜索</button>
									<input type="hidden" value="1" name="search[argsmodel]" />
								</td>
								<td colspan="4"></td>
							</tr>
						</table>
					</form>
					<form action="index.php?exam-teach-rowsquestions-batdel" method="post">
						<fieldset>
					        <table class="table table-hover table-bordered">
								<thead>
									<tr class="info">
					                    <th width="32"><input type="checkbox" class="checkall" target="delids"/></th>
					                    <th width="40">ID</th>
								        <th width="80">试题类型</th>
								        <th>试题内容</th>
										<th width="140">录入人/录入时间</th>
										<th width="140">删除人/删除时间</th>
								        <th width="48">难度</th>
								        <th width="140">操作</th>
					                </tr>
					            </thead>
					            <tbody>
				                    {x2;tree:$questions['data'],question,qid}
							        <tr>
										<td><input type="checkbox" name="delids[{x2;v:question['qrid']}]" value="1"></td>
										<td>
											{x2;v:question['qrid']}
										</td>
										<td>
											{x2;$questypes[v:question['qrtype']]['questype']}
										</td>
										<td>
											<a title="查看试题" class="selfmodal" href="javascript:;" url="index.php?exam-teach-rowsquestions-detail&questionid={x2;v:question['qrid']}&{x2;c:TIME}" data-target="#modal">{x2;substring:strip_tags(html_entity_decode(v:question['qrquestion'])),135}</a>
										</td>
										<td>
                                            {x2;v:question['qrusername']}<br />{x2;date:v:question['qrtime'],'Y-m-d'}
										</td>
										<td>
                                            {x2;if:v:question['qrdeler']}{x2;v:question['qrdeler']}<br />{x2;date:v:question['qrdeltime'],'Y-m-d'}{x2;endif}
										</td>
										<td>
											{x2;if:v:question['qrlevel']==2}中{x2;elseif:v:question['qrlevel']==3}难{x2;elseif:v:question['qrlevel']==1}易{x2;endif}
										</td>
										<td>
											<div class="btn-group">
					                    		<a class="btn" href="index.php?exam-teach-rowsquestions-rowsdetail&questionid={x2;v:question['qrid']}&page={x2;$page}{x2;$u}" title="子试题列表"><em class="glyphicon glyphicon-th-list"></em></a>
												<a class="btn" href="index.php?exam-teach-rowsquestions-modifyquestion&questionid={x2;v:question['qrid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
												<a class="btn confirm" href="index.php?exam-teach-rowsquestions-delquestion&questionid={x2;v:question['qrid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
					                    	</div>
										</td>
							        </tr>
							        {x2;endtree}
					        	</tbody>
					        </table>
					        <div class="form-group">
					            <div class="col-sm-9">
						            <label class="radio-inline">
						                <input type="radio" name="action" value="delete" checked/>删除
						            </label>
						            {x2;tree:$search,arg,sid}
						            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						            {x2;endtree}
						            <label class="radio-inline">
						            	<button class="btn btn-primary" type="submit">提交</button>
						            </label>
						            <input type="hidden" name="page" value="{x2;$page}"/>
						        </div>
					        </div>
					        <ul class="pagination pull-right">
					            {x2;$questions['pages']}
					        </ul>
						</fieldset>
					</form>
				</div>
			</div>
	        <div id="modal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
							<h4 id="myModalLabel">
								试题详情
							</h4>
						</div>
						<div class="modal-body"></div>
						<div class="modal-footer">
							 <button aria-hidden="true" class="btn btn-primary" data-dismiss="modal">关闭</button>
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