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

require_once __DIR__.'/Common.php';

use OSS\Core\OssException;
use OSS\OssClient;

$ossClient = Common::getOssClient();
if (is_null($ossClient)) {
    exit(1);
}
$bucket = Common::getBucketName();

//******************************* Simple Usage****************************************************************

// Create a bucket
$ossClient->createBucket($bucket, OssClient::OSS_ACL_TYPE_PUBLIC_READ_WRITE);
Common::println("bucket $bucket created");

// Check whether a bucket exists
$doesExist = $ossClient->doesBucketExist($bucket);
Common::println("bucket $bucket exist? ".($doesExist ? 'yes' : 'no'));

// Get the bucket list
$bucketListInfo = $ossClient->listBuckets();

// Set bucket ACL
$ossClient->putBucketAcl($bucket, OssClient::OSS_ACL_TYPE_PUBLIC_READ_WRITE);
Common::println("bucket $bucket acl put");
// Get bucket ACL
$acl = $ossClient->getBucketAcl($bucket);
Common::println("bucket $bucket acl get: ".$acl);

//******************************* For complete usage, see the following functions ****************************************************

createBucket($ossClient, $bucket);
doesBucketExist($ossClient, $bucket);
deleteBucket($ossClient, $bucket);
putBucketAcl($ossClient, $bucket);
getBucketAcl($ossClient, $bucket);
listBuckets($ossClient);

/**
 * Create a new bucket
 * acl indicates the access permission of a bucket, including: private, public-read-only/private-read-write, and public read-write.
 * Private indicates that only the bucket owner or authorized users can access the data..
 * The three permissions are separately defined by (OssClient::OSS_ACL_TYPE_PRIVATE,OssClient::OSS_ACL_TYPE_PUBLIC_READ, OssClient::OSS_ACL_TYPE_PUBLIC_READ_WRITE).
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    Name of the bucket to create
 *
 * @return null
 */
function createBucket($ossClient, $bucket)
{
    try {
        $ossClient->createBucket($bucket, OssClient::OSS_ACL_TYPE_PUBLIC_READ_WRITE);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
}

/**
 * Check whether a bucket exists.
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    bucket name
 */
function doesBucketExist($ossClient, $bucket)
{
    try {
        $res = $ossClient->doesBucketExist($bucket);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    if (true === $res) {
        echo __FUNCTION__.': OK'."\n";
    } else {
        echo __FUNCTION__.': FAILED'."\n";
    }
}

/**
 * Delete a bucket. If the bucket is not empty, the deletion fails.
 * A bucket which is not empty indicates that it does not contain any objects or parts that are not completely uploaded during multipart upload.
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    Name of the bucket to delete
 *
 * @return null
 */
function deleteBucket($ossClient, $bucket)
{
    try {
        $ossClient->deleteBucket($bucket);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
}

/**
 * Set bucket ACL.
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    bucket name
 *
 * @return null
 */
function putBucketAcl($ossClient, $bucket)
{
    $acl = OssClient::OSS_ACL_TYPE_PRIVATE;
    try {
        $ossClient->putBucketAcl($bucket, $acl);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
}

/**
 * Get bucket ACL.
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    bucket name
 *
 * @return null
 */
function getBucketAcl($ossClient, $bucket)
{
    try {
        $res = $ossClient->getBucketAcl($bucket);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
    echo 'acl: '.$res;
}

/**
 * List all buckets.
 *
 * @param OssClient $ossClient OssClient instance
 *
 * @return null
 */
function listBuckets($ossClient)
{
    $bucketList = null;
    try {
        $bucketListInfo = $ossClient->listBuckets();
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
    $bucketList = $bucketListInfo->getBucketList();
    foreach ($bucketList as $bucket) {
        echo $bucket->getLocation()."\t".$bucket->getName()."\t".$bucket->getCreatedate()."\n";
    }
}
