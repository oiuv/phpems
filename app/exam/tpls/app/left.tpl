	<!--主体左侧-->
	<div id="main_left" {x2;if:$nouseleft}class="main_left0"{x2;else}class="main_left"{x2;endif}>
    	<div id="lesson_nav_top"></div>
    	<div id="lesson_nav_mid">
        	<!--科目导航-->
			<ul id="lesson_menu" class="menu">
              <li>
                <div class="menu-hd"><span id="lesson-current"><a rel="reload" class="collapsible" href="#zl_{x2;$data['currentbasic']['basicid']}">{x2;substring:$data['currentbasic']['basic'],27}</a></span></div>
                <div id="zl_{x2;$data['currentbasic']['basicid']}" class="menu-bd" style="display:none">
                  <dl>
                  	{x2;tree:$data['openbasics'],basic,bid}
                  	<dd><a title="{x2;v:basic['basic']}" href="#zl_{x2;v:basic['basicid']}" onclick="javascript:$.get('index.php?{x2;$_app}-app-index-setCurrentBasic&basicid={x2;v:basic['basicid']}&'+Math.random(),function(data){window.location.reload();});">{x2;substring:v:basic['basic'],27}</a></dd>
                  	{x2;if:v:bid > 5}
                  	{x2;eval:break;}
                  	{x2;endif}
                  	{x2;endtree}
                  </dl>
                </div>
              </li>
    		</ul>
            <ol class="menu_con">
      			<!--
      			<li{x2;if:$method == 'basics'} class="on"{x2;endif}><a href="?exam-app-basics">我的考场</a></li>
      			-->
      			<li{x2;if:$method == 'exercise'} class="on"{x2;endif}><a href="?exam-app-exercise">强化训练</a></li>
                <li{x2;if:$method == 'exampaper'} class="on"{x2;endif}><a href="?exam-app-exampaper">随机考试</a></li>
                <li{x2;if:$method == 'exam'} class="on"{x2;endif}><a href="?exam-app-exam">正式考试</a></li>
                <li{x2;if:$method == 'record'} class="on"{x2;endif}><a href="?exam-app-record">我的错题</a></li>
                <li{x2;if:$method == 'favor'} class="on"{x2;endif}><a href="?exam-app-favor">我的收藏</a></li>
                <li{x2;if:$method == 'history'} class="on"{x2;endif}><a href="?exam-app-history">答题记录</a></li>
         	</ol>
          <!--科目导航 结束-->
        </div>
    	<div id="lesson_nav_bottom"></div>
    </div>
	<!--主体左侧 结束-->