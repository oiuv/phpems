<?php
/**
 * Created by [oiuv](https://github.com/oiuv).
 * User: i@oiuv.cn
 * Date: 2018-07-29
 * Time: 13:35
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
