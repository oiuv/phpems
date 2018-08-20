	        <script type="text/javascript">
	    	function selectexams(o,d){
	    		d = $('#'+d);
	    		s = d.val();
	    		if(s == '')s= ',';
	    		else
	    		s = ','+s+',';
	    		if($(o).is(':checked')){
					if(s.indexOf(','+$(o).val()+',') < 0){
						s = s+$(o).val()+',';
						s = s.substring(1,s.length-1);
					}
				}
				else{
					if(s.indexOf(','+$(o).val()+',') >= 0){
						var t = eval('/,'+$(o).val()+',/');
						s = s.replace(t,',');
						s = s.substring(1,s.length-1);
					}
				}
				if(s == ',' || s == ',,')s = '';
				d.val(s);
	    	}

	    	function markSelectedExams(n,o)
	    	{
	    		$("[name='"+n+"']").each(function(){if((','+$('#'+o).val()+',').indexOf(','+$(this).val()+',') >= 0)$(this).attr('checked',true);});
	    	}

	    	function selectall(obj,a){
	    		$(".sbox").prop('checked', $(obj).is(':checked'));
	    		$(".sbox").each(function(){
	    			selectexams(this,a);
	    		});
	    	}
	    	</script>
	        <table class="table table-hover table-bordered">
				<thead>
					<tr class="info">
	                    <th>ID</th>
				        <th>角色名</th>
	                </tr>
	            </thead>
	            <tbody>
                    {x2;tree:$actors['data'],actor,aid}
			        <tr>
						<td>
							<input rel="1" class="sbox" type="checkbox" name="ids[]" value="{x2;v:actor['groupid']}" onclick="javascript:selectexams(this,'{x2;$target}')"/>
						</td>
						<td>
							{x2;v:actor['groupname']}
						</td>
			        </tr>
			        {x2;endtree}
	        	</tbody>
	        </table>
	        <div class="pagination pagination-right">
	            <ul>{x2;$actors['pages']}</ul>
	        </div>
	        <script type="text/javascript">
	    		jQuery(function($) {
					markSelectedExams('ids[]','{x2;$target}');
	    		});
	    	</script>