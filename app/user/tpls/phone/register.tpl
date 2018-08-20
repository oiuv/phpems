		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				用户注册
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
    	<div style="width:90%;margin:auto;margin-bottom:1rem;">
	    	<h2 class="text-center">
				<img src="app/core/styles/img/logo2.png" style="width:6rem;">
			</h2>
			<h4 class="text-center" style="padding:1rem;">用户注册</h4>
			<form class="col-xs-12" method="post" action="index.php?user-phone-register">
				<div class="form-group input-group">
					<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-user"></a></span>
					<input type="hidden" value="1" name="userregister"/>
					<input class="form-control" name="args[username]" datatype="userName" needle="needle" msg="请你输入用户名" placeholder="请输入用户名">
				</div>
				<div class="form-group input-group">
					<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-envelope"></a></span>
					<input type="hidden" value="1" name="userregister"/>
					<input class="form-control" name="args[useremail]" id="user-register-email" datatype="email" needle="needle" msg="请输入邮箱" placeholder="请输入邮箱">
				</div>
				<div style="clear:both">
					<div class="col-xs-8" style="padding-left:0px;margin-left:0px;">
						<div class="form-group input-group">
							<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-exclamation-sign"></a></span>
							<input class="form-control" name="randcode" datatype="number" needle="needle" msg="请输入验证码" placeholder="请输入验证码" type="text">
						</div>
					</div>
					<div class="col-xs-4" style="padding-right: 0px;">
						<button type="button" class="btn btn-default pull-right" id="sendphonecode">发送验证码</button>
					</div>
				</div>
				<div class="form-group input-group" style="clear:both">
					<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-lock"></a></span>
					<input class="form-control"  name="args[userpassword]" datatype="password" needle="needle" msg="请你输入密码" placeholder="请输入密码" type="password">
				</div>
				<div class="form-group input-group">
					<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-lock"></a></span>
					<input class="form-control"  name="repeatpassword" datatype="password" needle="needle" msg="请再次输入密码" placeholder="请再次输入密码" type="password">
				</div>
        		{x2;if:$app['appsetting']['registype']}
				{x2;tree:$forms,form,fid}
				<div class="form-group input-group">
					<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-config"></a></span>
					{x2;v:form['html']}
				</div>
                {x2;endtree}
				{x2;endif}
				{x2;if:$app['appsetting']['closeregist']}
				<button type="button" class="btn btn-primary btn-block" style="line-height:3rem;">管理员禁止用户注册</button>
				{x2;else}
				<button type="submit" class="btn btn-primary btn-block" style="line-height:3rem;">注册</button>
				{x2;endif}
				<a class="btn btn-default btn-block ajax" href="index.php?user-phone-login" data-target="userlogin" data-page="userlogin" style="line-height:3rem;">登录</a>
			</form>
		</div>
		<script>
            if("undefined" != typeof sendevent)clearInterval(sendevent);
            else
			{
				var sendstatus = true;
			}
            sendstatus = true;
            $('#sendphonecode').click(function(){
                var _this = $(this);
                if(sendstatus)
                {
                    $.getJSON('index.php?core-api-index-sendmail&action=reg&email='+$('#user-register-email').val()+'&userhash='+Math.random(),function(data){
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