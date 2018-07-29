<?php
/**
 * Created by oiuv.
 * User: i@oiuv.cn
 * Date: 2018-07-29
 * Time: 12:06
 */

namespace Model;

use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    protected $table = 'area';
    protected $primaryKey = 'areaid';
    public $timestamps = false;

    // 获取地区考场
    public function basics(){
        return $this->hasMany(Basic::class, 'basicareaid');
    }
}
