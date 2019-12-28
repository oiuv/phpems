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

use OSS\Http\ResponseCore;
use OSS\Result\BodyResult;

class BodyResultTest extends \PHPUnit_Framework_TestCase
{
    public function testParseValid200()
    {
        $response = new ResponseCore([], 'hi', 200);
        $result = new BodyResult($response);
        $this->assertTrue($result->isOK());
        $this->assertSame($result->getData(), 'hi');
    }

    public function testParseInvalid404()
    {
        $response = new ResponseCore([], null, 200);
        $result = new BodyResult($response);
        $this->assertTrue($result->isOK());
        $this->assertSame($result->getData(), '');
    }
}
