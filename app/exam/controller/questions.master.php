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
        $search = $this->ev->get('search');
        $this->u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $this->u .= "&search[{$key}]={$arg}";
            }
        }
        $this->tpl->assign('u', $this->u);
        $this->$action();
        exit;
    }

    private function makequery()
    {
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功，正在转入查询结果',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-questions{$u}",
        ];
        $this->G->R($message);
    }

    private function filebataddquestion()
    {
        setlocale(LC_ALL, 'zh_CN');
        if ($this->ev->get('insertquestion')) {
            $page = $this->ev->get('page');
            $uploadfile = $this->ev->get('uploadfile');
            $knowsid = trim($this->ev->get('knowsid'));
            $this->exam->importQuestionBat($uploadfile, $knowsid);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $this->tpl->display('question_filebatadd');
        }
    }

    private function addquestion()
    {
        if ($this->ev->get('insertquestion')) {
            $type = $this->ev->get('type');
            $questionparent = $this->ev->get('questionparent');
            //批量添加
            if ($type) {
                $page = $this->ev->get('page');
                $content = $this->ev->get('content');
                $this->exam->insertQuestionBat($content, $questionparent);
            }
            //单个添加
            else {
                $args = $this->ev->get('args');
                $targs = $this->ev->get('targs');
                if (!$questionparent) {
                    $questionparent = $args['questionparent'];
                }
                $questype = $this->basic->getQuestypeById($args['questiontype']);
                $args['questionuserid'] = $this->_user['sessionuserid'];
                if ($questype['questsort']) {
                    $choice = 0;
                } else {
                    $choice = $questype['questchoice'];
                }
                $args['questionanswer'] = $targs['questionanswer'.$choice];
                if (is_array($args['questionanswer'])) {
                    $args['questionanswer'] = implode('', $args['questionanswer']);
                }
                $page = $this->ev->get('page');
                $args['questioncreatetime'] = TIME;
                $args['questionusername'] = $this->_user['sessionusername'];
                $this->exam->addQuestions($args);
            }
            if ($questionparent) {
                $this->exam->resetRowsQuestionNumber($questionparent);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}",
                ];
            } else {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
                ];
            }
            $this->G->R($message);
        } else {
            $search = $this->ev->get('search');
            $questypes = $this->basic->getQuestypeList();
            $subjects = $this->basic->getSubjectList();
            $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $search['questionsubjectid']]]);
            $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('sections', $sections);
            $this->tpl->assign('knows', $knows);
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->display('question_add');
        }
    }

    private function bataddquestion()
    {
        if ($this->ev->get('insertquestion')) {
            $page = $this->ev->get('page');
            $questionparent = $this->ev->get('questionparent');
            $content = $this->ev->get('content');
            $this->exam->insertQuestionBat($content, $questionparent);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $this->tpl->display('question_batadd');
        }
    }

    private function delquestion()
    {
        $page = $this->ev->get('page');
        $questionid = $this->ev->get('questionid');
        $questionparent = $this->ev->get('questionparent');
        $this->exam->delQuestions($questionid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function batdel()
    {
        $page = $this->ev->get('page');
        $delids = $this->ev->get('delids');
        foreach ($delids as $questionid => $p) {
            $this->exam->delQuestions($questionid);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function backquestion()
    {
        $page = $this->ev->get('page');
        $questionid = $this->ev->get('questionid');
        $questions = $this->exam->backQuestions($questionid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-recyle&page={$page}",
        ];
        $this->G->R($message);
    }

    private function modifyquestion()
    {
        if ($this->ev->get('modifyquestion')) {
            $page = $this->ev->get('page');
            $args = $this->ev->get('args');
            $questionid = $this->ev->get('questionid');
            $targs = $this->ev->get('targs');
            $questype = $this->basic->getQuestypeById($args['questiontype']);
            if ($questype['questsort']) {
                $choice = 0;
            } else {
                $choice = $questype['questchoice'];
            }
            $args['questionanswer'] = $targs['questionanswer'.$choice];
            if (is_array($args['questionanswer'])) {
                $args['questionanswer'] = implode('', $args['questionanswer']);
            }
            $this->exam->modifyQuestions($questionid, $args);
            if ($args['questionparent']) {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
                ];
            } else {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
                ];
            }
            $this->G->R($message);
        } else {
            $page = $this->ev->get('page');
            $questionparent = $this->ev->get('questionparent');
            $knowsid = $this->ev->get('knowsid');
            $questionid = $this->ev->get('questionid');
            $questypes = $this->basic->getQuestypeList();
            $question = $this->exam->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $questionid]]);
            if ($question['questionparent']) {
                header("location:index.php?exam-master-rowsquestions-modifychildquestion&page={$page}&questionparent={$question['questionparent']}&questionid={$questionid}");
                exit;
            }
            $subjects = $this->basic->getSubjectList();
            foreach ($question['questionknowsid'] as $key => $p) {
                $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $p['knowsid']]]);
                $question['questionknowsid'][$key]['knows'] = $knows['knows'];
            }
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('questionparent', $questionparent);
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('page', $page);
            $this->tpl->assign('knowsid', $knowsid);
            $this->tpl->assign('question', $question);
            if ($questionparent) {
                $this->tpl->display('questionchildrows_modify');
            } else {
                $this->tpl->display('questions_modify');
            }
        }
    }

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            //根据章节获取知识点信息
            case 'getknowsbysectionid':
            $sectionid = $this->ev->get('sectionid');
            $aknows = $this->section->getKnowsListByArgs([['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $sectionid], ['AND', 'knowsstatus = 1']]);
            $data = [['', '选择知识点']];
            foreach ($aknows as $knows) {
                $data[] = [$knows['knowsid'], $knows['knows']];
            }
            foreach ($data as $p) {
                echo "<option value=\"{$p[0]}\">{$p[1]}</option>";
            }
            //exit(json_encode($data));
            break;

            //根据科目获取章节信息
            case 'getsectionsbysubjectid':
            $esid = $this->ev->get('subjectid');
            $aknows = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $esid]]);
            $data = [[0, '选择章节']];
            foreach ($aknows as $knows) {
                $data[] = [$knows['sectionid'], $knows['section']];
            }
            foreach ($data as $p) {
                echo "<option value=\"{$p[0]}\">{$p[1]}</option>";
            }
            //exit(json_encode($data));
            break;

            default:
        }
    }

    private function detail()
    {
        $questionid = $this->ev->get('questionid');
        $questionparent = $this->ev->get('questionparent');
        if ($questionparent) {
            $questions = $this->exam->getQuestionByArgs([['AND', 'questionparent = :questionparent', 'questionparent', $questionparent]]);
        } else {
            $question = $this->exam->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $questionid]]);
            $sections = [];
            foreach ($question['questionknowsid'] as $key => $p) {
                $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $p['knowsid']]]);
                $question['questionknowsid'][$key]['knows'] = $knows['knows'];
                $sections[] = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $knows['knowssectionid']]]);
            }
            $subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
        }
        $this->tpl->assign('subject', $subject);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('question', $question);
        $this->tpl->assign('questions', $questions);
        $this->tpl->display('question_detail');
    }

    private function index()
    {
        $search = $this->ev->get('search');
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $args = [['AND', 'quest2knows.qkquestionid = questions.questionid'], ['AND', "questions.questionstatus = '1'"], ['AND', 'questions.questionparent = 0'], ['AND', 'quest2knows.qktype = 0']];
        if ($search['questionid']) {
            $args[] = ['AND', 'questions.questionid = :questionid', 'questionid', $search['questionid']];
        }
        if ($search['keyword']) {
            $args[] = ['AND', 'questions.question LIKE :question', 'question', '%'.$search['keyword'].'%'];
        }
        if ($search['knowsids']) {
            $args[] = ['AND', 'find_in_set(questions.questionknowsid,:questionknowsid)', 'questionknowsid', $search['knowsids']];
        }
        if ($search['stime']) {
            $args[] = ['AND', 'questions.questioncreatetime >= :questioncreatetime', 'questioncreatetime', strtotime($search['stime'])];
        }
        if ($search['etime']) {
            $args[] = ['AND', 'questions.questioncreatetime <= :questionendtime', 'questionendtime', strtotime($search['etime'])];
        }
        if ($search['questiontype']) {
            $args[] = ['AND', 'questions.questiontype = :questiontype', 'questiontype', $search['questiontype']];
        }
        if ($search['questionlevel']) {
            $args[] = ['AND', 'questions.questionlevel = :questionlevel', 'questionlevel', $search['questionlevel']];
        }
        if ($search['questionknowsid']) {
            $args[] = ['AND', 'quest2knows.qkknowsid = :qkknowsid', 'qkknowsid', $search['questionknowsid']];
        } else {
            $tmpknows = '0';
            if ($search['questionsectionid']) {
                $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
                foreach ($knows as $p) {
                    if ($p['knowsid']) {
                        $tmpknows .= ','.$p['knowsid'];
                    }
                }
                $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
            } elseif ($search['questionsubjectid']) {
                $knows = $this->section->getAllKnowsBySubject($search['questionsubjectid']);
                foreach ($knows as $p) {
                    if ($p['knowsid']) {
                        $tmpknows .= ','.$p['knowsid'];
                    }
                }
                $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
            }
        }
        $questypes = $this->basic->getQuestypeList();
        if ($search) {
            $questions = $this->exam->getQuestionsList($page, 10, $args);
        } else {
            $questions = $this->exam->getSimpleQuestionsList($page, 10, [['AND', "questionstatus = '1'"], ['AND', 'questionparent = 0']]);
        }
        $subjects = $this->basic->getSubjectList();
        $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $search['questionsubjectid']]]);
        $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('questions', $questions);
        $this->tpl->display('questions');
    }
}
