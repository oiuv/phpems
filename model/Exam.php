<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * This source file is subject to the MIT license that is bundled.
 */

namespace Model;

use Illuminate\Database\Eloquent\Model;

class Exam extends Model
{
    protected $primaryKey = 'examid';
    public $timestamps = false;

    // 获取试卷考试记录
    public function examHistories()
    {
        return $this->hasMany(ExamHistory::class, 'ehexamid');
    }

    // 获取考试科目
    public function subject()
    {
        return $this->belongsTo(Subject::class, 'examsubject');
    }
}
