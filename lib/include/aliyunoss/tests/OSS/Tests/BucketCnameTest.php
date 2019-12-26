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

class BucketCnameTest extends \PHPUnit_Framework_TestCase
{
    private $bucketName;
    private $client;

    public function setUp()
    {
        $this->client = Common::getOssClient();
        $this->bucketName = 'php-sdk-test-bucket-'.strval(rand(0, 10000));
        $this->client->createBucket($this->bucketName);
    }

    public function tearDown()
    {
        $this->client->deleteBucket($this->bucketName);
    }

    public function testBucketWithoutCname()
    {
        $cnameConfig = $this->client->getBucketCname($this->bucketName);
        $this->assertSame(0, count($cnameConfig->getCnames()));
    }

    public function testAddCname()
    {
        $this->client->addBucketCname($this->bucketName, 'www.baidu.com');
        $this->client->addBucketCname($this->bucketName, 'www.qq.com');

        $ret = $this->client->getBucketCname($this->bucketName);
        $this->assertSame(2, count($ret->getCnames()));

        // add another 2 cnames
        $this->client->addBucketCname($this->bucketName, 'www.sina.com.cn');
        $this->client->addBucketCname($this->bucketName, 'www.iqiyi.com');

        $ret = $this->client->getBucketCname($this->bucketName);
        $cnames = $ret->getCnames();
        $cnameList = [];

        foreach ($cnames as $c) {
            $cnameList[] = $c['Domain'];
        }
        $should = [
            'www.baidu.com',
            'www.qq.com',
            'www.sina.com.cn',
            'www.iqiyi.com',
        ];
        $this->assertSame(4, count($cnames));
        $this->assertSame(sort($should), sort($cnameList));
    }

    public function testDeleteCname()
    {
        $this->client->addBucketCname($this->bucketName, 'www.baidu.com');
        $this->client->addBucketCname($this->bucketName, 'www.qq.com');

        $ret = $this->client->getBucketCname($this->bucketName);
        $this->assertSame(2, count($ret->getCnames()));

        // delete one cname
        $this->client->deleteBucketCname($this->bucketName, 'www.baidu.com');

        $ret = $this->client->getBucketCname($this->bucketName);
        $this->assertSame(1, count($ret->getCnames()));
        $cnames = $ret->getCnames();
        $this->assertSame('www.qq.com', $cnames[0]['Domain']);
    }
}
