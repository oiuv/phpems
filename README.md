# [phpems v5.0](https://phpems.is.js.cn)

开源免费的PHP无纸化模拟考试系统，基于 [PHPEMS](http://www.phpems.net) 修改。
重点修复BUG(包括所有非 E_NOTICE 级别错误提示)，并根据个人需要优化新增一些功能。

> 源码默认开启错误提示，生产环境请修改 `init.cls.php` 文件 `error_reporting` 关闭提示，并务必删除 `examples` 目录

因使用部分第三方扩展包，系统要求`php>=7.0`，具体集成扩展包如下：

| 扩展包 | 说明 |
| --- | --- |
| [illuminate/database](https://packagist.org/packages/illuminate/database) | Eloquent ORM，以[Model](https://laravel-china.org/docs/laravel/5.6/eloquent/1403)的方式操作数据库 |
| [overtrue/easy-sms](https://packagist.org/packages/overtrue/easy-sms) | 一款满足你的多种发送需求的短信发送组件 |
| [overtrue/wechat](https://packagist.org/packages/overtrue/wechat) | 开源的微信非官方 SDK，方便在考试系统开发微信服务号相关功能 |
| [predis/predis](https://packagist.org/packages/predis/predis) | 缓存驱动 Redis 基础扩展包，使系统支持Redis缓存 |

## 优化&新增功能

- 新增使用composer，可直接安装第三方扩展包
- 为所有数据表定义 [Model](https://laravel-china.org/docs/laravel/5.6/eloquent/1403) ，数据库操作更灵活方便
- 可在线[数据库迁移](https://laravel-china.org/docs/laravel/5.6/migrations/1400)，请参考 `examples` 目录下 `Database.php`
- 新增部分字符串和数组[辅助函数](https://laravel-china.org/docs/laravel/5.6/helpers/1391)，如：dd()
- 新增 Redis 缓存支持，请参考 `examples` 目录中的 `Cache.php`

使用 ORM 操作数据库示例：
````php
// 获取userid为1的用户
$user = \Model\User::find(1);

// 获取用户名
echo $user->username;

// 调试输出用户所有信息
dd($user->getAttributes());

// 获取用户的考试记录
$eh = $user->examHistories;
foreach ($eh as $result){
    print_r($result->getAttributes());
}

// 获取用户开通的考场
$ob = $use->basics;
foreach($ob as $basic)
{
    // 考场信息
    print_r($basic->getAttributes());
    // 开通时间等信息
    print_r($basic->pivot->getAttributes());
}

// 获取basicid为1的考场
$basic = \Model\Basic::find(1);

// 获取考场考试科目信息
print_r($basic->subject->getAttributes());

// 获取考场的考试记录
$eh = $basic->examHistories;
foreach ($eh as $result){
    print_r($result->getAttributes());
}

// 获取开通考场的用户
$ou = $basic->users;
foreach($ou as $user)
{
    // 用户信息
    print_r($user->getAttributes());
    // 开通时间等信息
    print_r($user->pivot->getAttributes());
}

// 更多方法参考 model 目录
````

使用 Redis 缓存数据库示例：
```php
$client = new Predis\Client('tcp://127.0.0.1:6379');
$client->set('phpems:questions', json_encode(Cache::questions()));
$client->set('phpems:knows', json_encode(Cache::knows()));
```

## 安装

    git clone git@github.com:oiuv/phpems.git
    cd phpems
    composer install
    
安装完成后，重命名 lib 目录下 `config.inc.example.php` 为 `config.inc.php` 并修改配置，然后导入数据库 `phpems5.sql` 即可。

## 使用

演示：https://phpems.is.js.cn/

### 考试设置
1. 考试模块：考试设计—>科目管理（ID影响教师阅卷）—>章节—>知识点(ID影响试卷生成)
2. 考试模块：试题管理—>普通试题管理—>添加试题—>CSV导入(对应知识点ID)
3. 考试模块：试卷管理—>随机组卷—>试卷管理—>随机组卷
4. 考试模块：考试设计—>考场列表—>添加考场(至此步骤考试设置完毕)
5. 教师管理：
    1. 教师管理—>用户模块—>模型管理—>教师模型（字段管理）—>Teacher_subjects(修改字段）—>可选值列表（科目名称=ID）—>提交；
    2. 用户管理—>用户名—>修改（可管理科目打钩）；
    3. 登录—>成绩管理

## 关于系统的二次开发说明：

### PHPEMS 路由说明

    index.php?user-phone-login-index
    
> 访问 `app` 目录下 user/controller/login.phone.php 文件的index方法

### PHPEMS smarty模板标签

#### 变量
    
    {x2;$var}

> 该标签会被翻译为<?php echo 变量; ?>该变量必须为在php程序中被$this->tpl->assign过后的变量。

    {x2;v:var}

> 该标签会被翻译为<?php echo $var; ?>该变量是在php模板中产生的临时变量，不需要assign

    {x2;c:const}

> 该标签用于显示常量，注意，在以后的if,tree,loop等标签中，常量不需要c:，只在显示常量的本标签中需要c:

#### 循环遍历：tree

tree标签是一个组合标签，用于遍历一个数组。规则如下
````

{x2;tree:遍历变量，临时指针变量，循环次数变量}

{x2;endtree}

````

#### 逻辑判断：if

if标签格式：
````
{x2;if:判断语句}

......

{x2;elseif:判断语句}

......

{x2;else}

......

{x2;endif}

````

#### 字符处理

    date

> 将unix时间戳转换为具体时间，用法{x2;date:变量,'Y-m-d H:i:s'}

    substring

> 字符串截取，用法{x2;substring:变量,长度数字}

    realhtml

> 取消转义并显示带html的内容，{x2;realhtml:变量}

### 数据表说明

| 数据表 | 说明 |
| --- | --- |
| basic | 考场表 |
| examhistory | 考试记录表 |
| exams | 试卷表 |
| examsession | 会话表 |
| favor | 收藏表 |
| knows | 知识点表 |
| sections | 章节表 |
| subject | 科目表 |
| openbasics | 开通的考场记录表 |
| quest2knows | 知识点与试题关系表 |
| questionrows | 题冒题表 |
| questions | 试题表 |
| questype | 题型表 |
| session | 用户会话表 |
| user | 用户表 |
| user_group | 用户组表 |
| module | 模型表 |
| module_fields | 模型字段表 |
