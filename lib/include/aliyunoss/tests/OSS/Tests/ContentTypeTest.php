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

class ContentTypeTest extends \PHPUnit_Framework_TestCase
{
    private function runCmd($cmd)
    {
        $output = [];
        $status = 0;
        exec($cmd.' 2>/dev/null', $output, $status);

        $this->assertSame(0, $status);
    }

    private function getContentType($bucket, $object)
    {
        $client = Common::getOssClient();
        $headers = $client->getObjectMeta($bucket, $object);

        return $headers['content-type'];
    }

    public function testByFileName()
    {
        $client = Common::getOssClient();
        $bucket = Common::getBucketName();

        $file = '/tmp/x.html';
        $object = 'test/x';
        $this->runCmd('touch '.$file);

        $client->uploadFile($bucket, $object, $file);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('text/html', $type);

        $file = '/tmp/x.json';
        $object = 'test/y';
        $this->runCmd('dd if=/dev/urandom of='.$file.' bs=1024 count=100');

        $client->multiuploadFile($bucket, $object, $file, ['partSize' => 100]);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('application/json', $type);
    }

    public function testByObjectKey()
    {
        $client = Common::getOssClient();
        $bucket = Common::getBucketName();

        $object = 'test/x.txt';
        $client->putObject($bucket, $object, 'hello world');
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('text/plain', $type);

        $file = '/tmp/x.html';
        $object = 'test/x.txt';
        $this->runCmd('touch '.$file);

        $client->uploadFile($bucket, $object, $file);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('text/html', $type);

        $file = '/tmp/x.none';
        $object = 'test/x.txt';
        $this->runCmd('touch '.$file);

        $client->uploadFile($bucket, $object, $file);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('text/plain', $type);

        $file = '/tmp/x.mp3';
        $object = 'test/y.json';
        $this->runCmd('dd if=/dev/urandom of='.$file.' bs=1024 count=100');

        $client->multiuploadFile($bucket, $object, $file, ['partSize' => 100]);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('audio/mpeg', $type);

        $file = '/tmp/x.none';
        $object = 'test/y.json';
        $this->runCmd('dd if=/dev/urandom of='.$file.' bs=1024 count=100');

        $client->multiuploadFile($bucket, $object, $file, ['partSize' => 100]);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('application/json', $type);
    }

    public function testByUser()
    {
        $client = Common::getOssClient();
        $bucket = Common::getBucketName();

        $object = 'test/x.txt';
        $client->putObject($bucket, $object, 'hello world', [
            'Content-Type' => 'text/html',
        ]);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('text/html', $type);

        $file = '/tmp/x.html';
        $object = 'test/x';
        $this->runCmd('touch '.$file);

        $client->uploadFile($bucket, $object, $file, [
            'Content-Type' => 'application/json',
        ]);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('application/json', $type);

        $file = '/tmp/x.json';
        $object = 'test/y';
        $this->runCmd('dd if=/dev/urandom of='.$file.' bs=1024 count=100');

        $client->multiuploadFile($bucket, $object, $file, [
            'partSize' => 100,
            'Content-Type' => 'audio/mpeg',
        ]);
        $type = $this->getContentType($bucket, $object);

        $this->assertSame('audio/mpeg', $type);
    }
}
