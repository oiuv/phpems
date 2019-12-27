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
use OSS\Result\ExistResult;

class ExistResultTest extends \PHPUnit_Framework_TestCase
{
    public function testParseValid200()
    {
        $response = new ResponseCore([], '', 200);
        $result = new ExistResult($response);
        $this->assertTrue($result->isOK());
        $this->assertSame($result->getData(), true);
    }

    public function testParseInvalid404()
    {
        $response = new ResponseCore([], '', 404);
        $result = new ExistResult($response);
        $this->assertTrue($result->isOK());
        $this->assertSame($result->getData(), false);
    }

    public function testInvalidResponse()
    {
        $response = new ResponseCore([], '', 300);

        try {
            new ExistResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
        }
    }
}
