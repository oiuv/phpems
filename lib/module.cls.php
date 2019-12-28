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

class module
{
    public $G;
    private $cache = [];

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    //查询模型
    public function searchModules($args)
    {
        $data = [false, 'module', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'moduleid');
    }

    //根据应用获取模型
    public function getModulesByApp($app)
    {
        $data = [false, 'module', [['AND', 'moduleapp = :app', 'app', $app]], false, 'moduleid DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'moduleid');
    }

    public function getModulesList($args, $page, $number = PN, $order = 'moduleid desc')
    {
        $data = [
            'select'  => false,
            'table'   => 'module',
            'query'   => $args,
            'orderby' => $order,
            'serial'  => 'modulelockfields',
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    //根据ID获取模型
    public function getModuleById($moduleid)
    {
        if (!$this->cache['module'][$moduleid]) {
            $data = [false, 'module', [['AND', 'moduleid = :moduleid', 'moduleid', $moduleid]]];
            $sql = $this->pdosql->makeSelect($data);
            $this->cache['module'][$moduleid] = $this->db->fetch($sql, 'modulelockfields');
        }

        return $this->cache['module'][$moduleid];
    }

    //插入模型
    public function insertModule($args)
    {
        if (!$args['moduleapp']) {
            $args['moduleapp'] = $this->G->app;
        }
        if ('autoform' == $args['moduleapp']) {
            $args['moduletable'] = 'autoform_'.$args['modulecode'];
            $this->_insertDefaultTable($args['moduletable'], $args['modulecode'].'id');
        }
        $data = ['module', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //插入独立表模型
    public function insertTableModule($args)
    {
        if (!$args['moduleapp']) {
            $args['moduleapp'] = $this->G->app;
        }
        $args['moduletable'] = $args['moduleapp'].'_'.$args['modulecode'];
        $this->_insertDefaultTable($args['moduletable'], $args['modulecode'].'id');
        $data = ['module', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //插入默认的表，$primary为主键字段名，必须为INT 11
    private function _insertDefaultTable($table, $primary)
    {
        $fields = [['name' => $primary, 'type' => 'INT', 'length' => 11, 'auto' => true]];
        $indexs = [['type' => 'PRIMARY KEY', 'field' => $primary]];
        $sql = $this->pdosql->createTable($table, $fields, $indexs);

        return $this->db->query($sql);
    }

    //根据用户获取模型所有字段
    public function getMoudleFields($moduleid, $userinfo = 1, $uselock = false, $app = null)
    {
        if (!$app) {
            $app = $this->G->app;
        }
        $module = $this->getModuleById($moduleid);
        $data = [false, 'module_fields', [['AND', 'fieldmoduleid = :moduleid', 'moduleid', $moduleid], ['OR', ' (fieldpublic = 1 AND fieldappid = :app)', 'app', $app]], false, 'fieldsequence DESC,fieldid DESC'];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        if ($uselock) {
            return $r;
        }
        foreach ($r as $key => $p) {
            if ($module['modulelockfields'][$p['field']]) {
                unset($r[$key]);
            } else {
                if (1 == $userinfo) {
                    if (false !== strpos($p['fieldforbidactors'], ',1,')) {
                        unset($r[$key]);
                    }
                } else {
                    if (false !== strpos($p['fieldforbidactors'], ',-1,')) {
                        unset($r[$key]);
                    }
                }
            }
        }

        return $r;
    }

    public function getTableMoudleFields($moduleid, $userinfo = 1, $uselock = false, $app = null)
    {
        if (!$app) {
            $app = $this->G->app;
        }
        $module = $this->getModuleById($moduleid);
        $data = [false, 'module_fields', [['AND', 'fieldmoduleid = :moduleid', 'moduleid', $moduleid], ['AND', 'fieldappid = :app', 'app', $app]], false, 'fieldsequence DESC,fieldid DESC'];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        if ($uselock) {
            return $r;
        }
        foreach ($r as $key => $p) {
            if ($module['modulelockfields'][$p['field']]) {
                unset($r[$key]);
            } else {
                if (1 == $userinfo) {
                    if (false !== strpos($p['fieldforbidactors'], ',1,')) {
                        unset($r[$key]);
                    }
                } else {
                    if (false !== strpos($p['fieldforbidactors'], ',-1,')) {
                        unset($r[$key]);
                    }
                }
            }
        }

        return $r;
    }

    //获取模型直属字段
    public function getPrivateMoudleFields($moduleid)
    {
        $data = [false, 'module_fields', [['AND', 'fieldmoduleid = :moduleid', 'moduleid', $moduleid], ['AND', 'fieldpublic = 0']], false, 'fieldsequence DESC,fieldid DESC'];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    //删除模型
    public function delModule($moduleid)
    {
        $data = ['module', [['AND', 'moduleid = :moduleid', 'moduleid', $moduleid]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    //删除模型字段
    public function delField($fieldid)
    {
        $field = $this->getFieldById($fieldid);
        $sql = $this->pdosql->delField($field['field'], $this->G->app);
        $this->db->exec($sql);
        $data = ['module_fields', [['AND', 'fieldid = :fieldid', 'fieldid', $fieldid]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    //整理模型所需的参数，除去多余参数
    public function tidyNeedFieldsPars($args, $moduleid, $userinfo = -1)
    {
        $tmp = [];
        foreach ($this->G->make('config', $this->G->app)->fields as $p) {
            if (isset($args[$p])) {
                $tmp[$p] = $args[$p];
            }
        }
        $r = $this->getMoudleFields($moduleid, $userinfo);
        foreach ($r as $key => $data) {
            if ('htmltime' == $data['fieldhtmltype']) {
                $tmp[$data['field']] = strtotime($args[$data['field']]);
            } else {
                $tmp[$data['field']] = $args[$data['field']];
            }
        }

        return $tmp;
    }

    //根据字段名称和模型ID查找字段
    public function getFieldByNameAndModuleid($field, $moduleid = false)
    {
        if ($moduleid) {
            $data = [false, 'module_fields', [['AND', 'fieldmoduleid = :moduleid', 'moduleid', $moduleid], ['AND', 'field = :field', 'field', $field]]];
        } else {
            $data = [false, 'module_fields', [['AND', 'field = :field', 'field', $field]]];
        }
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //根据ID获取字段
    public function getFieldById($fieldid)
    {
        if (!$this->cache['field'][$fieldid]) {
            $data = [false, 'module_fields', [['AND', 'fieldid = :fieldid', 'fieldid', $fieldid]]];
            $sql = $this->pdosql->makeSelect($data);
            $this->cache['field'][$fieldid] = $this->db->fetch($sql);
        }

        return $this->cache['field'][$fieldid];
    }

    //插入模型字段
    public function insertModuleField($args)
    {
        $args['fieldappid'] = $this->G->app;
        $this->insertModuleFieldData($args);
        $data = ['module_fields', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //编辑字段的HTML属性
    public function modifyFieldHtmlType($fieldid, $args)
    {
        $data = ['module_fields', $args, [['AND', 'fieldid = :fieldid', 'fieldid', $fieldid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    //编辑字段的数据库属性
    public function modifyFieldDataType($fieldid, $args)
    {
        $this->modifyModuleField($args, $fieldid);
        $data = ['module_fields', $args, [['AND', 'fieldid = :fieldid', 'fieldid', $fieldid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    //插入模型字段
    public function insertModuleFieldData($args)
    {
        $args['fieldcharset'] = 'utf8';
        $r = $this->getModuleById($args['fieldmoduleid']);
        if ($r['moduletable']) {
            $table = $r['moduletable'];
        } else {
            $table = $this->G->app;
        }
        $sql = $this->sql->addField($args, $table);

        return $this->db->query($sql);
    }

    //修改模型字段
    public function modifyModuleField($fieldid, $args)
    {
        $args['fieldcharset'] = 'utf8';
        $field = $this->getFieldById($fieldid);
        $args['field'] = $field['field'];
        $r = $this->getModuleById($field['fieldmoduleid']);
        if ($r['moduletable']) {
            $table = $r['moduletable'];
        } else {
            $table = $this->G->app;
        }
        $sql = $this->sql->modifyField($args, $table);

        return $this->db->query($sql);
    }

    //修改模型
    public function modifyModule($moduleid, $args)
    {
        $data = ['module', $args, [['AND', 'moduleid = :moduleid', 'moduleid', $moduleid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }
}
