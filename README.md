# [phpems v6.1](https://phpems.is.js.cn)

开源免费的PHP无纸化模拟考试系统，基于 [PHPEMS](http://www.phpems.net/) v6.1 优化。本版本重点修复BUG(包括所有非 E_NOTICE 级别错误提示)，并根据需要优化新增一些功能。

因使用部分第三方扩展包，系统要求`php>=7.0`，默认集成扩展包如下：

| 扩展包 | 说明 |
| --- | --- |
| [illuminate/database](https://packagist.org/packages/illuminate/database) | Eloquent ORM，以[Model](https://learnku.com/docs/laravel/5.8/eloquent/3931)的方式操作数据库 |
| [symfony/var-dumper](https://packagist.org/packages/symfony/var-dumper) | 支持 dd()、dump() 等方法调试代码 |
| [predis/predis](https://packagist.org/packages/predis/predis) | 缓存驱动 Redis 基础扩展包，使系统支持Redis缓存 |
| [overtrue/wechat](https://packagist.org/packages/overtrue/wechat) | 开源的微信非官方 SDK，方便在考试系统开发微信服务号相关功能 |
| [overtrue/easy-sms](https://packagist.org/packages/overtrue/easy-sms) | 一款满足你的多种发送需求的短信发送组件 |
| [aliyuncs/oss-sdk-php](https://packagist.org/packages/aliyuncs/oss-sdk-php) | Aliyun OSS SDK for PHP |

## 优化&新增功能

- 新增使用composer，可直接安装第三方扩展包
- 为所有数据表定义 [Model](https://learnku.com/docs/laravel/5.8/eloquent/3931) ，数据库操作更灵活方便
- 可在线[数据库迁移](https://learnku.com/docs/laravel/5.8/migrations/3928)，请参考 `tasks` 目录下 `Database.php`
- 新增部分字符串和数组[辅助函数](https://learnku.com/docs/laravel/5.8/helpers/3919)，如：dd()
- 新增 Redis 缓存支持，请参考 `tasks` 目录中的 `Cache.php`

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

## 安装和配置

### 安装

#### 方式1：使用 composer 创建项目

通过 [composer](https://getcomposer.org/) 指令直接创建项目

    composer create-project --prefer-dist phpems/phpems phpems

如果要安装 v5.0 版本，请使用以下指令：

    composer create-project --prefer-dist phpems/phpems phpems "5.*"

提示：推荐使用[阿里云 Composer 全量镜像](https://developer.aliyun.com/composer)

#### 方式2：使用 git 创建项目

使用 git 复制项目后使用 composer 安装依赖

    git clone https://github.com/phpems/phpems.git
    cd phpems && composer install
    cd lib && cp config.inc.example.php config.inc.php

### 配置

安装完成后，根据需要修改 lib 目录下的 `config.inc.php` 文件，配置数据库，然后使用 `tasks` 目录下的数据库文件 `phpems.sql` 创建数据库，项目上线后务必删除 `tasks` 目录。

如果是 phpems v5.0 版本升级到 v6.0，请使用 `tasks` 目录下的 `v5v6.sql` 升级数据库。

如果是 linux 系统，需要保证 `data` 目录具有可写权限，否则网站无法正常访问。

默认管理员账号：peadmin，密码：peadmin

> 源码默认关闭错误提示，如需调试请修改 `config.inc.php` 中 `DEBUG` 为 `true`。

## 使用(演示)

 * v6.0：https://phpems.is.js.cn/
 * v5.0：https://phpems5.is.js.cn/

### 考试设置

1. 考试模块：考试设计—>科目管理（ID影响教师阅卷）—>章节—>知识点(ID影响试卷生成)
2. 考试模块：试题管理—>普通试题管理—>添加试题—>CSV导入(对应知识点ID)
3. 考试模块：试卷管理—>随机组卷—>试卷管理—>随机组卷
4. 考试模块：考试设计—>考场列表—>添加考场(至此步骤考试设置完毕)
5. 教师管理：
    1. 教师管理—>用户模块—>模型管理—>教师模型（字段管理）—>Teacher_subjects(修改字段）—>可选值列表（科目名称=ID）—>提交；
    2. 用户管理—>用户名—>修改（可管理科目打钩）；
    3. 登录—>成绩管理

### 开启微信自动登录

`config.inc.php`中 `USEWX` 值改为 `true`，并配置好微信服务号的 appid 和 appsecret 即可。

> 第一次从服务号或小程序登录系统会自动绑定微信和考试账号，以后从服务号或小程序进入直接自动登录。

## 关于系统二次开发的说明：

### PHPEMS 文件夹结构

 * `api` 支付相关API接口目录
 * `app` 项目的核心代码目录，应用的所有模块的类（cls）、控制器（controller）和视图模板（tpls）都在这里，其中 `app` 对应PC端、 `phone` 对应移动端、 `master` 对应管理后台、 `teach` 对应教师后台。主要模块如下：
   * `bank` 财务模块
   * `certificate` 证书模块
   * `content` 内容模块
   * `core` 全局核心模块，包括网站首页
   * `course` 课程模块
   * `docs` 文档（词条）模块
   * `document` 文件（附件）模块
   * `exma` 考试模块
   * `seminar` 专题模块
   * `user` 用户模块
   * `weixin` 微信登录模块
 * `data` 缓存和日志目录，需要可写权限
 * `files` 上传的附件和公共静态文件目录，需要可写权限
 * `lib` 系统公共类和方法目录，包括配置文件
 * `model` 数据模型目录，使用 ORM 操作数据库更为便捷
 * `tasks` 示例数据库和示例文件目录，项目上线后最好删除
 * `vendor` 项目依赖的 composer 包

### PHPEMS 路由说明

项目路由入口文件为根目录下的 `index.php`，如：

    index.php?user-phone-login-index

> 以上路由访问的是 `app` 目录下 `user/controller/login.phone.php` 文件的 `index` 方法

### PHPEMS 模板说明

视图模板在 `app` 文件夹下模块中的 `tpl` 文件夹中，编译文件在 `/data/compile/`目录。

    /data/compile/seminar/tpls/app/%%cpl%%index.php

> 以上编译文件对应的是 `app` 目录下 `seminar/tpls/app/index.tpl` 文件。

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

#### 不使用model生成CURD sql
```php
// 查询
// $sql = 'SELECT '.$db_fields.' FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;
$args = [
            $db_fields, // 多列使用数组
            $db_tables, // 多表使用数组
            $db_query, // [['AND','usergroupid = 1'],['AND','userid >= :userid','userid',$userid]]
            $db_groups, // 可选
            $db_orders, // 可选
            $db_limits, // 可选
        ];
$sql = $this->pdosql->makeSelect($args);
return $this->db->fetch($sql);

// 新增
// $sql = 'INSERT INTO '.$db_tables.' ('.implode(',', $db_field).') VALUES ('.implode(',', $db_value).')';
args = [
            'username' => $username,
            'userpassword' => md5($userpassword),
            'useremail' => $email
        ];
$data = ['user', $args];
$sql = $this->pdosql->makeInsert($data);
$this->db->exec($sql);
return $this->db->lastInsertId();

// 更新
// $sql = 'UPDATE '.$db_tables.' SET '.$parsql.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;
args = ['useremail' => $email];
$data = ['user', $args, [['AND', 'userid = :userid', 'userid', $userid]]];
$sql = $this->pdosql->makeUpdate($data);
return $this->db->exec($sql);

// 删除
// $sql = 'DELETE FROM '.$db_tables.' WHERE '.$db_query.$db_groups.$db_orders.' LIMIT '.$db_limits;
$data = ['user', [['AND', 'userid = :userid', 'userid', $userid]]];
$sql = $this->pdosql->makeDelete($data);
return $this->db->exec($sql);
```
## 版权说明

PHPEMS属于开源免费程序，开发者为[火眼](http://www.phpems.net/)，您可以自由修改其中属于PHPEMS原创部分的代码，原则上您只要不通过出售PHPEMS相关源代码盈利，即可免费使用本软件。

> 本系统基于火眼的 PHPEMS6.0(20190924) 修改，如果在安装和使用中发现问题，欢迎反馈或联系我（QQ：7300637），但如果需要付费定制，请直接联系版权所有者火眼（QQ：278768688）。

### 使用交流QQ群

 * 群1：2736999
 * 群2：274154600
 * 群3：391191029
 * 群4：438228249
 * 群5：264590257
 * 群6：466859119
 * 群7：2554408
 * 群8：479709205
 * 群9：474900152
 * 群10：498555033
