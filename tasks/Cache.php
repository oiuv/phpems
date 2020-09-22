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

require __DIR__.'/../vendor/autoload.php';

class Cache
{
    // 根据已做试题统计错题率
    public static function questions()
    {
        $eh = \Model\ExamHistory::all();
        $stats = [];
        $os = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

        // 获取试题类型并转为数组
        $questiontype = \Model\Questype::all();
        $questiontype = json_decode($questiontype->toJson(), true);

        foreach ($eh as $p) {
            // 统计普通试题记录
            foreach ($p->ehquestion['questions'] as $questions) {
                foreach ($questions as $key => $question) {
                    if (!isset($stats[$question['questionid']]['right'])) {
                        $stats[$question['questionid']]['right'] = 0;
                    }
                    if (!isset($stats[$question['questionid']]['number'])) {
                        $stats[$question['questionid']]['number'] = 0;
                    }
                    $stats[$question['questionid']]['title'] = $question['question'];
                    $stats[$question['questionid']]['id'] = $question['questionid'];
                    // 统计正确回答数量
                    if (isset($p->ehscorelist[$question['questionid']]) && $p->ehscorelist[$question['questionid']] > 0) {
                        $stats[$question['questionid']]['right'] = intval($stats[$question['questionid']]['right']) + 1;
                    }
                    // 统计总回答人数
                    $stats[$question['questionid']]['number'] = intval($stats[$question['questionid']]['number']) + 1;
                    // 统计各选项回答数量
                    if (isset($p->ehuseranswer[$question['questionid']]) && 0 == $questiontype[$question['questiontype'] - 1]['questsort'] && $questiontype[$question['questiontype'] - 1]['questchoice'] < 5) {
                        foreach ($os as $o) {
                            if (!isset($stats[$question['questionid']][$o])) {
                                $stats[$question['questionid']][$o] = 0;
                            }
                            // 多选
                            if (is_array($p->ehuseranswer[$question['questionid']]) && in_array($o, $p->ehuseranswer[$question['questionid']])) {
                                $stats[$question['questionid']][$o] = intval($stats[$question['questionid']][$o]) + 1;
                            }
                            // 单选
                            if (!is_array($p->ehuseranswer[$question['questionid']]) && false !== strpos($p->ehuseranswer[$question['questionid']], $o)) {
                                $stats[$question['questionid']][$o] = intval($stats[$question['questionid']][$o]) + 1;
                            }
                        }
                    }
                }
            }
            // 统计题冒题记录（材料分析题）
            foreach ($p->ehquestion['questionrows'] as $questionrows) {
                foreach ($questionrows as $questionrow) {
                    foreach ($questionrow['data'] as $key => $question) {
                        if (!isset($stats[$question['questionid']]['right'])) {
                            $stats[$question['questionid']]['right'] = 0;
                        }
                        if (!isset($stats[$question['questionid']]['number'])) {
                            $stats[$question['questionid']]['number'] = 0;
                        }
                        if (!$key) {
                            $stats[$question['questionid']]['title'] = $questionrow['qrquestion'].'<br />'.$question['question'];
                        }
                        $stats[$question['questionid']]['id'] = $question['questionid'];
                        if (isset($p->ehscorelist[$question['questionid']]) && $p->ehscorelist[$question['questionid']] > 0) {
                            $stats[$question['questionid']]['right'] = intval($stats[$question['questionid']]['right']) + 1;
                        }
                        $stats[$question['questionid']]['number'] = intval($stats[$question['questionid']]['number']) + 1;
                        if (isset($p->ehuseranswer[$question['questionid']]) && 0 == $questiontype[$question['questiontype'] - 1]['questsort'] && $questiontype[$question['questiontype'] - 1]['questchoice'] < 5) {
                            foreach ($os as $o) {
                                if (!isset($stats[$question['questionid']][$o])) {
                                    $stats[$question['questionid']][$o] = 0;
                                }
                                if (is_array($p->ehuseranswer[$question['questionid']]) && in_array($o, $p->ehuseranswer[$question['questionid']])) {
                                    $stats[$question['questionid']][$o] = intval($stats[$question['questionid']][$o]) + 1;
                                } elseif (!is_array($p->ehuseranswer[$question['questionid']]) && false !== strpos($p->ehuseranswer[$question['questionid']], $o)) {
                                    $stats[$question['questionid']][$o] = intval($stats[$question['questionid']][$o]) + 1;
                                }
                            }
                        }
                    }
                }
            }
        }

        return $stats;
    }

    // 根据知识点统计错题率
    public static function knows()
    {
        $eh = \Model\ExamHistory::all();
        $stats = [];

        foreach ($eh as $p) {
            // 普通试题知识点
            foreach ($p->ehquestion['questions'] as $questions) {
                foreach ($questions as $key => $question) {
                    foreach ($question['questionknowsid'] as $knows) {
                        if (!isset($stats[$knows['knowsid']]['number'])) {
                            $stats[$knows['knowsid']]['number'] = 0;
                        }
                        if (!isset($stats[$knows['knowsid']]['right'])) {
                            $stats[$knows['knowsid']]['right'] = 0;
                        }
                        $stats[$knows['knowsid']]['knowsid'] = $knows['knowsid'];
                        $stats[$knows['knowsid']]['knows'] = $knows['knows'];
                        $stats[$knows['knowsid']]['number'] = intval($stats[$knows['knowsid']]['number']) + 1;
                        if (isset($p->ehscorelist[$question['questionid']]) && $p->ehscorelist[$question['questionid']] > 0) {
                            $stats[$knows['knowsid']]['right'] = intval($stats[$knows['knowsid']]['right']) + 1;
                        }
                    }
                }
            }
            // 材料分析题知识点
            foreach ($p->ehquestion['questionrows'] as $questionrows) {
                foreach ($questionrows as $questionrow) {
                    foreach ($questionrow['data'] as $key => $question) {
                        foreach ($questionrow['qrknowsid'] as $knows) {
                            if (!isset($stats[$knows['knowsid']]['number'])) {
                                $stats[$knows['knowsid']]['number'] = 0;
                            }
                            if (!isset($stats[$knows['knowsid']]['right'])) {
                                $stats[$knows['knowsid']]['right'] = 0;
                            }
                            $stats[$knows['knowsid']]['knowsid'] = $knows['knowsid'];
                            $stats[$knows['knowsid']]['knows'] = $knows['knows'];
                            $stats[$knows['knowsid']]['number'] = intval($stats[$knows['knowsid']]['number']) + 1;
                            if (isset($p->ehscorelist[$question['questionid']]) && $p->ehscorelist[$question['questionid']] > 0) {
                                $stats[$knows['knowsid']]['right'] = intval($stats[$knows['knowsid']]['right']) + 1;
                            }
                        }
                    }
                }
            }
        }

        return $stats;
    }
}

// 查看待缓存的已考知识点数据
dump(Cache::knows());

// 缓存统计结果到 redis
$client = new Predis\Client('tcp://127.0.0.1:6379');
$client->set('phpems:questions', json_encode(Cache::questions()));
$client->set('phpems:knows', json_encode(Cache::knows()));
echo '已考试题和知识点缓存完成^_^';

/* 在控制器中可以直接读取缓存并在模板中使用
    $client = new Predis\Client('tcp://127.0.0.1:6379');
    $questions = $client->get('phpems:questions');
    $questions = json_decode($questions, true);
    $knows = $client->get('phpems:knows');
    $knows = json_decode($knows, true);
    // $this->tpl->assign('questions', $questions);
    dd($knows);
 */
