# phpems v5.0
开源免费的PHP无纸化模拟考试系统

基于 [PHPEMS](http://www.phpems.net) 修改并修复BUG(包括所有非 E_NOTICE 级别错误提示)

因原版系统老旧，计划在原系统基础上优化功能：

## 修改新增功能

- 新增使用composer，可直接安装第三方扩展包
- 默认集成 [illuminate/database](https://packagist.org/packages/illuminate/database)，为所有数据表定义 [Model](https://laravel-china.org/docs/laravel/5.6/eloquent/1403) 数据库操作更灵活方便。
- 数据库可在线迁移，具体操作请参考根目录下 `Database.php`
- 新增部分 laravel 字符串和数组辅助函数


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

#### 循环遍历

    tree

tree标签是一个组合标签，用于遍历一个数组。规则如下
````

{x2;tree:遍历变量，临时指针变量，循环次数变量}

{x2;endtree}

````

#### 逻辑判断

    if

if标签格式：
````
{x2;if:判断语句}

......

{x2;elseif}

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
