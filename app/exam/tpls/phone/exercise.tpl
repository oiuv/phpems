	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				强化训练
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
	            <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:0.5rem;">
	                <blockquote style="margin:0px;">
						<p>
							配卷规则
						</p>
					</blockquote>
				</div>
	            <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
					<form action="index.php?exam-phone-exercise" id="exer" method="post" class="form-inline" data-page="paper" data-target="paper">
	                	<div class="form-group">
							<label for="subject" class="control-label col-sm-2">请选择章节：</label>
							<div class="col-sm-9">
								<select autocomplete="off" id="thesectionid" name="args[sectionid]" class="combox form-control" ref="theknowsid" refUrl="index.php?exam-phone-index-ajax-getknowsbysectionid&sectionid={value}" more="questionnumbers" callback="getSectionContent">
                            		<option value="0">请选择章节</option>
                            		{x2;tree:$sections,section,sid}
                            		<option value="{x2;v:section['sectionid']}">{x2;v:section['section']}</option>
                            		{x2;endtree}
                            	</select>
							</div>
						</div>
						<div class="form-group">
							<label for="subject" class="control-label col-sm-2">请选择知识点：</label>
							<div class="col-sm-9">
								<select autocomplete="off" name="args[knowsid]" id="theknowsid" class="combox form-control" ref="questionnumbers" refUrl="index.php?exam-phone-exercise-ajax-getQuestionNumber&sectionid={tmp}&knowsid={value}" tmp="thesectionid">
                            		<option value="0">请选择知识点</option>
                            	</select>
							</div>
						</div>
						<div class="form-group">
							<label for="subject" class="control-label col-sm-2">试卷名称：</label>
							<div class="col-sm-9">
								<input type="text" needle="needle" msg="请填写试卷名称" name="args[title]" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="subject" class="control-label col-sm-12">做题时间（分钟）：</label>
							<div class="col-sm-5">
								<input type="text" needle="needle" msg="做题时间" name="args[time]" class="form-control" value='60'/>
							</div>
						</div>
						<div class="form-group">
							<label for="subject" class="control-label col-sm-12">如果您不希望做某种题型，请填写 0</label>
						</div>
	                    <div class="col-xs-12">
		                    <ol id="questionnumbers" class="list-unstyled" style="line-height:3.2rem;">
		                        {x2;tree:$questype,quest,qid}
		                        <li style="border-bottom:1px dotted #CCCCCC;padding:0.5rem;">
		                        	{x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题），选 <input id="question_{x2;v:quest}" type="text" style="width:6rem;height:34px;padding: 1.2rem;background-color: #fff;border: 1px solid #ccc;border-radius: 4px;" name="args[number][{x2;v:quest}]" rel="{x2;$numbers[v:quest]}"/> 题
		                        </li>
		                    	{x2;endtree}
		                    </ol>
	                    </div>
	                    <div id="begin_exer">
	                    	<input type="hidden" name="setExecriseConfig" value="1" />
	                    	<p class="text-center">
	                    		<button type="submit" class="btn btn-primary" action-before="clearStorage">开始测试</button>
	                    	</p>
	                    </div>
	                </form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function common(){
			var getSectionContent = function(data){
				var obj = '#'+data.attr('more');
				$.get('index.php?exam-phone-exercise-ajax-getQuestionNumber&sectionid='+data.val()+'&rand='+Math.random(),function(d){$(obj).html(d);});
			}
			var combox = function(){
				$('#exercise').find(".combox").bind("change",function(){
					if($(this).attr("ref") && $(this).attr("ref") != ""){
						if($(this).attr("refUrl") != ""){
							var url = $(this).attr("refUrl").replace(/{value}/,$(this).val());
							var t = $(this).attr('tmp');
							url = url.replace(/{tmp}/,$('#'+t).val());
							var obj = '#'+$(this).attr("ref");
							$.get(url+'&rand='+Math.random(),function(d){$(obj).html(d);});
							if($(this).attr("callback") && $(this).attr("callback") != "")
							eval($(this).attr("callback"))($(this));
						}
					}
				})
			}
			combox();
		}
		$(document).ready(function(){
			common();
		});
		</script>
	</div>