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

namespace Model;

use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    protected $table = 'subject';
    protected $primaryKey = 'subjectid';
    public $timestamps = false;

    // 获取科目考场
    public function baiscs()
    {
        return $this->hasMany(Basic::class, 'basicsubjectid');
    }

    // 获取考试试卷
    public function exams()
    {
        return $this->hasMany(Exam::class, 'examsubject');
    }
}
