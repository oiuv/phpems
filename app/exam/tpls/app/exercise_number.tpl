{x2;tree:$questype,quest,qid}
{x2;if:$numbers[v:quest['questid']]}
<div class="form-group underline">
    <label class="block">
        <div class="col-xs-4 tip">
            {x2;v:quest['questype']}
        </div>
        <div class="col-xs-8 form-inline">
            共 {x2;$numbers[v:quest['questid']]} 题，选 <input id="question_{x2;v:quest['questid']}" type="text" class="form-control text-center" name="args[number][{x2;v:quest['questid']}]" msg="{x2;v:quest['questype']}题量设置错误" maxvalue="{x2;$numbers[v:quest['questid']]}" value="0" size="1"/> 题
        </div>
    </label>
</div>
{x2;endif}
{x2;endtree}