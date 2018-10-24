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

    // 获取开通考场的用户
    public function users()
    {
        return $this->belongsToMany(User::class, 'openbasics', 'obbasicid', 'obuserid')->withPivot('obtime', 'obendtime');
    }
}
