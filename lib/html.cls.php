<?php

class html
{
	public $G;

    public function __construct(&$G)
    {
    	$this->G = $G;
    }

    public function buildHtml($fields,$values = NULL)
    {
    	if(!is_array($fields))return false;
    	$forms = array();
    	foreach($fields as $field)
    	{
	    	$tmp = array();
	    	if($field['fieldhtmltype'] != 'auto')
	    	{
		    	if($field['fieldvalues'])$field['fieldvalues'] = $this->_buildValues($field['fieldvalues']);
		    	if($field['fieldhtmlproperty'])$field['fieldhtmlproperty'] = $this->_buildValues($field['fieldhtmlproperty']);
                if(!is_array($field['fieldhtmlproperty']))$field['fieldhtmlproperty'] = array();
		    	$field['fieldhtmltype'] = strtolower($field['fieldhtmltype']);
		    	if(is_array($values))
		    	{
		    		if(!is_array($field['fieldhtmlproperty']))$field['fieldhtmlproperty'] = array();
		    		$field['fieldhtmlproperty'][] = array('key' => 'value', 'value' => $values[$field['field']]);
		    	}
		    	elseif($field['fielddefault'])$field['fieldhtmlproperty'][] = array('key' => 'value', 'value' => $field['fielddefault']);
		    	$field['fieldhtmlproperty'][] = array('key' => 'name', 'value' => 'args['.$field['field'].']');
		    	$field['fieldhtmlproperty'][] = array('key' => 'id', 'value' => $field['field']);
	    	}
	    	$tmp['title'] = $field['fieldtitle'];
	    	$tmp['id'] = $field['field'];
	    	$tmp['type'] = $field['fieldhtmltype'];
	    	$tmp['describe'] = $field['fielddescribe'];
    		if(is_array($values))
    		//$tmp['html'] = $this->$field['fieldhtmltype'](array('pars'=>$field['fieldhtmlproperty'],'values'=>$field['fieldvalues'],'default'=>$values[$field['field']]));
    		$tmp['html'] = call_user_func(array($this,$field['fieldhtmltype']),array('pars'=>$field['fieldhtmlproperty'],'values'=>$field['fieldvalues'],'default'=>$values[$field['field']]));
    		else
    		//$tmp['html'] = $this->$field['fieldhtmltype'](array('pars'=>$field['fieldhtmlproperty'],'values'=>$field['fieldvalues'],'default'=>$field['fielddefault']));
    		$tmp['html'] = call_user_func(array($this,$field['fieldhtmltype']),array('pars'=>$field['fieldhtmlproperty'],'values'=>$field['fieldvalues'],'default'=>$field['fielddefault']));
    		$forms[] = $tmp;
    	}
    	return $forms;
    }

    private function _buildValues($values = false)
    {
    	if(!$values)return false;
    	$v = array();
    	$tmp = explode("\n",$values);
    	foreach($tmp as $value)
    	{
			$t = explode('=',$value,2);
			$v[] = array('key'=>$t[0],'value'=>trim($t[1]));
    	}
    	return $v;
    }

    public function auto($args)
    {
    	return html_entity_decode($args['pars']);
    }

