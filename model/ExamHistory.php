<?php
/**
 * Created by [oiuv](https://github.com/oiuv).
 * User: i@oiuv.cn
 * Date: 2018-07-29
 * Time: 12:53
 */

namespace Model;

use Illuminate\Database\Eloquent\Model;

class ExamHistory extends Model
{
    protected $table = 'examhistory';
    protected $primaryKey = 'ehid';
    public $timestamps = false;

    // 考试试卷
    public function exam()
    {
        return $this->belongsTo(Exam::class, 'ehexamid');
    }

    // 考试考场
    public function basic()
    {
        return $this->belongsTo(Basic::class, 'ehbasicid');
    }

    // 考试用户
    public function user()
    {
        return $this->belongsTo(User::class, 'ehuserid');
    }
}
