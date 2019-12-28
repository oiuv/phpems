/**
 * @file 播放音乐插件
 */
var tms;
(function()
{
	var wikititleDialog = function( editor, dialogType )
	{
        var contentstring = '';
		return {
			title : '添加段落标题',
			minWidth : 420,
			minHeight : 80,
			onOk : function()
			{
                var titleLevel = this.getValueOf( 'Link', 'txtLevel');
				var rstring = '<h'+titleLevel+' class="wikititle" id="wkth_'+Math.random().toString().substring(2)+'">'+contentstring+'</h'+titleLevel+'>';
                editor.getSelection().getNative().anchorNode.parentNode.outerHTML = rstring;
			},
            onShow: function() {
                tms = editor.getSelection().getNative();
                contentstring = editor.getSelection().getNative().anchorNode.data;
			},
			contents : [
				{
					id : 'Link',
					label : '段落标题',
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
                                    id : 'txtLevel',
                                    type : 'select',
                                    label : '段落层级',
									style:'width: 240px',
                                    items: [
                                        ['一级标题', "1"],
                                        ['二级标题', "2"]
                                    ],
									default:"1"
                                }
							]
						}
					]
				}
			]
		};
	};
	CKEDITOR.dialog.add( 'wikititle', function( editor )
		{
			return wikititleDialog( editor, 'wikititle' );
		});
})();
