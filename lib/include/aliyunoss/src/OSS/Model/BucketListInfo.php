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

namespace OSS\Model;

/**
 * Class BucketListInfo.
 *
 * It's the type of return value of ListBuckets.
 */
class BucketListInfo
{
    /**
     * BucketListInfo constructor.
     */
    public function __construct(array $bucketList)
    {
        $this->bucketList = $bucketList;
    }

    /**
     * Get the BucketInfo list.
     *
     * @return BucketInfo[]
     */
    public function getBucketList()
    {
        return $this->bucketList;
    }

    /**
     * BucketInfo list.
     *
     * @var array
     */
    private $bucketList = [];
}
