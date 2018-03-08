                            {x2;tree:$questype,quest,qid}
                            <li class="text_in">
                            	<!--<input type="checkbox" name="args[questype][{x2;v:quest}]" value="1"/>-->{x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题），选 <input id="question_{x2;v:quest['questid']}" type="text" class="form-control" style="width:60px;" name="args[number][{x2;v:quest['questid']}]" onChange="javascript:check_num(this);" onblur="" rel="{x2;$numbers[v:quest['questid']]}"/> 题
                            	<span id="question_{x2;v:quest['questid']}_error" class="red font_12 main_left0">选择的题数不能超过{x2;$numbers[v:quest['questid']]}</span>
                            </li>
                        	{x2;endtree}