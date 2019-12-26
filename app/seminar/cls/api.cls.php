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

class api_seminar
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->seminar = $this->G->make('seminar', 'seminar');
    }

    public function parseSeminar($id)
    {
        $elem = $this->seminar->getSeminarElemById($id);
        $data['id'] = $elem['selid'];
        $data['title'] = $elem['seltitle'];
        $data['data'] = $elem['seldata'];
        if ($elem['seldata']['number']) {
            $args = [];
            $args[] = ['AND', 'sctelid = :sctelid', 'sctelid', $id];
            $r = $this->seminar->getSeminarContentList($args, 1, $elem['seldata']['number']);
            $data['list'] = $r['data'];
        }

        return $data;
    }
}
