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
					{x2;$basic['basic']}
					<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
				</h5>
			</header>
			<div class="container-fluid">
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem">
					<div class="col-xs-12">
						<h4 class="text-center" style="padding:1rem;">{x2;$basic['basic']}</h4>
						<div class="col-xs-5">
							<div class="thumbnail"><img alt="300x200" src="{x2;if:$basic['basicthumb']}{x2;$basic['basicthumb']}{x2;else}app/exam/styles/image/paper.png{x2;endif}" /></div>
						</div>
						<div class="caption" class="col-xs-7">
							<p>科目：{x2;$subjects[$basic['basicsubjectid']]['subject']}</p>
							<p>地区：{x2;$areas[$basic['basicareaid']]['area']}</p>
							<p>您现有积分：{x2;$_user['usercoin']} <!--（<a href="index.php?user-center-payfor">支付宝充值</a> / <a href="#myModal" role="button" data-toggle="modal">代金券充值</a>） --></p>
							<p><a href="index.php?user-center-payfor" class="ajax" data-target="user-payfor" data-page="user-payfor">积分不足？点此充值</a></p>
							{x2;if:$isopen}<p>到期时间：{x2;date:$isopen['obendtime'],'Y-m-d'}</p>{x2;endif}
						</div>
						<hr style="clear:both"/>
						{x2;if:!$isopen}
						<form action="index.php?exam-phone-basics-openit" method="post" data-target="mybasic" data-page="mybasic">
							{x2;if:!$basic['basicdemo']}
								{x2;if:$price}
								<p>
									<select name="opentype" class="form-control">
										{x2;tree:$price,p,pid}
										<option value="{x2;v:key}">{x2;v:p['price']}积分兑换{x2;v:p['time']}天</option>
										{x2;endtree}
									</select>
								</p>
								{x2;if:$allowopen}
								<p>
									<input value="{x2;$basic['basicid']}" name="basicid" type="hidden"/>
									<input class="btn btn-primary btn-block" value="开通" type="submit"/>
								</p>
								{x2;else}
								<p>
									<input value="{x2;$basic['basicid']}" name="basicid" type="hidden"/>
									<input class="btn btn-default btn-block" value="您所在的用户组不能开通本考场" type="button"/>
								</p>
								{x2;endif}
								{x2;else}
								<p>
									<input class="btn btn-block" value="请管理员先在后台设置价格" type="button"/>
								</p>
								{x2;endif}
							{x2;else}
								{x2;if:$allowopen}
								<p>
									<input value="{x2;$basic['basicid']}" name="basicid" type="hidden"/>
									<input class="btn btn-primary btn-block" value="开通" type="submit"/>
								</p>
								{x2;else}
								<p>
									<input value="{x2;$basic['basicid']}" name="basicid" type="hidden"/>
									<input class="btn btn-default btn-block" value="您所在的用户组不能开通本考场" type="button"/>
								</p>
								{x2;endif}
							{x2;endif}
						</form>
						{x2;else}
						<p>
							<a class="btn btn-primary ajax btn-block" href="index.php?exam-phone-index-setCurrentBasic&basicid={x2;$basic['basicid']}">进入考场</a>
						</p>
						{x2;endif}
					</div>
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