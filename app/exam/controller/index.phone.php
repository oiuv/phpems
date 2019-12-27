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

    private function setCurrentBasic()
    {
        $basicid = $this->ev->get('basicid');
        if ($this->data['openbasics'][$basicid]) {
            $this->session->setSessionValue(['sessioncurrent' => $basicid]);
            $message = [
                'statusCode'   => 200,
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?exam-phone-basics-page',
            ];
        } else {
            $message = [
                'statusCode'   => 200,
                'message'      => '您尚未开通本考场，系统将引导您开通',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?exam-phone-basics-detail&basicid='.$basicid,
            ];
        }
        $this->G->R($message);
    }

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            //根据章节获取知识点信息
            case 'getknowsbysectionid':
            $sectionid = $this->ev->get('sectionid');
            $knowsids = $this->data['currentbasic']['basicknows'][$sectionid];
            $aknows = $this->section->getKnowsListByArgs([['AND', 'knowsid in (:knowsid)', 'knowsid', $knowsids], ['AND', 'knowsstatus = 1']]);
            if ($sectionid) {
                $data = '<option value="0">选择知识点</option>'."\n";
            } else {
                $data = '<option value="0">请先选择章节</option>'."\n";
            }
            foreach ($aknows as $knows) {
                $data .= '<option value="'.$knows['knowsid'].'">'.$knows['knows'].'</option>'."\n";
            }
            exit($data);
            break;

            //获取剩余时间
            case 'lefttime':
            $sessionvars = $this->exam->getExamSessionBySessionid();
            $lefttime = TIME - $sessionvars['examsessionstarttime'];
            if ($lefttime < 0) {
                $lefttime = 0;
            }
            exit("{$lefttime}");
            break;

            //根据科目获取章节信息
            case 'getsectionsbysubjectid':
            $sectionids = $this->data['currentbasic']['basicsection'];
            $aknows = $this->section->getSectionListByArgs([['AND', 'sectionid IN (:sectionsubjectid)', 'sectionsubjectid', $sectionids]]);
            $data = [[0, '选择章节']];
            foreach ($aknows as $knows) {
                $data[] = [$knows['sectionid'], $knows['section']];
            }
            exit(json_encode($data));
            break;

            //标注题目
            case 'sign':
            $questionid = intval($this->ev->get('questionid'));
            $url = $this->G->make('strings')->destr($this->ev->get('url'));
            $sessionvars = $this->exam->getExamSessionBySessionid();
            $args['examsessionsign'] = $sessionvars['examsessionsign'];
            if ($questionid && !$args['examsessionsign'][$questionid]) {
                $args['examsessionsign'][$questionid] = 1;
                $args['examsessionsign'] = $args['examsessionsign'];
                $this->exam->modifyExamSession($args);
                exit('1');
            }

                unset($args['examsessionsign'][$questionid]);
                $args['examsessionsign'] = $args['examsessionsign'];
                $this->exam->modifyExamSession($args);
                exit('2');

            break;

            case 'saveUserAnswer':
            $sessionvars = $this->exam->getExamSessionBySessionid();
            if (!$sessionvars['examsessionid']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '系统检测到试卷错误，请停止作答，联系监考老师！',
                ];
                $this->G->R($message);
            }
            $question = $this->ev->post('question');
            $token = $this->ev->get('token');
            if (!$token || $token != $sessionvars['examsessiontoken']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '系统检测到试卷错误，请停止作答，联系监考老师！',
                ];
                $this->G->R($message);
            }
            foreach ($question as $key => $t) {
                if ('' == $t) {
                    unset($question[$key]);
                }
            }
            $this->exam->modifyExamSession(['examsessionuseranswer' => $question]);
            $message = [
                'statusCode' => 200,
            ];
            $this->G->R($message);
            break;

            default:
        }
    }

    private function index()
    {
        $this->tpl->assign('basics', $this->data['openbasics']);
        $this->tpl->display('index');
    }
}
