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
 * Class LoggingConfig.
 *
 * @see http://help.aliyun.com/document_detail/oss/api-reference/bucket/PutBucketLogging.html
 */
class LoggingConfig implements XmlConfig
{
    /**
     * LoggingConfig constructor.
     *
     * @param null $targetBucket
     * @param null $targetPrefix
     */
    public function __construct($targetBucket = null, $targetPrefix = null)
    {
        $this->targetBucket = $targetBucket;
        $this->targetPrefix = $targetPrefix;
    }

    /**
     * @param $strXml
     *
     * @return null
     */
    public function parseFromXml($strXml)
    {
        $xml = simplexml_load_string($strXml);
        if (!isset($xml->LoggingEnabled)) {
            return;
        }
        foreach ($xml->LoggingEnabled as $status) {
            foreach ($status as $key => $value) {
                if ('TargetBucket' === $key) {
                    $this->targetBucket = strval($value);
                } elseif ('TargetPrefix' === $key) {
                    $this->targetPrefix = strval($value);
                }
            }
            break;
        }
    }

    /**
     *  Serialize to xml string.
     */
    public function serializeToXml()
    {
        $xml = new \SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><BucketLoggingStatus></BucketLoggingStatus>');
        if (isset($this->targetBucket) && isset($this->targetPrefix)) {
            $loggingEnabled = $xml->addChild('LoggingEnabled');
            $loggingEnabled->addChild('TargetBucket', $this->targetBucket);
            $loggingEnabled->addChild('TargetPrefix', $this->targetPrefix);
        }

        return $xml->asXML();
    }

    /**
     * @return string
     */
    public function __toString()
    {
        return $this->serializeToXml();
    }

    /**
     * @return string
     */
    public function getTargetBucket()
    {
        return $this->targetBucket;
    }

    /**
     * @return string
     */
    public function getTargetPrefix()
    {
        return $this->targetPrefix;
    }

    private $targetBucket = '';
    private $targetPrefix = '';
}
