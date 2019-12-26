{x2;include:header}
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="pages">
            {x2;include:nav}
			<div class="content">
				<div class="col-xs-9">
					<div class="content-box padding">
						<h2 class="title">申请证书</h2>
						<form action="index.php?certificate-app-certificate-apply" method="post">
							<ul class="list-unstyled list-img">
								<li class="border morepadding">
									<h4 class="shorttitle text-center">{x2;$ce['cetitle']}</h4>
									<div class="intro">
										<div class="desc">
											{x2;realhtml:$ce['cetext']}
										</div>
									</div>
								</li>
								<li class="border morepadding">
									<div class="intro">
										<div class="desc">
											<table class="table table-bordered">
												<tr>
													<td width="15%">证书名称：</td>
													<td width="35%">{x2;$ce['cetitle']}</td>
													<td width="15%">申请费用：</td>
													<td width="35%">{x2;$ce['ceprice']}积分 <a class="badge" target="_blank" href="index.php?user-center-payfor">充值</a> </td>
												</tr>
												<tr>
													<td>需过考试：</td>
													<td>{x2;$basic['basic']}</td>
													<td>加入时间：</td>
													<td>{x2;date:$ce['cetime'],'Y-m-d'}</td>
												</tr>
												<tr>
													<td>身份证号：</td>
													<td>{x2;$_user['userpassport']} <a class="badge" title="修改后请刷新本页面" target="_blank" href="index.php?user-center-privatement">修改</a></td>
													<td>姓名：</td>
													<td>{x2;$_user['usertruename']}</td>
												</tr>
												<tr>
													<td>地址：</td>
													<td><input needle="needle" msg="请填写地址" type="text" placeholder="请填写地址" name="useraddress" value="{x2;$_user['useraddress']}"></td>
													<td>联系电话：</td>
													<td><input needle="needle" mas="请填写联系电话" type="text" placeholder="请填写联系电话" name="userphone" value="{x2;$_user['userphone']}"></td>
												</tr>
											</table>
										</div>
									</div>
								</li>
								<li class="border morepadding">
									<div class="intro">
										<div class="desc text-center">
											<button type="submit" class="btn btn-info" >申请证书</button>
											<input type="hidden" name="ceid" value="{x2;$ce['ceid']}">
											<input type="hidden" name="apply" value="1">
										</div>
									</div>
								</li>
							</ul>
						</form>
					</div>
				</div>
				<div class="col-xs-3 nopadding">
					<div class="content-box padding">
						<h2 class="title">推荐证书<a href="index.php?certificate-app" class="badge pull-right">我的证书 </a> </h2>
						<ul class="list-unstyled list-img">
                            {x2;tree:$news,content,cid}
							<li class="border padding">
								<a href="index.php?course-app-course&csid={x2;v:content['csid']}">
									<div class="intro">
										<div class="col-xs-5 img noleftpadding">
											<img src="{x2;if:v:content['csthumb']}{x2;v:content['csthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
										</div>
										<div class="desc">
											<p>{x2;v:content['cstitle']}</p>
										</div>
									</div>
								</a>
							</li>
                            {x2;endtree}
						</ul>
					</div>
				</div>
			</div>
            {x2;include:footer}
		</div>
	</div>
</div>
</body>
</html>