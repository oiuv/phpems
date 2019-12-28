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

namespace OSS\Core;

/**
 * Class OssException.
 *
 * This is the class that OSSClient is expected to thrown, which the caller needs to handle properly.
 * It has the OSS specific errors which is useful for troubleshooting.
 */
class OssException extends \Exception
{
    private $details = [];

    public function __construct($details)
    {
        if (is_array($details)) {
            $message = $details['code'].': '.$details['message']
                     .' RequestId: '.$details['request-id'];
            parent::__construct($message);
            $this->details = $details;
        } else {
            $message = $details;
            parent::__construct($message);
        }
    }

    public function getHTTPStatus()
    {
        return isset($this->details['status']) ? $this->details['status'] : '';
    }

    public function getRequestId()
    {
        return isset($this->details['request-id']) ? $this->details['request-id'] : '';
    }

    public function getErrorCode()
    {
        return isset($this->details['code']) ? $this->details['code'] : '';
    }

    public function getErrorMessage()
    {
        return isset($this->details['message']) ? $this->details['message'] : '';
    }

    public function getDetails()
    {
        return isset($this->details['body']) ? $this->details['body'] : '';
    }
}
