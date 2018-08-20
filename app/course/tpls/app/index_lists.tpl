{x2;include:header}
<body>
{x2;include:nav}
{x2;tree:$catids,cat,cid}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main box itembox">
			<h4 class="title"><a href="index.php?course-app-category&catid={x2;v:cat['catid']}">{x2;v:cat['catname']}</a></h4>
			<div class="col-xs-3" style="padding:0px;">
				<a href="index.php?course-app-category&catid={x2;v:cat['catid']}" class="">
					<img src="{x2;v:cat['catimg']}" alt="" width="287">
				</a>
			</div>
			<div class="col-xs-9" style="padding-left:0px;">
				{x2;tree:$contents[v:cat['catid']]['data'],content,cid}
				<div class="col-xs-3">
					<a href="index.php?course-app-course&csid={x2;v:content['csid']}" class="thumbnail">
						<img src="{x2;v:content['csthumb']}" alt="" width="180">
					</a>
					<h5 class="text-center">{x2;v:content['cstitle']}</h5>
				</div>
				{x2;if:v:cid % 4 == 0}
				<div class="col-xs-12"><hr /></div>
				{x2;endif}
				{x2;endtree}
			</div>
		</div>
	</div>
</div>
{x2;endtree}
{x2;include:footer}
</body>
</html>