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

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        $search = $this->ev->get('search');
        $u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        $this->tpl->assign('u', $u);
        $groups = $this->user->getUserGroups();
        $this->tpl->assign('groups', $groups);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function orderpoint()
    {
        $delids = $this->ev->get('delids');
        foreach ($delids as $knowsid => $v) {
            $this->section->modifyKnows($knowsid, ['knowssequence' => $v]);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function ordersection()
    {
        $delids = $this->ev->get('delids');
        foreach ($delids as $sectionid => $v) {
            $this->section->modifySection($sectionid, ['sectionsequence' => $v]);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function historyquestionbyuser()
    {
        $search = $this->ev->get('search');
        $page = $this->ev->get('page');
        if ($page < 1) {
            $page = 1;
        }
        $this->tpl->assign('page', $page);
        $args = [];
        $basicid = $this->ev->get('basicid');
        $args[] = ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid];
        if ($search['stime']) {
            $stime = strtotime($search['stime']);
            $args[] = ['AND', 'ehstarttime >= :stime', 'stime', $stime];
        }
        if ($search['etime']) {
            $etime = strtotime($search['etime']);
            $args[] = ['AND', 'ehstarttime <= :etime', 'etime', $etime];
        }
        if ($search['sscore']) {
            $args[] = ['AND', 'ehscore >= :sscore', 'sscore', $search['sscore']];
        }
        if ($search['escore']) {
            $args[] = ['AND', 'ehscore <= :escore', 'escore', $search['escore']];
        }
        if ($search['examid']) {
            $args[] = ['AND', 'ehexamid = :ehexamid', 'ehexamid', $search['examid']];
        }
        $rs = $this->favor->getStatsAllExamHistoryByArgs($args);
        $number = count($rs);
        $basic = $this->basic->getBasicById($basicid);
        $this->tpl->assign('basic', $basic);
        $stats = [];

        $questionid = $this->ev->get('questionid');
        $this->tpl->assign('questionid', $questionid);
        $questiontype = $this->basic->getQuestypeList();
        $member = [];
        foreach ($rs as $p) {
            if (isset($p['ehscorelist'][$questionid])) {
                if ($p['ehscorelist'][$questionid] > 0) {
                    $member['right'][] = ['id' => $p['ehid'], 'userid' => $p['ehuserid'], 'username' => $p['ehusername']];
                } else {
                    $member['wrong'][] = ['id' => $p['ehid'], 'userid' => $p['ehuserid'], 'username' => $p['ehusername']];
                }
            }
        }
        $this->tpl->assign('member', $member);
        $this->tpl->assign('basicid', $basicid);
        $this->tpl->display('basic_uqstats');
    }

    private function stats()
    {
        $search = $this->ev->get('search');
        $page = $this->ev->get('page');
        if ($page < 1) {
            $page = 1;
        }
        $this->tpl->assign('page', $page);
        $args = [];
        $basicid = $this->ev->get('basicid');
        $type = $this->ev->get('type');
        $this->tpl->assign('type', $type);
        $args[] = ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid];
        if ($search['stime']) {
            $stime = strtotime($search['stime']);
            $args[] = ['AND', 'ehstarttime >= :stime', 'stime', $stime];
        }
        if ($search['etime']) {
            $etime = strtotime($search['etime']);
            $args[] = ['AND', 'ehstarttime <= :etime', 'etime', $etime];
        }
        if ($search['sscore']) {
            $args[] = ['AND', 'ehscore >= :sscore', 'sscore', $search['sscore']];
        }
        if ($search['escore']) {
            $args[] = ['AND', 'ehscore <= :escore', 'escore', $search['escore']];
        }
        if ($search['examid']) {
            $args[] = ['AND', 'ehexamid = :ehexamid', 'ehexamid', $search['examid']];
        }
        $rs = $this->favor->getStatsAllExamHistoryByArgs($args);
        $number = count($rs);
        $basic = $this->basic->getBasicById($basicid);
        $this->tpl->assign('basic', $basic);
        $stats = [];
        if (!$type) {
            $os = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
            $questiontype = $this->basic->getQuestypeList();
            foreach ($rs as $p) {
                $p['ehquestion'] = unserialize(gzuncompress(base64_decode($p['ehquestion'])));
                $p['ehsetting'] = unserialize(gzuncompress(base64_decode($p['ehsetting'])));
                foreach ($p['ehquestion']['questions'] as $questions) {
                    foreach ($questions as $key => $question) {
                        $stats[$question['questionid']]['title'] = $question['question'];
                        $stats[$question['questionid']]['id'] = $question['questionid'];
                        if ($p['ehscorelist'][$question['questionid']] > 0) {
                            $stats[$question['questionid']]['right'] = intval($stats[$question['questionid']]['right']) + 1;
                        }
                        $stats[$question['questionid']]['number'] = intval($stats[$question['questionid']]['number']) + 1;
                        if ($p['ehuseranswer'][$question['questionid']] && 0 == $questiontype[$question['questiontype']]['questsort'] && $questiontype[$question['questiontype']]['questchoice'] < 5) {
                            if (is_array($p['ehuseranswer'][$question['questionid']])) {
                                $p['ehuseranswer'][$question['questionid']] = implode('', $p['ehuseranswer'][$question['questionid']]);
                            }
                            foreach ($os as $o) {
                                if (false !== strpos($p['ehuseranswer'][$question['questionid']], $o)) {
                                    $stats[$question['questionid']][$o] = intval($stats[$question['questionid']][$o]) + 1;
                                }
                            }
                        }
                    }
                }
                foreach ($p['ehquestion']['questionrows'] as $questionrows) {
                    foreach ($questionrows as $questionrow) {
                        foreach ($questionrow['data'] as $key => $question) {
                            if (!$key) {
                                $stats[$question['questionid']]['title'] = $questionrow['qrquestion'].'<br />'.$question['question'];
                            }
                            $stats[$question['questionid']]['id'] = $question['questionid'];
                            if ($p['ehscorelist'][$question['questionid']] > 0) {
                                $stats[$question['questionid']]['right'] = intval($stats[$question['questionid']]['right']) + 1;
                            }
                            $stats[$question['questionid']]['number'] = intval($stats[$question['questionid']]['number']) + 1;
                            if ($p['ehuseranswer'][$question['questionid']] && 0 == $questiontype[$question['questiontype']]['questsort'] && $questiontype[$question['questiontype']]['questchoice'] < 5) {
                                if (is_array($p['ehuseranswer'][$question['questionid']])) {
                                    $p['ehuseranswer'][$question['questionid']] = implode('', $p['ehuseranswer'][$question['questionid']]);
                                }
                                foreach ($os as $o) {
                                    if (false !== strpos($p['ehuseranswer'][$question['questionid']], $o)) {
                                        $stats[$question['questionid']][$o] = intval($stats[$question['questionid']][$o]) + 1;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            ksort($stats);
            $start = $page - 1;
            $start = $start >= 0 ? $start : 0;
            $tmp = array_slice($stats, $start * 20, 20);
            $pages = $this->pg->outPage($this->pg->getPagesNumber(count($stats), 20), $page);
            $this->tpl->assign('stats', ['data' => $tmp, 'pages' => $pages]);
            $this->tpl->assign('basicid', $basicid);
            $this->tpl->display('basic_stats');
        } else {
            foreach ($rs as $p) {
                $p['ehquestion'] = unserialize(gzuncompress(base64_decode($p['ehquestion'])));
                $p['ehsetting'] = unserialize(gzuncompress(base64_decode($p['ehsetting'])));
                foreach ($p['ehquestion']['questions'] as $questions) {
                    foreach ($questions as $key => $question) {
                        foreach ($question['questionknowsid'] as $knows) {
                            $stats[$knows['knowsid']]['knowsid'] = $knows['knowsid'];
                            $stats[$knows['knowsid']]['knows'] = $knows['knows'];
                            $stats[$knows['knowsid']]['number'] = intval($stats[$knows['knowsid']]['number']) + 1;
                            if ($p['ehscorelist'][$question['questionid']] > 0) {
                                $stats[$knows['knowsid']]['right'] = intval($stats[$knows['knowsid']]['right']) + 1;
                            }
                        }
                    }
                }
                foreach ($p['ehquestion']['questionrows'] as $questionrows) {
                    foreach ($questionrows as $questionrow) {
                        foreach ($questionrow['data'] as $key => $question) {
                            foreach ($questionrow['qrknowsid'] as $knows) {
                                $stats[$knows['knowsid']]['knowsid'] = $knows['knowsid'];
                                $stats[$knows['knowsid']]['knows'] = $knows['knows'];
                                $stats[$knows['knowsid']]['number'] = intval($stats[$knows['knowsid']]['number']) + 1;
                                if ($p['ehscorelist'][$question['questionid']] > 0) {
                                    $stats[$knows['knowsid']]['right'] = intval($stats[$knows['knowsid']]['right']) + 1;
                                }
                            }
                        }
                    }
                }
            }
            ksort($stats);
            $start = $page - 1;
            $start = $start >= 0 ? $start : 0;
            $tmp = array_slice($stats, $start * 20, 20);
            $pages = $this->pg->outPage($this->pg->getPagesNumber(count($stats), 20), $page);
            $this->tpl->assign('stats', ['data' => $tmp, 'pages' => $pages]);
            $this->tpl->assign('basicid', $basicid);
            $this->tpl->display('basic_knowsstats');
        }
    }

    private function outscore()
    {
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
        $fields = [];
        $tpfields = explode(',', $app['appsetting']['outfields']);
        foreach ($tpfields as $f) {
            $tf = $this->module->getFieldByNameAndModuleid($f);
            if ($tf && 'user' == $tf['fieldappid']) {
                $fields[$tf['fieldid']] = $tf;
            }
        }

        $search = $this->ev->get('search');
        $args = [];
        $basicid = $this->ev->get('basicid');
        if ($basicid) {
            $fname = 'data/score/'.TIME.'-'.$basicid.'-score.csv';
            $args[] = ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid];
            $args[] = ['AND', 'ehneedresit = 0'];
            $args[] = ['AND', 'ehtype = 2'];
            if ($search['stime']) {
                $stime = strtotime($search['stime']);
                $args[] = ['AND', 'ehstarttime >= :stime', 'stime', $stime];
            }
            if ($search['etime']) {
                $etime = strtotime($search['etime']);
                $args[] = ['AND', 'ehstarttime <= :etime', 'etime', $etime];
            }
            if ($search['sscore']) {
                $args[] = ['AND', 'ehscore >= :sscore', 'sscore', $search['sscore']];
            }
            if ($search['escore']) {
                $args[] = ['AND', 'ehscore <= :escore', 'escore', $search['escore']];
            }
            if ($search['examid']) {
                $args[] = ['AND', 'ehexamid = :ehexamid', 'ehexamid', $search['examid']];
            }
            $sf = ['ehusername', 'ehscore'];
            foreach ($fields as $p) {
                $sf[] = $p['field'];
            }
            $rs = $this->favor->getAllExamHistoryByArgs($args, $sf);
            $r = [];
            foreach ($rs as $p) {
                $tmp = ['ehusername' => iconv('UTF-8', 'GBK', $p['ehusername']), 'ehscore' => $p['ehscore']];
                foreach ($fields as $ps) {
                    $tmp[$ps['field']] = iconv('UTF-8', 'GBK', $p[$ps['field']]);
                }
                $r[] = $tmp;
            }
            if ($this->files->outCsv($fname, $r)) {
                $message = [
                    'statusCode'   => 200,
                    'message'      => "成绩导出成功，转入下载页面，如果浏览器没有相应，请<a href=\"{$fname}\">点此下载</a>",
                    'callbackType' => 'forward',
                    'forwardUrl'   => "{$fname}",
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '成绩导出失败',
                ];
            }
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '请选择好考场',
            ];
        }
        exit(json_encode($message));
    }

    private function delhistory()
    {
        $ehid = $this->ev->get('ehid');
        $this->favor->delExamHistory($ehid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function readpaper()
    {
        $ehid = $this->ev->get('ehid');
        $eh = $this->favor->getExamHistoryById($ehid);
        $questype = $this->basic->getQuestypeList();
        $sessionvars = ['examsession'=>$eh['ehexam'], 'examsessionscore'=>$eh['ehscore'], 'examsessionscorelist'=>$eh['ehscorelist'], 'examsessionsetting'=>$eh['ehsetting'], 'examsessionquestion'=>$eh['ehquestion'], 'examsessionuseranswer'=>$eh['ehuseranswer']];
        $this->tpl->assign('eh', $eh);
        $this->tpl->assign('user', $this->user->getUserById($eh['ehuserid']));
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->assign('questype', $questype);
        $this->tpl->display('basic_examview');
    }

    private function scorelist()
    {
        $this->module = $this->G->make('module');
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
        $fields = [];
        $tpfields = explode(',', $app['appsetting']['outfields']);
        foreach ($tpfields as $f) {
            $tf = $this->module->getFieldByNameAndModuleid($f);
            if ($tf && 'user' == $tf['fieldappid']) {
                $fields[$tf['fieldid']] = $tf;
            }
        }

        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $basicid = intval($this->ev->get('basicid'));
        $basic = $this->basic->getBasicById($basicid);
        $page = $page > 0 ? $page : 1;
        $args = [];
        $args[] = ['AND', "ehtype = '2'"];
        $args[] = ['AND', "ehstatus = '1'"];
        $args[] = ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid];
        if ($search['stime']) {
            $stime = strtotime($search['stime']);
            $args[] = ['AND', 'ehstarttime >= :stime', 'stime', $stime];
        }
        if ($search['etime']) {
            $etime = strtotime($search['etime']);
            $args[] = ['AND', 'ehstarttime <= :etime', 'etime', $etime];
        }
        if ($search['sscore']) {
            $args[] = ['AND', 'ehscore >= :sscore', 'sscore', $search['sscore']];
        }
        if ($search['escore']) {
            $args[] = ['AND', 'ehscore <= :escore', 'escore', $search['escore']];
        }
        if ($search['examid']) {
            $args[] = ['AND', 'ehexamid = :ehexamid', 'ehexamid', $search['examid']];
        }
        $exams = $this->favor->getExamHistoryListByArgs($args, $page, 30);
        $ids = trim($basic['basicexam']['self'], ', ');
        if (!$ids) {
            $ids = '0';
        }
        $exampaper = $this->exam->getExamSettingsByArgs([['AND', 'find_in_set(examid,:examid)', 'examid', $ids]]);
        $this->tpl->assign('basicid', $basicid);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('basic', $basic);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('fields', $fields);
        $this->tpl->assign('exampaper', $exampaper);
        $this->tpl->assign('exams', $exams);
        $this->tpl->display('basic_scorelist');
    }

    private function selectmember()
    {
        $page = intval($this->ev->get('page'));
        $basicid = intval($this->ev->get('basicid'));
        $basic = $this->basic->getBasicById($basicid);
        $search = $this->ev->get('search');
        $u = '';
        if ($search) {
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        if ($this->ev->get('submit')) {
            $userids = $this->ev->get('delids');
            $days = $this->ev->get('days');
            if ($userids && $days) {
                foreach ($userids as $userid => $p) {
                    $this->basic->openBasic(['obuserid' => $userid, 'obbasicid' => $basicid, 'obendtime' => TIME + $days * 24 * 3600]);
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?exam-master-basic-members&basicid='.$basicid,
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
            }
            exit(json_encode($message));
        }

        $args = [];
        if ($search['userid']) {
            $args[] = ['AND', 'userid = :userid', 'userid', $search['userid']];
        }
        if ($search['username']) {
            $args[] = ['AND', 'username LIKE :username', 'username', '%'.$search['username'].'%'];
        }
        if ($search['useremail']) {
            $args[] = ['AND', 'useremail  LIKE :useremail', 'useremail', '%'.$search['useremail'].'%'];
        }
        if ($search['groupid']) {
            $args[] = ['AND', 'usergroupid = :usergroupid', 'usergroupid', $search['groupid']];
        }
        if ($search['stime'] || $search['etime']) {
            if (!is_array($args)) {
                $args = [];
            }
            if ($search['stime']) {
                $stime = strtotime($search['stime']);
                $args[] = ['AND', 'userregtime >= :userregtime', 'userregtime', $stime];
            }
            if ($search['etime']) {
                $etime = strtotime($search['etime']);
                $args[] = ['AND', 'userregtime <= :userregtime', 'userregtime', $etime];
            }
        }
        $users = $this->user->getUserList($args, $page, 10);
        $this->tpl->assign('basic', $basic);
        $this->tpl->assign('users', $users);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('u', $u);
        $this->tpl->assign('page', $page);
        $this->tpl->display('basic_selectmember');
    }

    private function members()
    {
        $basicid = $this->ev->get('basicid');
        $search = $this->ev->get('search');
        $page = $this->ev->get('page');
        $args = [];
        $args[] = ['AND', 'openbasics.obbasicid = :obbasicid', 'obbasicid', $basicid];
        $args[] = ['AND', 'openbasics.obendtime >= :obendtime', 'obendtime', TIME];
        if ($search['userid']) {
            $args[] = ['AND', 'user.userid = :userid', 'userid', $search['userid']];
        }
        if ($search['username']) {
            $args[] = ['AND', 'user.username LIKE :username', 'username', '%'.$search['username'].'%'];
        }
        $members = $this->basic->getOpenBasicMember($args, $page);
        $basic = $this->basic->getBasicById($basicid);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('basicid', $basicid);
        $this->tpl->assign('basic', $basic);
        $this->tpl->assign('members', $members);
        $this->tpl->assign('page', $page);
        $this->tpl->display('basic_members');
    }

    private function selectgroups()
    {
        $useframe = $this->ev->get('useframe');
        $target = $this->ev->get('target');
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $this->pg->setUrlTarget('modal-body" class="ajax');
        $args = [];
        $actors = $this->user->getUserGroupList($args, $page, 10);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('target', $target);
        $this->tpl->assign('actors', $actors);
        $this->tpl->display('basic_allowgroups');
    }

    private function getsubjectquestype()
    {
        $subjectid = $this->ev->get('subjectid');
        $subject = $this->basic->getSubjectById($subjectid);
        $r = [];
        if ($subject['subjectsetting']['questypes']) {
            foreach ($subject['subjectsetting']['questypes'] as $key => $p) {
                if ($p) {
                    $r[] = $key;
                }
            }
        }
        exit(json_encode($r));
    }

    private function getbasicmembernumber()
    {
        $basicid = $this->ev->get('basicid');
        $number = $this->basic->getOpenBasicNumber($basicid);
        echo $number;
    }

    private function output()
    {
        $args = [['AND', 'quest2knows.qkquestionid = questions.questionid'], ['AND', "questions.questionstatus = '1'"], ['AND', 'questions.questionparent = 0'], ['AND', 'quest2knows.qktype = 0']];
        $rargs = [['AND', 'quest2knows.qkquestionid = questionrows.qrid'], ['AND', "questionrows.qrstatus = '1'"], ['AND', 'quest2knows.qktype = 1']];
        $tmpknows = '0';
        if ($this->ev->get('subjectid')) {
            $knows = $this->section->getAllKnowsBySubject($this->ev->get('subjectid'));
            foreach ($knows as $p) {
                if ($p['knowsid']) {
                    $tmpknows .= ','.$p['knowsid'];
                }
            }
            $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
            $rargs[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
        } elseif ($this->ev->get('sectionid')) {
            $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $this->ev->get('sectionid')]]);
            foreach ($knows as $p) {
                if ($p['knowsid']) {
                    $tmpknows .= ','.$p['knowsid'];
                }
            }
            $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
            $rargs[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
        } elseif ($this->ev->get('knowsid')) {
            $knowsid = $this->ev->get('knowsid');
            $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $knowsid];
            $rargs[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $knowsid];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '参数错误',
            ];
            $this->G->R($message);
        }
        $questions = $this->exam->getQuestionListByArgs($args);
        $fname = 'data/score/'.$this->ev->get('subjectid').'-'.$this->ev->get('sectionid').'-'.$this->ev->get('knowsid').'-questions.csv';
        $r = [];
        foreach ($questions as $p) {
            $r[] = ['questiontype' => $p['questiontype'], 'question' => iconv('UTF-8', 'GBK', html_entity_decode($p['question'])), 'questionselect' => iconv('UTF-8', 'GBK', html_entity_decode($p['questionselect'])), 'questionselectnumber' => iconv('UTF-8', 'GBK', $p['questionselectnumber']), 'questionanswer' => iconv('UTF-8', 'GBK', html_entity_decode($p['questionanswer'])), 'questiondescribe' => iconv('UTF-8', 'GBK', html_entity_decode($p['questiondescribe'])), 'knowsid' => $p['qkknowsid'], 'questionlevel' => $p['questionlevel']];
        }
        $questionrows = $this->exam->getAllQuestionRowsByArgs($rargs);
        foreach ($questionrows as $p) {
            $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $p['qkknowsid']]]);
            $r[] = ['questiontype' => $p['qrtype'], 'question' => iconv('UTF-8', 'GBK', html_entity_decode($p['qrquestion'])), 'questionselect' => iconv('UTF-8', 'GBK', html_entity_decode($p['qrselect'])), 'questionselectnumber' => iconv('UTF-8', 'GBK', $p['qrselectnumber']), 'questionanswer' => iconv('UTF-8', 'GBK', html_entity_decode($p['qranswer'])), 'questiondescribe' => iconv('UTF-8', 'GBK', html_entity_decode($p['qrdescribe'])), 'knowsid' => iconv('UTF-8', 'GBK', html_entity_decode($knows['knowsid'])), 'questionlevel' => $p['qrlevel'], 1, 1];
            $qtp = $this->exam->getSimpleQuestionListByArgs([['AND', 'questionparent = :qrid', 'qrid', $p['qrid']], ['AND', 'questionstatus = 1']]);
            foreach ($qtp as $qt) {
                $r[] = ['questiontype' => $p['qrtype'], 'question' => iconv('UTF-8', 'GBK', html_entity_decode($qt['question'])), 'questionselect' => iconv('UTF-8', 'GBK', html_entity_decode($qt['questionselect'])), 'questionselectnumber' => iconv('UTF-8', 'GBK', $qt['questionselectnumber']), 'questionanswer' => iconv('UTF-8', 'GBK', html_entity_decode($qt['questionanswer'])), 'questiondescribe' => iconv('UTF-8', 'GBK', html_entity_decode($qt['questiondescribe'])), 'knowsid' => iconv('UTF-8', 'GBK', html_entity_decode($knows['knowsid'])), 'questionlevel' => $p['qrlevel'], 1, 0];
            }
        }
        if ($this->files->outCsv($fname, $r)) {
            $message = [
                'statusCode'   => 200,
                'message'      => "试题导出成功，转入下载页面，如果浏览器没有相应，请<a href=\"{$fname}\">点此下载</a>",
                'callbackType' => 'forward',
                'forwardUrl'   => "{$fname}",
            ];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '试题导出失败',
            ];
        }
        $this->G->R($message);
    }

    private function section()
    {
        $subjectid = $this->ev->get('subjectid');
        $subjects = $this->basic->getSubjectList();
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $sections = $this->section->getSectionList($page, 10, [['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $subjectid]]);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('subjectid', $subjectid);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->display('basic_section');
    }

    private function addsection()
    {
        if ($this->ev->get('insertsection')) {
            $args = $this->ev->get('args');
            $section = $this->section->getSectionByArgs([['AND', 'section = :section', 'section', $args['section']], ['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $args['sectionsubjectid']]]);
            if ($section) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败，该科目下已经存在同名的章节',
                ];
            } else {
                $this->section->addSection($args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-basic-section&subjectid={$args['sectionsubjectid']}",
                ];
            }
            $this->G->R($message);
        } else {
            $subjectid = $this->ev->get('subjectid');
            $subjects = $this->basic->getSubjectList();
            $this->tpl->assign('subjectid', $subjectid);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('basic_addsection');
        }
    }

    private function modifysection()
    {
        if ($this->ev->get('modifysection')) {
            $args = $this->ev->get('args');
            $page = $this->ev->get('page');
            $sectionid = $this->ev->get('sectionid');
            $section = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $sectionid]]);
            $tpsection = $this->section->getSectionByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $section['sectionsubjectid']], ['AND', 'section = :section', 'section', $args['section']], ['AND', 'sectionid != :sectionid', 'sectionid', $sectionid]]);
            if ($tpsection) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败，本科目下已经存在这个章节',
                    'forwardUrl' => "index.php?exam-master-basic-section&subjectid={$section['sectionsubjectid']}&page={$page}",
                ];
            } else {
                $this->section->modifySection($sectionid, $args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-basic-section&subjectid={$section['sectionsubjectid']}&page={$page}",
                ];
            }
            $this->G->R($message);
        } else {
            $page = $this->ev->get('page');
            $sectionid = $this->ev->get('sectionid');
            $section = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $sectionid]]);
            $subjects = $this->basic->getSubjectList();
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('section', $section);
            $this->tpl->display('basic_modifysection');
        }
    }

    private function delsection()
    {
        $sectionid = $this->ev->get('sectionid');
        $page = $this->ev->get('page');
        $section = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $sectionid]]);
        $this->section->delSection($sectionid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-basic-section&subjectid={$section['sectionsubjectid']}&page={$page}",
        ];
        $this->G->R($message);
    }

    private function point()
    {
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $sectionid = $this->ev->get('sectionid');
        $section = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $sectionid]]);
        if (!$section['sectionid']) {
            header('location:index.php?exam-master-subject');
            exit;
        }

        $subjects = $this->basic->getSubjectList();
        $knows = $this->section->getKnowsList($page, 10, [['AND', 'knowssectionid = :sectionid', 'sectionid', $sectionid], ['AND', 'knowsstatus = 1']]);
        $this->tpl->assign('section', $section);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->display('basic_point');
    }

    private function addpoint()
    {
        if ($this->ev->get('insertknows')) {
            $args = $this->ev->get('args');
            $page = $this->ev->get('page');
            $knows = explode(',', $args['knows']);
            foreach ($knows as $know) {
                if ($know) {
                    $data = $this->section->getKnowsByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knows = :knows', 'knows', $know], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $args['knowssectionid']]]);
                    if ($data) {
                        $errmsg .= $know.',';
                    } else {
                        $this->section->addKnows(['knowssectionid' => $args['knowssectionid'], 'knows' => $know]);
                    }
                }
            }
            $errmsg = trim($errmsg, ' ,');
            if ($errmsg) {
                $errmsg = $errmsg.'等知识点已经存在，程序自动忽略！';
            }
            $message = [
                'statusCode' => 200,
                'message'    => '操作成功！'.$errmsg,
                'forwardUrl' => "index.php?exam-master-basic-point&sectionid={$args['knowssectionid']}",
            ];
            $this->G->R($message);
        } else {
            $page = $this->ev->get('page');
            $page = $page > 0 ? $page : 1;
            $sectionid = $this->ev->get('sectionid');
            $section = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $sectionid]]);
            if (!$section['sectionid']) {
                header('location:index.php?exam-master-subject');
                exit;
            }

            $subjects = $this->basic->getSubjectList();
            $knows = $this->section->getKnowsList($page, 10, [['AND', 'knowssectionid = :sectionid', 'sectionid', $sectionid], ['AND', 'knowsstatus = 1']]);
            $this->tpl->assign('section', $section);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('basic_addpoint');
        }
    }

    private function clearpoint()
    {
        $subjectid = $this->ev->get('subjectid');
        $sectionid = $this->ev->get('sectionid');
        $knowsid = $this->ev->get('knowsid');
        if ($knowsid) {
            $this->section->modifyKnows($knowsid, ['knowsnumber' => '', 'knowsquestions' => '']);
        } elseif ($sectionid) {
            $tpknows = $this->section->getKnowsListByArgs([['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $sectionid]]);
            foreach ($tpknows as $p) {
                $this->section->modifyKnows($p['knowsid'], ['knowsnumber' => '', 'knowsquestions' => '']);
            }
        } elseif ($subjectid) {
            $tpknows = $this->section->getAllKnowsBySubject($subjectid);
            foreach ($tpknows as $p) {
                $this->section->modifyKnows($p['knowsid'], ['knowsnumber' => '', 'knowsquestions' => '']);
            }
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功！',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function modifypoint()
    {
        if ($this->ev->get('modifypoint')) {
            $args = $this->ev->get('args');
            $page = $this->ev->get('page');
            $knowsid = $this->ev->get('knowsid');
            $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]);
            $tpknows = $this->section->getKnowsByArgs([['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $knows['knowssectionid']], ['AND', 'knows = :knows', 'knows', $args['knows']], ['AND', 'knowsid != :', 'knowsid', $knowsid]]);
            if ($tpknows) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败，该章节下已经存在同名的知识点',
                ];
            } else {
                $this->section->modifyKnows($knowsid, $args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-basic-point&sectionid={$knows['knowssectionid']}&page={$page}",
                ];
            }
            $this->G->R($message);
        } else {
            $page = $this->ev->get('page');
            $knowsid = $this->ev->get('knowsid');
            $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]);
            $section = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $knows['knowssectionid']]]);
            $this->tpl->assign('section', $section);
            $this->tpl->assign('knows', $knows);
            $this->tpl->display('basic_modifypoint');
        }
    }

    private function delpoint()
    {
        $knowsid = $this->ev->get('knowsid');
        $sectionid = $this->ev->get('sectionid');
        $page = $this->ev->get('page');
        $this->section->delKnows($knowsid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功！',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function subject()
    {
        $subjects = $this->basic->getSubjectList();
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->display('basic_subject');
    }

    private function addsubject()
    {
        if ($this->ev->get('insertsubject')) {
            $args = ['subject' => $this->ev->get('subject'), 'subjectsetting' => $this->ev->get('setting')];
            $data = $this->basic->getSubjectByName($args['subject']);
            if ($data) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败，该科目已经存在',
                ];
                $this->G->R($message);
            }
            $this->basic->addSubject($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?exam-master-basic-subject',
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $questypes = $this->basic->getQuestypeList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('basic_addsubject');
        }
    }

    private function modifysubject()
    {
        if ($this->ev->get('modifysubject')) {
            $args = $this->ev->get('args');
            $subjectid = $this->ev->get('subjectid');
            $this->basic->modifySubject($subjectid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?exam-master-basic-subject',
            ];
            $this->G->R($message);
        } else {
            $subjectid = $this->ev->get('subjectid');
            $subject = $this->basic->getSubjectById($subjectid);
            $questypes = $this->basic->getQuestypeList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('subject', $subject);
            $this->tpl->display('basic_modifysubject');
        }
    }

    private function delsubject()
    {
        $subjectid = $this->ev->get('subjectid');
        $section = $this->section->getSectionByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $subjectid]]);
        if ($section) {
            $message = [
                'statusCode' => 300,
                'message'    => '操作失败，请删除该科目下所有章节后再删除本科目',
            ];
        } else {
            $this->basic->delSubject($subjectid);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?exam-master-basic-subject',
            ];
        }
        $this->G->R($message);
    }

    private function questype()
    {
        $questypes = $this->basic->getQuestypeList();
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->display('basic_questype');
    }

    private function addquestype()
    {
        if ($this->ev->get('insertquestype')) {
            $args = $this->ev->get('args');
            $page = $this->ev->get('page');
            $this->basic->addQuestype($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-basic-questype&page={$page}",
            ];
            $this->G->R($message);
        } else {
            $this->tpl->display('basic_addquestype');
        }
    }

    private function modifyquestype()
    {
        if ($this->ev->get('modifyquestype')) {
            $args = $this->ev->get('args');
            $page = $this->ev->get('page');
            $questid = $this->ev->get('questid');
            $this->basic->modifyQuestype($questid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-basic-questype&page={$page}",
            ];
            $this->G->R($message);
        } else {
            $questid = $this->ev->get('questid');
            $quest = $this->basic->getQuestypeById($questid);
            $this->tpl->assign('quest', $quest);
            $this->tpl->display('basic_modifyquest');
        }
    }

    private function delquestype()
    {
        $questid = $this->ev->get('questid');
        $page = $this->ev->get('page');
        $this->basic->delQuestype($questid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-basic-questype&page={$page}",
        ];
        $this->G->R($message);
    }

    private function delarea()
    {
        $areaid = intval($this->ev->get('areaid'));
        $this->area->delArea($areaid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-basic-area&page={$page}",
        ];
        $this->G->R($message);
    }

    private function modifyarea()
    {
        if ($this->ev->get('modifyarea')) {
            $args = $this->ev->get('args');
            $areaid = $this->ev->get('areaid');
            $this->area->modifyArea($areaid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-basic-area&page={$page}",
            ];
            $this->G->R($message);
        } else {
            $page = intval($this->ev->get('page'));
            $areaid = intval($this->ev->get('areaid'));
            $area = $this->area->getAreaById($areaid);
            $this->tpl->assign('page', $page);
            $this->tpl->assign('area', $area);
            $this->tpl->display('basic_modifyarea');
        }
    }

    private function addarea()
    {
        if ($this->ev->get('insertarea')) {
            $args = $this->ev->get('args');
            $id = $this->area->addArea($args);
            if (!$id) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败，区号已存在',
                ];
            } else {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-basic-area&page={$page}",
                ];
            }
            $this->G->R($message);
        } else {
            $this->tpl->display('basic_addarea');
        }
    }

    private function area()
    {
        $page = $this->ev->get('page');
        $page = $page > 1 ? $page : 1;
        $areas = $this->area->getAreaListByPage($page, 10);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('areas', $areas);
        $this->tpl->display('basic_area');
    }

    private function delbasic()
    {
        $page = $this->ev->get('page');
        $basicid = $this->ev->get('basicid');
        $this->basic->delBasic($basicid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-basic&page={$page}",
        ];
        $this->G->R($message);
    }

    private function batdelbasic()
    {
        $page = $this->ev->get('page');
        $delids = $this->ev->get('delids');
        foreach ($delids as $basicid => $p) {
            $this->basic->delBasic($basicid);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function modifybasic()
    {
        $page = $this->ev->get('page');
        if ($this->ev->get('modifybasic')) {
            $basicid = $this->ev->get('basicid');
            $args = $this->ev->get('args');
            $this->basic->setBasicConfig($basicid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-basic&page={$page}",
            ];
            $this->G->R($message);
        } else {
            $basicid = $this->ev->get('basicid');
            $basic = $this->basic->getBasicById($basicid);
            $subjects = $this->basic->getSubjectList();
            $areas = $this->area->getAreaList();
            $this->tpl->assign('areas', $areas);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('basic', $basic);
            $this->tpl->display('basic_modify');
        }
    }

    private function offpaper()
    {
        $page = $this->ev->get('page');
        $basicid = $this->ev->get('basicid');
        $args = [];
        $args[] = ['AND', 'examsessionbasic = :examsessionbasic', 'examsessionbasic', $basicid];
        $args[] = ['AND', 'examsessiontype = 2'];
        $sessionusers = $this->exam->getExamSessionByArgs($args, $page);
        $this->tpl->assign('sessionusers', $sessionusers);
        $this->tpl->display('basic_offpaper');
    }

    private function savepaper()
    {
        $sessionid = $this->ev->get('examsessionid');
        $questype = $this->basic->getQuestypeList();
        $sessionvars = $this->exam->getExamSessionBySessionid($sessionid);
        $result = $this->exam->markscore($sessionvars, $questype);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function setexamrange()
    {
        $page = $this->ev->get('page');
        $basicid = $this->ev->get('basicid');
        if ($this->ev->get('setexamrange')) {
            $args = $this->ev->get('args');
            $args['basicsection'] = [];
            if (is_array($args['basicknows'])) {
                foreach ($args['basicknows'] as $key => $p) {
                    $args['basicsection'][] = $key;
                }
            }
            $args['basicexam']['opentime']['start'] = strtotime($args['basicexam']['opentime']['start']);
            $args['basicexam']['opentime']['end'] = strtotime($args['basicexam']['opentime']['end']);
            $args['basicsection'] = $args['basicsection'];
            $args['basicknows'] = $args['basicknows'];
            $args['basicexam'] = $args['basicexam'];
            $this->basic->setBasicConfig($basicid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-basic&page={$page}",
            ];
            $this->G->R($message);
        } else {
            $basic = $this->basic->getBasicById($basicid);
            $subjects = $this->basic->getSubjectList();
            $areas = $this->area->getAreaList();
            $tmpknows = $this->section->getAllKnowsBySubject($basic['basicsubjectid']);
            $knows = [];
            $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $basic['basicsubjectid']]]);
            foreach ($tmpknows as $p) {
                $knows[$p['knowssectionid']][] = $p;
            }
            $tpls = [];
            foreach (glob('app/exam/tpls/app/exampaper_paper*.tpl') as $p) {
                $tpls['ep'][] = substr(basename($p), 0, -4);
            }
            foreach (glob('app/exam/tpls/app/exam_paper*.tpl') as $p) {
                $tpls['pp'][] = substr(basename($p), 0, -4);
            }
            $this->tpl->assign('tpls', $tpls);
            $this->tpl->assign('basic', $basic);
            $this->tpl->assign('areas', $areas);
            $this->tpl->assign('sections', $sections);
            $this->tpl->assign('knows', $knows);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('basic_examrange');
        }
    }

    private function add()
    {
        if ($this->ev->get('insertbasic')) {
            $args = $this->ev->get('args');
            $page = $this->ev->get('page');
            $id = $this->basic->addBasic($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-basic-setexamrange&basicid={$id}&page={$page}",
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $areas = $this->area->getAreaList();
            $this->tpl->assign('areas', $areas);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('basic_add');
        }
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $page = $page > 1 ? $page : 1;
        $subjects = $this->basic->getSubjectList();
        if (!$search) {
            $args = 1;
        } else {
            $args = [];
        }
        if ($search['basicid']) {
            $args[] = ['AND', 'basicid = :basicid', 'basicid', $search['basicid']];
        } else {
            if ($search['keyword']) {
                $args[] = ['AND', 'basic LIKE :basic', 'basic', "%{$search['keyword']}%"];
            }
            if ($search['basicareaid']) {
                $args[] = ['AND', 'basicareaid = :basicareaid', 'basicareaid', $search['basicareaid']];
            }
            if ($search['basicsubjectid']) {
                $args[] = ['AND', 'basicsubjectid = :basicsubjectid', 'basicsubjectid', $search['basicsubjectid']];
            }
            if ($search['basicapi']) {
                $args[] = ['AND', 'basicapi = :basicapi', 'basicapi', $search['basicapi']];
            }
            if ($search['basicclosed']) {
                if (1 == $search['basicclosed']) {
                    $basicclosed = 1;
                } else {
                    $basicclosed = 0;
                }
                $args[] = ['AND', 'basicclosed = :basicclosed', 'basicclosed', $basicclosed];
            }
        }
        $basics = $this->basic->getBasicList($args, $page, 10);
        $areas = $this->area->getAreaList();
        $this->tpl->assign('areas', $areas);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('basics', $basics);
        $this->tpl->display('basic');
    }
}
