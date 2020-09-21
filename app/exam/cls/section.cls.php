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

class section_exam
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    //根据参数查询某一章节
    public function getSectionByArgs($args)
    {
        $data = [false, 'sections', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //根据参数查询章节列表
    public function getSectionListByArgs($args)
    {
        $data = [false, 'sections', $args, false, 'sectionsequence desc,sectionid asc'];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'sectionid');
    }

    //根据参数获取章节列表
    public function getSectionList($page, $number = 20, $args = 1)
    {
        $page = $page > 0 ? $page : 1;
        $r = [];
        $data = [false, 'sections', $args, false, 'sectionsequence desc,sectionid asc', [intval($page - 1) * $number, $number]];
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchAll($sql);
        $data = ['count(*) AS number', 'sections', $args];
        $sql = $this->pdosql->makeSelect($data);
        $t = $this->db->fetch($sql);
        $pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    //添加章节
    public function addSection($args)
    {
        $data = ['sections', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //删除章节
    public function delSection($id)
    {
        $data = ['sections', [['AND', 'sectionid = :sectionid', 'sectionid', $id]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    //修改章节信息
    public function modifySection($id, $args)
    {
        $data = ['sections', $args, [['AND', 'sectionid = :sectionid', 'sectionid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    //获取所有知识点
    public function getAllKnowsBySubject($subjectid)
    {
        $data = [false, ['sections', 'knows'], [['AND', 'sections.sectionsubjectid = :subjectid', 'subjectid', $subjectid], ['AND', 'sections.sectionid = knows.knowssectionid'], ['AND', 'knows.knowsstatus = 1']], false, 'knowssequence desc,knowsid asc', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'knowsid');
    }

    //获取多科目所有知识点
    public function getAllKnowsBySubjects($subjectids)
    {
        $data = [false, ['sections', 'knows'], [['AND', 'find_in_set(sections.sectionsubjectid,:subjectids)', 'subjectids', $subjectids], ['AND', 'sections.sectionid = knows.knowssectionid'], ['AND', 'knows.knowsstatus = 1']], false, 'knowssequence desc,knowsid asc', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'knowsid');
    }

    //根据章节获取知识点列表
    public function getKnowsList($page, $number = 20, $args = 1)
    {
        $page = $page > 0 ? $page : 1;
        $r = [];
        $data = [false, 'knows', $args, false, 'knowssequence desc,knowsid asc', [intval($page - 1) * $number, $number]];
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchAll($sql);
        $data = ['count(*) AS number', 'knows', $args];
        $sql = $this->pdosql->makeSelect($data);
        $t = $this->db->fetch($sql);
        $pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    //根据参数获取全部匹配的知识点列表
    public function getKnowsListByArgs($args)
    {
        $data = [false, 'knows', $args, false, 'knowssequence desc,knowsid asc', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'knowsid');
    }

    public function getKnowsById($knowsid)
    {
        $data = [false, 'knows', [['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //根据参数获取某一知识点
    public function getKnowsByArgs($args)
    {
        $data = [false, 'knows', $args, false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //添加知识点
    public function addKnows($args)
    {
        $args['knowsstatus'] = 1;
        $data = ['knows', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //删除知识点
    public function delKnows($knowsid, $bool = true)
    {
        if ($bool) {
            $data = ['knows', [['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]];
            $sql = $this->pdosql->makeDelete($data);

            return $this->db->exec($sql);
        }

        $data = ['knows', ['knowsstatus' => 0], [['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    //恢复知识点
    public function backKnows($knowsid)
    {
        $data = ['knows', ['knowsstatus' => 1], [['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    //修改知识点
    public function modifyKnows($knowsid, $args)
    {
        $data = ['knows', $args, [['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    //根据知识点获取章节和科目信息
    public function getSubjectAndSectionByKnowsid($knowsid)
    {
        $data = [false, ['knows', 'sections'], [['AND', 'knows.knowsid = :knowsid', 'knowsid', $knowsid], ['AND', 'knows.knowssectionid = sections.sectionid']]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getQuestionsByKnows($knowsid)
    {
        $knows = $this->getKnowsById($knowsid);
        $knows['knowsnumber'] = unserialize($knows['knowsnumber']);
        $knows['knowsquestions'] = unserialize($knows['knowsquestions']);
        if (!$knows['knowsquestions']) {
            $data = ['DISTINCT questionid', ['questions', 'quest2knows'], [['AND', 'find_in_set(quest2knows.qkknowsid,:knowsid)', 'knowsid', $knowsid], ['AND', 'quest2knows.qktype = 0'], ['AND', 'quest2knows.qkquestionid = questions.questionid'], ['AND', 'questions.questionstatus = 1']], false, false, false];
            $sql1 = $this->pdosql->makeSelect($data);
            $data = ['questionid,questiontype', 'questions', [['AND', 'questionid in (%CHILDSQL%)']], false, 'questionparent asc,questionsequence asc,questionid asc', false];
            $sql = $this->pdosql->makeSelect($data);
            $sql['sql'] = str_replace('%CHILDSQL%', $sql1['sql'], $sql['sql']);
            $sql['v'] = array_merge($sql1['v'], $sql['v']);
            $r = $this->db->fetchAll($sql);
            $t = [];
            $n = [];
            foreach ($r as $p) {
                $t[$p['questiontype']][] = $p['questionid'];
            }
            $data = ['DISTINCT questionid', ['questions', 'questionrows', 'quest2knows'], [['AND', 'find_in_set(quest2knows.qkknowsid,:knowsid)', 'knowsid', $knowsid], ['AND', 'quest2knows.qktype = 1'], ['AND', 'quest2knows.qkquestionid = questionrows.qrid'], ['AND', 'questions.questionparent = questionrows.qrid'], ['AND', 'questionrows.qrstatus = 1']], false, false, false];
            $sql1 = $this->pdosql->makeSelect($data);
            $data = ['questionid,qrtype', ['questions', 'questionrows'], [['AND', 'questionid in (%CHILDSQL%)'], ['AND', 'questionparent = qrid']], false, 'questionparent asc,questionsequence asc,questionid asc', false];
            $sql = $this->pdosql->makeSelect($data);
            $sql['sql'] = str_replace('%CHILDSQL%', $sql1['sql'], $sql['sql']);
            $sql['v'] = array_merge($sql1['v'], $sql['v']);
            $r = $this->db->fetchAll($sql);
            foreach ($r as $p) {
                $t[$p['qrtype']][] = $p['questionid'];
            }
            foreach ($t as $key => $v) {
                $n[$key] = count($v);
            }
            $knows['knowsquestions'] = $t;
            $knows['knowsnumber'] = $n;
            $args = [
                'knowsquestions' => $t,
                'knowsnumber'    => $n,
            ];
            $this->modifyKnows($knowsid, $args);
        }

        return $knows;
    }
}
