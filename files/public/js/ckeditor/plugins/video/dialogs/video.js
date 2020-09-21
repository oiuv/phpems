/**
 * @file 播放音乐插件
 */

(function()
{
	var videoDialog = function( editor, dialogType )
	{
		return {
			title : 'video',
			minWidth : 420,
			minHeight : 240,
			onOk : function()
			{
				var videoUrl = this.getValueOf( 'Link', 'txtUrl' );
				var videoTitle = this.getValueOf( 'Link', 'txtTitle');
				var videoWidth = this.getValueOf( 'Link', 'txtWidth');
				var videoHeight = this.getValueOf( 'Link', 'txtHeight');
				var tempvar= '<video src="'+videoUrl+'" width="'+videoWidth+'" height="'+videoHeight+'" title="'+videoTitle+'" controls="controls">Your browser does not support this format.</video>';
				editor.insertHtml(tempvar);
			},
			contents : [
				{
					id : 'Link',
					label : '视频',
					padding : 0,
					type : 'vbox',
					elements :
					[
						{
							type : 'vbox',
							padding : 0,
							children :
							[
								{
									id : 'txtTitle',
									type : 'text',
									label : '名称',
									style : 'width: 60%',
									'default' : ''
								},
								{
									id : 'txtUrl',
									type : 'text',
									label : '地址',
									style : 'width: 100%',
									'default' : ''
								},
								{
									id : 'txtWidth',
									type : 'text',
									label : '宽度',
									style : 'width: 60%',
									'default' : '640'
								},
								{
									id : 'txtHeight',
									type : 'text',
									label : '高度',
									style : 'width: 60%',
									'default' : '480'
								},
							]
						}
					]
				},
				{
					id:"Upload",
					hidden:!0,
					filebrowser:"uploadButton",
					label:'上传',
					elements:
					[
						{
							type:"file",
							id:"upload",
							label:'上传',
							size:38
						},
						{
							type:"fileButton",
							id:"uploadButton",
							label:'上传',
							filebrowser:"Link:txtUrl",
							"for":["Upload","upload"]
						}
					]
				}
			]
		};
	};
	CKEDITOR.dialog.add( 'video', function( editor )
		{
			return videoDialog( editor, 'video' );
		});
})();
