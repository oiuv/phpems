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

require_once __DIR__.'/Common.php';

class ObjectAclTest extends \PHPUnit_Framework_TestCase
{
    public function testGetSet()
    {
        $client = Common::getOssClient();
        $bucket = Common::getBucketName();

        $object = 'test/object-acl';
        $client->deleteObject($bucket, $object);
        $client->putObject($bucket, $object, 'hello world');

        $acl = $client->getObjectAcl($bucket, $object);
        $this->assertSame('default', $acl);

        $client->putObjectAcl($bucket, $object, 'public-read');
        $acl = $client->getObjectAcl($bucket, $object);
        $this->assertSame('public-read', $acl);

        $content = $client->getObject($bucket, $object);
        $this->assertSame('hello world', $content);
    }
}
