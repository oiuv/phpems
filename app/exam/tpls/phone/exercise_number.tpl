                            {x2;tree:$questype,quest,qid}
                            <li style="border-bottom:1px dotted #CCCCCC;padding:0.5rem;">
                            	{x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题），选 <input id="question_{x2;v:quest['questid']}" type="text" style="width:6rem;background-color: #fff;height:34px;padding: 1.2rem;border: 1px solid #ccc;border-radius: 4px;" name="args[number][{x2;v:quest['questid']}]" rel="{x2;$numbers[v:quest['questid']]}"/> 题
                            </li>
                        	{x2;endtree}