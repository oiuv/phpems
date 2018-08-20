						<table class="table table-hover table-bordered" style="width:86%;margin:auto;">
							{x2;if:$sections}
							{x2;tree:$sections,section,sid}
							<tr class="info">
								<td colspan="3">{x2;v:section['section']}</td>
							</tr>
							<tr>
								{x2;tree:$knows[v:section['sectionid']],know,kid}
								<td><input type="checkbox" value="{x2;v:know['knowsid']}"/> {x2;v:know['knows']}</td>
								{x2;if:v:kid % 3 == 0}
								</tr><tr>
								{x2;endif}
								{x2;endtree}
							</tr>
							{x2;endtree}
							{x2;else}
							<tr class="info">
								<td colspan="3">请先选择科目</td>
							</tr>
							{x2;endif}
						</table>