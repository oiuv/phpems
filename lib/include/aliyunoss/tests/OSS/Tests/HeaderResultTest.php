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
use OSS\Result\HeaderResult;

/**
 * Class HeaderResultTest.
 */
class HeaderResultTest extends \PHPUnit_Framework_TestCase
{
    public function testGetHeader()
    {
        $response = new ResponseCore(['key' => 'value'], '', 200);
        $result = new HeaderResult($response);
        $this->assertTrue($result->isOK());
        $this->assertTrue(is_array($result->getData()));
        $data = $result->getData();
        $this->assertSame($data['key'], 'value');
    }
}
