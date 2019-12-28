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

use OSS\Model\BucketInfo;

/**
 * Class BucketInfoTest.
 */
class BucketInfoTest extends \PHPUnit_Framework_TestCase
{
    public function testConstruct()
    {
        $bucketInfo = new BucketInfo('cn-beijing', 'name', 'today');
        $this->assertNotNull($bucketInfo);
        $this->assertSame('cn-beijing', $bucketInfo->getLocation());
        $this->assertSame('name', $bucketInfo->getName());
        $this->assertSame('today', $bucketInfo->getCreateDate());
    }
}
