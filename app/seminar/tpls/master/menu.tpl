<ul class="list-group">
    <li class="list-group-item {x2;if:$method == 'index'} active{x2;endif}">
        {x2;if:$method == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;$_app}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'category'}active{x2;endif}">
        {x2;if:$method == 'category'}分类管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-category">分类管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'seminar'}active{x2;endif}">
        {x2;if:$method == 'seminar'}专题管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-seminar">专题管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'tpls'}active{x2;endif}">
        {x2;if:$method == 'tpls'}模板管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-tpls">模板管理</a>
        {x2;endif}
    </li>
</ul>
