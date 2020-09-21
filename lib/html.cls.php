<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

class html
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function buildHtml($fields, $values = null)
    {
        if (!is_array($fields)) {
            return false;
        }
        $forms = [];
        foreach ($fields as $field) {
            $tmp = [];
            if ('auto' != $field['fieldhtmltype']) {
                if ($field['fieldvalues']) {
                    $field['fieldvalues'] = $this->_buildValues($field['fieldvalues']);
                }
                if ($field['fieldhtmlproperty']) {
                    $field['fieldhtmlproperty'] = $this->_buildValues($field['fieldhtmlproperty']);
                }
                if (!is_array($field['fieldhtmlproperty'])) {
                    $field['fieldhtmlproperty'] = [];
                }
                $field['fieldhtmltype'] = strtolower($field['fieldhtmltype']);
                if (is_array($values)) {
                    if (!is_array($field['fieldhtmlproperty'])) {
                        $field['fieldhtmlproperty'] = [];
                    }
                    $field['fieldhtmlproperty'][] = ['key' => 'value', 'value' => $values[$field['field']]];
                } elseif ($field['fielddefault']) {
                    $field['fieldhtmlproperty'][] = ['key' => 'value', 'value' => $field['fielddefault']];
                }
                $field['fieldhtmlproperty'][] = ['key' => 'name', 'value' => 'args['.$field['field'].']'];
                $field['fieldhtmlproperty'][] = ['key' => 'id', 'value' => $field['field']];
            }
            $tmp['title'] = $field['fieldtitle'];
            $tmp['id'] = $field['field'];
            $tmp['type'] = $field['fieldhtmltype'];
            $tmp['describe'] = $field['fielddescribe'];
            if (is_array($values)) {
                //$tmp['html'] = $this->$field['fieldhtmltype'](array('pars'=>$field['fieldhtmlproperty'],'values'=>$field['fieldvalues'],'default'=>$values[$field['field']]));
                $tmp['html'] = call_user_func([$this, $field['fieldhtmltype']], ['pars' => $field['fieldhtmlproperty'], 'values' => $field['fieldvalues'], 'default' => $values[$field['field']]]);
            } else {
                //$tmp['html'] = $this->$field['fieldhtmltype'](array('pars'=>$field['fieldhtmlproperty'],'values'=>$field['fieldvalues'],'default'=>$field['fielddefault']));
                $tmp['html'] = call_user_func([$this, $field['fieldhtmltype']], ['pars' => $field['fieldhtmlproperty'], 'values' => $field['fieldvalues'], 'default' => $field['fielddefault']]);
            }
            $forms[] = $tmp;
        }

        return $forms;
    }

    public function buildInfo($fields, $values)
    {
        if (!is_array($fields)) {
            return false;
        }
        $infos = [];
        foreach ($fields as $field) {
            $tmp = [];
            switch ($field['fieldhtmltype']) {
                case 'htmltime':
                $tmp['value'] = date('Y-m-d H:i:s', $values[$field['field']]);
                break;

                case 'radio':
                case 'select':
                $field['fieldvalues'] = $this->_buildValues($field['fieldvalues']);
                foreach ($field['fieldvalues'] as $p) {
                    if ($p['value'] == $values[$field['field']]) {
                        $tmp['value'] = $p['key'];
                        break;
                    }
                }
                break;

                case 'checkbox':
                    $field['fieldvalues'] = $this->_buildValues($field['fieldvalues']);
                    foreach ($field['fieldvalues'] as $p) {
                        if (in_array($p['value'], $values[$field['field']])) {
                            $tmp['value'][] = $p['key'];
                        }
                    }
                    $tmp['value'] = implode(',', $tmp['value']);
                break;

                case 'thumb':
                    $tmp['value'] = '<img class="col-xs-4" src="'.$values[$field['field']].'"/>';
                break;

                case 'picture':
                    foreach ($values[$field['field']] as $p) {
                        $tmp['value'] .= '<img class="col-xs-4" src="'.$p.'"/>';
                    }
                break;

                case 'videotext':
                    $tmp['value'] = '<a target="_blank" href="'.$values[$field['field']].'">查看</a>';
                break;

                default:
                $tmp['value'] = $values[$field['field']];
                break;
            }
            $tmp['title'] = $field['fieldtitle'];
            $tmp['id'] = $field['field'];
            $tmp['type'] = $field['fieldhtmltype'];
            $tmp['describe'] = $field['fielddescribe'];
            $infos[] = $tmp;
        }

        return $infos;
    }

    private function _buildValues($values = false)
    {
        if (!$values) {
            return false;
        }
        $v = [];
        $tmp = explode("\n", $values);
        foreach ($tmp as $value) {
            $t = explode('=', $value, 2);
            $v[] = ['key' => $t[0], 'value' => trim($t[1])];
        }

        return $v;
    }

    public function auto($args)
    {
        return html_entity_decode($args['pars']);
    }

    public function text($args)
    {
        $str = '<input type="text" ';
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $p) {
                $str .= "{$p['key']}=\"{$p['value']}\" ";
            }
        }
        $str .= '/>';

        return $str;
    }

    public function htmltime($args)
    {
        if (!$args['default']) {
            $args['pars'][] = ['key' => 'value', 'value' => date('Y-m-d H:i:s')];
        } else {
            foreach ($args['pars'] as $id => $p) {
                if ('value' == $p['key']) {
                    $args['pars'][$id] = ['key' => 'value', 'value' => date('Y-m-d H:i:s', $args['default'])];
                    break;
                }
            }
        }

        return $this->text($args);
    }

    public function htmldate($args)
    {
        $pram = 0;
        if (!$args['default']) {
            $args['pars'][] = ['key' => 'value', 'value' => date('Y-m-d')];
        } else {
            foreach ($args['pars'] as $id => $p) {
                if ('value' == $p['key']) {
                    $args['pars'][$id] = ['key' => 'value', 'value' => date('Y-m-d', $args['default'])];
                }
                if ('class' == $p['key']) {
                    $args['pars'][$id]['value'] = $args['pars'][$id]['value'].' datepicker';
                    $pram = 1;
                    $args['pars'][$id]['value'] = str_replace('datepicker ', '', $args['pars'][$id]['value']);
                }
            }
        }
        if (!$pram) {
            $args['pars'][] = ['key' => 'class', 'value' => 'datepicker'];
        }

        return $this->text($args);
    }

    public function password($args)
    {
        $str = '<input type="password" ';
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $key => $p) {
                $str .= "{$p['key']}=\"{$p['value']}\" ";
            }
        }
        $str .= '/>';

        return $str;
    }

    public function textarea($args)
    {
        $str = '<textarea ';
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $p) {
                if ('value' != $p['key']) {
                    $str .= "{$p['key']}=\"{$p['value']}\" ";
                } else {
                    $value = $p['value'];
                }
            }
        }
        $str .= '>';
        $str .= $value;
        $str .= '</textarea>';

        return $str;
    }

    public function _radio($pars, $value, $default, $index)
    {
        $str = '<label class="radio-inline inline"><input type="radio" ';
        if (is_array($pars)) {
            foreach ($pars as $key => $p) {
                if ('value' != $p['key']) {
                    if ('id' == $p['key']) {
                        $str .= "{$p['key']}=\"{$p['value']}{$index}\" ";
                    } else {
                        $str .= "{$p['key']}=\"{$p['value']}\" ";
                    }
                }
            }
        }
        if ($value['value'] == $default) {
            $str .= "value=\"{$value['value']}\" checked/> <span class=\"selector\">{$value['key']}</span></label>&nbsp;&nbsp;";
        } else {
            $str .= "value=\"{$value['value']}\" /> <span class=\"selector\">{$value['key']}</span></label>&nbsp;&nbsp;";
        }

        return $str;
    }

    public function radio($args)
    {
        $str = '';
        unset($args['pars']['value']);
        foreach ($args['values'] as $key => $p) {
            $str .= $this->_radio($args['pars'], $p, $args['default'], $key);
        }

        return $str;
    }

    public function thumb($args)
    {
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $p) {
                if ('id' == $p['key']) {
                    $id = $p['value'];
                }
                if ('name' == $p['key']) {
                    $name = $p['value'];
                }
                if ('value' == $p['key']) {
                    $value = $p['value'];
                }
            }
            if (!$id) {
                $id = 'form'.$name;
            }
            if (!$value) {
                $value = 'files/public/img/noimage.gif';
            }
        }
        $str = <<<EOF
        <script type="text/template" id="pe-template-$id">
            <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;max-width:270px;">
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

        return $str;
    }

    public function picture($args)
    {
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $p) {
                if ('id' == $p['key']) {
                    $id = $p['value'];
                }
                if ('name' == $p['key']) {
                    $name = $p['value'].'[]';
                }
                if ('value' == $p['key']) {
                    $values = $p['value'];
                }
            }
            if (!$id) {
                $id = 'form'.$name.'[]';
            }
            $values = unserialize($values);
        }
        $str = "<div class=\"sortable\" id=\"{$id}-range\">";
        if (is_array($values)) {
            foreach ($values as $value) {
                if ($value) {
                    $str .= <<<EOF
                <div class="thumbnail col-xs-3 listimgselector">
                    <img class="qq-thumbnail-selector" alt="点击上传新图片" src="$value">
                    <input type="hidden" class="qq-edit-filename-selector" name="$name" tabindex="0" value="$value">
                </div>
EOF;
                }
            }
        }
        $str .= '</div>';
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
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $p) {
                if ('id' == $p['key']) {
                    $id = $p['value'];
                }
                if ('name' == $p['key']) {
                    $name = $p['value'];
                }
                if ('value' == $p['key']) {
                    $v = $p['value'];
                }
                if ('attr-ftype' == $p['key']) {
                    $ftype = $p['value'];
                }
            }
        }
        if (!$ftype) {
            $ftype = 'mp4';
        }
        $str = <<<EOF
        <script type="text/template" id="pe-template-$id">
            <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;max-width: 100%;">
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

        return $str;
    }

    public function editor($args = null)
    {
        $str = '<textarea ';
        if (is_array($args['pars'])) {
            $par = 0;
            foreach ($args['pars'] as $p) {
                if ('value' != $p['key']) {
                    $str .= "{$p['key']}=\"{$p['value']}\" ";
                } else {
                    $value = $p['value'];
                }
                if ('class' == $p['key']) {
                    $par = 1;
                    if ('ckeditor' == $p['value']) {
                        $str .= "{$p['key']}=\"{$p['value']}\" ";
                    } else {
                        $str .= "{$p['key']}=\"{$p['value']} ckeditor\" ";
                    }
                }
            }
        }
        if (!$par) {
            $str .= ' class="ckeditor" ';
        }
        $str .= '>'.$value.'</textarea>';

        return $str;
    }

    public function files($args)
    {
        $str = '<input type="file" ';
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $key => $p) {
                $str .= "{$p['key']}=\"{$p['value']}\" ";
            }
        }
        $str .= '/>';

        return $str;
    }

    public function checkBox($args)
    {
        if (null != $args['default']) {
            $args['default'] = explode(',', $args['default']);
        }

        return $this->_checkBox($args);
    }

    public function _checkBox($args, $isArray = false)
    {
        $str = '<label class="checkbox-inline checkbox inline"><input type="checkbox" ';
        $v = '';
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $key => $p) {
                if ('name' == $p['key'] && $isArray) {
                    $p['value'] .= '[]';
                }
                $str .= "{$p['key']}=\"{$p['value']}\" ";
                if ('value' == $p['key']) {
                    $v = $p['value'];
                }
            }
        }
        if (null != $args['default'] && in_array($v, $args['default'])) {
            $str .= 'checked';
        }
        $str .= '/><span class="selector">'.$args['values']['key'].'</span></label>';

        return $str;
    }

    public function checkBoxArray($args)
    {
        foreach ($args['pars'] as $id => $p) {
            if ('value' == $p['key']) {
                unset($args['pars'][$id]);
                break;
            }
        }
        $str = '';
        if (null != $args['default']) {
            $args['default'] = unserialize($args['default']);
        }
        foreach ($args['values'] as $p) {
            $tmp = $args;
            unset($tmp['values']);
            $tmp['pars'][] = ['key' => 'value', 'value' => $p['value']];
            $tmp['values'] = $p;
            $str .= $this->_checkBox($tmp, true);
        }

        return $str;
    }

    public function select($args)
    {
        unset($args['pars']['value']);
        $str = '<select ';
        if (is_array($args['pars'])) {
            foreach ($args['pars'] as $key => $p) {
                $str .= "{$p['key']}=\"{$p['value']}\" ";
            }
        }
        $str .= '>';
        if (is_array($args['values'])) {
            foreach ($args['values'] as $p) {
                if ($p['value'] == $args['default']) {
                    $str .= "<option value='{$p['value']}' selected>{$p['key']}</option>\n";
                } else {
                    $str .= "<option value='{$p['value']}'>{$p['key']}</option>\n";
                }
            }
        }
        $str .= '</select>';

        return $str;
    }
}
