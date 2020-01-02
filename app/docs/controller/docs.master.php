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
        $this->tpl->assign('search', $search);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function setdochistory()
    {
        if ($this->ev->get('setdochistory')) {
            if ('delete' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->delDocHistory($key);
                }
            } elseif ('pass' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDocHistory($key, ['dhstatus' => 1]);
                }
            } elseif ('unpass' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDocHistory($key, ['dhstatus' => 2]);
                }
            } elseif ('waitpass' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDocHistory($key, ['dhstatus' => 0]);
                }
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        } elseif ('nowuse' == $this->ev->get('action')) {
            $dhid = $this->ev->get('dhid');
            $history = $this->doc->getDocHistroyById($dhid);
            $this->doc->modifyDoc($history['dhdocid'], ['doccontentid' => $dhid]);
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

    private function history()
    {
        $docid = $this->ev->get('docid');
        $page = $this->ev->get('page');
        $doc = $this->doc->getDocById($docid, false);
        $args = [];
        $args[] = ['AND', 'dhdocid = :dhdocid', 'dhdocid', $docid];
        $histories = $this->doc->getDocHistoryListByArgs($args, $page);
        $this->tpl->assign('doc', $doc);
        $this->tpl->assign('histories', $histories);
        $this->tpl->display('docs_history');
    }

    private function catsmenu()
    {
        $catid = $this->ev->get('catid');
        $categories = $this->category->getAllCategory();
        $r = [];
        $this->category->selected = $catid;
        $this->category->hrefpre = 'index.php?docs-master-docs&catid=';
        $this->category->levelCategory($r, 0, $this->category->tidycategories);
        $this->category->resetCategoryIndex($r);
        echo 'var treeData = '.json_encode($r);
        exit();
    }

    private function add()
    {
        if ($this->ev->get('submit')) {
            $args = $this->ev->get('args');
            $args['docusername'] = $this->_user['sessionusername'];
            $args['docinputtime'] = TIME;
            $args['docneedmore'] = 1;
            $id = $this->doc->addDoc($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?docs-master-docs&catid={$args['doccatid']}",
            ];
            exit(json_encode($message));
        }

        $catid = intval($this->ev->get('catid'));
        $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0']]);
        $this->tpl->assign('parentcat', $parentcat);
        $this->tpl->assign('catid', $catid);
        $this->tpl->display('docs_add');
    }

    private function edit()
    {
        $page = intval($this->ev->get('page'));
        $docid = intval($this->ev->get('docid'));
        $doc = $this->doc->getDocById($docid, false);
        if ($this->ev->get('submit')) {
            $args = $this->ev->get('args');
            $args['docmodifytime'] = TIME;
            unset($args['doccatid']);
            $this->doc->modifyDoc($docid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?docs-master-docs&catid={$doc['doccatid']}&page={$page}{$this->u}",
            ];
            exit(json_encode($message));
        }

        $catid = intval($this->ev->get('catid'));
        $cat = $this->category->getCategoryById($catid);
        $this->tpl->assign('catid', $catid);
        $this->tpl->assign('cat', $cat);
        $this->tpl->assign('docid', $docid);
        $this->tpl->assign('doc', $doc);
        $this->tpl->assign('page', $page);
        $this->tpl->display('docs_edit');
    }

    private function del()
    {
        $page = intval($this->ev->get('page'));
        $docid = intval($this->ev->get('docid'));
        $doc = $this->doc->getDocById($docid);
        if ($doc) {
            $this->doc->delDoc($docid);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function lite()
    {
        $catid = $this->ev->get('catid');
        $page = $this->ev->get('page');
        $this->tpl->assign('catid', $catid);
        $this->tpl->assign('page', $page);
        if ($this->ev->get('modifycontentsequence')) {
            if ('delete' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->delDoc($key);
                }
            } elseif ('move' == $this->ev->get('action')) {
                $docids = [];
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    if ($key) {
                        $docids[] = $key;
                    }
                }
                $docids = implode(',', $docids);
                $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0']]);
                $this->tpl->assign('parentcat', $parentcat);
                $this->tpl->assign('docids', $docids);
                $this->tpl->display('docs_move');
                exit;
            } elseif ('more' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDoc($key, ['docneedmore' => 1]);
                }
            } elseif ('unmore' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDoc($key, ['docneedmore' => 0]);
                }
            } elseif ('top' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDoc($key, ['docistop' => 1]);
                }
            } elseif ('untop' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDoc($key, ['docistop' => 0]);
                }
            } elseif ('lock' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDoc($key, ['docsyslock' => 1]);
                }
            } elseif ('unlock' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDoc($key, ['docsyslock' => 0]);
                }
            } else {
                $ids = $this->ev->get('ids');
                foreach ($ids as $key => $id) {
                    $this->doc->modifyDoc($key, ['docsequence' => $id]);
                }
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?docs-master-docs&catid={$catid}&page={$page}{$u}",
            ];
            exit(json_encode($message));
        } elseif ($this->ev->get('movecategory')) {
            $docids = explode(',', $this->ev->get('docids'));
            $targetcatid = $this->ev->get('targetcatid');
            if ($targetcatid) {
                foreach ($docids as $key => $id) {
                    if ($id) {
                        $this->doc->modifyDoc($id, ['doccatid' => $targetcatid]);
                    }
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?docs-master-docs&catid={$catid}&page={$page}{$u}",
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
            }
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
        $search = $this->ev->get('search');
        $catid = intval($this->ev->get('catid'));
        $page = intval($this->ev->get('page'));
        $page = $page ? $page : 1;
        if (!$catid) {
            $catid = $search['doccatid'];
        }
        $categories = $this->category->getAllCategory();
        $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0'], ['AND', "catapp = 'docs'"]]);
        if ($catid) {
            $childstring = $this->category->getChildCategoryString($catid);
            $args = [['AND', 'find_in_set(doccatid,:doccatid)', 'doccatid', $childstring]];
        } else {
            $args = [];
        }
        if ($search['docid']) {
            $args[] = ['AND', 'docid = :docid', 'docid', $search['docid']];
        } else {
            if ($search['doccatid']) {
                $args[] = ['AND', 'doccatid = :doccatid', 'doccatid', $search['doccatid']];
            }
            if ($search['stime']) {
                $args[] = ['AND', 'docinputtime >= :sdocinputtime', 'sdocinputtime', strtotime($search['stime'])];
            }
            if ($search['etime']) {
                $args[] = ['AND', 'docinputtime <= :edocinputtime', 'edocinputtime', strtotime($search['etime'])];
            }
            if ($search['keyword']) {
                $args[] = ['AND', 'doctitle LIKE :doctitle', 'doctitle', "%{$search['keyword']}%"];
            }
            if ($search['docneedmore']) {
                if ('-1' == $search['docneedmore']) {
                    $nm = 0;
                } else {
                    $nm = 1;
                }
                $args[] = ['AND', 'docneedmore = :docneedmore', 'docneedmore', $nm];
            }
            if ($search['docistop']) {
                if ('-1' == $search['docistop']) {
                    $top = 0;
                } else {
                    $top = 1;
                }
                $args[] = ['AND', 'docistop = :docistop', 'docistop', $top];
            }
            if ($search['docsyslock']) {
                if ('-1' == $search['docsyslock']) {
                    $lock = 0;
                } else {
                    $lock = 1;
                }
                $args[] = ['AND', 'docsyslock = :docsyslock', 'docsyslock', $lock];
            }
        }
        $catlevel = 1;
        if ($catid) {
            $pos = $this->category->getCategoryPos($catid);
            if (count($pos)) {
                $catlevel = count($pos) + 1;
            }
        }
        $this->tpl->assign('catlevel', $catlevel);
        $docs = $this->doc->getDocList($args, $page, 10);
        $this->tpl->assign('catid', $catid);
        $this->tpl->assign('docs', $docs);
        $this->tpl->assign('parentcat', $parentcat);
        $this->tpl->assign('categories', $categories);
        $this->tpl->assign('page', $page);
        $this->tpl->display('docs');
    }
}
