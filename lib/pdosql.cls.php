<?php

//本类主要用于生成各种SQL语句

class pdosql
{
    public $G;
    public $tablepre = DTH;
    private $_mostlimits = 512;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    private function _makeDefaultInsertArgs($tables, $args)
    {
        $newargs = array();
        if (!is_array($tables)) {
            $tables = array($tables);
        }
        foreach ($tables as $table) {
            $sql = "SHOW FULL COLUMNS FROM  `".$this->tablepre.$table."`";
            $r = $this->G->make('pepdo')->fetchAll(array('sql' => $sql));
            foreach ($r as $p) {
                if ($p['Extra'] != 'auto_increment') {
                    if ($args[$p['Field']]) $newargs[$p['Field']] = $args[$p['Field']];
                    else {
                        if (array_key_exists($p['Field'], $args)) {
                            $newargs[$p['Field']] = $this->_setDefaultInsetValue($p['Type']);
                        } else
                            $newargs[$p['Field']] = $this->_setDefaultInsetValue($p['Type'], $p['Default']);
                    }
                }
            }
        }
        return $newargs;
    }

    private function _makeDefaultUpdateArgs($tables, $args)
    {
        $newargs = array();
        if (!is_array($tables)) {
            $tables = array($tables);
        }
        foreach ($tables as $table) {
            $sql = "SHOW FULL COLUMNS FROM  `".$this->tablepre.$table."`";
            $r = $this->G->make('pepdo')->fetchAll(array('sql' => $sql));
            foreach ($r as $p) {
                if ($p['Extra'] != 'auto_increment') {
                    if (array_key_exists($p['Field'], $args)) {
                        if ($args[$p['Field']]) $newargs[$p['Field']] = $args[$p['Field']];
                        else
                            $newargs[$p['Field']] = $this->_setDefaultInsetValue($p['Type']);
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
                if ($def) return (string)$def;
                else
                    return '';
                break;

            case 'int':
                if ($def) return intval($def);
                else
                    return 0;
                break;

            default:
                if ($def) return floatval($def);
                else
                    return 0;
                break;
        }
    }

    //生成select sql
    //$args = array('*',array('user','user_group'),array(array('AND','user.usergroupid = user_group.groupid'),array('AND','userid >= :userid','userid',$userid),array('OR','usergroupid >= :usergroupid','usergroupid',$usergroupid)));
    //$data = $this->makeSelect($args,$dbh);
    public function makeSelect($args, $tablepre = NULL)
    {
        if ($tablepre === NULL) $tb_pre = $this->tablepre;
        else $tb_pre = $tablepre;
        //if($args[0] === false)$args[0] = '*';
        if (!$args[0]) $args[0] = '*';
        $db_fields = is_array($args[0]) ? implode(',', $args[0]) : $args[0];
        $tables = $args[1];
        if (is_array($tables)) {
            $db_tables = array();
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p} AS $p";
            }
            $db_tables = implode(',', $db_tables);
        } else
            $db_tables = $tb_pre.$tables;
        $query = $args[2];
        if (!is_array($query) || empty($query)) $db_query = 1;
        else {
            $q = array();
            $v = array();
            foreach ($query as $key => $p) {
                if ($key) {
                    $q[] = $p[0].' '.$p[1].' ';
                    if (isset($p[2]))
                        $v[$p[2]] = $p[3];
                } else {
                    $q[] = $p[1].' ';
                    if (isset($p[2]))
                        $v[$p[2]] = $p[3];
                }
            }
            $db_query = ' '.implode(' ', $q);
        }
        if (isset($args[3]))
            $db_groups = is_array($args[3]) ? implode(',', $args[3]) : $args[3];
        else
            $db_groups = '';
        if (isset($args[4]))
            $db_orders = is_array($args[4]) ? implode(',', $args[4]) : $args[4];
        else
            $db_orders = '';
        if (isset($args[5]))
            $db_limits = is_array($args[5]) ? implode(',', $args[5]) : $args[5];
        else
            $db_limits = '';
        if ($db_limits == false && $db_limits !== false) $db_limits = $this->_mostlimits;
        $db_groups = $db_groups ? ' GROUP BY '.$db_groups : '';
        $db_orders = $db_orders ? ' ORDER BY '.$db_orders : '';
        if ($db_limits === false)
            $sql = 'SELECT '.$db_fields.' FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders;
        else
            $sql = 'SELECT '.$db_fields.' FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;
        return array('sql' => $sql, 'v' => $v);
    }

    //生成update sql
    public function makeUpdate($args, $tablepre = NULL)
    {
        if (!is_array($args)) return false;
        if ($tablepre === NULL) $tb_pre = $this->tablepre;
        else $tb_pre = $tablepre;
        $tables = $args[0];
        $args[1] = $this->_makeDefaultUpdateArgs($tables, $args[1]);
        if (is_array($tables)) {
            $db_tables = array();
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p} AS $p";
            }
            $db_tables = implode(',', $db_tables);
        } else
            $db_tables = $tb_pre.$tables;
        $v = array();

