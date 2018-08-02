<?php
/**
 * Created by [oiuv](https://github.com/oiuv).
 * User: i@oiuv.cn
 * Date: 2018-08-02
 * Time: 11:09
 */

namespace Model;

use Illuminate\Database\Eloquent\Model;

class Questype extends Model
{
    protected $table = 'questype';
    protected $primaryKey = 'questid';
    public $timestamps = false;
}