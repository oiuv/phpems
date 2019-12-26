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
use OSS\Result\ListPartsResult;

/**
 * Class ListPartsResultTest.
 */
class ListPartsResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<BBBB
<?xml version="1.0" encoding="UTF-8"?>
<ListPartsResult xmlns="http://doc.oss-cn-hangzhou.aliyuncs.com">
    <Bucket>multipart_upload</Bucket>
    <Key>multipart.data</Key>
    <UploadId>0004B999EF5A239BB9138C6227D69F95</UploadId>
    <NextPartNumberMarker>5</NextPartNumberMarker>
    <MaxParts>1000</MaxParts>
    <IsTruncated>false</IsTruncated>
    <Part>
        <PartNumber>1</PartNumber>
        <LastModified>2012-02-23T07:01:34.000Z</LastModified>
        <ETag>&quot;3349DC700140D7F86A078484278075A9&quot;</ETag>
        <Size>6291456</Size>
    </Part>
    <Part>
        <PartNumber>2</PartNumber>
        <LastModified>2012-02-23T07:01:12.000Z</LastModified>
        <ETag>&quot;3349DC700140D7F86A078484278075A9&quot;</ETag>
        <Size>6291456</Size>
    </Part>
    <Part>
        <PartNumber>5</PartNumber>
        <LastModified>2012-02-23T07:02:03.000Z</LastModified>
        <ETag>&quot;7265F4D211B56873A381D321F586E4A9&quot;</ETag>
        <Size>1024</Size>
    </Part>
</ListPartsResult>
BBBB;

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new ListPartsResult($response);
        $listPartsInfo = $result->getData();
        $this->assertSame('multipart_upload', $listPartsInfo->getBucket());
        $this->assertSame('multipart.data', $listPartsInfo->getKey());
        $this->assertSame('0004B999EF5A239BB9138C6227D69F95', $listPartsInfo->getUploadId());
        $this->assertSame(5, $listPartsInfo->getNextPartNumberMarker());
        $this->assertSame(1000, $listPartsInfo->getMaxParts());
        $this->assertSame('false', $listPartsInfo->getIsTruncated());
        $this->assertSame(3, count($listPartsInfo->getListPart()));
        $parts = $listPartsInfo->getListPart();
        $this->assertSame(1, $parts[0]->getPartNumber());
        $this->assertSame('2012-02-23T07:01:34.000Z', $parts[0]->getLastModified());
        $this->assertSame('"3349DC700140D7F86A078484278075A9"', $parts[0]->getETag());
        $this->assertSame(6291456, $parts[0]->getSize());
    }
}
