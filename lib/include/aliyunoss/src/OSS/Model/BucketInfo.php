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
 * Bucket information class. This is the type of element in BucketListInfo's.
 *
 * Class BucketInfo
 */
class BucketInfo
{
    /**
     * BucketInfo constructor.
     *
     * @param string $location
     * @param string $name
     * @param string $createDate
     */
    public function __construct($location, $name, $createDate)
    {
        $this->location = $location;
        $this->name = $name;
        $this->createDate = $createDate;
    }

    /**
     * Get bucket location.
     *
     * @return string
     */
    public function getLocation()
    {
        return $this->location;
    }

    /**
     * Get bucket name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Get bucket creation time.
     *
     * @return string
     */
    public function getCreateDate()
    {
        return $this->createDate;
    }

    /**
     * bucket region.
     *
     * @var string
     */
    private $location;
    /**
     * bucket name.
     *
     * @var string
     */
    private $name;

    /**
     * bucket creation time.
     *
     * @var string
     */
    private $createDate;
}
