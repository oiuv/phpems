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
        $args = [];
        $path = 'files/attach/images/content/'.date('Ymd').'/';
        $upfile = $this->ev->getFile('qqfile');
        $args['attext'] = $this->files->getFileExtName($upfile['name']);
        if (!in_array(strtolower($args['attext']), $this->allowexts)) {
            exit(json_encode(['status' => 'fail']));
        }
        if ($upfile) {
            $fileurl = $this->files->uploadFile($upfile, $path, null, null, $this->allowexts);
        }
        if ($fileurl) {
            $args['attpath'] = $fileurl;
            $args['atttitle'] = $upfile['name'];

            $args['attsize'] = $upfile['size'];
            $args['attuserid'] = $this->_user['sessionuserid'];
            $args['attcntype'] = $upfile['type'];
            $this->attach->addAttach($args);
            if ($this->ev->get('imgwidth') || $this->ev->get('imgheight')) {
                if ($this->files->thumb($fileurl, $fileurl.'.png', $this->ev->get('imgwidth'), $this->ev->get('imgheight'))) {
                    $thumb = $fileurl.'.png';
                } else {
                    $thumb = $fileurl;
                }
            } else {
                $thumb = $fileurl;
            }
            exit(json_encode(['success' => true, 'thumb' => $thumb, 'title' => $upfile['name']]));
        }

        exit(json_encode(['status' => 'fail']));
    }
}
