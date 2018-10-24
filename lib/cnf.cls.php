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

class cnf
{
    public $G;

    public $config = [];

    private $table;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->table = DTH.'config';
    }

    public function getCfgDataByModule($app = 'core')
    {
        if ((!isset($this->config[$app])) || (!is_array($this->config[$app]))) {
            $ca = $this->G->make('ca');
            if ($ca->isTimeOut($app, 3600)) {
                $sql = 'SELECT * FROM `'.$this->table."` WHERE module = '{$app}'";
                $tmp = $this->G->make('db')->fetchAll(1, $sql);
                foreach ($tmp as $p) {
                    $this->config[$app][$p['name']] = $p['value'];
                }
                $ca->writeCache($app, $this->config[$app]);
            } else {
                $this->config[$app] = $ca->readCache($app);
            }
        }

        return $this->config[$app];
    }

    public function getCfgData($parname, $app = 'core')
    {
        if (!isset($this->config[$app][$parname])) {
            $this->getCfgDataByModule($app);
        }

        return $this->config[$app][$parname];
    }
}
