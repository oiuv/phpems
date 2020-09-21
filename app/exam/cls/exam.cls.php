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

class exam_exam
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
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->section = $this->G->make('section', 'exam');
        $this->favor = $this->G->make('favor', 'exam');
        $this->session = $this->G->make('session');
        $this->init = 1;
    }

    //增加一个考试会话
    //参数：会话信息数组
    //返回值：true
    public function insertExamSession($args)
    {
        $args['examsessionid'] = $this->session->getSessionId();
        $args['examsessionstarttime'] = TIME;
        $args['examsessiontoken'] = md5(serialize($args));
        $data = ['examsession', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return true;
    }

    //清除考试会话
    //参数：无
    //返回值：无
    public function clearExamSession()
    {
        $sessionid = $this->session->getSessionId();
    }

    public function clearOutTimeExamSession($time)
    {
        if (!$time) {
            $date = TIME - 6 * 24 * 3600;
        } else {
            $date = $time;
        }
        $data = ['examsession', [['AND', 'examsessionstarttime < :date', 'date', $date]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //修改考试会话内容
    //参数：会话内容数组
    //返回值：true
    public function modifyExamSession($args, $sessionid = false)
    {
        if (!$sessionid) {
            $sessionid = $this->session->getSessionId();
        }
        $data = ['examsession', $args, [['AND', 'examsessionid = :oldexamsessionid', 'oldexamsessionid', $sessionid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    //清除会话内容
    public function delExamSession($sessionid = false)
    {
        if (!$sessionid) {
            $sessionid = $this->session->getSessionId();
        }
        $data = ['examsession', [['AND', 'examsessionid = :examsessionid', 'examsessionid', $sessionid]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //获取当前考试会话信息
    //参数：无
    //返回值：会话信息数组
    public function getExamSessionBySessionid($sessionid = false)
    {
        if (!$sessionid) {
            $sessionid = $this->session->getSessionId();
        }
        $data = [false, 'examsession', [['AND', 'examsessionid = :examsessionid', 'examsessionid', $sessionid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['examsessionquestion', 'examsessionsign', 'examsessionsetting', 'examsessionuseranswer', 'examsessionscorelist']);
    }

    public function getExamSessionByUserid($userid, $basicid, $sessionid = 0, $usesession = 0, $type = 2)
    {
        if ($usesession && !$sessionid) {
            $sessionid = $this->session->getSessionId();
        }
        $args = [['AND', 'examsessionuserid = :examsessionuserid', 'examsessionuserid', $userid]];
        $args[] = ['AND', 'examsessionbasic = :examsessionbasic', 'examsessionbasic', $basicid];
        if ($usesession) {
            $args[] = ['AND', 'examsessionid = :examsessionid', 'examsessionid', $sessionid];
        }
        if ($type) {
            $args[] = ['AND', 'examsessiontype = :examsessiontype', 'examsessiontype', $type];
        }
        $data = [false, 'examsession', $args, false, 'examsessionstarttime DESC'];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['examsessionquestion', 'examsessionsign', 'examsessionsetting', 'examsessionuseranswer', 'examsessionscorelist']);
    }

    public function getExamSessionByArgs($args = [], $page = 1, $number = 20)
    {
        $args[] = ['AND', 'examsession.examsessionuserid = user.userid'];
        $data = [
            'select'  => false,
            'table'   => ['examsession', 'user'],
            'query'   => $args,
            'orderby' => 'examsessionstarttime DESC',
            'serial'  => ['examsessionsetting'],
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    //获取考试设置信息列表
    //参数：当前页码，每页显示数，查询条件数组
    //返回值：考试设置信息列表数组
    public function getExamSettingList($args, $page, $number = 20)
    {
        $data = [
            'select'  => false,
            'table'   => 'exams',
            'query'   => $args,
            'orderby' => 'examid DESC',
            'serial'  => 'examsetting',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getExamSettingsByArgs($args = [])
    {
        $data = [false, 'exams', $args, false, 'examid DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, false, ['examsetting', 'examquestions', 'examscore']);
    }

    //根据参数获取设置好的考试信息列表，用于抽题使用
    //参数：当前页码，每页显示数，查询条件数组
    //返回值：考试设置信息列表数组
    public function getRandExamSetting($subjectid)
    {
        $data = ['examid', 'exams', [['AND', 'examsubject = :examsubject', 'examsubject', $subjectid], ['AND', 'examtype = 2']], false, false, false];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        $examid = $r[array_rand($r, 1)]['examid'];
        $data = [false, 'exams', "examid = '{$examid}'", false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['examsetting', 'examquestions']);
    }

    //根据ID获取一个考试设置
    //参数：考试设置ID
    //返回值：考试设置信息数组
    public function getExamSettingById($id)
    {
        $data = [false, 'exams', [['AND', 'examid = :examid', 'examid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['examsetting', 'examquestions']);
    }

    //获取已设置考题的数量
    public function getExamQuestionNumber($number = false)
    {
        if (!is_array($number)) {
            return false;
        }

        $number['questions'] = trim($number['questions'], ' ,');
        $number['rowsquestions'] = trim($number['rowsquestions'], ' ,');
        if ($number['questions']) {
            $data = ['count(*) as number', 'questions', [['AND', 'find_in_set(questionid,:questionid)', 'questionid', $number['questions']], ['AND', 'questionstatus = 1']]];
            $sql = $this->pdosql->makeSelect($data);
            $stmp = $this->db->fetch($sql);
            $snumber = $stmp['number'];
        } else {
            $snumber = 0;
        }
        if ($number['rowsquestions']) {
            $data = ['sum(qrnumber) as number', 'questionrows', [['AND', 'find_in_set(qrid,:qrid)', 'qrid', $number['rowsquestions']], ['AND', 'qrstatus = 1']]];
            $sql = $this->pdosql->makeSelect($data);
            $tmp = $this->db->fetch($sql);

            return $snumber + $tmp['number'];
        }

        return $snumber;
    }

    //根据参数获取一个考试设置
    //参数：考试设置查询参数（数组或者字符串）
    //返回值：考试设置信息数组
    public function getExamSettingByArgs($args = [])
    {
        $data = [false, 'exams', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'examsetting');
    }

    //根据参数修改一个考试设置
    //参数：考试ID，参数（数组）
    //返回值：受影响记录数
    public function modifyExamSetting($id, $args = [])
    {
        $data = ['exams', $args, [['AND', 'examid = :examid', 'examid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
        //return $this->db->affectedRows();
    }

    //删除考试设置
    //参数：考试ID
    //返回值：受影响记录数
    public function delExamSetting($id)
    {
        $data = ['exams', [['AND', 'examid = :examid', 'examid', $id]]];
        $sql = $this->pdosql->makeDelete($data);
        //$data = array('exams',array("examstatus"=>0),"examid = '{$id}'");
        //$sql = $this->pdosql->makeUpdate($data);
        return $this->db->exec($sql);
        //$this->db->affectedRows();
    }

    //增加考试设置
    //参数：考试设置参数（数组）
    //返回值：插入ID
    public function addExamSetting($args = [])
    {
        $args['examtime'] = TIME;
        $data = ['exams', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //增加试题
    //参数：试题参数（数组）
    //返回值：插入ID
    public function addQuestions($args = [])
    {
        $args['questionstatus'] = 1;
        $data = ['questions', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        $r = $this->db->lastInsertId();
        if ($args['questionparent']) {
            $qktype = 1;
        } else {
            $qktype = 0;
        }
        $question = $this->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $r]]);
        $questionknowsid = $this->parseQuestionKnows($args['questionknowsid'], $r, $qktype);
        $data = ['questions', ['questionknowsid' => $questionknowsid], [['AND', 'questionid = :questionid', 'questionid', $r]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return $r;
    }

    public function parseQuestionKnows($knows, $questionid = null, $qktype = 0)
    {
        $ks = explode("\n", $knows);
        $data = [];
        foreach ($ks as $p) {
            if ($p) {
                $p = explode(':', $p, 2);
                $data[] = ['knowsid' => $p[0], 'knows' => $p[1]];
                if ($questionid) {
                    $sqldata = ['quest2knows', ['qkquestionid' => $questionid, 'qkknowsid' => $p[0], 'qktype' => $qktype]];
                    $sql = $this->pdosql->makeInsert($sqldata);
                    $this->db->exec($sql);
                }
            }
        }

        return $data;
    }

    //增加特殊题型
    //暂时不用
    public function addQuestionRows($args)
    {
        $args['qrstatus'] = 1;
        $data = ['questionrows', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        $r = $this->db->lastInsertId();
        $questionknowsid = $this->parseQuestionKnows($args['qrknowsid'], $r, 1);
        $data = ['questionrows', ['qrknowsid' => $questionknowsid], [['AND', 'qrid = :qrid', 'qrid', $r]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return $r;
    }

    public function importQuestionBat($uploadfile, $tknowsid, $questionparent = 0)
    {
        $this->session = $this->G->make('session');
        $this->_user = $this->session->getSessionUser();
        $userid = $this->_user['sessionuserid'];
        $username = $this->_user['sessionusername'];
        $handle = fopen($uploadfile, 'r');
        $qrid = 0;
        while ($data = fgetcsv($handle)) {
            $args = [];
            $question = $data;
            if (count($question) >= 6) {
                $isqr = intval(trim($question[8], " \n\t"));
                if ($isqr) {
                    $istitle = intval(trim($question[9], " \n\t"));
                    if ($istitle) {
                        if ($qrid) {
                            $this->resetRowsQuestionNumber($qrid);
                        }
                        $args['qrtype'] = $question[0];
                        $args['qrquestion'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[1]), " \n\t"))));
                        $args['qrlevel'] = $question[7];
                        $args['qrtime'] = TIME;
                        $args['qruserid'] = $userid;
                        $args['qrusername'] = $username;
                        if (!$tknowsid) {
                            $questionknowsid = trim($question[6], " \n\t");
                        } else {
                            $questionknowsid = $tknowsid;
                        }
                        if ($questionknowsid) {
                            $questionknowsid = explode(',', $questionknowsid);
                            $tmpkid = '0';
                            foreach ($questionknowsid as $knowsid) {
                                $knowsid = intval($knowsid);
                                if ($knowsid) {
                                    $tmpkid .= ','.$knowsid;
                                }
                            }
                            $knows = $this->section->getKnowsListByArgs([['AND', 'find_in_set(knowsid,:knowsid)', 'knowsid', $tmpkid]]);
                            $args['qrknowsid'] = '';
                            foreach ($knows as $p) {
                                $args['qrknowsid'] .= $p['knowsid'].':'.$p['knows']."\n";
                            }
                        }
                        $qrid = $this->addQuestionRows($args);
                    } else {
                        $args['questiontype'] = intval($question[0]);
                        $args['question'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[1], " \n\t"))));
                        $args['questionselect'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[2], " \n\t"))));
                        $args['questionselectnumber'] = intval(trim($question[3], " \n\t"));
                        $args['questionanswer'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[4], " \n\t"))));
                        $args['questiondescribe'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[5], " \n\t"))));
                        if ($qrid) {
                            $args['questionparent'] = $qrid;
                        }
                        $args['questionlevel'] = intval(trim($question[7], " \n\t"));
                        $args['questioncreatetime'] = TIME;
                        $args['questionuserid'] = $userid;
                        $args['questionusername'] = $username;
                        $this->addQuestions($args);
                    }
                } else {
                    $args['questiontype'] = intval($question[0]);
                    $args['question'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[1], " \n\t"))));
                    $args['questionselect'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[2], " \n\t"))));
                    $args['questionselectnumber'] = intval(trim($question[3], " \n\t"));
                    $args['questionanswer'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[4], " \n\t"))));
                    $args['questiondescribe'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[5], " \n\t"))));
                    $args['questionuserid'] = $userid;
                    $args['questionusername'] = $username;
                    if (!$tknowsid) {
                        $questionknowsid = trim($question[6], " \n\t");
                    } else {
                        $questionknowsid = $tknowsid;
                    }
                    if ($questionknowsid) {
                        $questionknowsid = explode(',', $questionknowsid);
                        $tmpkid = '0';
                        foreach ($questionknowsid as $knowsid) {
                            $knowsid = intval($knowsid);
                            if ($knowsid) {
                                $tmpkid .= ','.$knowsid;
                            }
                        }
                        $knows = $this->section->getKnowsListByArgs([['AND', 'find_in_set(knowsid,:knowsid)', 'knowsid', $tmpkid]]);
                        $args['questionknowsid'] = '';
                        foreach ($knows as $p) {
                            $args['questionknowsid'] .= $p['knowsid'].':'.$p['knows']."\n";
                        }
                    }
                    if ($questionparent) {
                        $args['questionparent'] = $questionparent;
                    }
                    $args['questionlevel'] = intval(trim($question[7], " \n\t"));
                    $args['questioncreatetime'] = TIME;
                    $this->addQuestions($args);
                }
            }
        }
        if ($qrid) {
            $this->resetRowsQuestionNumber($qrid);
        }

        return true;
    }

    //批量导入试题
    //参数：批量试题内容字符串，知识点ID
    //返回值：true
    public function importQuestionBatbak($uploadfile, $tknowsid, $questionparent = 0)
    {
        $handle = fopen($uploadfile, 'r');
        while ($data = fgetcsv($handle)) {
            $args = [];
            $question = $data;
            if (count($question) >= 6) {
                $args['questiontype'] = intval($question[0]);
                $args['question'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[1], " \n\t"))));
                $args['questionselect'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[2], " \n\t"))));
                $args['questionselectnumber'] = intval(trim($question[3], " \n\t"));
                $args['questionanswer'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[4], " \n\t"))));
                $args['questiondescribe'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[5], " \n\t"))));
                if (!$tknowsid) {
                    $questionknowsid = trim($question[6], " \n\t");
                } else {
                    $questionknowsid = $tknowsid;
                }
                if ($questionknowsid) {
                    $questionknowsid = explode(',', $questionknowsid);
                    $tmpkid = '0';
                    foreach ($questionknowsid as $knowsid) {
                        $knowsid = intval($knowsid);
                        if ($knowsid) {
                            $tmpkid .= ','.$knowsid;
                        }
                    }
                    $knows = $this->section->getKnowsListByArgs([['AND', 'find_in_set(knowsid,:knowsid)', 'knowsid', $tmpkid]]);
                    $args['questionknowsid'] = '';
                    foreach ($knows as $p) {
                        $args['questionknowsid'] .= $p['knowsid'].':'.$p['knows']."\n";
                    }
                }
                if ($questionparent) {
                    $args['questionparent'] = $questionparent;
                }
                $args['questionlevel'] = intval(trim($question[7], " \n\t"));
                $args['questioncreatetime'] = TIME;
                $this->addQuestions($args);
            }
        }

        return true;
    }

    //批量增加试题
    //参数：批量试题内容字符串，知识点ID
    //返回值：true
    public function insertQuestionBat($content, $questionparent)
    {
        $content = str_replace(' ', '', $content);
        $content = str_replace('()', '( )', $content);
        $content = str_replace("\t", '', $content);
        $content = str_replace("\r", "\n", $content);
        $content = str_replace("\n\n", "\n", $content);
        $content = explode('======', $content);
        foreach ($content as $q) {
            $args = [];
            $question = explode('------', $q);
            if (count($question) >= 6) {
                $args['questiontype'] = intval($question[0]);
                $args['question'] = trim($question[1], " \n\t");
                $args['questionselect'] = trim($question[2], " \n\t");
                $args['questionselectnumber'] = trim($question[3], " \n\t");
                $args['questionanswer'] = trim($question[4], " \n\t");
                $args['questiondescribe'] = trim($question[5], " \n\t");
                $questionknowsid = trim($question[6], " \n\t");
                if ($questionknowsid) {
                    $questionknowsid = explode(',', $questionknowsid);
                    $tmpkid = '0';
                    foreach ($questionknowsid as $knowsid) {
                        $knowsid = intval($knowsid);
                        if ($knowsid) {
                            $tmpkid .= ','.$knowsid;
                        }
                    }
                    $knows = $this->section->getKnowsListByArgs([['AND', 'find_in_set(knowsid,:knowsid)', 'knowsid', $tmpkid]]);
                    $args['questionknowsid'] = '';
                    foreach ($knows as $p) {
                        $args['questionknowsid'] .= $p['knowsid'].':'.$p['knows']."\n";
                    }
                }
                if ($questionparent) {
                    $args['questionparent'] = $questionparent;
                }
                $args['questionlevel'] = trim($question[7], " \n\t");
                $args['questioncreatetime'] = TIME;
                $this->addQuestions($args);
            }
        }

        return true;
    }

    //批量增加特殊试题
    //参数：批量试题内容字符串，知识点ID
    //返回值：true
    public function insertQuestionRowsBat($content, $knowsid)
    {
        $content = str_replace(' ', '', $content);
        $content = str_replace('()', '( )', $content);
        $content = str_replace("\t", '', $content);
        $content = str_replace("\r", "\n", $content);
        $content = str_replace("\n\n", "\n", $content);
        $content = explode('======', $content);
        foreach ($content as $key => $q) {
            $args = [];
            $question = explode('------', $q);
            if (count($question) >= 3) {
                $args['qrquestion'] = trim($question[0], " \n\t");
                $args['qrtype'] = intval($question[1]);
                $args['qrlevel'] = intval($question[3]);
                $args['qrtime'] = TIME;
                $questionknowsid = trim($question[2], " \n\t");
                $questionknowsid = explode(',', $questionknowsid);
                $tmpkid = '0';
                foreach ($questionknowsid as $knowsid) {
                    $knowsid = intval($knowsid);
                    if ($knowsid) {
                        $tmpkid .= ','.$knowsid;
                    }
                }
                $knows = $this->section->getKnowsListByArgs([['AND', 'find_in_set(knowsid,:knowsid)', 'knowsid', $tmpkid]]);
                $args['qrknowsid'] = '';
                foreach ($knows as $p) {
                    $args['qrknowsid'] .= $p['knowsid'].':'.$p['knows']."\n";
                }
                $this->addQuestionRows($args);
            }
        }
        //$this->modifyQuestions($questionparent,array('questionnumber'=>$sequence));
        return true;
    }

    //按照ID删除试题
    //参数：试题ID
    //返回值：受影响记录数
    public function delQuestions($id)
    {
        $this->session = $this->G->make('session');
        $this->_user = $this->session->getSessionUser();
        $username = $this->_user['sessionusername'];
        $data = ['questions', ['questionstatus' => '0', 'questiondeler' => $username, 'questiondeltime' => TIME], [['AND', 'questionid = :questionid', 'questionid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
        //$this->db->affectedRows();
    }

    //按照参数删除试题
    //参数：试题ID
    //返回值：受影响记录数
    public function delQuestionsByArgs($args)
    {
        $this->session = $this->G->make('session');
        $this->_user = $this->session->getSessionUser();
        $username = $this->_user['sessionusername'];
        $data = ['questions', ['questionstatus' => '0', 'questiondeler' => $username, 'questiondeltime' => TIME], $args];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
        //$this->db->affectedRows();
    }

    //按照ID彻底删除试题
    //参数：试题ID
    //返回值：受影响记录数
    public function fanalDelQuestions($id)
    {
        $data = ['questions', [['AND', 'questionid = :questionid', 'questionid', $id]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
        //$this->db->affectedRows();
    }

    //按照参数彻底删除试题
    //参数：$args
    //返回值：受影响记录数
    public function fanalDelQuestionsByArgs($args)
    {
        $data = ['questions', $args];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
        //$this->db->affectedRows();
    }

    //按照ID删除题帽题
    //参数：题帽题ID
    //返回值：受影响记录数
    public function delQuestionRows($id)
    {
        $this->session = $this->G->make('session');
        $this->_user = $this->session->getSessionUser();
        $username = $this->_user['sessionusername'];
        $data = ['questionrows', ['qrstatus' => '0', 'qrdeler' => $username, 'qrdeltime' => TIME], [['AND', 'qrid = :qrid', 'qrid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
        //$this->db->affectedRows();
    }

    //按照ID彻底删除题帽题
    //参数：题帽题ID
    //返回值：受影响记录数
    public function finalDelQuestionRows($id)
    {
        $data = ['questionrows', [['AND', 'qrid = :qrid', 'qrid', $id]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
        //$this->db->affectedRows();
    }

    //按照ID删除题帽题下子试题
    //参数：试题ID
    //返回值：受影响记录数
    public function delRowsQuestions($id)
    {
        $this->session = $this->G->make('session');
        $this->_user = $this->session->getSessionUser();
        $username = $this->_user['sessionusername'];
        $r = $this->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $id]]);
        $data = ['questions', ['questionstatus' => '0', 'questiondeler' => $username, 'questiondeltime' => TIME], [['AND', 'questionid = :questionid', 'questionid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $num = $this->db->exec($sql);
        if ($r['questionparent']) {
            $this->resetRowsQuestionNumber($id);
        }

        return $num;
    }

    public function resetRowsQuestionNumber($id)
    {
        if (!$id) {
            return false;
        }
        $data = ['count(*) AS number', 'questions', [['AND', 'questionparent = :questionparent', 'questionparent', $id], ['AND', 'questionstatus = 1']]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        $data = ['questionrows', ['qrnumber' => $r['number']], [['AND', 'qrid = :qrid', 'qrid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    //恢复试题
    //参数：试题ID
    //返回值：受影响记录数
    public function backQuestions($id)
    {
        $data = ['questions', ['questionstatus' => '1'], [['AND', 'questionid = :questionid', 'questionid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    //恢复题帽题
    //参数：试题ID
    //返回值：受影响记录数
    public function backQuestionRows($id)
    {
        $data = ['questionrows', ['qrstatus' => '1'], [['AND', 'qrid = :qrid', 'qrid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);
        $data = ['questions', ['questionstatus' => '1'], [['AND', 'questionparent = :questionparent', 'questionparent', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);
        $this->resetRowsQuestionNumber($id);

        return $this->db->affectedRows();
    }

    //修改试题
    //参数：试题ID，更改参数（数组）
    //返回值：受影响记录数
    public function modifyQuestions($id, $args)
    {
        if ($args['questionknowsid']) {
            $this->clearQuestKnowsByQuestionid($id);
        }
        $data = ['questions', $args, [['AND', 'questionid = :questionid', 'questionid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $rs = $this->db->exec($sql);
        $r = $this->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $id]]);
        $nargs = [];
        if ($args['questionknowsid']) {
            $nargs['questionknowsid'] = $this->parseQuestionKnows($args['questionknowsid'], $id, 0);
            $data = ['questions', $nargs, [['AND', 'questionid = :questionid', 'questionid', $id]]];
            $sql = $this->pdosql->makeUpdate($data);
            $rs = $this->db->exec($sql);
        }

        return $rs;
    }

    public function modifyQuestionSequence($id, $args)
    {
        $data = ['questions', $args, [['AND', 'questionid = :questionid', 'questionid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function modifyQuestionRows($id, $args)
    {
        $this->clearQuestKnowsByQuestionid($id, 1);
        $data = ['questionrows', $args, [['AND', 'qrid = :qrid', 'qrid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);
        $r = $this->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $id]]);
        $nargs['qrknowsid'] = $this->parseQuestionKnows($args['qrknowsid'], $id, 1);
        $data = ['questionrows', $nargs, [['AND', 'qrid = :qrid', 'qrid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function clearQuestKnowsByQuestionid($questionid, $qktype = 0)
    {
        $data = ['quest2knows', [['AND', 'qkquestionid = :qkquestionid', 'qkquestionid', $questionid], ['AND', 'qktype = :qktype', 'qktype', $qktype]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    //根据参数获取单一普通试题
    //参数：参数（数组或者字符串）
    //返回值：试题内容数组
    public function getQuestionByArgs($args)
    {
        $data = [false, 'questions', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['questionhtml', 'questionknowsid']);
    }

    //根据参数获取试题总数量
    //参数：参数（数组或者字符串）
    //返回值：试题内容数组
    public function getQuestionNumberByQuestypeAndKnowsid($questype, $knowsid)
    {
        $ca = $this->G->make('ca');
        if ($ca->isTimeOut("n-{$questype}-{$knowsid}")) {
            if (!$knowsid) {
                $knowsid = '0';
            }
            $data = ['count(*) AS number', ['questions', 'quest2knows'], [['AND', 'questions.questiontype = :questype', 'questype', $questype], ['AND', 'questions.questionparent = 0'], ['AND', 'questions.questionstatus = 1'], ['AND', 'questions.questionid = quest2knows.qkquestionid'], ['AND', 'find_in_set(quest2knows.qkknowsid,:knowsid)', 'knowsid', $knowsid], ['AND', 'quest2knows.qktype = 0']], false, false, false];
            $sql = $this->pdosql->makeSelect($data);
            $r = $this->db->fetch($sql);
            $data = ['sum(qrnumber) AS number', ['questionrows', 'quest2knows'], [['AND', 'questionrows.qrtype = :questype', 'questype', $questype], ['AND', 'questionrows.qrstatus = 1'], ['AND', 'questionrows.qrid = quest2knows.qkquestionid'], ['AND', 'find_in_set(quest2knows.qkknowsid,:knowsid)', 'knowsid', $knowsid], ['AND', 'quest2knows.qktype = 1']], false, false, false];
            $sql = $this->pdosql->makeSelect($data);
            $m = $this->db->fetch($sql);
            $number = $r['number'] + $m['number'];
            $ca->writeCache("n-{$questype}-{$knowsid}", $number);

            return $number;
        }

        return $ca->readCache("n-{$questype}-{$knowsid}");
    }

    //根据参数获取单一题帽试题
    //参数：参数（数组或者字符串）
    //返回值：试题内容数组
    public function getQuestionRowsByArgs($args, $fields = false)
    {
        $data = [$fields, ['questionrows', 'quest2knows'], $args];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql, ['qrknowsid']);
        if ($r['qrid']) {
            $r['data'] = $this->getSimpleQuestionListByArgs([['AND', 'questionparent = :questionparent', 'questionparent', $r['qrid']], ['AND', 'questionstatus = 1']]);
        }

        return $r;
    }

    public function getAllQuestionRowsByArgs($args)
    {
        $data = [false, ['questionrows', 'quest2knows'], $args, false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function getQuestionRowsById($id, $fields = false, $childs = true)
    {
        $data = [$fields, 'questionrows', [['AND', 'qrid = :qrid', 'qrid', $id], ['AND', 'qrstatus = 1']]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql, ['qrknowsid']);
        if ($r['qrid'] && $childs) {
            $r['data'] = $this->getSimpleQuestionListByArgs([['AND', 'questionparent = :qrid', 'qrid', $r['qrid']], ['AND', 'questionstatus = 1']]);
        }

        return $r;
    }

    //根据参数获取所有普通试题列表
    //参数：参数（数组或者字符串）
    //返回值：试题内容列表数组
    public function getQuestionListByArgs($args, $fields = false)
    {
        $args[] = ['AND', 'quest2knows.qkquestionid = questions.questionid'];
        $data = [$fields, ['questions', 'quest2knows'], $args, false, ['questionsequence ASC', 'questionid ASC'], false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'questionid', ['questionhtml', 'questionknowsid']);
    }

    public function getSimpleQuestionListByArgs($args, $fields = false)
    {
        $data = [$fields, 'questions', $args, false, ['questionsequence ASC', 'questionid ASC'], false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'questionid', ['questionhtml', 'questionknowsid']);
    }

    public function getQuestionListByIds($ids, $fields = false)
    {
        if (!is_array($ids)) {
            $ids = explode(',', $ids);
        }
        $data = [$fields, 'questions', [['AND', 'questionid in (:ids)', 'ids', $ids], ['AND', 'questionstatus = 1']], false, ['questionsequence ASC', 'questionid ASC'], false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'questionid', ['questionknowsid']);
    }

    //根据知识点获取试题列表
    //参数：当前页码，每页显示数量，参数（数组或者字符串）
    //返回值：试题内容列表数组
    public function getQuestionsList($page, $number = 20, $args = 1)
    {
        $page = $page > 0 ? $page : 1;
        $r = [];
        $data = ['DISTINCT questions.*', ['questions', 'quest2knows'], $args, false, 'questions.questionid DESC', [intval($page - 1) * $number, $number]];
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchAll($sql, false, ['questionhtml', 'questionknowsid']);
        $data = ['count(DISTINCT questions.questionid) AS number', ['questions', 'quest2knows'], $args];
        $sql = $this->pdosql->makeSelect($data);
        $t = $this->db->fetch($sql);
        $pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    public function getSimpleQuestionsList($page, $number = 20, $args = 1)
    {
        $page = $page > 0 ? $page : 1;
        $r = [];
        $data = [false, 'questions', $args, false, 'questionid DESC', [intval($page - 1) * $number, $number]];
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchAll($sql, false, ['questionhtml', 'questionknowsid']);
        $data = ['count(*) AS number', 'questions', $args];
        $sql = $this->pdosql->makeSelect($data);
        $t = $this->db->fetch($sql);
        $pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    //根据知识点获取题帽试题列表
    //参数：当前页码，每页显示数量，参数（数组或者字符串）
    //返回值：试题内容列表数组
    public function getQuestionrowsList($page, $number = 20, $args = 1)
    {
        $page = $page > 0 ? $page : 1;
        $r = [];
        $data = ['DISTINCT questionrows.*', ['questionrows', 'quest2knows'], $args, false, 'questionrows.qrid DESC', [intval($page - 1) * $number, $number]];
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchAll($sql, false, ['questionknowsid']);
        $data = ['count(DISTINCT questionrows.qrid) AS number', ['questionrows', 'quest2knows'], $args];
        $sql = $this->pdosql->makeSelect($data);
        $t = $this->db->fetch($sql);
        $pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'], $number), $page);
        $r['pages'] = $pages;
        $r['number'] = $t['number'];

        return $r;
    }

    public function markscore($sessionvars, $questypes)
    {
        if (!$sessionvars['examsessionid']) {
            return false;
        }
        $token = $this->ev->get('token');

        if (!$token || $token != $sessionvars['examsessiontoken']) {
            $message = [
                'statusCode' => 300,
                'message'    => '系统检测到试卷错误，请联系监考老师！',
            ];
            $this->G->R($message);
        }

        if (!$sessionvars['examsessiontype']) {
            foreach ($questypes as $questype) {
                $sessionvars['examsessionsetting']['examsetting']['questype'][$questype['questid']]['score'] = 1;
            }
        }
        foreach ($sessionvars['examsessionquestion']['questions'] as $key => $tmp) {
            if (!empty($tmp)) {
                if (!$questypes[$key]['questsort']) {
                    foreach ($tmp as $p) {
                        if (is_array($sessionvars['examsessionuseranswer'][$p['questionid']])) {
                            $nanswer = '';
                            $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                            asort($answer);
                            $nanswer = implode('', $answer);
                            if ($nanswer == $p['questionanswer']) {
                                $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                            } else {
                                if (3 == $questypes[$key]['questchoice']) {
                                    $alen = strlen($p['questionanswer']);
                                    $rlen = 0;
                                    foreach ($answer as $t) {
                                        if (false === strpos($p['questionanswer'], $t)) {
                                            $rlen = 0;
                                            break;
                                        }

                                        $rlen++;
                                    }
                                    $score = floatval($sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'] * $rlen / $alen);
                                } else {
                                    $score = 0;
                                }
                            }
                        } else {
                            $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                            if ($answer == $p['questionanswer']) {
                                $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                            } else {
                                $score = 0;
                            }
                        }
                        $scorelist[$p['questionid']] = $score;
                    }
                } else {
                    $needhand = 1;
                }
            }
        }
        foreach ($sessionvars['examsessionquestion']['questionrows'] as $key => $tmp) {
            if (!empty($tmp)) {
                foreach ($tmp as $tmp2) {
                    foreach ($tmp2['data'] as $p) {
                        if (!$questypes[$p['questiontype']]['questsort']) {
                            if (is_array($sessionvars['examsessionuseranswer'][$p['questionid']])) {
                                $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                                asort($answer);
                                $nanswer = implode('', $answer);
                                if ($nanswer == $p['questionanswer']) {
                                    $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                                } else {
                                    if (3 == $questypes[$key]['questchoice']) {
                                        $alen = strlen($p['questionanswer']);
                                        $rlen = 0;
                                        foreach ($answer as $t) {
                                            if (false === strpos($p['questionanswer'], $t)) {
                                                $rlen = 0;
                                                break;
                                            }
                                            $rlen++;
                                        }
                                        $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'] * $rlen / $alen;
                                    } else {
                                        $score = 0;
                                    }
                                }
                            } else {
                                $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                                if ($answer == $p['questionanswer']) {
                                    $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                                } else {
                                    $score = 0;
                                }
                            }
                            $scorelist[$p['questionid']] = $score;
                        } else {
                            $needhand = 1;
                        }
                    }
                }
            }
        }
        $sessionvars['examsessionscorelist'] = $scorelist;
        $sessionvars['examsessionscore'] = array_sum($scorelist);
        if ($needhand) {
            $ehid = $this->favor->addExamHistory($sessionvars, 0);
        } else {
            $ehid = $this->favor->addExamHistory($sessionvars);
        }
        $this->delExamSession($sessionvars['examsessionid']);

        return ['ehid' => $ehid, 'needhand' => $needhand];
    }

    public function clearDeletedQuestions($args = [])
    {
        $args[] = ['AND', 'questionid = qkquestionid'];
        $args[] = ['AND', 'qktype = 0'];
        $args[] = ['AND', 'questionstatus = 0'];
        $args[] = ['AND', 'questionparent = 0'];
        $data = [['questions', 'quest2knows'], $args, false, false, false];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    public function clearDeletedQuestionrows($args = [])
    {
        $args[] = ['AND', 'qrid = qkquestionid'];
        $args[] = ['AND', 'qktype = 1'];
        $args[] = ['AND', 'qrstatus = 0'];
        $data = ['qrid', ['questionrows', 'quest2knows'], $args, false, false, false];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        foreach ($r as $q) {
            $data = ['questionrows', [['AND', 'qrid = :qrid', 'qrid', $q['qrid']]], false, false, false];
            $sql = $this->pdosql->makeDelete($data);
            $this->db->exec($sql);
            $data = ['questions', [['AND', 'questionparent = :questionparent', 'questionparent', $q['qrid']]], false, false, false];
            $sql = $this->pdosql->makeDelete($data);
            $this->db->exec($sql);
        }

        return true;
    }
}
