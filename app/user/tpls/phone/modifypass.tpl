	<header class="container-fluid" style="background-color:#337AB7;">
		<h5 class="text-center">
			<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
			<span class="ttlo">密码修改</span>
			<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
		</h5>
	</header>
	<div style="clear:both" class="col-xs-12">
		<form action="index.php?user-phone-privatement-modifypass" method="post" class="form-horizontal" style="padding:20px;">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-sm-2">旧密码：</label>
					<div class="col-sm-10"><input id="oldpassowrd" type="password" class="form-control" value="" name="oldpassword" needle="needle" datatype="password" msg="密码字数必须在6位以上"/></div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">新密码：</label>
					<div class="col-sm-10"><input id="modpassword1" type="password" class="form-control" value="" name="args[password]" needle="needle" datatype="password" msg="密码字数必须在6位以上"/></div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">重复密码：</label>
					<div class="col-sm-10"><input id="modpassword2" type="password" class="form-control" value="" name="args[password2]" needle="needle" equ="modpassword1" msg="前后两次密码必须一致且不能为空"/></div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-10">
						<button class="btn btn-primary btn-block" type="submit">提交</button>
						<input type="hidden" name="modifyuserpassword" value="1"/>
						<input type="hidden" name="page" value="{x2;$page}"/>
						{x2;tree:$search,arg,aid}
						<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						{x2;endtree}
					</div>
				</div>
			</fieldset>
		</form>
	</div>