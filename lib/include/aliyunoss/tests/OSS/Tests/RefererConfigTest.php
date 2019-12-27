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

namespace OSS\Tests;

use OSS\Model\RefererConfig;

class RefererConfigTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<RefererConfiguration>
<AllowEmptyReferer>true</AllowEmptyReferer>
<RefererList>
<Referer>http://www.aliyun.com</Referer>
<Referer>https://www.aliyun.com</Referer>
<Referer>http://www.*.com</Referer>
<Referer>https://www.?.aliyuncs.com</Referer>
</RefererList>
</RefererConfiguration>
BBBB;

    private $validXml2 = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<RefererConfiguration>
<AllowEmptyReferer>true</AllowEmptyReferer>
<RefererList>
<Referer>http://www.aliyun.com</Referer>
</RefererList>
</RefererConfiguration>
BBBB;

    public function testParseValidXml()
    {
        $refererConfig = new RefererConfig();
        $refererConfig->parseFromXml($this->validXml);
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml($refererConfig->serializeToXml()));
    }

    public function testParseValidXml2()
    {
        $refererConfig = new RefererConfig();
        $refererConfig->parseFromXml($this->validXml2);
        $this->assertTrue($refererConfig->isAllowEmptyReferer());
        $this->assertSame(1, count($refererConfig->getRefererList()));
        $this->assertSame($this->cleanXml($this->validXml2), $this->cleanXml(strval($refererConfig)));
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }
}
