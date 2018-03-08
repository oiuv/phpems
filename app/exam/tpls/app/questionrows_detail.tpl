				<table class="table table-hover">
					{x2;if:$question['qrknowsid']}
					<tr>
			          <td width="100">所属科目：</td>
			          <td>{x2;$subject['subject']}&nbsp;</td>
			        </tr>
			        <tr>
			          <td>所属章节：</td>
			          <td>{x2;tree:$sections,section,sid}{x2;v:section['section']}{x2;endtree}&nbsp;&nbsp;</td>
			        </tr>
			        <tr>
			          <td>所属知识点：</td>
			          <td>{x2;tree:$question['qrknowsid'],know,kid}{x2;v:know['knows']}{x2;endtree}&nbsp;&nbsp;</td>
			        </tr>
			        {x2;endif}
			        <tr>
			          <td width="100">题帽：</td>
			          <td>{x2;realhtml:$question['qrquestion']}</td>
			        </tr>
			        <tr>
			          <td>难度：</td>
			          <td>{x2;if:$question['qrlevel']==1}易{x2;elseif:$question['qrlevel']==2}中{x2;elseif:$question['qrlevel']==3}难{x2;endif}</td>
			        </tr>
				</table>
				{x2;tree:$question['data'],question,qid}
				<table class="table table-hover">
			        <tr>
			          <td width="100">第{x2;v:qid}题</td>
			          <td>&nbsp;</td>
			        </tr>
			        <tr>
			          <td>标题：</td>
			          <td>{x2;eval: echo html_entity_decode(v:question['question'])}</td>
			        </tr>
			        <tr>
			        	<td>备选项：</td>
			        	<td>
			          	{x2;realhtml:v:question['questionselect']}
						</td>
			        </tr>
			        <tr>
			          <td>答案：</td>
			          <td>{x2;realhtml: v:question['questionanswer']}</td>
			        </tr>
			        <tr>
			          <td>解析：</td>
			          <td>{x2;realhtml: v:question['questiondescribe']}</td>
			        </tr>
				</table>
				{x2;endtree}