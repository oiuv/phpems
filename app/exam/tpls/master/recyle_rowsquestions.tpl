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
							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
							<li><a href="index.php?exam-master-recyle">回收站</a></li>
							<li class="active">已删题冒题</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						已删题冒题
						<a class="btn btn-primary pull-right" href="index.php?exam-master-recyle">回收站</a>
					</h4>
			        <table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
			                    <th>ID</th>
						        <th>试题类型</th>
						        <th>试题内容</th>
						        <th>录入人</th>
						        <th>录入时间</th>
						        <th>难度</th>
						        <th>操作</th>
			                </tr>
			            </thead>
			            <tbody>
		                    {x2;tree:$questions['data'],question,qid}
					        <tr>
								<td>
									{x2;v:question['qrid']}
								</td>
								<td>
									{x2;$questypes[v:question['qrtype']]['questype']}
								</td>
								<td>
									<a title="查看试题" class="selfmodal" href="javascript:;" url="index.php?exam-master-rowsquestions-detail&questionid={x2;v:question['qrid']}&{x2;c:TIME}" data-target="#modal">{x2;realsubstring: v:question['qrquestion'],120}</a>
								</td>
								<td>
									{x2;v:question['qrusername']}
								</td>
								<td>
									{x2;date:v:question['qrtime'],'Y-m-d'}
								</td>
								<td>
									{x2;if:v:question['qrlevel']==2}中{x2;elseif:v:question['qrlevel']==3}难{x2;elseif:v:question['qrlevel']==1}易{x2;endif}
								</td>
								<td>
									<div class="btn-group">
			                    		<a class="btn ajax" href="index.php?exam-master-rowsquestions-backquestion&page={x2;$page}&questionid={x2;v:question['qrid']}{x2;$u}" title="恢复本题将会恢复本题下所有已删除子题"><em class="glyphicon glyphicon-edit"></em></a>
										<a class="btn ajax" href="index.php?exam-master-recyle-finaldelrowsquestion&page={x2;$page}&questionid={x2;v:question['qrid']}{x2;$u}" title="彻底删除"><em class="glyphicon glyphicon-remove"></em></a>
			                    	</div>
			                    </td>
					        </tr>
					        {x2;endtree}
			        	</tbody>
			        </table>
			        <ul class="pagination pull-right">
						{x2;$questions['pages']}
					</ul>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
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
{x2;include:footer}
</body>
</html>
{x2;endif}