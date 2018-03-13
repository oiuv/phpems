{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main" style="overflow:hidden;">
			<div class="col-xs-10 box" style="padding:0px;width:79%;padding: 20px 10px 10px 10px;">
                {x2;tree:$docs['top']['data'],doc,did}
				<div class="col-xs-3">
					<a href="index.php?docs-app-docs&docid={x2;v:doc['docid']}" class="thumbnail">
						<img src="{x2;v:doc['docthumb']}" alt="" width="100%">
					</a>
					<h5 class="text-center">{x2;substring:v:doc['doctitle'],36}</h5>
				</div>
                {x2;endtree}
			</div>
			<div class="col-xs-2 box itembox pull-right" style="width:20%;overflow:hidden;padding: 20px 20px 30px 20px;">
				<h4 class="text-center" style="line-height: 2em">共有词条 {x2;$number['all']} 个</h4>
				<h4 class="text-center" style="line-height: 2em">待完善词条 {x2;$number['more']} 个</h4>
				<h5>&nbsp;</h5>
				<p><a class="btn btn-primary btn-block" href="index.php?docs-app-category-needmore">协助完善词条</a></p>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-6 box itembox" style="min-height:200px;">
				<h4 class="title">最新词条</h4>
				<ul class="list-unstyled">
                    {x2;tree:$docs['new']['data'],doc,did}
					<li><a href="index.php?docs-app-docs&docid={x2;v:doc['docid']}" title="{x2;v:doc['doctitle']}">{x2;v:doc['doctitle']}</a></li>
                    {x2;endtree}
				</ul>
			</div>
			<div class="col-xs-6 box itembox" style="min-height:200px;">
				<h4 class="title"><a href="index.php?docs-app-category-needmore">待完善词条</a></h4>
				<ul class="list-unstyled">
                    {x2;tree:$docs['more']['data'],doc,did}
					<li><a href="index.php?docs-app-docs&docid={x2;v:doc['docid']}" title="{x2;v:doc['doctitle']}">{x2;v:doc['doctitle']}</a></li>
                    {x2;endtree}
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			{x2;tree:$categories[0],cat,cid}
			<div class="col-xs-3 box itembox" style="min-height:200px;">
				<h4 class="title"><a href="index.php?docs-app-category&catid=1">{x2;v:cat['catname']}</a></h4>
				<ul class="list-unstyled">
					{x2;if:is_array($categories[v:cat['catid']])}
					{x2;tree:$categories[v:cat['catid']],ccat,ccid}
					<li><a href="index.php?docs-app-category&catid={x2;v:ccat['catid']}" title="{x2;v:ccat['catname']}">{x2;v:ccat['catname']}</a></li>
					{x2;endtree}
					{x2;endif}
				</ul>
			</div>
			{x2;endtree}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>