    public function text($args)
    {
    	$str = "<input type=\"text\" ";
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $p)
	    	{
	    		$str .= "{$p['key']}=\"{$p['value']}\" ";
	    	}
    	}
    	$str .= "/>";
    	return $str;
    }

    public function htmltime($args)
    {
    	if(!$args['default'])$args['pars'][] = array('key'=>'value' ,'value'=>date("Y-m-d H:i:s"));
    	else
    	foreach($args['pars'] as $id => $p)
    	{
			if($p['key'] == 'value')
			{
				$args['pars'][$id] = array('key'=>'value' ,'value'=>date("Y-m-d H:i:s",$args['default']));
				break;
			}
    	}
    	return $this->text($args);
    }

    public function htmldate($args)
    {
    	$pram = 0;
    	if(!$args['default'])$args['pars'][] = array('key'=>'value' ,'value'=>date("Y-m-d"));
    	else
    	foreach($args['pars'] as $id => $p)
    	{
			if($p['key'] == 'value')
			{
				$args['pars'][$id] = array('key'=>'value' ,'value'=>date("Y-m-d",$args['default']));
			}
			if($p['key'] == 'class')
			{
				$args['pars'][$id]['value'] = $args['pars'][$id]['value'].' datepicker';
				$pram = 1;
				$args['pars'][$id]['value'] = str_replace('datepicker ','',$args['pars'][$id]['value']);
			}
    	}
    	if(!$pram)$args['pars'][] = array('key'=>'class' ,'value'=>'datepicker');
    	return $this->text($args);
    }

    public function password($args)
    {
    	$str = "<input type=\"password\" ";
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $key => $p)
	    	{
	    		$str .= "{$p['key']}=\"{$p['value']}\" ";
	    	}
    	}
    	$str .= "/>";
    	return $str;
    }

    public function textarea($args)
    {
		$str = "<textarea ";
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $p)
	    	{
	    		if($p['key'] != 'value')
	    		$str .= "{$p['key']}=\"{$p['value']}\" ";
				else
				$value = $p['value'];
	    	}
    	}
    	$str .= ">";
    	$str .= $value;
    	$str .= "</textarea>";
    	return $str;
    }

    public function _radio($pars,$value,$default,$index)
    {
    	$str = "<label class=\"radio-inline\"><input type=\"radio\" ";
    	//$str = "<input type=\"radio\" ";
    	if(is_array($pars))
    	{
	    	foreach($pars as $key => $p)
	    	{
	    		if($p['key'] != 'value')
	    		{
	    			if($p['key'] == 'id')
	    			$str .= "{$p['key']}=\"{$p['value']}{$index}\" ";
	    			else
	    			$str .= "{$p['key']}=\"{$p['value']}\" ";
	    		}
	    	}
    	}
    	if($value['value'] == $default)
    	$str .= "value=\"{$value['value']}\" checked/> {$value['key']}</label>&nbsp;&nbsp;";
    	//$str .= "value=\"{$value['value']}\" checked/> {$value['key']}&nbsp;&nbsp;";
    	else
    	$str .= "value=\"{$value['value']}\" /> {$value['key']}</label>&nbsp;&nbsp;";
    	//$str .= "value=\"{$value['value']}\" /> {$value['key']}&nbsp;&nbsp;";
    	return $str;
    }

    public function radio($args)
    {
    	$str = "";
    	unset($args['pars']['value']);
    	foreach($args['values'] as $key => $p)
    	{
    		$str .= $this->_radio($args['pars'],$p,$args['default'],$key);
    	}
    	return $str;
    }

    public function thumb($args)
    {
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $p)
	    	{
	    		if($p['key'] == 'id')
				$id = $p['value'];
	    		if($p['key'] == "name")
	    		$name = $p['value'];
	    		if($p['key'] == "value")
	    		$value = $p['value'];
	    	}
	    	if(!$id)
	    	$id = 'form'.$name;
	    	if(!$value)$value = 'app/core/styles/img/noimage.gif';
    	}
    	$str = <<<EOF
    	<script type="text/template" id="pe-template-$id">
    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
            	<div class="qq-upload-button-selector" style="clear:both;">
                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
		                <li class="text-center">
		                    <div class="thumbnail">
								<img class="qq-thumbnail-selector" alt="点击上传新图片">
								<input type="hidden" class="qq-edit-filename-selector" name="$name" tabindex="0">
							</div>
		                </li>
		            </ul>
		            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
			            <li class="text-center">
			                <div class="thumbnail">
								<img class="qq-thumbnail-selector" src="$value" alt="点击上传新图片">
								<input type="hidden" class="qq-edit-filename-selector" name="$name" tabindex="0" value="$value">
                			</div>
			            </li>
			        </ul>
                </div>
            </div>
        </script>
        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-$id"></div>
