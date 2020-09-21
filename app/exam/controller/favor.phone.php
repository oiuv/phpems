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

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            //添加一个收藏
            case 'addfavor':
            $questionid = $this->ev->get('questionid');
            if (!is_numeric($questionid)) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '即时组卷试题不能收藏！',
                ];
            }
            if ($this->favor->getFavorByQuestionAndUserId($questionid, $this->_user['sessionuserid'])) {
                $message = [
                    'statusCode' => 200,
                    'message'    => '收藏成功！',
                ];
            } else {
                $this->favor->favorQuestion($questionid, $this->_user['sessionuserid'], $this->data['currentbasic']['basicsubjectid']);
                $message = [
                    'statusCode' => 200,
                    'message'    => '收藏成功！',
                ];
            }
            $this->G->R($message);
            break;

            //删除一个收藏
            case 'delfavor':
            $favorid = $this->ev->get('favorid');
            $this->favor->delFavorById($favorid);
            $message = [
                'statusCode' => 200,
                'message'    => '操作成功',
                'callback'   => reloadpage,
            ];
            $this->G->R($message);
            break;

            case 'questions':
                $page = $this->ev->get('page');
                $page = $page > 0 ? $page : 1;
                $args = [
                    ['AND', 'favorsubjectid = :favorsubjectid', 'favorsubjectid', $this->data['currentbasic']['basicsubjectid']],
                    ['AND', 'favoruserid = :favoruserid', 'favoruserid', $this->_user['sessionuserid']],
                ];
                $favors = $this->favor->getFavorListByUserid($args, $page, 1);
                $question = $this->exam->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $favors['data'][0]['favorquestionid']]]);
                if ($question['questionparent']) {
                    $parent = $this->exam->getQuestionRowsById($question['questionparent'], false, false);
                    $this->tpl->assign('parent', $parent);
                }
                $questypes = $this->basic->getQuestypeList();
                $this->tpl->assign('favor', $favors['data'][0]);
                $this->tpl->assign('number', $page);
                $this->tpl->assign('question', $question);
                $this->tpl->assign('questype', $questypes[$question['questiontype']]);
                $this->tpl->assign('allnumber', $favors['number']);
                $this->tpl->display('favor_ajaxquestion');
                break;

            default:
            break;
        }
    }

    private function index()
    {
        $this->tpl->display('favor');
    }
}
