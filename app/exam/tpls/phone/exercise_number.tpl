                            {x2;tree:$questype,quest,qid}
                            {x2;if:$numbers[v:quest['questid']]}
                            <li class="form-group">
                                {x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题），选 <input id="question_{x2;v:quest['questid']}" size="5" type="text" name="args[number][{x2;v:quest['questid']}]" rel="{x2;$numbers[v:quest['questid']]}" value="0"/> 题
                            </li>
                            {x2;endif}
                            {x2;endtree}
