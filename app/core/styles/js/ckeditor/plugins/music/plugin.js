/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
 * @file Image plugin
 */

CKEDITOR.plugins.add( 'music',
{
	init : function( editor )
	{
		var pluginName = 'music';

		// Register the dialog.
		CKEDITOR.dialog.add( pluginName, this.path + 'dialogs/music.js' );

		// Register the command.
		editor.addCommand( pluginName, new CKEDITOR.dialogCommand( pluginName ) );

		// Register the toolbar button.
		editor.ui.addButton( 'music',
			{
				label : '音频音乐',
				icon : 'plugins/music/music.gif',
				command : pluginName
			});
	}
} );
