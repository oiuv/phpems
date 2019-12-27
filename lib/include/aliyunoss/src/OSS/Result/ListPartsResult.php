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

namespace OSS\Result;

use OSS\Model\ListPartsInfo;
use OSS\Model\PartInfo;

/**
 * Class ListPartsResult.
 */
class ListPartsResult extends Result
{
    /**
     * Parse the xml data returned by the ListParts interface.
     *
     * @return ListPartsInfo
     */
    protected function parseDataFromResponse()
    {
        $content = $this->rawResponse->body;
        $xml = simplexml_load_string($content);
        $bucket = isset($xml->Bucket) ? strval($xml->Bucket) : '';
        $key = isset($xml->Key) ? strval($xml->Key) : '';
        $uploadId = isset($xml->UploadId) ? strval($xml->UploadId) : '';
        $nextPartNumberMarker = isset($xml->NextPartNumberMarker) ? intval($xml->NextPartNumberMarker) : '';
        $maxParts = isset($xml->MaxParts) ? intval($xml->MaxParts) : '';
        $isTruncated = isset($xml->IsTruncated) ? strval($xml->IsTruncated) : '';
        $partList = [];
        if (isset($xml->Part)) {
            foreach ($xml->Part as $part) {
                $partNumber = isset($part->PartNumber) ? intval($part->PartNumber) : '';
                $lastModified = isset($part->LastModified) ? strval($part->LastModified) : '';
                $eTag = isset($part->ETag) ? strval($part->ETag) : '';
                $size = isset($part->Size) ? intval($part->Size) : '';
                $partList[] = new PartInfo($partNumber, $lastModified, $eTag, $size);
            }
        }

        return new ListPartsInfo($bucket, $key, $uploadId, $nextPartNumberMarker, $maxParts, $isTruncated, $partList);
    }
}
