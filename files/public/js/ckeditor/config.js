/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.filebrowserUploadUrl = 'index.php?document-api-upload';
	config.filebrowserImageUploadUrl = 'index.php?document-api-upload';
    config.filebrowserFlashUploadUrl = 'index.php?document-api-upload';
    config.filebrowserMusicUploadUrl = 'index.php?document-api-upload&action=music';
	
	config.toolbar = [
		{ name: 'document', items: [ 'Source' ] },
		{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
		{ name: 'styles', items: [ 'Styles', 'Format','Font','FontSize','TextColor','wikititle','lineheight'] },
		'/',
		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
		{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
		{ name: 'insert', items: [ 'Image','Mathjax', 'Table', 'HorizontalRule', 'SpecialChar','music','video'] },
		{ name: 'tools', items: [ 'Maximize' ] }
	];
	
	config.extraPlugins = 'mathjax,music,wikititle,lineheight,video';
	config.mathJaxLib = 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_HTML';
    config.mathJaxLib = 'files/public/js/ckeditor/js/MathJax.js?config=TeX-AMS_HTML';
	CKEDITOR.config.contentsCss = ['files/public/css/bootstrap.css','files/public/css/pe.master.css','files/public/js/ckeditor/ckeditor.css'];
};
