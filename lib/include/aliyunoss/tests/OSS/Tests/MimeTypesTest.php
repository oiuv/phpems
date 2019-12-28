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

use OSS\Core\MimeTypes;

class MimeTypesTest extends \PHPUnit_Framework_TestCase
{
    public function testGetMimeType()
    {
        $this->assertSame('application/xml', MimeTypes::getMimetype('file.xml'));
    }
}
