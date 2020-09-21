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
        $this->module = $this->G->make('module');
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
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
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
                        if ($p['ehuseranswer'][$question['questionid']] && $questiontype[$question['questiontype']]['questsort'] == 0 && $questiontype[$question['questiontype']]['questchoice'] < 5) {
                            foreach ($os as $o) {
                                if (strpos($p['ehuseranswer'][$question['questionid']], $o) !== false) {
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
                            if ($p['ehuseranswer'][$question['questionid']] && $questiontype[$question['questiontype']]['questsort'] == 0 && $questiontype[$question['questiontype']]['questchoice'] < 5) {
                                $p['ehuseranswer'][$question['questionid']] = implode('', $p['ehuseranswer'][$question['questionid']]);
                                foreach ($os as $o) {
                                    if (strpos($p['ehuseranswer'][$question['questionid']], $o) !== false) {
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
            $this->tpl->display('users_stats');
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
            $this->tpl->display('users_knowsstats');
        }
    }

    private function outanswer()
    {
        $search = $this->ev->get('search');
        $args = [];
        $basicid = $this->ev->get('basicid');
        if ($basicid) {
            $fname = 'data/score/'.TIME.'-'.$basicid.'-answer.csv';
            $args[] = ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid];
            $args[] = ['AND', 'ehneedresit = 0'];
            $args[] = ['AND', "ehstatus = '1'"];
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
            $sf = ['ehusername', 'useremail', 'usertruename', 'ehstarttime', 'ehtime', 'ehquestion', 'ehuseranswer'];
            $rs = $this->favor->getAllExamHistoryByArgs($args, $sf);
            $r = [];
            $index = [];
            $questions = [];
            $answers = [];
            $info = [];
            foreach ($rs as $p) {
                $info[] = ['ehstarttime' => $p['ehstarttime'], 'useremail' =>$p['useremail'], 'ehusername' =>$p['ehusername'], 'usertruename' => $p['usertruename'], 'ehtime' => $p['ehtime']];
                $p['ehquestion'] = unserialize(gzuncompress(base64_decode($p['ehquestion'])));
                $p['ehuseranswer'] = unserialize($p['ehuseranswer']);
                foreach ($p['ehquestion']['questions'] as $fquestions) {
                    foreach ($fquestions as $key => $question) {
                        if (!$questions[$question['questionid']]) {
                            $questions[$question['questionid']]['title'] = strip_tags(html_entity_decode($question['question']));
                            $index[] = $question['questionid'];
                        }
                    }
                }
                foreach ($p['ehquestion']['questionrows'] as $questionrows) {
                    foreach ($questionrows as $questionrow) {
                        foreach ($questionrow['data'] as $key => $question) {
                            if (!$questions[$question['questionid']]) {
                                $questions[$question['questionid']]['title'] = strip_tags(html_entity_decode($question['question']));
                                $index[] = $question['questionid'];
                            }
                        }
                    }
                }
                $answers[] = $p['ehuseranswer'];
            }
            $r = [];
            $tmp = [];
            $tmp[] = iconv('UTF-8', 'GBK', '序号');
            $tmp[] = iconv('UTF-8', 'GBK', '答题时间');
            $tmp[] = iconv('UTF-8', 'GBK', '所用时间(秒)');
            $tmp[] = iconv('UTF-8', 'GBK', '邮箱');
            $tmp[] = iconv('UTF-8', 'GBK', '用户名');
            $tmp[] = iconv('UTF-8', 'GBK', '姓名');
            foreach ($index as $inx) {
                $tmp[] = iconv('UTF-8', 'GBK', $questions[$inx]['title']);
            }
            $r[] = $tmp;
            $i = 0;
            foreach ($answers as $key => $answer) {
                $tmp = [];
                $tmp[] = iconv('UTF-8', 'GBK', ++$i);
                $tmp[] = iconv('UTF-8', 'GBK', date('Y-m-d H:i:s', $info[$key]['ehstarttime']));
                $tmp[] = iconv('UTF-8', 'GBK', $info[$key]['ehtime']);
                $tmp[] = iconv('UTF-8', 'GBK', $info[$key]['useremail']);
                $tmp[] = iconv('UTF-8', 'GBK', $info[$key]['ehusername']);
                $tmp[] = iconv('UTF-8', 'GBK', $info[$key]['usertruename']);
                foreach ($index as $inx) {
                    $tmp[] = iconv('UTF-8', 'GBK', $answer[$inx]);
                }
                $r[] = $tmp;
            }
            if ($this->files->outCsv($fname, $r)) {
                $message = [
                    'statusCode'   => 200,
                    'message'      => "导出成功，转入下载页面，如果浏览器没有相应，请<a href=\"{$fname}\">点此下载</a>",
                    'callbackType' => 'forward',
                    'forwardUrl'   => "{$fname}",
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '导出失败',
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

    private function outscore()
    {
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
        $fields = [];
        $tpfields = explode(',', $app['appsetting']['outfields']);
        foreach ($tpfields as $f) {
            $tf = $this->module->getFieldByNameAndModuleid($f);
            if ($tf && $tf['fieldappid'] == 'user') {
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
            $args[] = ['AND', 'ehtype > 0'];
            if ($search['username']) {
                $args[] = ['AND', 'ehusername = :ehusername', 'ehusername', $search['username']];
            }
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
            if ($search['examtype']) {
                $args[] = ['AND', 'ehtype = :ehtype', 'ehtype', $search['examtype']];
            }
            $sf = ['ehusername', 'ehscore', 'ehtime', 'ehstarttime'];
            foreach ($fields as $p) {
                $sf[] = $p['field'];
            }
            $rs = $this->favor->getAllExamHistoryByArgs($args, $sf);
            $r = [];
            foreach ($rs as $p) {
                $tmp = ['ehusername' => iconv('UTF-8', 'GBK', $p['ehusername']), 'ehscore' => $p['ehscore'], 'ehtime' => $p['ehtime'], 'ehstrattime' => date('Y-m-d H:i:s', $p['ehstarttime'])];
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
        $this->tpl->display('exam_view');
    }

    private function makescore()
    {
        $questype = $this->basic->getQuestypeList();
        $ehid = $this->ev->get('ehid');
        $eh = $this->favor->getExamHistoryById($ehid);
        if ($this->ev->get('makescore')) {
            if ($eh['ehteacher'] != $this->_user['username']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => "本试卷已被{$eh['ehteacher']}锁定批改中",
                ];
                exit(json_encode($message));
            }
            $score = $this->ev->get('score');
            $sumscore = 0;
            if (is_array($score)) {
                foreach ($score as $key => $p) {
                    $eh['ehscorelist'][$key] = $p;
                }
            }
            foreach ($eh['ehscorelist'] as $p) {
                $sumscore = $sumscore + floatval($p);
            }
            $eh['ehscore'] = $sumscore;
            $args['ehscorelist'] = $eh['ehscorelist'];
            $args['ehscore'] = $eh['ehscore'];
            $args['ehstatus'] = 1;
            if ($eh['ehscore'] >= $eh['ehsetting']['examsetting']['passscore']) {
                $args['ehispass'] = 1;
            }
            $this->favor->modifyExamHistory($ehid, $args);
            $message = [
                'statusCode' => 200,
                'message'    => '评分完成',
                'forwardUrl' => "index.php?exam-teach-users-exams&basicid={$eh['ehbasicid']}",
            ];
            exit(json_encode($message));
        }
    }

    private function score()
    {
        $ehid = $this->ev->get('ehid');
        $sessionvars = $this->favor->getExamHistoryById($ehid);
        if (!$sessionvars['ehstatus'] && !$sessionvars['ehteacher']) {
            $args = [];
            $sessionvars['ehteacher'] = $args['ehteacher'] = $this->_user['username'];
            $sessionvars['ehdecidetime'] = $args['ehdecidetime'] = TIME;
            $this->favor->modifyExamHistory($ehid, $args);
        }
        $questype = $this->basic->getQuestypeList();
        $this->tpl->assign('ehid', $ehid);
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->assign('questype', $questype);
        $this->tpl->display('users_decide');
    }

    private function scorelist()
    {
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
        $fields = [];
        $tpfields = explode(',', $app['appsetting']['outfields']);
        foreach ($tpfields as $f) {
            $tf = $this->module->getFieldByNameAndModuleid($f);
            if ($tf && $tf['fieldappid'] == 'user') {
                $fields[$tf['fieldid']] = $tf;
            }
        }
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $basicid = intval($this->ev->get('basicid'));
        $basic = $this->basic->getBasicById($basicid);
        $page = $page > 0 ? $page : 1;
        $args = [];
        $args[] = ['AND', 'ehtype > 0'];
        $args[] = ['AND', "ehstatus = '1'"];
        $args[] = ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid];
        if ($search['username']) {
            $args[] = ['AND', 'ehusername = :ehusername', 'ehusername', $search['username']];
        }
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
        if ($search['examtype']) {
            $args[] = ['AND', 'ehtype = :ehtype', 'ehtype', $search['examtype']];
        }
        if ($search['order']) {
            $order = null;
        } else {
            $order = 'ehid desc';
        }
        $exams = $this->favor->getExamHistoryListByArgs($args, $page, 30, false, $order);
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
        $this->tpl->display('users_scorelist');
    }

    private function setresit()
    {
        $ehid = $this->ev->get('ehid');
        $this->favor->modifyExamHistory($ehid, ['ehneedresit' => 1]);
        $message = [
            'statusCode' => 200,
            'message'    => '设置成功',
            'forwardUrl' => 'reload',
        ];
        exit(json_encode($message));
    }

    private function exams()
    {
        $page = $this->ev->get('page');
        $basicid = intval($this->ev->get('basicid'));
        $page = $page > 0 ? $page : 1;
        $args = [['AND', "ehstatus = '0'"], ['AND', 'ehtype = 2'], ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid]];
        $exams = $this->favor->getExamHistoryListByArgs($args, $page, 10, false, 'ehid desc');
        $this->tpl->assign('page', $page);
        $this->tpl->assign('exams', $exams);
        $this->tpl->display('users_history');
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $page = $page > 1 ? $page : 1;
        $subjects = $this->basic->getSubjectList([['AND', 'find_in_set(subjectid,:subjectid)', 'subjectid', $this->teachsubjects]]);
        $args = [['AND', 'find_in_set(basicsubjectid,:basicsubjectid)', 'basicsubjectid', $this->teachsubjects]];
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
        }
        $basics = $this->basic->getBasicList($args, $page, 10);
        $areas = $this->area->getAreaList();
        $this->tpl->assign('areas', $areas);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('basics', $basics);
        $this->tpl->display('users_basic');
    }
}
