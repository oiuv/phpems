<table class="table table-hover table-bordered">
    <tr class="success"><td colspan="2">{x2;$knows['knows']}</td></tr>
    <tr>
    {x2;eval: v:tmp = 0}
    {x2;tree:$questype,quest,qid}
        {x2;if:$numbers[v:quest['questid']]}
        <td>
        <a href="index.php?exam-app-lesson-ajax-setlesson&questype={x2;v:quest['questid']}&knowsid={x2;$knows['knowsid']}" class="ajax" action-before="clearStorage">{x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题）</a>
        {x2;eval: v:tmp++}
        </td>
        {x2;endif}
        {x2;if:v:tmp % 2 == 0}
    </tr>
    <tr>
        {x2;endif}
    {x2;endtree}
    </tr>
</table>
