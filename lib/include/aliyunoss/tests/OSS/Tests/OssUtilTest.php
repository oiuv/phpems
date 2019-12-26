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

use OSS\Core\OssException;
use OSS\Core\OssUtil;

class OssUtilTest extends \PHPUnit_Framework_TestCase
{
    public function testIsChinese()
    {
        $this->assertSame(OssUtil::chkChinese('hello,world'), 0);
        $str = '你好,这里是卖咖啡!';
        $strGBK = OssUtil::encodePath($str);
        $this->assertSame(OssUtil::chkChinese($str), 1);
        $this->assertSame(OssUtil::chkChinese($strGBK), 1);
    }

    public function testIsGB2312()
    {
        $str = '你好,这里是卖咖啡!';
        $this->assertFalse(OssUtil::isGb2312($str));
    }

    public function testCheckChar()
    {
        $str = '你好,这里是卖咖啡!';
        $this->assertFalse(OssUtil::checkChar($str));
        $this->assertTrue(OssUtil::checkChar(iconv('UTF-8', 'GB2312//IGNORE', $str)));
    }

    public function testIsIpFormat()
    {
        $this->assertTrue(OssUtil::isIPFormat('10.101.160.147'));
        $this->assertTrue(OssUtil::isIPFormat('12.12.12.34'));
        $this->assertTrue(OssUtil::isIPFormat('12.12.12.12'));
        $this->assertTrue(OssUtil::isIPFormat('255.255.255.255'));
        $this->assertTrue(OssUtil::isIPFormat('0.1.1.1'));
        $this->assertFalse(OssUtil::isIPFormat('0.1.1.x'));
        $this->assertFalse(OssUtil::isIPFormat('0.1.1.256'));
        $this->assertFalse(OssUtil::isIPFormat('256.1.1.1'));
        $this->assertFalse(OssUtil::isIPFormat('0.1.1.0.1'));
        $this->assertTrue(OssUtil::isIPFormat('10.10.10.10:123'));
    }

    public function testToQueryString()
    {
        $option = ['a' => 'b'];
        $this->assertSame('a=b', OssUtil::toQueryString($option));
    }

    public function testSReplace()
    {
        $str = "<>&'\"";
        $this->assertSame('&amp;lt;&amp;gt;&amp;&apos;&quot;', OssUtil::sReplace($str));
    }

    public function testCheckChinese()
    {
        $str = '你好,这里是卖咖啡!';
        $this->assertSame(OssUtil::chkChinese($str), 1);
        if (OssUtil::isWin()) {
            $strGB = OssUtil::encodePath($str);
            $this->assertSame($str, iconv('GB2312', 'UTF-8', $strGB));
        }
    }

    public function testValidateOption()
    {
        $option = 'string';

        try {
            OssUtil::validateOptions($option);
            $this->assertFalse(true);
        } catch (OssException $e) {
            $this->assertSame('string:option must be array', $e->getMessage());
        }

        $option = null;

        try {
            OssUtil::validateOptions($option);
            $this->assertTrue(true);
        } catch (OssException $e) {
            $this->assertFalse(true);
        }
    }

    public function testCreateDeleteObjectsXmlBody()
    {
        $xml = <<<BBBB
<?xml version="1.0" encoding="utf-8"?><Delete><Quiet>true</Quiet><Object><Key>obj1</Key></Object></Delete>
BBBB;
        $a = ['obj1'];
        $this->assertSame($xml, $this->cleanXml(OssUtil::createDeleteObjectsXmlBody($a, 'true')));
    }

    public function testCreateCompleteMultipartUploadXmlBody()
    {
        $xml = <<<BBBB
<?xml version="1.0" encoding="utf-8"?><CompleteMultipartUpload><Part><PartNumber>2</PartNumber><ETag>xx</ETag></Part></CompleteMultipartUpload>
BBBB;
        $a = [['PartNumber' => 2, 'ETag' => 'xx']];
        $this->assertSame($this->cleanXml(OssUtil::createCompleteMultipartUploadXmlBody($a)), $xml);
    }

    public function testCreateBucketXmlBody()
    {
        $xml = <<<BBBB
<?xml version="1.0" encoding="UTF-8"?><CreateBucketConfiguration><StorageClass>Standard</StorageClass></CreateBucketConfiguration>
BBBB;
        $storageClass = 'Standard';
        $this->assertSame($this->cleanXml(OssUtil::createBucketXmlBody($storageClass)), $xml);
    }

    public function testValidateBucket()
    {
        $this->assertTrue(OssUtil::validateBucket('xxx'));
        $this->assertFalse(OssUtil::validateBucket('XXXqwe123'));
        $this->assertFalse(OssUtil::validateBucket('XX'));
        $this->assertFalse(OssUtil::validateBucket('/X'));
        $this->assertFalse(OssUtil::validateBucket(''));
    }

    public function testValidateObject()
    {
        $this->assertTrue(OssUtil::validateObject('xxx'));
        $this->assertTrue(OssUtil::validateObject('xxx23'));
        $this->assertTrue(OssUtil::validateObject('12321-xxx'));
        $this->assertTrue(OssUtil::validateObject('x'));
        $this->assertFalse(OssUtil::validateObject('/aa'));
        $this->assertFalse(OssUtil::validateObject('\\aa'));
        $this->assertFalse(OssUtil::validateObject(''));
    }

    public function testStartWith()
    {
        $this->assertTrue(OssUtil::startsWith('xxab', 'xx'), true);
    }

    public function testReadDir()
    {
        $list = OssUtil::readDir('./src', '.|..|.svn|.git', true);
        $this->assertNotNull($list);
    }

    public function testIsWin()
    {
        //$this->assertTrue(OssUtil::isWin());
    }

    public function testGetMd5SumForFile()
    {
        $this->assertSame(OssUtil::getMd5SumForFile(__FILE__, 0, filesize(__FILE__) - 1), base64_encode(md5(file_get_contents(__FILE__), true)));
    }

    public function testGenerateFile()
    {
        $path = __DIR__.DIRECTORY_SEPARATOR.'generatedFile.txt';
        OssUtil::generateFile($path, 1024 * 1024);
        $this->assertSame(filesize($path), 1024 * 1024);
        unlink($path);
    }

    public function testThrowOssExceptionWithMessageIfEmpty()
    {
        $null = null;
        try {
            OssUtil::throwOssExceptionWithMessageIfEmpty($null, 'xx');
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('xx', $e->getMessage());
        }
    }

    public function testThrowOssExceptionWithMessageIfEmpty2()
    {
        $null = '';
        try {
            OssUtil::throwOssExceptionWithMessageIfEmpty($null, 'xx');
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('xx', $e->getMessage());
        }
    }

    public function testValidContent()
    {
        $null = '';
        try {
            OssUtil::validateContent($null);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('http body content is invalid', $e->getMessage());
        }

        $notnull = 'x';
        try {
            OssUtil::validateContent($notnull);
            $this->assertTrue(true);
        } catch (OssException $e) {
            $this->assertSame('http body content is invalid', $e->getMessage());
        }
    }

    public function testThrowOssExceptionWithMessageIfEmpty3()
    {
        $null = 'xx';
        try {
            OssUtil::throwOssExceptionWithMessageIfEmpty($null, 'xx');
            $this->assertTrue(true);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }
}