        $pars = $args[1];
        if (!is_array($pars)) return false;
        $parsql = array();
        foreach ($pars as $key => $value) {
            $parsql[] = $key.' = '.':'.$key;
            if (is_array($value)) $value = serialize($value);
            $v[$key] = $value;
        }
        $parsql = implode(',', $parsql);

        $query = $args[2];
        if (!is_array($query)) $db_query = 1;
        else {
            $q = array();
            foreach ($query as $p) {
                $q[] = $p[0].' '.$p[1].' ';
                if (isset($p[2]))
                    $v[$p[2]] = $p[3];
            }
            $db_query = '1 '.implode(' ', $q);
        }
        if (isset($args[3]))
            $db_groups = is_array($args[3]) ? implode(',', $args[3]) : $args[3];
        else
            $db_groups = '';
        if (isset($args[4]))
            $db_orders = is_array($args[4]) ? implode(',', $args[4]) : $args[4];
        else
            $db_orders = '';
        if (isset($args[5]))
            $db_limits = is_array($args[5]) ? implode(',', $args[5]) : $args[5];
        else
            $db_limits = '';
        if ($db_limits == false && $db_limits !== false) $db_limits = $this->_mostlimits;
        $db_groups = $db_groups ? ' GROUP BY '.$db_groups : '';
        $db_orders = $db_orders ? ' ORDER BY '.$db_orders : '';
        $sql = 'UPDATE '.$db_tables.' SET '.$parsql.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;
        return array('sql' => $sql, 'v' => $v);
    }

    //生成delete sql
    public function makeDelete($args, $tablepre = NULL)
    {
        if (!is_array($args)) return false;
        if ($tablepre === NULL) $tb_pre = $this->tablepre;
        else $tb_pre = $tablepre;
        $tables = $args[0];
        if (is_array($tables)) {
            $db_tables = array();
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p} AS $p";
            }
            $db_tables = implode(',', $db_tables);
        } else
            $db_tables = $tb_pre.$tables;
        $query = $args[1];
        if (!is_array($query)) $db_query = 1;
        else {
            $q = array();
            $v = array();
            foreach ($query as $p) {
                $q[] = $p[0].' '.$p[1].' ';
                if (isset($p[2]))
                    $v[$p[2]] = $p[3];
            }
            $db_query = '1 '.implode(' ', $q);
        }
        if (isset($args[2]))
            $db_groups = is_array($args[2]) ? implode(',', $args[2]) : $args[2];
        else
            $db_groups = '';
        if (isset($args[3]))
            $db_orders = is_array($args[3]) ? implode(',', $args[3]) : $args[3];
        else
            $db_orders = '';
        if (isset($args[4]))
            $db_limits = is_array($args[4]) ? implode(',', $args[4]) : $args[4];
        else
            $db_limits = '';
        if ($db_limits == false && $db_limits !== false) $db_limits = $this->_mostlimits;
        $db_groups = $db_groups ? ' GROUP BY '.$db_groups : '';
        $db_orders = $db_orders ? ' ORDER BY '.$db_orders : '';
        $sql = 'DELETE FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;
        return array('sql' => $sql, 'v' => $v);
    }

    /**
     * 生成insert sql
     * $args = array('user',array('username' => 'ttt1','useremail' => 'ttt11@166.com','userpassword' => '122s5a1s4sdfs5as5ax4a5sd5s','usergroupid' => '8'));
     * $data = $this->makeInsert($args);
     */

    public function makeInsert($args, $dim = 0, $tb_pre = NULL)
    {
        if ($tb_pre === NULL) $tb_pre = $this->tablepre;
        else $tb_pre = '';
        $tables = $args[0];
        $args[1] = $this->_makeDefaultInsertArgs($tables, $args[1]);
        if (is_array($tables)) {
            $db_tables = array();
            foreach ($tables as $p) {
                $db_tables[] = "{$tb_pre}{$p} AS $p";
            }
            $db_tables = implode(',', $db_tables);
        } else
            $db_tables = $tb_pre.$tables;
        $v = array();
        if ($dim == 0) {
            $query = $args[1];

            foreach ($args[1] as $key => $value) {
                if (is_array($value))
                    $value = serialize($value);
                $v[$key] = $value;
            }
        } else {
            $query = current($args[1]);
            foreach ($args[1] as $pkey => $p) {
                $tn = array();
                foreach ($p as $key => $value) {
                    if (is_array($value))
                        $value = serialize($value);
                    $tn[$key] = $value;
                }
                $v[] = $tn;
            }
        }
        if (!is_array($query)) return false;
        $db_field = array();
        $db_value = array();
        foreach ($query as $key => $value) {
            $db_field[] = $key;
            $db_value[] = ':'.$key;
        }
        $sql = 'INSERT INTO '.$db_tables.' ('.implode(',', $db_field).') VALUES ('.implode(',', $db_value).')';
        return array('sql' => $sql, 'v' => $v, 'dim' => $dim);
    }
}
