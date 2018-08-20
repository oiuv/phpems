{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main box">
			<div class="col-xs-7" style="padding:15px;">
				<img src="app/core/styles/img/login.jpg" />
			</div>
			<div class="col-xs-4 pull-right" style="margin:0px 30px 0px auto;background-color:#FFFFFF;">
				<form class="col-xs-12" method="post" action="index.php?user-app-register-findpassword">
					<h4 class="title" style="line-height:3em;margin-bottom:10px;">找回密码</h4>
					<div class="form-group input-group">
						<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-user" style="font-size:16px;"></a></span>
						<input class="form-control" name="args[username]" datatype="userName" needle="needle" msg="请你输入用户名" placeholder="请输入用户名" style="height:44px;line-height:24px;font-size:16px;">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-envelope" style="font-size:16px;"></a></span>
						<input class="form-control" name="args[useremail]" id="email" datatype="email" needle="needle" msg="请输入邮箱" placeholder="请输入邮箱" style="height:44px;line-height:24px;font-size:16px;">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-lock" style="font-size:16px;"></a></span>
						<input class="form-control"  name="args[userpassword]" datatype="password" needle="needle" msg="请输入新密码" placeholder="请输入新密码" type="password" style="height:44px;line-height:24px;font-size:16px;">
					</div>
                    {x2;if:$app['appsetting']['emailverify']}
					<div class="form-group" style="overflow:hidden;">
						<div class="col-sm-8" style="padding-left:0px;">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-exclamation-sign" style="font-size:15px;"></a></span>
								<input class="form-control" type="text" maxlength="4" placeholder="请输入验证码" name="randcode" style="height:44px;line-height:24px;font-size:15px;width:150px;"/>
							</div>
						</div>
						<div class="col-xs-4" style="padding-right: 0px;">
							<button type="button" class="btn btn-danger pull-right" id="sendphonecode" style="height:44px;line-height:24px;font-size:15px;">发送验证码</button>
						</div>
					</div>
                    {x2;endif}
					{x2;if:$app['appsetting']['emailverify']}
					<button type="submit" class="btn btn-primary btn-block" style="height:44px;line-height:32px;font-size:16px;margin-top:30px;">重置密码</button>
					{x2;else}
					<button type="button" class="btn btn-primary btn-block" style="height:44px;line-height:32px;font-size:16px;margin-top:30px;">未开启邮箱验证</button>
					{x2;endif}
					<input type="hidden" value="1" name="findpassword"/>
					<a class="btn btn-default btn-block" href="index.php?user-app-login" style="height:44px;line-height:32px;font-size:16px;margin-top:10px;">登录</a>
				</form>
			</div>
		</div>
	</div>
</div>
{x2;if:$app['appsetting']['emailverify']}
<script>
    var sendstatus = true;
    $('#sendphonecode').click(function(){
        var _this = $(this);
        if(sendstatus)
        {
            $.getJSON('index.php?core-api-index-sendmail&action=findpassword&email='+$('#email').val()+'&userhash='+Math.random(),function(data){
                if(parseInt(data.statusCode) == 200)
                {
                    _this.html('120秒重发');
                    sendstatus = false;
                    sendtime = 120;
                    sendevent = setInterval(function(){
                        if(sendtime > 0)
                        {
                            sendtime--;
                            _this.html(sendtime+'秒重发');
                        }
                        else
                        {
                            sendstatus = true;
                            _this.html('发送验证码');
                            clearInterval(sendevent);
                        }
                    },1000);
                }
                else
                {
                    $.zoombox.show('ajax',data);
                }
            });
        }
    });
</script>
{x2;endif}
{x2;include:footer}
</body>
</html>