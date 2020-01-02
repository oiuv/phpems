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

use OSS\OssClient;

$bucketName = Common::getBucketName();
$object = 'example.jpg';
$ossClient = Common::getOssClient();
$download_file = 'download.jpg';
if (is_null($ossClient)) {
    exit(1);
}

//******************************* Simple Usage ***************************************************************

// Upload example.jpg to the specified bucket and rename it to $object.
$ossClient->uploadFile($bucketName, $object, 'example.jpg');

// Image resize
$options = [
    OssClient::OSS_FILE_DOWNLOAD => $download_file,
    OssClient::OSS_PROCESS       => 'image/resize,m_fixed,h_100,w_100', ];
$ossClient->getObject($bucketName, $object, $options);
printImage('imageResize', $download_file);

// Image crop
$options = [
    OssClient::OSS_FILE_DOWNLOAD => $download_file,
    OssClient::OSS_PROCESS       => 'image/crop,w_100,h_100,x_100,y_100,r_1', ];
$ossClient->getObject($bucketName, $object, $options);
printImage('iamgeCrop', $download_file);

// Image rotate
$options = [
    OssClient::OSS_FILE_DOWNLOAD => $download_file,
    OssClient::OSS_PROCESS       => 'image/rotate,90', ];
$ossClient->getObject($bucketName, $object, $options);
printImage('imageRotate', $download_file);

// Image sharpen
$options = [
    OssClient::OSS_FILE_DOWNLOAD => $download_file,
    OssClient::OSS_PROCESS       => 'image/sharpen,100', ];
$ossClient->getObject($bucketName, $object, $options);
printImage('imageSharpen', $download_file);

// Add watermark into a image
$options = [
    OssClient::OSS_FILE_DOWNLOAD => $download_file,
    OssClient::OSS_PROCESS       => 'image/watermark,text_SGVsbG8g5Zu-54mH5pyN5YqhIQ', ];
$ossClient->getObject($bucketName, $object, $options);
printImage('imageWatermark', $download_file);

// Image format convertion
$options = [
    OssClient::OSS_FILE_DOWNLOAD => $download_file,
    OssClient::OSS_PROCESS       => 'image/format,png', ];
$ossClient->getObject($bucketName, $object, $options);
printImage('imageFormat', $download_file);

// Get image information
$options = [
    OssClient::OSS_FILE_DOWNLOAD => $download_file,
    OssClient::OSS_PROCESS       => 'image/info', ];
$ossClient->getObject($bucketName, $object, $options);
printImage('imageInfo', $download_file);

 /**
  * Generate a signed url which could be used in browser to access the object. The expiration time is 1 hour.
  */
 $timeout = 3600;
$options = [
    OssClient::OSS_PROCESS => 'image/resize,m_lfit,h_100,w_100',
];
$signedUrl = $ossClient->signUrl($bucketName, $object, $timeout, 'GET', $options);
Common::println("rtmp url: \n".$signedUrl);

// Finally delete the $object uploaded.
$ossClient->deleteObject($bucketName, $object);

function printImage($func, $imageFile)
{
    $array = getimagesize($imageFile);
    Common::println("$func, image width: ".$array[0]);
    Common::println("$func, image height: ".$array[1]);
    Common::println("$func, image type: ".(2 === $array[2] ? 'jpg' : 'png'));
    Common::println("$func, image size: ".ceil(filesize($imageFile)));
}
