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

    public function index()
    {
        $fn = $this->ev->get('CKEditorFuncNum');
        $upfile = $this->ev->getFile('upload');
        $path = 'files/attach/files/content/'.date('Ymd').'/';
        $args = [];
        $args['attext'] = $this->files->getFileExtName($upfile['name']);
        if (!in_array(strtolower($args['attext']), $this->allowexts) || in_array(strtolower($args['attext']), $this->forbidden)) {
            $message = '上传失败，附件类型不符!';
            $back = [
                'error' => [
                    'number'  => 105,
                    'message' => $message,
                ],
            ];
            exit(json_encode($back));
        }
        if ($upfile) {
            $fileurl = $this->files->uploadFile($upfile, $path, $args['attext'], null);
        }
        if ($fileurl) {
            $osspath = false;
            if (defined('OPENOSS') && OPENOSS) {
                $osspath = $this->G->make('oss')->upload($fileurl);
                $osspath = str_ireplace(['http://', 'https://'], '//', $osspath);
            }
            $message = '上传成功!';
            $args['attpath'] = $fileurl;
            $args['atttitle'] = $upfile['name'];
            $args['attsize'] = $upfile['size'];
            $args['attuserid'] = $this->_user['sessionuserid'];
            $args['attcntype'] = $upfile['type'];
            $this->attach->addAttach($args);
            $back = [
                'fileName' => $upfile['name'],
                'url'      => $fileurl,
                'uploaded' => 1,
            ];
        } else {
            $message = '上传失败，附件类型不符!';
            $back = [
                'error' => [
                    'number'  => 105,
                    'message' => $message,
                ],
            ];
        }
        exit(json_encode($back));
    }
}
