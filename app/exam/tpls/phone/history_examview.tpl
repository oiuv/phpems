	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				{x2;$sessionvars['examsession']}
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage($('#page1'));"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="col-xs-12" style="padding:0px;">
					{x2;eval: v:oid = 0}
					{x2;eval: v:qcid = 0}
					{x2;tree:$sessionvars['examsessionsetting']['examsetting']['questypelite'],lite,qid}
					{x2;if:v:lite}
					{x2;eval: v:quest = v:key}
					{x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
					{x2;eval: v:oid++}
					<h4 class="title questionpanel" id="questype_{x2;v:quest}">{x2;$ols[v:oid]}、{x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']}</h4>
					{x2;eval: v:tid = 0}
					{x2;if:is_array($sessionvars['examsessionquestion']['questions'][v:quest])}
	                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
	                {x2;eval: v:tid++}
	                {x2;eval: v:qcid++}
					<div class="paperexamcontent" id="questions_{x2;v:question['questionid']}" rel="{x2;v:quest}" style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
						<h4 class="title">
							第{x2;v:tid}题
							<span class="pull-right">
								<a class="btn text-primary qicon" onclick="javascript:favorquestion('{x2;v:question['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
								<a name="question_{x2;v:question['questionid']}"></a>
								<input id="time_{x2;v:question['questionid']}" type="hidden" name="time[{x2;v:question['questionid']}]"/>
							</span>
						</h4>
						<div class="choice">
							{x2;realhtml:v:question['question']}
						</div>
						{x2;if:!$questype[v:quest]['questsort']}
						{x2;if:v:question['questionselect'] && $questype[v:quest]['questchoice'] != 5}
						<div class="choice" style="padding-bottom:0.5rem;">
	                    	{x2;realhtml:v:question['questionselect']}
	                    </div>
	                    {x2;endif}
	                    {x2;endif}
						<div class="decidediv" style="position:relative;">
		                	{x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}<div class="right"></div>{x2;else}<div class="wrong"></div>{x2;endif}
		                	<table class="table table-hover table-bordered">
	            				<tr>
		                			<th style="border-top:0px;">本题得分：{x2;$sessionvars['examsessionscorelist'][v:question['questionid']]}分{x2;if:$sessionvars['examsessiontimelist'][v:question['questionid']]} &nbsp;&nbsp;做题时间：{x2;date:$sessionvars['examsessiontimelist'][v:question['questionid']],'Y-m-d H:i:s'}{x2;endif}</th>
		                		</tr>
		                		<tr class="info">
		                    		<td>正确答案：</td>
		                    	</tr>
		                		<tr>
		                    		<td>{x2;realhtml:v:question['questionanswer']}</td>
		                    	</tr>
		                    	<tr class="info">
		                    		<td>您的答案：</td>
		                    	</tr>
		                		<tr>
		                        	<td>{x2;if:is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:$sessionvars['examsessionuseranswer'][v:question['questionid']]}{x2;endif}</td>
		                    	</tr>
		                    	<tr class="info">
		                    		<td>所在章：</td>
		                    	</tr>
		                		<tr>
		                    		<td>{x2;tree:v:question['questionknowsid'],knowsid,kid}{x2;$globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
		                    	</tr>
		                    	<tr class="info">
		                    		<td>知识点：</td>
		                    	</tr>
		                		<tr>
		                    		<td>{x2;tree:v:question['questionknowsid'],knowsid,kid}{x2;$globalknows[v:knowsid['knowsid']]['knows']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
		                    	</tr>
		                    	<tr class="info">
		                    		<td>答案解析：</td>
		                    	</tr>
		                		<tr>
		                    		<td>{x2;realhtml:v:question['questiondescribe']}</td>
		                    	</tr>
		                	</table>
		                </div>
					</div>
					{x2;endtree}
					{x2;endif}
					{x2;if:is_array($sessionvars['examsessionquestion']['questionrows'][v:quest])}
					{x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
	                {x2;eval: v:tid++}
					<div class="paperexamcontent" id="questions_{x2;v:data['questionid']}" rel="{x2;v:quest}" style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
						<h4 class="title">第{x2;v:tid}题
							<span class="pull-right">
								<a class="btn text-primary qicon" onclick="javascript:favorquestion('{x2;v:data['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
								<a name="question_{x2;v:data['questionid']}"></a>
								<input id="time_{x2;v:data['questionid']}" type="hidden" name="time[{x2;v:data['questionid']}]"/>
							</span>
						</h4>
						<div class="choice">
							{x2;realhtml:v:questionrow['qrquestion']}
						</div>
						{x2;tree:v:questionrow['data'],data,did}
		            	{x2;eval: v:qcid++}
		                <hr />
		                <div style="padding:0rem 1.5rem;margin-top:1rem;">
							<div class="choice">
								<span class="badge badge-primary">{x2;v:did}</span>{x2;realhtml:v:data['question']}
							</div>
							{x2;if:!$questype[v:quest]['questsort']}
							{x2;if:v:data['questionselect'] && $questype[v:quest]['questchoice'] != 5}
							<div class="choice" style="padding-bottom:0.5rem;">
		                    	{x2;realhtml:v:data['questionselect']}
		                    </div>
		                    {x2;endif}
		                    {x2;endif}
							<div class="decidediv" style="position:relative;">
			                	{x2;if:$sessionvars['examsessionscorelist'][v:data['questionid']] && $sessionvars['examsessionscorelist'][v:data['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}<div class="right"></div>{x2;else}<div class="wrong"></div>{x2;endif}
			                	<table class="table table-hover table-bordered">
		            				<tr>
			                			<th style="border-top:0px;">本题得分：{x2;$sessionvars['examsessionscorelist'][v:data['questionid']]}分{x2;if:$sessionvars['examsessiontimelist'][v:data['questionid']]} &nbsp;&nbsp;做题时间：{x2;date:$sessionvars['examsessiontimelist'][v:data['questionid']],'Y-m-d H:i:s'}{x2;endif}</th>
			                		</tr>
			                		<tr class="info">
			                    		<td>正确答案：</td>
			                    	</tr>
		                			<tr>
			                    		<td>{x2;realhtml:v:data['questionanswer']}</td>
			                    	</tr>
			                    	<tr class="info">
			                    		<td>您的答案：</td>
			                    	</tr>
		                			<tr>
			                        	<td>{x2;if:is_array($sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;else}{x2;realhtml:$sessionvars['examsessionuseranswer'][v:data['questionid']]}{x2;endif}</td>
			                    	</tr>
			                    	<tr class="info">
			                    		<td>所在章：</td>
			                    	</tr>
		                			<tr>
			                    		<td>{x2;tree:v:questionrow['qrknowsid'],knowsid,kid}{x2;$globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
			                    	</tr>
			                    	<tr class="info">
			                    		<td>知识点：</td>
			                    	</tr>
		                			<tr>
			                    		<td>{x2;tree:v:questionrow['qrknowsid'],knowsid,kid}{x2;$globalknows[v:knowsid['knowsid']]['knows']}&nbsp;&nbsp;&nbsp;{x2;endtree}</td>
			                    	</tr>
			                    	<tr class="info">
			                    		<td>答案解析：</td>
			                    	</tr>
		                			<tr>
			                    		<td>{x2;realhtml:v:data['questiondescribe']}</td>
			                    	</tr>
			                	</table>
			                </div>
						</div>
						{x2;endtree}
					</div>
					{x2;endtree}
					{x2;endif}
					{x2;endif}
					{x2;endif}
					{x2;endtree}
				</div>
			</div>
		</div>
	</div>