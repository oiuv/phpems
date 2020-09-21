/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
 * @file Image plugin
 */

CKEDITOR.plugins.add( 'video',
{
	init : function( editor )
	{
		var pluginName = 'video';

		// Register the dialog.
		CKEDITOR.dialog.add( pluginName, this.path + 'dialogs/video.js' );

		// Register the command.
		editor.addCommand( pluginName, new CKEDITOR.dialogCommand( pluginName ) );

		// Register the toolbar button.
		editor.ui.addButton( 'video',
			{
				label : 'video',
				icon : 'plugins/video/video.gif',
				command : pluginName
			});
	}
} );
