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
					label : 'video',
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
									label : 'Title',
									style : 'width: 60%',
									'default' : ''
								},
								{
									id : 'txtUrl',
									type : 'text',
									label : 'Url',
									style : 'width: 100%',
									'default' : ''
								},
								{
									id : 'txtWidth',
									type : 'text',
									label : 'Width',
									style : 'width: 60%',
									'default' : '640'
								},
								{
									id : 'txtHeight',
									type : 'text',
									label : 'Height',
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
					label:'Upload',
					elements:
					[
						{
							type:"file",
							id:"upload",
							label:'Upload',
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
