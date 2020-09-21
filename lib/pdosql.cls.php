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

class pdosql
{
    public $G;
    public $tablepre = DTH;
    private $_mostlimits = 512;
    private $db;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $pdo = $this->G->make('pepdo');
        $this->setDb($pdo);
    }

    public function setDb(&$db)
    {
        $this->db = $db;
    }

    //建表
    public function createTable($table, $fields, $indexs = false)
    {
        $sql = 'CREATE TABLE IF NOT EXISTS `'.$this->tablepre."{$table}` (";
        foreach ($fields as $field) {
            $sql .= "\n`{$field['name']}` ";
            if ($field['type']) {
                $sql .= "{$field['type']} ";
            }
            if ($field['length']) {
                $sql .= "( {$field['length']} ) ";
            }
            $sql .= "CHARACTERSET {$field['charset']} COLLATE utf8_general_ci ";
            $sql .= 'NOT NULL ';
            if ($field['auto']) {
                $sql .= 'AUTO_INCREMENT ';
            }
            if ($field['comment']) {
                $sql .= "COMMENT '{$field['comment']}' ";
            }
            $sql .= ',';
        }
        if ($indexs) {
            foreach ($indexs as $index) {
                $sql .= "\n";
                $sql .= $index['type']."( `{$index['field']}` ) ";
                $sql .= ',';
            }
        }
        $sql = trim($sql, ', ');
        $sql .= "\n)";

        return $sql;
    }

    //清空表内数据
    public function clearTableData($table)
    {
        if (is_array($table)) {
            $tsql = 'TRUNCATE TABLE ';
            foreach ($table as $t) {
                $tsql .= "`$this->tablepre`.`$t`,";
            }

            return trim($tsql, ',');
        }

        return "TRUNCATE TABLE `{$table}`";
    }

    //删除表
    public function delTable($table)
    {
        if (is_array($table)) {
            $tsql = 'TRUNCATE TABLE ';
            foreach ($table as $t) {
                $tsql .= "`$this->tablepre`.`$t`,";
            }

            return trim($tsql, ',');
        }

        return "DROP TABLE `{$table}`";
    }

    //修改字段
    public function modifyField($field, $table)
    {
        if ($table) {
            if (is_array($field)) {
                $sql = 'ALTER TABLE `'.$this->tablepre."{$table}` ";
                if ($field['field']) {
                    $sql .= "CHANGE `{$field['field']}` `{$field['field']}`";
                    if ($field['fieldtype']) {
                        $sql .= "{$field['fieldtype']} ";
                    }
                    if ($field['fieldlength']) {
                        $sql .= "( {$field['fieldlength']} )";
                    } else {
                        if ('VARCHAR' == $field['fieldtype']) {
                            $sql .= '( 120 )';
                        } elseif ('DECIMAL' == $field['fieldtype']) {
                            $sql .= '( 10,2 )';
                        }
                    }
                    if ('VARCHAR' == strtoupper($field['fieldtype']) || 'TEXT' == strtoupper($field['fieldtype'])) {
                        if ('gbk' == $field['fieldcharset']) {
                            $sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE gbk_chinese_ci ";
                        } else {
                            $sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE utf8_general_ci ";
                        }
                    }
                    $sql .= 'NOT NULL ';

                    if ($field['fieldindextype']) {
                        $sql .= ", ADD {$field['fieldindextype']} ( `{$field['field']}` ) ";
                    }

                    return $sql;
                }

                return false;
            }

            return false;
        }

        return false;
    }

    //添加字段
    public function addField($field, $table)
    {
        if ($table) {
            if (is_array($field)) {
                $sql = 'ALTER TABLE `'.$this->tablepre."{$table}` ";
                if ($field['field']) {
                    $sql .= "ADD `{$field['field']}` ";
                    $field['fieldtype'] = strtoupper($field['fieldtype']);
                    if ($field['fieldtype']) {
                        $sql .= "{$field['fieldtype']} ";
                    }
                    if ($field['fieldlength']) {
                        $sql .= "( {$field['fieldlength']} )";
                    } else {
                        if ('VARCHAR' == $field['fieldtype']) {
                            $sql .= '( 120 )';
                        } elseif ('DECIMAL' == $field['fieldtype']) {
                            $sql .= '( 10,2 )';
                        }
                    }
                    if ('VARCHAR' == $field['fieldtype'] || 'TEXT' == $field['fieldtype']) {
                        if ('gbk' == $field['fieldcharset']) {
                            $sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE gbk_chinese_ci ";
                        } else {
                            $sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE utf8_general_ci ";
                        }
                    }
                    $sql .= 'NOT NULL ';

                    if ($field['fieldindextype']) {
                        $sql .= ", ADD {$field['fieldindextype']} ( `{$field['field']}` )";
                    }

                    return $sql;
                }

                return false;
            }

            return false;
        }

        return false;
    }

    //删除字段
    public function delField($field, $table)
    {
        $sql = 'ALTER TABLE `'.$this->tablepre."{$table}` DROP `{$field}`";

        return ['sql' => $sql];
    }

    private function _makeDefaultInsertArgs($tables, $args)
    {
        $newargs = [];
        if (!is_array($tables)) {
            $tables = [$tables];
        }
        foreach ($tables as $table) {
            $sql = 'SHOW FULL COLUMNS FROM  `'.$this->tablepre.$table.'`';
            $r = $this->db->fetchAll(['sql' => $sql]);
            foreach ($r as $p) {
                if (is_array($args) && 'auto_increment' != $p['Extra']) {
                    if ($args[$p['Field']]) {
                        $newargs[$p['Field']] = $args[$p['Field']];
                    } else {
                        if (array_key_exists($p['Field'], $args)) {
                            $newargs[$p['Field']] = $this->_setDefaultInsetValue($p['Type']);
                        } else {
                            $newargs[$p['Field']] = $this->_setDefaultInsetValue($p['Type'], $p['Default']);
                        }
                    }
                }
            }
        }

        return $newargs;
    }

    private function _makeDefaultUpdateArgs($tables, $args)
    {
        $newargs = [];
        if (!is_array($tables)) {
            $tables = [$tables];
        }
        foreach ($tables as $table) {
            $sql = 'SHOW FULL COLUMNS FROM  `'.$this->tablepre.$table.'`';
            $r = $this->db->fetchAll(['sql' => $sql]);
            foreach ($r as $p) {
                if ('auto_increment' != $p['Extra']) {
                    if (array_key_exists($p['Field'], $args)) {
                        if ($args[$p['Field']]) {
                            $newargs[$p['Field']] = $args[$p['Field']];
                        } else {
                            $newargs[$p['Field']] = $this->_setDefaultInsetValue($p['Type']);
                        }
                    }
                }
            }
        }

        return $newargs;
    }

    private function _setDefaultInsetValue($type, $def = false)
    {
        $type = explode('(', $type);
        $type = $type[0];
        switch ($type) {
            case 'char':
            case 'varchar':
            case 'tinytext':
            case 'longtext':
            case 'mediumtext':
            case 'text':
            if ($def) {
                return (string) $def;
            }

            return '';
            break;

            case 'int':
            if ($def) {
                return intval($def);
            }

            return 0;
            break;

            default:
            if ($def) {
                return floatval($def);
            }

            return 0;
            break;
        }
    }

    //生成select sql
    //$args = array('*',array('user','user_group'),array(array('AND','user.usergroupid = user_group.groupid'),array('AND','userid >= :userid','userid',$userid),array('OR','usergroupid >= :usergroupid','usergroupid',$usergroupid)));
    //$data = $this->makeSelect($args,$dbh);
    public function makeSelect($args, $tablepre = null)
    {
        if (null === $tablepre) {
            $tb_pre = $this->tablepre;
        } else {
            $tb_pre = $tablepre;
        }
        //if($args[0] === false)$args[0] = '*';
        if (!$args[0]) {
            $args[0] = '*';
        }
        $db_fields = is_array($args[0]) ? implode(',', $args[0]) : $args[0];
        $tables = $args[1];
        if (is_array($tables)) {
            $db_tables = [];
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p} AS $p";
            }
            $db_tables = implode(',', $db_tables);
        } else {
            $db_tables = $tb_pre.$tables;
        }
        $query = $args[2];
        if (!is_array($query) || empty($query)) {
            $db_query = 1;
        } else {
            $q = [];
            $v = [];
            foreach ($query as $key => $p) {
                if (isset($p[2])) {
                    if (is_array($p[3])) {
                        $i = 0;
                        $tkey = [];
                        foreach ($p[3] as $tp) {
                            $tkey[] = ':'.$p[2].'_'.$i;
                            $v[$p[2].'_'.$i] = $tp;
                            $i++;
                        }
                        $p[1] = str_replace(':'.$p[2], implode(',', $tkey), $p[1]);
                    } else {
                        $v[$p[2]] = $p[3];
                    }
                }
                if ($key) {
                    $q[] = $p[0].' '.$p[1].' ';
                } else {
                    $q[] = $p[1].' ';
                }
            }
            $db_query = ' '.implode(' ', $q);
        }
        if (isset($args[3])) {
            $db_groups = is_array($args[3]) ? implode(',', $args[3]) : $args[3];
        } else {
            $db_groups = '';
        }
        if (isset($args[4])) {
            $db_orders = is_array($args[4]) ? implode(',', $args[4]) : $args[4];
        } else {
            $db_orders = '';
        }
        if (isset($args[5])) {
            $db_limits = is_array($args[5]) ? implode(',', $args[5]) : $args[5];
        } else {
            $db_limits = '';
        }
        if (false == $db_limits && false !== $db_limits) {
            $db_limits = $this->_mostlimits;
        }
        $db_groups = $db_groups ? ' GROUP BY '.$db_groups : '';
        $db_orders = $db_orders ? ' ORDER BY '.$db_orders : '';
        if (false === $db_limits) {
            $sql = 'SELECT '.$db_fields.' FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders;
        } else {
            $sql = 'SELECT '.$db_fields.' FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;
        }

        return ['sql' => $sql, 'v' => $v];
    }

    //生成update sql
    public function makeUpdate($args, $tablepre = null)
    {
        if (!is_array($args)) {
            return false;
        }
        if (null === $tablepre) {
            $tb_pre = $this->tablepre;
        } else {
            $tb_pre = $tablepre;
        }
        $tables = $args[0];
        $args[1] = $this->_makeDefaultUpdateArgs($tables, $args[1]);
        if (is_array($tables)) {
            $db_tables = [];
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p} AS $p";
            }
            $db_tables = implode(',', $db_tables);
        } else {
            $db_tables = $tb_pre.$tables;
        }
        $v = [];

        $pars = $args[1];
        if (!is_array($pars)) {
            return false;
        }
        $parsql = [];
        foreach ($pars as $key => $value) {
            $parsql[] = $key.' = '.':'.$key;
            if (is_array($value)) {
                $value = serialize($value);
            }
            $v[$key] = $value;
        }
        $parsql = implode(',', $parsql);

        $query = $args[2];
        if (!is_array($query)) {
            $db_query = 1;
        } else {
            $q = [];
            foreach ($query as $p) {
                $q[] = $p[0].' '.$p[1].' ';
                if (isset($p[2])) {
                    $v[$p[2]] = $p[3];
                }
            }
            $db_query = '1 '.implode(' ', $q);
        }
        if (isset($args[3])) {
            $db_groups = is_array($args[3]) ? implode(',', $args[3]) : $args[3];
        } else {
            $db_groups = '';
        }
        if (isset($args[4])) {
            $db_orders = is_array($args[4]) ? implode(',', $args[4]) : $args[4];
        } else {
            $db_orders = '';
        }
        if (isset($args[5])) {
            $db_limits = is_array($args[5]) ? implode(',', $args[5]) : $args[5];
        } else {
            $db_limits = '';
        }
        if (false == $db_limits && false !== $db_limits) {
            $db_limits = $this->_mostlimits;
        }
        $db_groups = $db_groups ? ' GROUP BY '.$db_groups : '';
        $db_orders = $db_orders ? ' ORDER BY '.$db_orders : '';
        $sql = 'UPDATE '.$db_tables.' SET '.$parsql.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;

        return ['sql' => $sql, 'v' => $v];
    }

    //生成delete sql
    public function makeDelete($args, $tablepre = null)
    {
        if (!is_array($args)) {
            return false;
        }
        if (null === $tablepre) {
            $tb_pre = $this->tablepre;
        } else {
            $tb_pre = $tablepre;
        }
        $tables = $args[0];
        if (is_array($tables)) {
            $db_tables = [];
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p}";
            }
            $db_tables = implode(',', $db_tables);
        } else {
            $db_tables = $tb_pre.$tables;
        }
        $query = $args[1];
        if (!is_array($query)) {
            $db_query = 1;
        } else {
            $q = [];
            $v = [];
            foreach ($query as $p) {
                $q[] = $p[0].' '.$p[1].' ';
                if (isset($p[2])) {
                    $v[$p[2]] = $p[3];
                }
            }
            $db_query = '1 '.implode(' ', $q);
        }
        if (isset($args[2])) {
            $db_groups = is_array($args[2]) ? implode(',', $args[2]) : $args[2];
        } else {
            $db_groups = '';
        }
        if (isset($args[3])) {
            $db_orders = is_array($args[3]) ? implode(',', $args[3]) : $args[3];
        } else {
            $db_orders = '';
        }
        if (isset($args[4])) {
            $db_limits = is_array($args[4]) ? implode(',', $args[4]) : $args[4];
        } else {
            $db_limits = '';
        }
        if ($db_limits) {
            $db_limits = ' LIMIT '.$db_limits;
        }
        //if($db_limits == false && $db_limits !== false)$db_limits = $this->_mostlimits;
        $db_groups = $db_groups ? ' GROUP BY '.$db_groups : '';
        $db_orders = $db_orders ? ' ORDER BY '.$db_orders : '';
        if (is_array($tables)) {
            $sql = 'DELETE '.$db_tables.' FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders.$db_limits;
        } else {
            $sql = 'DELETE FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders.$db_limits;
        }

        return ['sql' => $sql, 'v' => $v];
    }

    /**
     * 生成insert sql
     * $args = array('user',array('username' => 'ttt1','useremail' => 'ttt11@166.com','userpassword' => '122s5a1s4sdfs5as5ax4a5sd5s','usergroupid' => '8'));
     * $data = $this->makeInsert($args);.
     */
    public function makeInsert($args, $dim = 0, $tb_pre = null)
    {
        if (null === $tb_pre) {
            $tb_pre = $this->tablepre;
        } else {
            $tb_pre = '';
        }
        $tables = $args[0];
        $args[1] = $this->_makeDefaultInsertArgs($tables, $args[1]);
        if (is_array($tables)) {
            $db_tables = [];
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p} AS $p";
            }
            $db_tables = implode(',', $db_tables);
        } else {
            $db_tables = $tb_pre.$tables;
        }
        $v = [];
        if (0 == $dim) {
            $query = $args[1];

            foreach ($args[1] as $key => $value) {
                if (is_array($value)) {
                    $value = serialize($value);
                }
                $v[$key] = $value;
            }
        } else {
            $query = current($args[1]);
            foreach ($args[1] as $pkey => $p) {
                $tn = [];
                foreach ($p as $key => $value) {
                    if (is_array($value)) {
                        $value = serialize($value);
                    }
                    $tn[$key] = $value;
                }
                $v[] = $tn;
            }
        }
        if (!is_array($query)) {
            return false;
        }
        $db_field = [];
        $db_value = [];
        foreach ($query as $key => $value) {
            $db_field[] = $key;
            $db_value[] = ':'.$key;
        }
        $sql = 'INSERT INTO '.$db_tables.' ('.implode(',', $db_field).') VALUES ('.implode(',', $db_value).')';

        return ['sql' => $sql, 'v' => $v, 'dim' => $dim];
    }
}
