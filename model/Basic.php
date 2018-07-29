<?php
/**
 * Created by oiuv.
 * User: i@oiuv.cn
 * Date: 2018-07-29
 * Time: 11:56
 */

namespace Model;

use Illuminate\Database\Eloquent\Model;

class Basic extends Model
{
    protected $table = 'basic';
    protected $primaryKey = 'basicid';
    public $timestamps = false;

    // 获取考场地区
    public function area()
    {
        return $this->belongsTo(Area::class, 'basicareaid');
    }

    // 获取考试科目
    public function subject()
    {
        return $this->belongsTo(Subject::class, 'basicsubjectid');
    }

    // 获取考试记录
    public function examHistories()
    {
        return $this->hasMany(ExamHistory::class, 'ehbasicid');
    }
}
