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
        $search = $this->ev->get('search');
        $this->u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $this->u .= "&search[{$key}]={$arg}";
            }
        }
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function modifycontent()
    {
        if ($this->ev->get('modifyblock')) {
            $posid = $this->ev->get('posid');
            $page = $this->ev->get('page');
            $args = $this->ev->get('args');
            $args['blockcontent'] = $args['blockcontent'];
            unset($args['blocktype']);
            $this->block->modifyBlock($posid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'target'       => '',
                'rel'          => '',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?content-master-positions&page={$page}",
            ];
            exit(json_encode($message));
        }

        $posid = $this->ev->get('posid');
        $page = $this->ev->get('page');
        $block = $this->block->getBlockById($posid);
        $block['blockcontent'] = $this->ev->stripSlashes($block['blockcontent']);
        $apps = $this->apps->getAppList();
        foreach ($apps as $id => $app) {
            $tmp = $this->G->make('api', $app['appid']);
            if ($tmp && method_exists($tmp, 'parseBlock')) {
                continue;
            }

            unset($apps[$id]);
        }
        $this->tpl->assign('block', $block);
        $this->tpl->assign('apps', $apps);
        $this->tpl->assign('page', $page);
        $this->tpl->display('positions_modify');
    }

    private function add()
    {
        if ($this->ev->get('addpos')) {
            $args = $this->ev->get('args');
            $this->position->addPos($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?content-master-positions',
            ];
            exit(json_encode($message));
        }

        $this->tpl->display('positions_add');
    }

    private function modify()
    {
        $posid = $this->ev->get('posid');
        $pos = $this->position->getPosById($posid);
        if ($this->ev->get('modifypos')) {
            $args = $this->ev->get('args');
            $this->position->modifyPos($posid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        }

        $apps = $this->apps->getAppList();
        foreach ($apps as $id => $app) {
            $tmp = $this->G->make('api', $app['appid']);
            if ($tmp && method_exists($tmp, 'parseBlock')) {
                continue;
            }

            unset($apps[$id]);
        }
        $this->tpl->assign('pos', $pos);
        $this->tpl->display('positions_modify');
    }

    private function del()
    {
        $posid = $this->ev->get('posid');
        if ($this->position->getPosContentNumber($posid)) {
            $message = [
                'statusCode' => 300,
                'message'    => '请先删除本推荐位下的内容',
            ];
        } else {
            $this->position->delPos($posid);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
        }
        exit(json_encode($message));
    }

    private function delcontent()
    {
        $pcid = $this->ev->get('pcid');
        $page = $this->ev->get('page');
        $this->position->delPosContent($pcid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function poscontent()
    {
        $page = $this->ev->get('page');
        $posid = $this->ev->get('posid');
        $pos = $this->position->getPosById($posid);
        $args = [];
        $args[] = ['AND', 'pcposid = :pcposid', 'pcposid', $posid];
        $contents = $this->position->getPosContentList($args, $page, 20);
        $this->tpl->assign('contents', $contents);
        $this->tpl->assign('pos', $pos);
        $this->tpl->display('position_content');
    }

    private function lite()
    {
        if ($this->ev->get('modifycontentsequence')) {
            $page = $this->ev->get('page');
            if ('delete' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->position->delPosContent($key);
                }
            } else {
                $ids = $this->ev->get('ids');
                foreach ($ids as $key => $id) {
                    $this->position->modifyPosContent($key, ['pcsequence' => $id]);
                }
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        }

        $message = [
            'statusCode' => 300,
            'message'    => '无效访问',
        ];
        exit(json_encode($message));
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $poses = $this->position->getPosList();
        $this->tpl->assign('poses', $poses);
        $this->tpl->display('positions');
    }
}
