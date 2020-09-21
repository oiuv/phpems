<ul class="list-group">
    <li class="list-group-item {x2;if:$method == 'index'} active{x2;endif}">
        {x2;if:$method == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;$_app}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'positions'}active{x2;endif}">
        {x2;if:$method == 'positions'}推荐管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-positions">推荐管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'category'}active{x2;endif}">
        {x2;if:$method == 'category'}分类管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-category">分类管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'contents'}active{x2;endif}">
        {x2;if:$method == 'contents'}内容管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-contents">内容管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'module'}active{x2;endif}">
        {x2;if:$method == 'module'}模型管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-module">模型管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'blocks'}active{x2;endif}">
        {x2;if:$method == 'blocks'}标签管理
        {x2;else}
        <a href="index.php?{x2;$_app}-master-blocks">标签管理</a>
        {x2;endif}
    </li>
</ul>
