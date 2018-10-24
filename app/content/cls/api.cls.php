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

class api_content
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->tpl = $this->G->make('tpl');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->files = $this->G->make('files');
        $this->category = $this->G->make('category');
        $this->content = $this->G->make('content', 'content');
        $this->block = $this->G->make('block', 'content');
        $this->tpl_var = &$this->tpl->tpl_var;
    }

    private function _getBlockContentList($args)
    {
        $catids = $this->category->getChildCategoryString($args['catid']);
        if ($args['query']) {
            $query = explode("\n", str_replace("\r", '', html_entity_decode($this->ev->stripSlashes($args['query']))));
        } else {
            $query = [];
        }
        $query[] = ['AND', 'find_in_set(contentcatid,:contentcatid)', 'contentcatid', $catids];
        $r = $this->content->getContentList($query, 1, $args['number']);

        return $r['data'];
    }

    public function parseBlock($blockid)
    {
        $block = $this->block->getBlockById($blockid);
        if (1 == $block['blocktype']) {
            echo html_entity_decode($block['blockcontent']['content']);
        } elseif (2 == $block['blocktype']) {
            if ('content' == $block['blockcontent']['app']) {
                $args = ['catid' => $block['blockcontent']['catid'], 'number' => $block['blockcontent']['number'], 'query' => $block['blockcontent']['query']];
                $blockdata = $this->_getBlockContentList($args);
                $tp = $this->tpl->fetchContent(html_entity_decode($this->ev->stripSlashes($block['blockcontent']['template'])));
                $blockcat = $this->category->getCategoryById($block['blockcontent']['catid']);
                $blockcatchildren = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $block['blockcontent']['catid']]]);
                eval(' ?>'.$tp.'<?php ');
            } else {
                $args = ['catid' => $block['blockcontent']['catid'], 'number' => $block['blockcontent']['number'], 'query' => $block['blockcontent']['query']];
                $obj = $this->G->make('api', $block['blockcontent']['app']);
                if (method_exists($obj, 'parseBlock')) {
                    $blockdata = $obj->parseBlock($args);
                } else {
                    return false;
                }
            }

            return true;
        } elseif (3 == $block['blocktype']) {
            if ($block['blockcontent']['sql']) {
                $sql = ['sql' => str_replace('[TABLEPRE]', DTH, $block['blockcontent']['sql'])];
            } else {
                $tables = array_filter(explode(',', $block['blockcontent']['dbtable']));
                $querys = array_filter(explode("\n", str_replace("\r", '', html_entity_decode($this->ev->stripSlashes($block['blockcontent']['query'])))));
                $args = [];
                foreach ($querys as $p) {
                    $a = explode('|', $p);
                    if ($a[3]) {
                        if ('$' == $a[3][0]) {
                            $s = stripos($a[3], '[');
                            $k = substr($a[3], 1, $s - 1);
                            $v = substr($a[3], $s, (strlen($a[3]) - $s));
                            $execode = "\$a[3] = \"{\$this->tpl_var['$k']$v}\";";
                        } else {
                            $k = substr($a[3], 2, (strlen($a[3]) - 2));
                            $execode = "\$a[3] = \"{\$$k}\";";
                        }
                        eval($execode);
                    }
                    $args[] = $a;
                }

                $data = [false, $tables, $args, false, $block['blockcontent']['order'], $block['blockcontent']['limit']];
                $sql = $this->pdosql->makeSelect($data);
            }
            $blockdata = $this->db->fetchAll($sql, $block['blockcontent']['index'] ? $block['blockcontent']['index'] : false, $block['blockcontent']['serial'] ? $block['blockcontent']['serial'] : false);
            $tp = $this->tpl->fetchContent(html_entity_decode($this->ev->stripSlashes($block['blockcontent']['template'])));
            eval(' ?>'.$tp.'<?php ');

            return true;
        } elseif (4 == $block['blocktype']) {
            $tp = $this->tpl->fetchContent(html_entity_decode($this->ev->stripSlashes($block['blockcontent']['content'])));
            eval(' ?>'.$tp.'<?php ');
        } else {
            return false;
        }
    }
}
