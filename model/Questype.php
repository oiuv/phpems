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

class Questype extends Model
{
    protected $table = 'questype';
    protected $primaryKey = 'questid';
    public $timestamps = false;
}
