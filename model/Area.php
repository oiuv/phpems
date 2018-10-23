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

class Area extends Model
{
    protected $table = 'area';
    protected $primaryKey = 'areaid';
    public $timestamps = false;

    // 获取地区考场
    public function basics()
    {
        return $this->hasMany(Basic::class, 'basicareaid');
    }
}
