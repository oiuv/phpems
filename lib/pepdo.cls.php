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

class pepdo
{
    public $G;
    private $queryid = 0;
    private $linkid = 0;
    private $log = SQLDEBUG;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->sql = $this->G->make('pdosql');
    }

    private function _log($sql, $query)
    {
        if ($this->log) {
            $fp = fopen(PEPATH.'/data/error.log', 'a');
            fwrite($fp, print_r($sql, true).print_r($query->errorInfo(), true));
            fclose($fp);
        }
    }

    public function connect($host = DH, $dbuser = DU, $password = DP, $dbname = DB, $dbcode = HE)
    {
        $dsn = "mysql:host={$host};dbname={$dbname};";
        $this->linkid = new PDO($dsn, $dbuser, $password);
        if (HE == 'utf-8') {
            $this->linkid->query('set names utf8');
        } else {
            $this->linkid->query('set names gbk');
        }
    }

    public function commit()
    {
        if (!$this->linkid) {
            $this->connect();
        }
        $this->linkid->commit();
    }

    public function beginTransaction()
    {
        if (!$this->linkid) {
            $this->connect();
        }
        $this->linkid->beginTransaction();
    }

    public function rollback()
    {
        if (!$this->linkid) {
            $this->connect();
        }
        $this->linkid->rollback();
    }

    public function fetchAll($sql, $index = false, $unserialize = false)
    {
        if (!is_array($sql)) {
            return false;
        }
        if (!$this->linkid) {
            $this->connect();
        }
        $query = $this->linkid->prepare($sql['sql']);
        $rs = $query->execute($sql['v']);
        $this->_log($sql, $query);
        if ($rs) {
            $query->setFetchMode(PDO::FETCH_ASSOC);
            //return $query->fetchAll();
            $r = [];
            while ($tmp = $query->fetch()) {
                if ($unserialize) {
                    if (is_array($unserialize)) {
                        foreach ($unserialize as $value) {
                            $tmp[$value] = unserialize($tmp[$value]);
                        }
                    } else {
                        $tmp[$unserialize] = unserialize($tmp[$unserialize]);
                    }
                }
                if ($index) {
                    $r[$tmp[$index]] = $tmp;
                } else {
                    $r[] = $tmp;
                }
            }

            return $r;
        }

        return false;
    }

    public function fetch($sql, $unserialize = false)
    {
        if (!is_array($sql)) {
            return false;
        }
        if (!$this->linkid) {
            $this->connect();
        }
        $query = $this->linkid->prepare($sql['sql']);
        $rs = $query->execute($sql['v']);
        $this->_log($sql, $query);
        if ($rs) {
            $query->setFetchMode(PDO::FETCH_ASSOC);
            $tmp = $query->fetch();
            if ($tmp) {
                if ($unserialize) {
                    if (is_array($unserialize)) {
                        foreach ($unserialize as $value) {
                            $tmp[$value] = unserialize($tmp[$value]);
                        }
                    } else {
                        $tmp[$unserialize] = unserialize($tmp[$unserialize]);
                    }
                }
            }

            return $tmp;
        }

        return false;
    }

    public function query($sql)
    {
        if (!$sql) {
            return false;
        }
        if (!$this->linkid) {
            $this->connect();
        }

        return $this->linkid->query($sql);
    }

    public function exec($sql)
    {
        $this->affectedRows = 0;
        if (!is_array($sql)) {
            return false;
        }
        if (!$this->linkid) {
            $this->connect();
        }
        if ($sql['dim']) {
            return $this->dimexec($sql);
        }

        $query = $this->linkid->prepare($sql['sql']);
        $rs = $query->execute($sql['v']);
        $this->_log($sql, $query);
        $this->affectedRows = $rs;

        return $rs;
    }

    public function dimexec($sql)
    {
        if (!is_array($sql)) {
            return false;
        }
        if (!$this->linkid) {
            $this->connect();
        }
        $query = $this->linkid->prepare($sql['sql']);
        foreach ($sql['v'] as $p) {
            $rs = $query->execute($p);
        }
        //if($stmt->errorInfo())print_r($stmt->errorInfo());
        //else
        return $rs;
    }

    public function lastInsertId()
    {
        return $this->linkid->lastInsertId();
    }

    public function insertElement($args)
    {
        $data = [$args['table'], $args['query']];
        $sql = $this->sql->makeInsert($data);
        $this->exec($sql);

        return $this->lastInsertId();
    }

    public function listElements($page, $number, $args, $tablepre = DTH)
    {
        if (!is_array($args)) {
            return false;
        }
        $pg = $this->G->make('pg');
        $page = $page > 0 ? $page : 1;
        $r = [];
        $data = [$args['select'], $args['table'], $args['query'], $args['groupby'], $args['orderby'], [intval($page - 1) * $number, $number]];
        $sql = $this->sql->makeSelect($data, $tablepre);
        $r['data'] = $this->fetchAll($sql, $args['index'], $args['serial']);
        $data = ['count(*) AS number', $args['table'], $args['query']];
        $sql = $this->sql->makeSelect($data, $tablepre);
        $t = $this->fetch($sql);
        $pages = $pg->outPage($pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    public function delElement($args)
    {
        $data = [$args['table'], $args['query'], $args['orderby'], $args['limit']];
        $sql = $this->sql->makeDelete($data);

        return $this->exec($sql);
        //return $this->affectedRows();
    }

    public function updateElement($args)
    {
        $data = [$args['table'], $args['value'], $args['query'], $args['limit']];
        $sql = $this->sql->makeUpdate($data);

        return $this->exec($sql);
        //$this->affectedRows();
    }

    public function affectedRows()
    {
        return $this->affectedRows;
    }
}
