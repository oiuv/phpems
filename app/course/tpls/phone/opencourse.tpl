		<div class="pagecontent">
			<header class="container-fluid" style="background-color:#337AB7;">
				<h5 class="text-center">
					<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
					开通课程
					<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
				</h5>
			</header>
			<div class="container-fluid">
				<div class="row-fluid">
					<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem">
						<div class="col-xs-12" style="padding-top:30px;">
							<div class="thumbnail"><img alt="300x200" src="{x2;if:$course['csthumb']}{x2;$course['csthumb']}{x2;else}app/exam/styles/image/paper.png{x2;endif}" /></div>
						</div>
						<div class="col-xs-12">
							<div class="caption">
								<h4 class="title">{x2;$course['cstitle']}</h4>
								<p>&nbsp;</p>
								<p>您现有积分：{x2;$_user['usercoin']}</p>
								<p><a href="index.php?user-phone-payfor" class="ajax" data-target="page2" data-page="page2">积分不足？点此充值</a></p>
								{x2;if:$isopen}<p>到期时间：{x2;date:$isopen['ocendtime'],'Y-m-d'}</p>{x2;endif}
							</div>
							{x2;if:!$isopen}
							<form action="index.php?course-app-course-opencourse" method="post">
								{x2;if:!$course['csdemo']}
									{x2;if:$price}
									<p>
										<select name="opentype" class="form-control">
											{x2;tree:$price,p,pid}
											<option value="{x2;v:key}">{x2;v:p['price']}积分兑换{x2;v:p['time']}天</option>
											{x2;endtree}
										</select>
									</p>
									<p>&nbsp;</p>
									<p>
										<input value="{x2;$course['csid']}" name="csid" type="hidden"/>
										<input value="1" name="opencs" type="hidden"/>
										<input class="btn btn-primary btn-block" value="开通" type="submit"/>
									</p>
									{x2;else}
									<p>&nbsp;</p>
									<p>
										<input class="btn" value="请管理员先在后台设置价格" type="button"/>
									</p>
									{x2;endif}
								{x2;else}
								<p>&nbsp;</p>
								<p>
									<input value="{x2;$course['csid']}" name="csid" type="hidden"/>
									<input value="1" name="opencs" type="hidden"/>
									<input class="btn btn-primary btn-block" value="开通" type="submit"/>
								</p>
								{x2;endif}
							</form>
							{x2;else}
							<p>&nbsp;</p>
							<p>
								<a class="btn btn-primary" href="index.php?course-app-course&csid={x2;$course['csid']}">开始学习</a>
							</p>
							{x2;endif}
						</div>
					</div>
				</div>
			</div>
		</div>