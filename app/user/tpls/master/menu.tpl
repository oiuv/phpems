<ul class="list-group">
    <li class="list-group-item {x2;if:$method == 'index'} active{x2;endif}">
        {x2;if:$method == 'index'}首页
        {x2;else}
        <a href="index.php?user-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'user'}active{x2;endif}">
        {x2;if:$method == 'user'}用户管理
        {x2;else}
        <a href="index.php?user-master-user">用户管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'actor'}active{x2;endif}">
        {x2;if:$method == 'actor'}用户组管理
        {x2;else}
        <a href="index.php?user-master-actor">用户组管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'config'} active{x2;endif}">
        {x2;if:$method == 'config'}模块设置
        {x2;else}
        <a href="index.php?user-master-config">模块设置</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'module'}active{x2;endif}">
        {x2;if:$method == 'module'}模型管理
        {x2;else}
        <a href="index.php?user-master-module">模型管理</a>
        {x2;endif}
    </li>
</ul>
