/**
 * @file 播放音乐插件
 */

(function()
{
	var musicDialog = function( editor, dialogType )
	{
		return {
			title : '视频音乐',
			minWidth : 420,
			minHeight : 160,
			onOk : function()
			{
				var musicUrl = this.getValueOf( 'Link', 'txtUrl' );
				var musicTitle = this.getValueOf( 'Link', 'txtTitle');
				//var tempvar='<td>'+musicTitle+'</td></br><embed src="/plus/player.swf?soundFile='+musicUrl+'&bg=E5E5E5&text=333333&leftbg=CCCCCC&lefticon=333333&volslider=666666&voltrack=FFFFFF&rightbg=B4B4B4&rightbghover=999999&righticon=333333&righticonhover=FFFFFF&track=FFFFFF&loader=009900&border=CCCCCC&tracker=DDDDDD&skip=666666&autostart=no&loop=no" type="application/x-shockwave-flash" wmode="transparent" allowscriptaccess="always" width="290" height="30">';
				//var tempvar='<td>'+musicTitle+'</td></br><embed src="'+musicUrl+'" width="290" height="30">';
				var tempvar= '<audio controls="controls" title="'+musicTitle+'"><source src="'+musicUrl+'" type="audio/mp3" />Your browser does not support this audio format.</audio>';
				editor.insertHtml(tempvar);
			},
			contents : [
				{
					id : 'Link',
					label : '播放音乐',
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
									label : '（选填）音乐名',
									style : 'width: 60%',
									'default' : ''
								},
								{
									id : 'txtUrl',
									type : 'text',
									label : '（必填）选择音乐文件或填写文件地址',
									style : 'width: 100%',
									'default' : ''
								}
								/**,
								{
									type : 'button',
									id : 'browse',
									filebrowser :
									{
										action : 'Browse',
										target: 'Link:txtUrl',
										url: '../include/dialog/select_media.php'
									},
									style : 'float:right',
									hidden : true,
									label : editor.lang.common.browseServer
								}
								**/
							]
						}
					]
				},
				{
					id:"Upload",
					hidden:!0,
					filebrowser:"uploadButton",
					label:'上传文件',
					elements:
					[
						{
							type:"file",
							id:"upload",
							label:'上传文件',
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
	CKEDITOR.dialog.add( 'music', function( editor )
		{
			return musicDialog( editor, 'music' );
		});
})();
