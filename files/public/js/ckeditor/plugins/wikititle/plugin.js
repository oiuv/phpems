/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
 * @file Image plugin
 */

CKEDITOR.plugins.add( 'wikititle',
{
	init : function( editor )
	{
		var pluginName = 'wikititle';

		// Register the dialog.
		CKEDITOR.dialog.add( pluginName, this.path + 'dialogs/wikititle.js' );

		// Register the command.
		editor.addCommand( pluginName, new CKEDITOR.dialogCommand( pluginName ) );

		// Register the toolbar button.
		editor.ui.addButton( 'wikititle',
			{
				label : '文档段落',
				icon : 'plugins/wikititle/wikititle.gif',
				command : pluginName
			});
	}
} );
