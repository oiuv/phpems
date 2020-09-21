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

    private function apply()
    {
        $ceid = $this->ev->get('ceid');
        $ce = $this->ce->getCeById($ceid);
        if ($this->ev->get('apply')) {
            $user = $this->user->getUserById($this->_user['sessionuserid']);
            if ($user['usercoin'] < $ce['ceprice']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '余额不足，请到个人中心充值',
                ];
                exit(json_encode($message));
            }
            $cq = $this->ce->getCeQueueByArgs([
                ['AND', 'cequserid = :cequserid', 'cequserid', $this->_user['sessionuserid']],
                ['AND', 'ceqceid = :ceqceid', 'ceqceid', $ceid],
                ['AND', 'ceqstatus < 3'],
                ['AND', 'ceqtime >= :ceqtime', 'ceqtime', TIME - $ce['cedays'] * 24 * 3600],
            ]);
            if ($cq['ceqid']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '您已经申请过本证书了',
                ];
                exit(json_encode($message));
            }
            $ce['cebasic'] = explode(',', $ce['cebasic']);
            foreach ($ce['cebasic'] as $basicid) {
                if ($basicid) {
                    $eh = $this->G->make('favor', 'exam')->getExamHistoryByArgs([['AND', 'ehuserid = :ehuserid', 'ehuserid', $this->_user['sessionuserid']], ['AND', 'ehispass = 1'], ['AND', 'ehtype = 2'], ['AND', 'ehbasicid = :ehbasicid', 'ehbasicid', $basicid]]);
                    if (!$eh['ehid']) {
                        $message = [
                            'statusCode' => 300,
                            'message'    => '您需要通过考试后才能申请',
                        ];
                        exit(json_encode($message));
                    }
                }
            }
            $info = $this->ev->get('info');
            if (!$info['useraddress'] || !$info['userphone']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '请填写地址和联系电话',
                ];
                exit(json_encode($message));
            }
            $args = [];
            $args['cequserid'] = $this->_user['sessionuserid'];
            $args['ceqtime'] = TIME;
            $args['ceqstatus'] = 0;
            $args['ceqceid'] = $ceid;
            $args['ceqinfo'] = ['username' => $user['username'], 'photo' => $user['userphoto'], 'usertruename' => $user['usertruename'], 'usersex' => $user['usergender'], 'userphone' => $info['userphone'], 'useraddress' => $info['useraddress']];
            $this->ce->addCeQueue($args);
            $coin = $user['usercoin'] - $ce['ceprice'];
            $this->user->modifyUserInfo($this->_user['sessionuserid'], ['usercoin' => $coin]);
            $this->G->make('consume', 'bank')->addConsumeLog(['conluserid' => $this->_user['sessionuserid'], 'conlcost' => $ce['ceprice'], 'conltype' => 1, 'conltime' => TIME, 'conlinfo' => '申请证书'.$ce['cetitle']]);
            $user = $this->user->getUserById($this->_user['sessionuserid']);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?certificate',
            ];
            exit(json_encode($message));
        }

        // $basic = $this->G->make('basic', 'exam')->getBasicById($ce['cebasic']);
        // $this->tpl->assign('basic', $basic);
        $this->tpl->assign('ce', $ce);
        $this->tpl->display('certificate_apply');
    }

    private function index()
    {
        $page = intval($this->ev->get('page'));
        $certificates = $this->ce->getCeList([], $page, 10);
        $args = [];
        $args[] = ['AND', 'cequserid = :cequserid', 'cequserid', $this->_user['sessionuserid']];
        $new = $this->ce->getCeQueueList($args, 1, 10);
        $this->tpl->assign('news', $new['data']);
        $this->tpl->assign('certificates', $certificates);
        $this->tpl->assign('page', $page);
        $this->tpl->display('certificate');
    }
}
