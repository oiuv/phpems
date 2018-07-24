/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
	/**config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'about' }
	];**/
	config.filebrowserUploadUrl = 'index.php?document-api-uploadfile';
	config.filebrowserImageUploadUrl = 'index.php?document-api-upload';
    config.filebrowserFlashUploadUrl = 'index.php?document-api-upload';
    config.filebrowserMusicUploadUrl = 'index.php?document-api-upload&action=music';
    config.allowedContent = true;
	//config.height = '250px';

	config.toolbar = [
		{ name: 'document', items: [ 'Source' ] },
		{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
		/**{ name: 'editing', items: [ 'Scayt' ] },**/
		{ name: 'styles', items: [ 'Styles', 'Format','Font','FontSize','TextColor','wikititle','lineheight'] },
		'/',
		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
		{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
		{ name: 'insert', items: [ 'Image', 'Mathjax', 'Table', 'HorizontalRule', 'SpecialChar','music','video'] },
		{ name: 'tools', items: [ 'Maximize' ] }
		/**
		{ name: 'about', items: [ 'Preview' , 'About' ] }**/
	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';
	config.extraPlugins = 'mathjax,music,preview,font,colorbutton,justify,wikititle,lineheight,video';
	config.mathJaxLib = 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_HTML';
    config.mathJaxLib = 'app/core/styles/js/ckeditor/js/MathJax.js?config=TeX-AMS_HTML';
	config.line_height = "1;1.5;2;2.5;3;4;";

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	CKEDITOR.config.contentsCss = ['app/core/styles/css/bootstrap.css','app/core/styles/css/jquery-ui.min.css','app/core/styles/css/peskin.css','app/core/styles/js/ckeditor/ckeditor.css'];
};