EOF;
		/**
    	$str = "<div class=\"thumbuper pull-left\"><div class=\"thumbnail\"><a href=\"javascript:;\" class=\"second label\"><em class=\"uploadbutton\" id=\"{$id}\" exectype=\"thumb\"></em></a><a href=\"javascript:;\" onclick=\"javascript:$('#{$id}_view').attr('src','app/core/styles/images/noimage.gif');$('#{$id}_value').val('');\" class=\"second2 label\" title=\"重置\"><em style=\"color:#000000;\" class=\"glyphicon glyphicon-remove icon-remove\"></em></a><div class=\"first\" id=\"{$id}_percent\"></div><div class=\"boot\"><img src=\"{$value}\" id=\"{$id}_view\"/><input type=\"hidden\" name=\"{$name}\" value=\"{$value}\" id=\"{$id}_value\"/></div></div></div>";
    	**/
    	return $str;
    }

    public function picture($args)
    {
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $p)
	    	{
	    		if($p['key'] == 'id')
				$id = $p['value'];
	    		if($p['key'] == "name")
	    		$name = $p['value'].'[]';
	    		if($p['key'] == "value")
	    		$values = $p['value'];
	    	}
	    	if(!$id)
	    	$id = 'form'.$name.'[]';
	    	$values = unserialize($values);
    	}
    	$str = "<div class=\"sortable\" id=\"{$id}-range\">";
    	if(is_array($values))
    	{
	    	foreach($values as $value)
	    	{
	    		if($value)
	    		$str .= <<<EOF
	    		<div class="thumbnail col-xs-3 listimgselector">
					<img class="qq-thumbnail-selector" alt="点击上传新图片" src="$value">
					<input type="hidden" class="qq-edit-filename-selector" name="$name" tabindex="0" value="$value">
				</div>
EOF;
	    	}
    	}
    	$str .= "</div>";
    	$str .= <<<EOF
		<script type="text/template" id="pe-template-$id">
    		<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
            	<div class="qq-upload-list-selector hide" aria-live="polite" aria-relevant="additions removals">
					<span></span>
				</div>
				<div class="listimg hide">
					<div class="thumbnail col-xs-3 listimgselector">
						<img class="qq-thumbnail-selector" alt="点击上传新图片" src="*value*">
						<input type="hidden" class="qq-edit-filename-selector" name="*name*" tabindex="0" value="*value*">
					</div>
				</div>
				<div class="qq-upload-button-selector qq-upload-button" style="clear:both;">
                    <a class="btn btn-primary">添加文件</a>
                </div>
            </div>
        </script>
        <div class="fineuploader" attr-box="$id-range" attr-name="$name" attr-type="list" attr-list="true" attr-template="pe-template-$id"></div>
EOF;
    	return $str;
    }

    public function videotext($args)
    {
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $p)
	    	{
				if($p['key'] == 'id')
				$id = $p['value'];
	    		if($p['key'] == "name")
	    		$name = $p['value'];
				if($p['key'] == 'value')
				$v = $p['value'];
				if($p['key'] == 'attr-ftype')
				$ftype = $p['value'];
	    	}
    	}
    	if(!$ftype)$ftype = 'mp4';
    	$str = <<<EOF
    	<script type="text/template" id="pe-template-$id">
    		<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
            	<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
	                <li class="text-center">
						<input size="45" class="form-control qq-edit-filename-selector" type="text" name="$name" tabindex="0" value="">
	                </li>
	            </ul>
	            <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
	                <li class="text-center">
	                    <input size="45" class="form-control qq-edit-filename-selector" type="text" name="$name" tabindex="0" value="$v">
	                </li>
	            </ul>
            	<div class="qq-upload-button-selector col-xs-3">
					<button class="btn btn-primary">上传文件<span class="process"></span></button>
                </div>
            </div>
        </script>
        <div class="fineuploader" attr-type="files" attr-template="pe-template-$id" attr-ftype="$ftype"></div>
