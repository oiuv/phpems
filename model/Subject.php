<?php
/**
 * Created by [oiuv](https://github.com/oiuv).
 * User: i@oiuv.cn
 * Date: 2018-07-29
 * Time: 12:36
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
