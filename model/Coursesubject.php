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

class Coursesubject extends Model
{
    protected $table = 'coursesubject';
    protected $primaryKey = 'csid';
    public $timestamps = false;

    // 获取课程分类
    public function category()
    {
        return $this->belongsTo(category::class, 'cscatid');
    }
}
