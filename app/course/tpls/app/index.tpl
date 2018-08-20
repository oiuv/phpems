{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main box itembox">
			<h4 class="title" style="padding:10px;">
				我的课程
				<a href="index.php?course-app-index-lists" class="btn btn-primary pull-right">
					<em class="glyphicon glyphicon-plus-sign"></em> 开通新课程
				</a>
			</h4>
			<div class="col-xs-12" style="padding-left:0px;">
                {x2;tree:$contents['data'],content,cid}
				<div class="col-xs-3" style="width:20%">
					<a href="index.php?course-app-course&csid={x2;v:content['csid']}" class="thumbnail">
						<img src="{x2;if:v:content['csthumb']}{x2;v:content['csthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" alt="" width="100%">
					</a>
					<h5 class="text-center">{x2;v:content['cstitle']}</h5>
				</div>
                {x2;endtree}
				<ul class="pagination pagination-right">{x2;$contents['pages']}</ul>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>