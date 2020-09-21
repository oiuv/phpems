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

class favor_exam
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
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->session = $this->G->make('session');
        $this->basic = $this->G->make('basic', 'exam');
        $this->exam = $this->G->make('exam', 'exam');
        $this->section = $this->G->make('section', 'exam');
    }

    public function getBestStudentsToday()
    {
        $t = TIME - 24 * 3600 * 7;
        $data = ['count(*) AS number,ehusername,max(ehscore) as ehscore', 'examhistory', [['AND', 'ehstarttime >= :ehstarttime', 'ehstarttime', $t]], 'ehuserid', 'number DESC', 10];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function getBestStudentsThisMonth()
    {
        $t = TIME - 24 * 3600 * 30;
        $data = ['count(*) AS number,ehusername,max(ehscore) as ehscore', 'examhistory', [['AND', 'ehstarttime >= :ehstarttime', 'ehstarttime', $t]], 'ehuserid', 'number DESC', 10];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    //通过用户ID获取收藏试题列表
    //参数：当前页码，单页显示数量，查询参数（数组或字符串）
    //返回值：试题列表数组
    public function getFavorListByUserid($args, $page, $number = 20, $orderby = 'favorid desc')
    {
        $args[] = ['AND', 'favor.favorquestionid = questions.questionid'];
        $data = [
            'select'  => false,
            'table'   => ['favor', 'questions'],
            'query'   => $args,
            'orderby' => $orderby,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    //收藏试题
    //参数：试题ID，用户ID，考试ID
    //返回值：试题收藏后的插入ID
    public function favorQuestion($questionid, $userid, $subjectid)
    {
        $args = ['favorsubjectid' => $subjectid, 'favorquestionid' => $questionid, 'favoruserid' => $userid, 'favortime' => TIME];
        $data = ['favor', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //根据ID获取试题是否收藏
    //本函数暂不用
    public function getFavorById($id)
    {
        $data = [false, 'favor', ['AND', 'favorid = :favorid', 'favorid', $id]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'favorquestion');
    }

    //根据用户ID和试题ID获取试题是否收藏
    //参数：试题ID，用户ID
    //返回值：试题信息数组（无则为FALSE）
    public function getFavorByQuestionAndUserId($id, $userid)
    {
        $data = [false, 'favor', [['AND', 'favorquestionid = :favorquestionid', 'favorquestionid', $id], ['AND', 'favoruserid = :favoruserid', 'favoruserid', $userid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'favorquestion');
    }

    //根据ID删除试题
    public function delFavorById($id)
    {
        $data = ['favor', [['AND', 'favorid = :favorid', 'favorid', $id]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //错题记录函数
    //新增错题记录
    public function addRecord($questionid, $userid, $examid)
    {
        $question = $this->exam->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $questionid]]);
        $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $question['questionknowsid']]]);
        $section = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $knows['knowssectionid']]]);
        $args = ['recordexamid' => $examid, 'recordquestionid' => $questionid, 'recordquestype' => $question['questiontype'], 'recordquestion' => $this->ev->addSlashes(serialize($question['questionhtml'])), 'recordsubjectid' => $section['sectionsubjectid'], 'recordknowsid' => $question['questionknowsid'], 'recorduserid' => $userid, 'recordtime' => TIME];
        $data = ['record', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //根据用户ID和试题ID获取试题是否被收入错题库
    public function getRecordByQuestionAndUserId($id, $userid)
    {
        $data = [false, 'record', [['AND', 'recordquestionid = :recordquestionid', 'recordquestionid', $id], ['AND', 'recorduserid = :recorduserid', 'recorduserid', $userid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'recordquestion');
    }

    //删除错误记录
    public function delRecord($recordid)
    {
        $data = ['record', [['AND', 'recordid = :recordid', 'recordid', $recordid]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //通过用户ID获取错误试题列表
    public function getRecordListByUserid($page, $number = 20, $args = [])
    {
        $page = $page > 0 ? $page : 1;
        $r = [];
        $data = [false, 'record', $args, false, 'recordid DESC', [intval($page - 1) * $number, $number]];
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchAll($sql, false, 'recordquestion');
        $data = ['count(*) AS number', 'record', $args];
        $sql = $this->pdosql->makeSelect($data);
        $t = $this->db->fetch($sql);
        $pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    //根据用户和科目获取考试记录列表
    public function getExamHistoryListByArgs($args, $page, $number = 20, $fields = false, $orderby = 'ehscore DESC,ehid DESC')
    {
        $page = $page > 0 ? $page : 1;
        $r = [];
        $args[] = ['AND', 'examhistory.ehuserid = user.userid'];
        $data = [$fields, ['examhistory', 'user'], $args, false, $orderby, [intval($page - 1) * $number, $number]];
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchAll($sql, 'ehid');
        $data = ['count(*) AS number', ['examhistory', 'user'], $args];
        $sql = $this->pdosql->makeSelect($data);
        $t = $this->db->fetch($sql);
        $pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    //根据用户和科目获取考试记录列表
    public function getAllExamHistoryByArgs($args = [], $fields = false)
    {
        $args[] = ['AND', 'examhistory.ehuserid = user.userid'];
        $data = [$fields, ['examhistory', 'user'], $args, false, 'ehscore DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function getStatsAllExamHistoryByArgs($args = [])
    {
        $args[] = ['AND', 'examhistory.ehuserid = user.userid'];
        $data = [false, ['examhistory', 'user'], $args, false, 'ehscore DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, false, ['ehscorelist', 'ehuseranswer', 'ehtimelist']);
    }

    //根据用户和ID获取一个考试记录
    public function getExamHistoryById($id)
    {
        $data = [false, 'examhistory', [['AND', 'ehid = :ehid', 'ehid', $id]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql, ['ehscorelist', 'ehuseranswer', 'ehtimelist']);
        $r['ehquestion'] = unserialize(gzuncompress(base64_decode($r['ehquestion'])));
        $r['ehsetting'] = unserialize(gzuncompress(base64_decode($r['ehsetting'])));

        return $r;
    }

    public function getExamHistoryByArgs($args)
    {
        $data = [false, 'examhistory', $args];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql, ['ehscorelist', 'ehuseranswer', 'ehtimelist']);
        $r['ehquestion'] = unserialize(gzuncompress(base64_decode($r['ehquestion'])));
        $r['ehsetting'] = unserialize(gzuncompress(base64_decode($r['ehsetting'])));

        return $r;
    }

    //根据ID修改一个考试记录
    public function modifyExamHistory($ehid, $args)
    {
        $data = ['examhistory', $args, [['AND', 'ehid = :ehid', 'ehid', $ehid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    //根据ID删除一个考试记录
    public function delExamHistory($ehid, $userid = false)
    {
        if ($userid) {
            $data = ['examhistory', [['AND', 'ehid = :ehid', 'ehid', $ehid], ['AND', 'ehuserid = :ehuserid', 'ehuserid', $userid]]];
        } else {
            $data = ['examhistory', [['AND', 'ehid = :ehid', 'ehid', $ehid]]];
        }
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //批量清理考试记录
    public function clearExamHistory($args)
    {
        $data = ['examhistory', $args];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //获取记录数量
    public function getExamHistoryNumber($userid, $basicid, $type = 0)
    {
        $data = ['count(*) AS number', 'examhistory', [['AND', 'ehuserid = :ehuserid', 'ehuserid', $userid], ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid], ['AND', 'ehtype = :ehtype', 'ehtype', $type]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    //删除最后一个考试记录
    public function delLastExamHistory($userid, $subjectid, $type = 0)
    {
        $data = [false, 'examhistory', [['AND', 'ehuserid = :ehuserid', 'ehuserid', $userid], ['AND', 'ehsubjectid = :ehsubjectid', 'ehsubjectid', $subjectid], ['AND', 'ehtype = :ehtype', 'ehtype', $type]], false, 'ehid ASC', 1];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        $data = ['examhistory', "ehid = '{$r['ehid']}'"];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //添加一个考试记录
    public function addExamHistory($exam, $status = 1)
    {
        if (!$exam) {
            return false;
        }
        $t = TIME - $exam['examsessionstarttime'];
        if ($t >= $exam['examsessiontime'] * 60) {
            $t = $exam['examsessiontime'] * 60;
        }
        $user = $this->G->make('user', 'user')->getUserById($exam['examsessionuserid']);
        $args = [
            'ehtype'       => $exam['examsessiontype'],
            'ehtimelist'   => $exam['examsessiontimelist'],
            'ehexam'       => $exam['examsession'],
            'ehexamid'     => $exam['examsessionkey'],
            'ehbasicid'    => $exam['examsessionbasic'],
            'ehquestion'   => base64_encode(gzcompress(serialize($exam['examsessionquestion']), 9)),
            'ehsetting'    => base64_encode(gzcompress(serialize($exam['examsessionsetting']), 9)),
            'ehuseranswer' => $exam['examsessionuseranswer'],
            'ehstarttime'  => $exam['examsessionstarttime'],
            'ehtime'       => $t,
            'ehscore'      => $exam['examsessionscore'],
            'ehscorelist'  => $exam['examsessionscorelist'],
            'ehuserid'     => $exam['examsessionuserid'],
            'ehusername'   => $user['username'],
            'ehdecide'     => intval($exam['examsessionsetting']['examdecide']),
            'ehstatus'     => $status,
            'ehispass'     => $exam['examsessionscore'] >= $exam['examsessionsetting']['examsetting']['passscore'] ? 1 : 0,
        ];
        $data = ['examhistory', $args];
        $sql = $this->pdosql->makeInsert($data);
        $aff = $this->db->exec($sql);
        $ehid = $this->db->lastInsertId();
        //        if($args['ehtype'] == 2 && $args['ehispass'])
        //        {
        //            $this->G->make('progress','user')->modifyProgressByArgs(array(array("AND","prsexamid = :prsexamid","prsexamid",$args['ehbasicid']),array("AND","prsexamstatus = 0")),array('prsexamstatus' => 1));
        //            $this->G->make('progress','user')->modifyProgressByArgs(array(array("AND","prscoursestatus = 1"),array("AND","prsexamstatus = 1"),array("AND","prstatus = 0"),array("AND","prsexamid = :prsexamid","prsexamid",$args['ehbasicid'])),array('prstatus' => 1,'prsendtime' => TIME));
        //        }
        return $ehid;
    }

    public function getAvgScore($args)
    {
        $data = ['avg(ehscore) as avgscore', 'examhistory', $args, false, false, false];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['avgscore'];
    }

    public function getExamUseNumber($userid, $examid, $basicid, $type = 2)
    {
        $data = ['count(*) AS number', 'examhistory', [['AND', 'ehuserid = :ehuserid', 'ehuserid', $userid], ['AND', 'ehexamid = :ehexamid', 'ehexamid', $examid], ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid], ['AND', 'ehtype = :ehtype', 'ehtype', $type], ['AND', 'ehneedresit = 0']]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    public function getExamScoreListByBasicId($basicid, $page, $number = 10)
    {
        $data = [
            'select'  => false,
            'table'   => ['examhistory', 'user'],
            'query'   => [['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid], ['AND', 'ehtype = 2'], ['AND', 'ehuserid = userid'], ['AND', 'ehstatus = 1']],
            'orderby' => 'ehscore DESC,ehid DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getUserScoreIndex($basicid, $userid, $score)
    {
        $data = ['count(*) as number', 'examhistory', [['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid], ['AND', 'ehscore > :ehscore', 'ehscore', $score]], false, false, false];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'] + 1;
    }

    public function getUserTopScore($basicid, $userid)
    {
        $data = ['max(ehscore) as ehscore', 'examhistory', [['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid], ['AND', 'ehuserid = :ehuserid', 'ehuserid', $userid], ['AND', 'ehtype = 2']], false, false, false];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        if ($r['ehscore'] > 0) {
            $s = ['score' => $r['ehscore']];
        } else {
            $s = ['score' => 0];
        }
        $data = ['count(*) as number', 'examhistory', [['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid], ['AND', 'ehscore > :ehscore', 'ehscore', $s['score']], ['AND', 'ehtype = 2']], false, false, false];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        $s['index'] = $r['number'] + 1;

        return $s;
    }
}
