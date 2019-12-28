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
        if ($this->data['currentbasic']['basicexam']['model']) {
            header('location:index.php?exam-app-lesson');
            exit;
        }
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function getknowsbysectionid()
    {
        $sectionid = $this->ev->get('sectionid');
        $aknows = $this->section->getKnowsListByArgs([['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $sectionid], ['AND', 'knowsstatus = 1']]);
        $data = [['', '选择知识点']];
        foreach ($aknows as $knows) {
            $data[] = [$knows['knowsid'], $knows['knows']];
        }
        foreach ($data as $p) {
            echo "<option value=\"{$p[0]}\">{$p[1]}</option>";
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

    private function rowsdetail()
    {
        $questionid = $this->ev->get('questionid');
        $question = $this->exam->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $questionid]]);
        $sections = [];
        foreach ($question['qrknowsid'] as $key => $p) {
            $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $p['knowsid']]]);
            $question['qrknowsid'][$key]['knows'] = $knows['knows'];
            $sections[] = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $knows['knowssectionid']]]);
        }
        $subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
        $this->tpl->assign('subject', $subject);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('question', $question);
        $this->tpl->display('questionrows_detail');
    }

    private function questionrows()
    {
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $questypes = $this->basic->getQuestypeList();
        $basic = $this->data['currentbasic'];
        $search = $this->ev->get('search');
        $args = [['AND', 'quest2knows.qkquestionid = questionrows.qrid'], ['AND', 'quest2knows.qktype = 1'], ['AND', "questionrows.qrstatus = '1'"]];
        if ($search['questionid']) {
            $args[] = ['AND', 'questionrows.qrid = :qrid', 'qrid', $search['questionid']];
        }
        if ($search['questiontype']) {
            $args[] = ['AND', 'questionrows.qrtype = :qrtype', 'qrtype', $search['questiontype']];
        }
        if ($search['keyword']) {
            $args[] = ['AND', 'questionrows.qrquestion LIKE :qrquestion', 'qrquestion', '%'.$search['keyword'].'%'];
        }
        if ($search['qrlevel']) {
            $args[] = ['AND', 'questionrows.qrlevel = :qrlevel', 'qrlevel', $search['qrlevel']];
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
            } else {
                $knows = $this->section->getAllKnowsBySubject($basic['basicsubjectid']);
                foreach ($knows as $p) {
                    if ($p['knowsid']) {
                        $tmpknows .= ','.$p['knowsid'];
                    }
                }
                $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
            }
        }
        $questions = $this->exam->getQuestionrowsList($page, 10, $args);
        $subjects = $this->basic->getSubjectList();
        $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $basic['basicsubjectid']]]);
        $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('questions', $questions);
        $this->tpl->display('questionrows');
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $basic = $this->data['currentbasic'];
        $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $basic['basicsubjectid']]]);
        $args = [['AND', 'quest2knows.qkquestionid = questions.questionid'], ['AND', "questions.questionstatus = '1'"], ['AND', 'questions.questionparent = 0'], ['AND', 'quest2knows.qktype = 0']];
        if ($search['questionid']) {
            $args[] = ['AND', 'questions.questionid = :questionid', 'questionid', $search['questionid']];
        }
        if ($search['keyword']) {
            $args[] = ['AND', 'questions.question LIKE :question', 'question', '%'.$search['keyword'].'%'];
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
            } else {
                $knows = $this->section->getAllKnowsBySubject($basic['basicsubjectid']);
                foreach ($knows as $p) {
                    if ($p['knowsid']) {
                        $tmpknows .= ','.$p['knowsid'];
                    }
                }
                $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
            }
        }
        $questions = $this->exam->getQuestionsList($page, 10, $args);
        $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
        $questypes = $this->basic->getQuestypeList();
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('questions', $questions);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('page', $page);
        $this->tpl->display('questions');
    }
}
