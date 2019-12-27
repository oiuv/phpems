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
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
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
                'forwardUrl'   => "index.php?exam-teach-basic&page={$page}{$u}",
            ];
            exit(json_encode($message));
        }

        $basic = $this->basic->getBasicById($basicid);
        $subjects = $this->basic->getSubjectList([['AND', 'find_in_set(subjectid,:subjectid)', 'subjectid', $this->teachsubjects]]);
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

    private function savepaper()
    {
        $sessionid = $this->ev->get('examsessionid');
        $questype = $this->basic->getQuestypeList();
        $sessionvars = $this->exam->getExamSessionBySessionid($sessionid);
        $question = $sessionvars['examsessionuseranswer'];
        $needhand = 0;
        foreach ($sessionvars['examsessionquestion']['questions'] as $key => $tmp) {
            if (!$questype[$key]['questsort']) {
                foreach ($tmp as $p) {
                    if (is_array($sessionvars['examsessionuseranswer'][$p['questionid']])) {
                        $nanswer = '';
                        $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                        asort($answer);
                        $nanswer = implode('', $answer);
                        if ($nanswer == $p['questionanswer']) {
                            $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                        } else {
                            if (3 == $questype[$key]['questchoice']) {
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
                if (is_array($tmp) && count($tmp)) {
                    $needhand = 1;
                }
            }
        }
        foreach ($sessionvars['examsessionquestion']['questionrows'] as $key => $tmp) {
            if (!$questype[$key]['questsort']) {
                foreach ($tmp as $tmp2) {
                    foreach ($tmp2['data'] as $p) {
                        if (is_array($sessionvars['examsessionuseranswer'][$p['questionid']])) {
                            $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                            asort($answer);
                            $nanswer = implode('', $answer);
                            if ($nanswer == $p['questionanswer']) {
                                $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                            } else {
                                if (3 == $questype[$key]['questchoice']) {
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
                    }
                }
            } else {
                if (!$needhand) {
                    if (is_array($tmp) && count($tmp)) {
                        $needhand = 1;
                    }
                }
            }
        }
        $args['examsessionuseranswer'] = $question;
        $args['examsessionscorelist'] = $scorelist;
        $args['examsessionscore'] = array_sum($scorelist);
        $this->exam->modifyExamSession($args, $sessionid);
        $this->favor->addExamHistory($sessionid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function selectgroups()
    {
        $useframe = $this->ev->get('useframe');
        $target = $this->ev->get('target');
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $this->pg->setUrlTarget('modal-body" class="ajax');
        $args = 1;
        $actors = $this->user->getUserGroupList($args, $page, 10);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('target', $target);
        $this->tpl->assign('actors', $actors);
        $this->tpl->display('basic_allowgroups');
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

    private function getbasicmembernumber()
    {
        $basicid = $this->ev->get('basicid');
        $number = $this->basic->getOpenBasicNumber($basicid);
        echo $number;
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
        $this->tpl->display('basic');
    }
}
