					{x2;tree:$child,category,cid}
					<tr class="submenu{x2;$catid}">
						<td><input type="text" name="ids[{x2;v:category['catid']}]" value="{x2;v:category['catlite']}" style="width:24px;padding:2px 5px;"/></td>
						<td>{x2;v:category['catid']}</td>
						<td><img src="{x2;if:v:category['catthumb']}{x2;v:category['catthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
						<td><a onclick="javascript:openmenu(this);" href="javascript:void(0);" class="icon-plus-sign catool" rel="{x2;v:category['catid']}" data="0" app="{x2;$_app}"></a><span>{x2;v:category['catname']}</span></td>
						<td>
							<div class="btn-group">
								<a class="btn" href="index.php?{x2;$_app}-master-category-edit&page={x2;$page}&catid={x2;v:category['catid']}{x2;$u}"><em class="icon-edit"></em></a>
								<a class="btn ajax" href="index.php?{x2;$_app}-master-category-del&catid={x2;v:category['catid']}&page={x2;$page}{x2;$u}"><em class="icon-remove"></em></a>
							</div>
						</td>
					</tr>
					{x2;endtree}