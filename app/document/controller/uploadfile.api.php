<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * This source file is subject to the MIT license that is bundled.
 */

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function index()
    {
        /**
        $path = 'files/attach/images/content/'.date('Ymd').'/';
        $fileurl = $this->files->uploadFile($this->ev->getFile('Filedata'),$path,NULL,NULL,$this->allowexts);
        echo $fileurl;
         **/
        $fn = $this->ev->get('CKEditorFuncNum');
        $upfile = $this->ev->getFile('upload');
        $path = 'files/attach/files/content/'.date('Ymd').'/';
        $args['attext'] = $this->files->getFileExtName($upfile['name']);
        if (!in_array(strtolower($args['attext']), $this->allowexts)) {
            $message = '上传失败，附件类型不符!';
            $str = '<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('.$fn.',false, \''.$message.'\');</script>';
            exit($str);
        }
        if ($upfile) {
            $fileurl = $this->files->uploadFile($upfile, $path, null, null, $this->allowexts);
        }
        if ($fileurl) {
            $message = '上传成功!';
            $args = [];
            $args['attpath'] = $fileurl;
            $args['atttitle'] = $upfile['name'];
            $args['attext'] = $this->files->getFileExtName($upfile['name']);
            if (!in_array(strtolower($args['attext']), $this->allowexts)) {
                $message = '上传失败，附件类型不符!';
                $str = '<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('.$fn.',false, \''.$message.'\');</script>';
                echo $str;
                exit;
            }
            $args['attsize'] = $upfile['size'];
            $args['attuserid'] = $this->_user['sessionuserid'];
            $args['attcntype'] = $upfile['type'];
            $this->attach->addAttach($args);
            $str = '<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('.$fn.', \''.$fileurl.'\', \''.$message.'\');</script>';
        } else {
            $message = '上传失败，附件类型不符!';
            $str = '<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('.$fn.',false, \''.$message.'\');</script>';
        }
        echo $str;
    }
}
