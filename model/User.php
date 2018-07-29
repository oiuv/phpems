<?php
/**
 * Created by PhpStorm.
 * User: xuefeng
 * Date: 2018/3/14
 * Time: 23:42
 */
namespace Model;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'user';
    protected $primaryKey = 'userid';
    public $timestamps = false;

    // 获取考试记录
    public function examHistories()
    {
        return $this->hasMany(ExamHistory::class, 'ehuserid');
    }
}
