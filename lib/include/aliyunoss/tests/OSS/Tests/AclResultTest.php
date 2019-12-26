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

use OSS\Core\OssException;
use OSS\Http\ResponseCore;
use OSS\Result\AclResult;

class AclResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<BBBB
<?xml version="1.0" ?>
<AccessControlPolicy>
    <Owner>
        <ID>00220120222</ID>
        <DisplayName>user_example</DisplayName>
    </Owner>
    <AccessControlList>
        <Grant>public-read</Grant>
    </AccessControlList>
</AccessControlPolicy>
BBBB;

    private $invalidXml = <<<BBBB
<?xml version="1.0" ?>
<AccessControlPolicy>
</AccessControlPolicy>
BBBB;

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new AclResult($response);
        $this->assertSame('public-read', $result->getData());
    }

    public function testParseNullXml()
    {
        $response = new ResponseCore([], '', 200);
        try {
            new AclResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('body is null', $e->getMessage());
        }
    }

    public function testParseInvalidXml()
    {
        $response = new ResponseCore([], $this->invalidXml, 200);
        try {
            new AclResult($response);
            $this->assertFalse(true);
        } catch (OssException $e) {
            $this->assertSame('xml format exception', $e->getMessage());
        }
    }
}
