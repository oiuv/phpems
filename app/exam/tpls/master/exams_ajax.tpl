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
				        <th>考试名称</th>
				        <th>组卷人</th>
				        <th>组卷类型</th>
				        <th>组卷时间</th>
	                </tr>
	            </thead>
	            <tbody>
                    {x2;tree:$exams['data'],exam,eid}
			        <tr>
						<td>
							<input rel="1" class="sbox" type="checkbox" name="ids[]" value="{x2;v:exam['examid']}" onclick="javascript:selectexams(this,'{x2;$target}')"/>
						</td>
						<td>
							{x2;v:exam['exam']}
						</td>
						<td>
							{x2;v:exam['examauthor']}
						</td>
						<td>
							{x2;if:v:exam['examtype'] == 1}随机组卷{x2;elseif:v:exam['examtype'] == 2}手工组卷{x2;else}即时组卷{x2;endif}
						</td>
						<td>
							{x2;date:v:exam['examtime'],'Y-m-d'}
						</td>
			        </tr>
			        {x2;endtree}
	        	</tbody>
	        </table>
	        <div class="pagination pagination-right">
	            <ul>{x2;$exams['pages']}</ul>
	        </div>
	        <script type="text/javascript">
	    		jQuery(function($) {
					markSelectedExams('ids[]','{x2;$target}');
	    		});
	    	</script>