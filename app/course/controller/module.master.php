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

    private function fields()
    {
        $moduleid = $this->ev->get('moduleid');
        $page = $this->ev->post('page');
        if ($this->ev->get('modifyfieldsequence')) {
            $ids = $this->ev->post('ids');
            if ($ids) {
                foreach ($ids as $key => $value) {
                    $args = ['fieldsequence' => $value];
                    $this->module->modifyFieldHtmlType($key, $args);
                }
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?course-master-module-fields&moduleid={$moduleid}",
            ];
            exit(json_encode($message));
        }

        $module = $this->module->getModuleById($moduleid);
        $fields = $this->module->getMoudleFields($moduleid, 1, true);
        $this->tpl->assign('moduleid', $moduleid);
        $this->tpl->assign('module', $module);
        $this->tpl->assign('fields', $fields);
        $this->tpl->display('fields');
    }

    private function addfield()
    {
        $moduleid = $this->ev->get('moduleid');
        $fieldpublic = $this->ev->get('fieldpublic');
        $page = $this->ev->post('page');
        if ($this->ev->get('insertfield')) {
            $args = $this->ev->post('args');
            $moduleid = $args['fieldmoduleid'];
            $module = $this->module->getModuleById($moduleid);
            if (!$args['fieldpublic']) {
                $args['field'] = $module['modulecode'].'_'.$args['field'];
            }
            $args['fieldforbidactors'] = ','.implode(',', $args['fieldforbidactors']).',';
            $id = $this->module->insertModuleField($args);
            if ($id) {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?course-master-module-fields&moduleid={$moduleid}&page={$page}",
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
            }
            exit(json_encode($message));
        }

        $module = $this->module->getModuleById($moduleid);
        $this->tpl->assign('moduleid', $moduleid);
        $this->tpl->assign('fieldpublic', $fieldpublic);
        $this->tpl->assign('module', $module);
        $this->tpl->display('addfield');
    }

    private function preview()
    {
        $moduleid = $this->ev->get('moduleid');
        $module = $this->module->getModuleById($moduleid);
        $fields = $this->module->getMoudleFields($moduleid, 1);
        $forms = $this->html->buildHtml($fields);
        $this->tpl->assign('moduleid', $moduleid);
        $this->tpl->assign('module', $module);
        $this->tpl->assign('fields', $fields);
        $this->tpl->assign('forms', $forms);
        $this->tpl->display('preview');
    }

    private function modifyfield()
    {
        if ($this->ev->get('modifyfieldhtml')) {
            $args = $this->ev->post('args');
            $args['fieldforbidactors'] = ','.implode(',', $args['fieldforbidactors']).',';
            $fieldid = $this->ev->post('fieldid');
            $field = $this->module->getFieldById($fieldid);
            $this->module->modifyFieldHtmlType($fieldid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?course-master-module-fields&moduleid={$field['fieldmoduleid']}",
            ];
            exit(json_encode($message));
        } elseif ($this->ev->get('modifyfielddata')) {
            $args = $this->ev->post('args');
            $fieldid = $this->ev->post('fieldid');
            $field = $this->module->getFieldById($fieldid);
            $this->module->modifyFieldDataType($fieldid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'navTabId'     => '',
                'rel'          => '',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?course-master-module-fields&moduleid={$field['fieldmoduleid']}",
            ];
            exit(json_encode($message));
        }

        $fieldid = $this->ev->get('fieldid');
        $field = $this->module->getFieldById($fieldid);
        $module = $this->module->getModuleById($field['fieldmoduleid']);
        $this->tpl->assign('fieldid', $fieldid);
        $this->tpl->assign('module', $module);
        $this->tpl->assign('field', $field);
        $this->tpl->display('modifyfield');
    }

    private function delfield()
    {
        $fieldid = $this->ev->get('fieldid');
        $moduleid = $this->ev->get('moduleid');
        $r = $this->module->delField($fieldid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?course-master-module-fields&moduleid={$moduleid}",
        ];
        exit(json_encode($message));
    }

    private function modify()
    {
        $page = $this->ev->get('page');
        if ($this->ev->get('modifymodule')) {
            $args = $this->ev->get('args');
            $moduleid = $this->ev->get('moduleid');
            $this->module->modifyModule($moduleid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?course-master-module',
            ];
            exit(json_encode($message));
        }

        $moduleid = $this->ev->get('moduleid');
        $module = $this->module->getModuleById($moduleid);
        $this->tpl->assign('module', $module);
        $this->tpl->display('modifymodule');
    }

    private function forbiddenfield()
    {
        $fieldid = $this->ev->get('fieldid');
        $moduleid = $this->ev->get('moduleid');
        $field = $this->module->getFieldById($fieldid);
        if (!$moduleid) {
            $moduleid = $field['fieldmoduleid'];
        }
        $module = $this->module->getModuleById($moduleid);
        if ($module['modulelockfields'][$field['field']]) {
            unset($module['modulelockfields'][$field['field']]);
        } else {
            $module['modulelockfields'][$field['field']] = 1;
        }
        $this->module->modifyModule($moduleid, ['modulelockfields' => $module['modulelockfields']]);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function add()
    {
        $page = intval($this->ev->get('page'));
        if ($this->ev->post('insertmodule')) {
            $args = $this->ev->post('args');
            $errmsg = false;
            if ($this->module->searchModules([['AND', 'modulecode = :modulecode', 'modulecode', $args['modulecode']]])) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败，存在同名（代码）模型',
                ];
                exit(json_encode($message));
            }
            $id = $this->module->insertModule($args);
            if (!$id) {
                $errmsg = '模型添加出错';
            }
            if (!$errmsg) {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?course-master-module&page={$page}",
                ];
                exit(json_encode($message));
            }

            $message = [
                'statusCode' => 300,
                'message'    => "操作失败，{$errmsg}",
            ];

            exit(json_encode($message));
        }

        $this->tpl->display('addmodule');
    }

    private function del()
    {
        $moduleid = $this->ev->get('moduleid');
        $fileds = $this->module->getPrivateMoudleFields($moduleid);
        $groups = $this->user->getGroupsByModuleid($moduleid);
        if ($fileds || $groups) {
            $message = [
                'statusCode' => 300,
                'message'    => '操作失败，请先删除该模型下所有模型字段和用户组',
            ];
        } else {
            $this->module->delModule($moduleid);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
        }
        exit(json_encode($message));
    }

    private function index()
    {
        $this->tpl->display('module');
    }
}