EOF;
/**
    	$str = "<span class=\"input-append\">";
		$istr = '';
		$id = NULL;
    	$classinfo = false;
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $p)
	    	{
	    		if($p['key'] == 'id')
				$id = $p['value'];
				if($p['key'] == 'value')
				$v = $p['value'];
	    		if($p['key'] == "class")
	    		{
	    			$istr .= "{$p['key']}=\"inline uploadbutton\" ";
	    			$classinfo = true;
	    		}
	    		else
	    		$istr .= "{$p['key']}=\"{$p['value']}\" ";
	    	}
	    	if(!$classinfo)
	    	{
	    		$istr .= 'class="inline uploadbutton" ';
	    	}
	    	if(!$id)
	    	{
	    		$id = 'up'.md5($str);
	    	}
    	}
    	$str .= "<input type=\"text\" name=\"args[{$id}]\" id=\"{$id}_value\" value=\"{$v}\" class=\"inline uploadvideo\"/>";
		$str .= "<span id=\"{$id}_percent\" class=\"add-on\">0.00%</span></span>&nbsp;";
		$str .= "<span class=\"btn\"><a {$istr} exectype=\"upfile\">选择文件</a></span>";**/
    	return $str;
    }

    public function editor($args = NULL)
    {
    	$str = "<textarea ";
    	if(is_array($args['pars']))
    	{
	    	$par = 0;
	    	foreach($args['pars'] as $p)
	    	{
	    		if($p['key'] != 'value')
	    		$str .= "{$p['key']}=\"{$p['value']}\" ";
	    		else $value = $p['value'];
	    		if($p['key'] == 'class')
	    		{
	    			$par = 1;
	    			if($p['value'] == 'ckeditor')
	    			$str .= "{$p['key']}=\"{$p['value']}\" ";
	    			else
	    			$str .= "{$p['key']}=\"{$p['value']} ckeditor\" ";
	    		}
	    	}
    	}
    	if(!$par)$str .= " class=\"ckeditor\" ";
    	$str .= ">".$value."</textarea>";
    	return $str;
    }

    public function files($args)
    {
		$str = "<input type=\"file\" ";
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $key => $p)
	    	{
	    		$str .= "{$p['key']}=\"{$p['value']}\" ";
	    	}
    	}
    	$str .= "/>";
    	return $str;
    }

    public function checkBox($args)
    {
    	if($args['default'] != NULL)
    	$args['default'] = explode(',',$args['default']);
    	return $this->_checkBox($args);
    }

    public function _checkBox($args,$isArray = false)
    {
    	$str = "<label class=\"checkbox-inline checkbox inline\"><input type=\"checkbox\" ";
    	$v = '';
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $key => $p)
	    	{
	    		if($p['key'] == 'name' && $isArray)$p['value'] .= '[]';
	    		$str .= "{$p['key']}=\"{$p['value']}\" ";
	    		if($p['key'] == 'value')$v = $p['value'];
	    	}
    	}
    	if($args['default'] != NULL && in_array($v,$args['default']))
    	$str .= "checked";
    	$str .= "/>".$args['values']['key'].'</label>';
    	return $str;
    }

    public function checkBoxArray($args)
    {
		foreach($args['pars'] as $id => $p)
		{
			if($p['key'] == 'value')
			{
				unset($args['pars'][$id]);
				break;
			}
		}
    	$str = '';
    	if($args['default'] != NULL)
    	$args['default'] = unserialize($args['default']);
    	foreach($args['values'] as $p)
    	{
			$tmp = $args;
    		unset($tmp['values']);
    		$tmp['pars'][] = array('key'=>'value','value' => $p['value']);
    		$tmp['values'] = $p;
    		$str .= $this->_checkBox($tmp,true);
    	}
    	return $str;
    }

    public function select($args)
    {
    	unset($args['pars']['value']);
    	$str = "<select ";
    	if(is_array($args['pars']))
    	{
	    	foreach($args['pars'] as $key => $p)
	    	{
	    		$str .= "{$p['key']}=\"{$p['value']}\" ";
	    	}
    	}
    	$str .= ">";
    	if(is_array($args['values']))
    	{
	    	foreach($args['values'] as $p)
	    	{
	    		if($p['value'] == $args['default'])
	    		$str .= "<option value='{$p['value']}' selected>{$p['key']}</option>\n";
	    		else
	    		$str .= "<option value='{$p['value']}'>{$p['key']}</option>\n";
	    	}
    	}
    	$str .= "</select>";
    	return $str;
    }
}
?>