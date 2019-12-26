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
use OSS\Result\ListObjectsResult;

class ListObjectsResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml1 = <<<BBBB
<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult>
  <Name>testbucket-hf</Name>
  <Prefix></Prefix>
  <Marker></Marker>
  <MaxKeys>1000</MaxKeys>
  <Delimiter>/</Delimiter>
  <IsTruncated>false</IsTruncated>
  <CommonPrefixes>
    <Prefix>oss-php-sdk-test/</Prefix>
  </CommonPrefixes>
  <CommonPrefixes>
    <Prefix>test/</Prefix>
  </CommonPrefixes>
</ListBucketResult>
BBBB;

    private $validXml2 = <<<BBBB
<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult>
  <Name>testbucket-hf</Name>
  <Prefix>oss-php-sdk-test/</Prefix>
  <Marker>xx</Marker>
  <MaxKeys>1000</MaxKeys>
  <Delimiter>/</Delimiter>
  <IsTruncated>false</IsTruncated>
  <Contents>
    <Key>oss-php-sdk-test/upload-test-object-name.txt</Key>
    <LastModified>2015-11-18T03:36:00.000Z</LastModified>
    <ETag>"89B9E567E7EB8815F2F7D41851F9A2CD"</ETag>
    <Type>Normal</Type>
    <Size>13115</Size>
    <StorageClass>Standard</StorageClass>
    <Owner>
      <ID>cname_user</ID>
      <DisplayName>cname_user</DisplayName>
    </Owner>
  </Contents>
</ListBucketResult>
BBBB;

    private $validXmlWithEncodedKey = <<<BBBB
<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult>
  <Name>testbucket-hf</Name>
  <EncodingType>url</EncodingType>
  <Prefix>php%2Fprefix</Prefix>
  <Marker>php%2Fmarker</Marker>
  <NextMarker>php%2Fnext-marker</NextMarker>
  <MaxKeys>1000</MaxKeys>
  <Delimiter>%2F</Delimiter>
  <IsTruncated>true</IsTruncated>
  <Contents>
    <Key>php/a%2Bb</Key>
    <LastModified>2015-11-18T03:36:00.000Z</LastModified>
    <ETag>"89B9E567E7EB8815F2F7D41851F9A2CD"</ETag>
    <Type>Normal</Type>
    <Size>13115</Size>
    <StorageClass>Standard</StorageClass>
    <Owner>
      <ID>cname_user</ID>
      <DisplayName>cname_user</DisplayName>
    </Owner>
  </Contents>
</ListBucketResult>
BBBB;

    public function testParseValidXml1()
    {
        $response = new ResponseCore([], $this->validXml1, 200);
        $result = new ListObjectsResult($response);
        $this->assertTrue($result->isOK());
        $this->assertNotNull($result->getData());
        $this->assertNotNull($result->getRawResponse());
        $objectListInfo = $result->getData();
        $this->assertSame(2, count($objectListInfo->getPrefixList()));
        $this->assertSame(0, count($objectListInfo->getObjectList()));
        $this->assertSame('testbucket-hf', $objectListInfo->getBucketName());
        $this->assertSame('', $objectListInfo->getPrefix());
        $this->assertSame('', $objectListInfo->getMarker());
        $this->assertSame(1000, $objectListInfo->getMaxKeys());
        $this->assertSame('/', $objectListInfo->getDelimiter());
        $this->assertSame('false', $objectListInfo->getIsTruncated());
        $prefixes = $objectListInfo->getPrefixList();
        $this->assertSame('oss-php-sdk-test/', $prefixes[0]->getPrefix());
        $this->assertSame('test/', $prefixes[1]->getPrefix());
    }

    public function testParseValidXml2()
    {
        $response = new ResponseCore([], $this->validXml2, 200);
        $result = new ListObjectsResult($response);
        $this->assertTrue($result->isOK());
        $this->assertNotNull($result->getData());
        $this->assertNotNull($result->getRawResponse());
        $objectListInfo = $result->getData();
        $this->assertSame(0, count($objectListInfo->getPrefixList()));
        $this->assertSame(1, count($objectListInfo->getObjectList()));
        $this->assertSame('testbucket-hf', $objectListInfo->getBucketName());
        $this->assertSame('oss-php-sdk-test/', $objectListInfo->getPrefix());
        $this->assertSame('xx', $objectListInfo->getMarker());
        $this->assertSame(1000, $objectListInfo->getMaxKeys());
        $this->assertSame('/', $objectListInfo->getDelimiter());
        $this->assertSame('false', $objectListInfo->getIsTruncated());
        $objects = $objectListInfo->getObjectList();
        $this->assertSame('oss-php-sdk-test/upload-test-object-name.txt', $objects[0]->getKey());
        $this->assertSame('2015-11-18T03:36:00.000Z', $objects[0]->getLastModified());
        $this->assertSame('"89B9E567E7EB8815F2F7D41851F9A2CD"', $objects[0]->getETag());
        $this->assertSame('Normal', $objects[0]->getType());
        $this->assertSame(13115, $objects[0]->getSize());
        $this->assertSame('Standard', $objects[0]->getStorageClass());
    }

    public function testParseValidXmlWithEncodedKey()
    {
        $response = new ResponseCore([], $this->validXmlWithEncodedKey, 200);
        $result = new ListObjectsResult($response);
        $this->assertTrue($result->isOK());
        $this->assertNotNull($result->getData());
        $this->assertNotNull($result->getRawResponse());
        $objectListInfo = $result->getData();
        $this->assertSame(0, count($objectListInfo->getPrefixList()));
        $this->assertSame(1, count($objectListInfo->getObjectList()));
        $this->assertSame('testbucket-hf', $objectListInfo->getBucketName());
        $this->assertSame('php/prefix', $objectListInfo->getPrefix());
        $this->assertSame('php/marker', $objectListInfo->getMarker());
        $this->assertSame('php/next-marker', $objectListInfo->getNextMarker());
        $this->assertSame(1000, $objectListInfo->getMaxKeys());
        $this->assertSame('/', $objectListInfo->getDelimiter());
        $this->assertSame('true', $objectListInfo->getIsTruncated());
        $objects = $objectListInfo->getObjectList();
        $this->assertSame('php/a+b', $objects[0]->getKey());
        $this->assertSame('2015-11-18T03:36:00.000Z', $objects[0]->getLastModified());
        $this->assertSame('"89B9E567E7EB8815F2F7D41851F9A2CD"', $objects[0]->getETag());
        $this->assertSame('Normal', $objects[0]->getType());
        $this->assertSame(13115, $objects[0]->getSize());
        $this->assertSame('Standard', $objects[0]->getStorageClass());
    }
}
