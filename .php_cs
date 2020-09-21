<?php
$header = <<<EOF
This file is part of the phpems/phpems.

(c) oiuv <i@oiuv.cn>

项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)

This source file is subject to the MIT license that is bundled.
EOF;

$finder = PhpCsFixer\Finder::create()
    ->exclude(['vendor', 'data', 'files'])
    ->in(__DIR__)
;

$config = PhpCsFixer\Config::create()
    ->setRiskyAllowed(true)
    ->setRules([
        '@PSR2' => true,
        'header_comment' => ['header' => $header],
        'binary_operator_spaces' => ['operators' => ['=>' => 'align']],
        // 'no_useless_else' => true,
        // 'no_useless_return' => true,
    ])
    ->setFinder($finder)
;

return $config;
