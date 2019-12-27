<link rel="stylesheet" href="files/public/js/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="files/public/js/codemirror/theme/monokai.css">
<script src="files/public/js/codemirror/lib/codemirror.js"></script>
<script src="files/public/js/codemirror/addon/edit/closetag.js"></script>
<script src="files/public/js/codemirror/mode/xml/xml.js"></script>
<script src="files/public/js/codemirror/mode/javascript/javascript.js"></script>
<script src="files/public/js/codemirror/mode/css/css.js"></script>
<script src="files/public/js/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script>
    $(function(){
        $('.Codemirror').each(function(){
            var that = this;
            var cm = CodeMirror(that,{
                lineNumbers: true,
                mode:  "htmlmixed",
                theme: 'monokai',
                lineWrapping: true,
                autofocus: true,
                tabSize: 4,
                value:$(that).parent().find('.blockcontent_content:first').val(),
                autoCloseTags: true
            });
            var fm = $(that).parents('form:first');
            fm.find('.tplbutton').on('click',function(){
                var _this = this;
                fm.find('.blockcontent_content:first').val(cm.getValue());
                fm.submit();
            });
            fm.find('.stpl').on('change',function(){
                var _this = $(this);
                $.get('index.php?seminar-master-seminar-getstplcode&stplid='+_this.val(),function(data){
                    cm.setValue(data);
                });
            });
        });
    });
</script>