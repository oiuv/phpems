<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * é¡¹ç›®ç»´æŠ¤ï¼šoiuv(QQ:7300637) | å®šåˆ¶æœåŠ¡ï¼šç«çœ¼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

require_once 'include/aliyunoss/autoload.php';

use OSS\Core\OssException;
use OSS\OssClient;

class oss
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function upload($filepath)
    {
        $accessKeyId = 'LTAI1gDYPJhtZlIh';
        $accessKeySecret = 'bmLtFONC9OVSfS9NAWYtelVsWMzCEp';
        $endpoint = 'http://oss-cn-beijing.aliyuncs.com';
        $bucket = 'ossforphpems';
        $object = date('Ymd').'/'.basename($filepath);
        $filePath = $filepath;

        try {
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

            $rs = $ossClient->uploadFile($bucket, $object, $filePath);
            $path = $rs['oss-request-url'];
            $path = str_ireplace('ÓòÃû1', 'ÓòÃû2', $path);
        } catch (OssException $e) {
            //printf(__FUNCTION__ . ": FAILED\n");
            //printf($e->getMessage() . "\n");
            return;
        }

        return $path;
    }
}
