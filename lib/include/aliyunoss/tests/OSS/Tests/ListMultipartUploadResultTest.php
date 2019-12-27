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
use OSS\Result\ListMultipartUploadResult;

/**
 * Class ListMultipartUploadResultTest.
 */
class ListMultipartUploadResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<'BBBB'
<?xml version="1.0" encoding="UTF-8"?>
<ListMultipartUploadsResult xmlns="http://doc.oss-cn-hangzhou.aliyuncs.com">
    <Bucket>oss-example</Bucket>
    <KeyMarker>xx</KeyMarker>
    <UploadIdMarker>3</UploadIdMarker>
    <NextKeyMarker>oss.avi</NextKeyMarker>
    <NextUploadIdMarker>0004B99B8E707874FC2D692FA5D77D3F</NextUploadIdMarker>
    <Delimiter>x</Delimiter>
    <Prefix>xx</Prefix>
    <MaxUploads>1000</MaxUploads>
    <IsTruncated>false</IsTruncated>
    <Upload>
        <Key>multipart.data</Key>
        <UploadId>0004B999EF518A1FE585B0C9360DC4C8</UploadId>
        <Initiated>2012-02-23T04:18:23.000Z</Initiated>
    </Upload>
    <Upload>
        <Key>multipart.data</Key>
        <UploadId>0004B999EF5A239BB9138C6227D69F95</UploadId>
        <Initiated>2012-02-23T04:18:23.000Z</Initiated>
    </Upload>
    <Upload>
        <Key>oss.avi</Key>
        <UploadId>0004B99B8E707874FC2D692FA5D77D3F</UploadId>
        <Initiated>2012-02-23T06:14:27.000Z</Initiated>
    </Upload>
</ListMultipartUploadsResult>
BBBB;

    private $validXmlWithEncodedKey = <<<'BBBB'
<?xml version="1.0" encoding="UTF-8"?>
<ListMultipartUploadsResult xmlns="http://doc.oss-cn-hangzhou.aliyuncs.com">
    <Bucket>oss-example</Bucket>
    <EncodingType>url</EncodingType>
    <KeyMarker>php%2Bkey-marker</KeyMarker>
    <UploadIdMarker>3</UploadIdMarker>
    <NextKeyMarker>php%2Bnext-key-marker</NextKeyMarker>
    <NextUploadIdMarker>0004B99B8E707874FC2D692FA5D77D3F</NextUploadIdMarker>
    <Delimiter>%2F</Delimiter>
    <Prefix>php%2Bprefix</Prefix>
    <MaxUploads>1000</MaxUploads>
    <IsTruncated>true</IsTruncated>
    <Upload>
        <Key>php%2Bkey-1</Key>
        <UploadId>0004B999EF518A1FE585B0C9360DC4C8</UploadId>
        <Initiated>2012-02-23T04:18:23.000Z</Initiated>
    </Upload>
    <Upload>
        <Key>php%2Bkey-2</Key>
        <UploadId>0004B999EF5A239BB9138C6227D69F95</UploadId>
        <Initiated>2012-02-23T04:18:23.000Z</Initiated>
    </Upload>
    <Upload>
        <Key>php%2Bkey-3</Key>
        <UploadId>0004B99B8E707874FC2D692FA5D77D3F</UploadId>
        <Initiated>2012-02-23T06:14:27.000Z</Initiated>
    </Upload>
</ListMultipartUploadsResult>
BBBB;

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new ListMultipartUploadResult($response);
        $listMultipartUploadInfo = $result->getData();
        $this->assertSame('oss-example', $listMultipartUploadInfo->getBucket());
        $this->assertSame('xx', $listMultipartUploadInfo->getKeyMarker());
        $this->assertSame(3, $listMultipartUploadInfo->getUploadIdMarker());
        $this->assertSame('oss.avi', $listMultipartUploadInfo->getNextKeyMarker());
        $this->assertSame('0004B99B8E707874FC2D692FA5D77D3F', $listMultipartUploadInfo->getNextUploadIdMarker());
        $this->assertSame('x', $listMultipartUploadInfo->getDelimiter());
        $this->assertSame('xx', $listMultipartUploadInfo->getPrefix());
        $this->assertSame(1000, $listMultipartUploadInfo->getMaxUploads());
        $this->assertSame('false', $listMultipartUploadInfo->getIsTruncated());
        $uploads = $listMultipartUploadInfo->getUploads();
        $this->assertSame('multipart.data', $uploads[0]->getKey());
        $this->assertSame('0004B999EF518A1FE585B0C9360DC4C8', $uploads[0]->getUploadId());
        $this->assertSame('2012-02-23T04:18:23.000Z', $uploads[0]->getInitiated());
    }

    public function testParseValidXmlWithEncodedKey()
    {
        $response = new ResponseCore([], $this->validXmlWithEncodedKey, 200);
        $result = new ListMultipartUploadResult($response);
        $listMultipartUploadInfo = $result->getData();
        $this->assertSame('oss-example', $listMultipartUploadInfo->getBucket());
        $this->assertSame('php+key-marker', $listMultipartUploadInfo->getKeyMarker());
        $this->assertSame('php+next-key-marker', $listMultipartUploadInfo->getNextKeyMarker());
        $this->assertSame(3, $listMultipartUploadInfo->getUploadIdMarker());
        $this->assertSame('0004B99B8E707874FC2D692FA5D77D3F', $listMultipartUploadInfo->getNextUploadIdMarker());
        $this->assertSame('/', $listMultipartUploadInfo->getDelimiter());
        $this->assertSame('php+prefix', $listMultipartUploadInfo->getPrefix());
        $this->assertSame(1000, $listMultipartUploadInfo->getMaxUploads());
        $this->assertSame('true', $listMultipartUploadInfo->getIsTruncated());
        $uploads = $listMultipartUploadInfo->getUploads();
        $this->assertSame('php+key-1', $uploads[0]->getKey());
        $this->assertSame('0004B999EF518A1FE585B0C9360DC4C8', $uploads[0]->getUploadId());
        $this->assertSame('2012-02-23T04:18:23.000Z', $uploads[0]->getInitiated());
    }
}
