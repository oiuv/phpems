		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				个人中心
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<h2 class="text-center">
				<img src="app/core/styles/img/logo2.png" style="width:6rem;">
			</h2>
			<h4 class="text-center">{x2;$_user['username']} 积分:{x2;$_user['usercoin']}</h4>
		</div>
		{x2;if:$_user['username'] != '888'}
		<div style="width:95%;margin:auto;margin-top:0.6rem;background-color:#FFFFFF;overflow:hidden;padding:1.2rem;">
			<a class="ajax" href="index.php?user-phone-payfor" data-target="page2" data-page="page2">积分充值 <span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
		</div>

		<div style="width:95%;margin:auto;margin-top:0.6rem;background-color:#FFFFFF;overflow:hidden;padding:1.2rem;">
			<a class="ajax" href="index.php?user-phone-privatement-modifypass" data-target="page2" data-page="page2">修改密码 <span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
		</div>
		{x2;endif}
		<div style="width:95%;margin:auto;margin-top:0.6rem;margin-bottom:4.8rem;background-color:#FFFFFF;overflow:hidden;padding:1.2rem;">
			<a href="index.php?user-phone-logout" class="ajax">退出登录 <span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
		</div>