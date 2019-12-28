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
 * Class LiveChannelHistory.
 */
class LiveChannelHistory implements XmlConfig
{
    public function __construct()
    {
    }

    public function getStartTime()
    {
        return $this->startTime;
    }

    public function getEndTime()
    {
        return $this->endTime;
    }

    public function getRemoteAddr()
    {
        return $this->remoteAddr;
    }

    public function parseFromXmlNode($xml)
    {
        if (isset($xml->StartTime)) {
            $this->startTime = strval($xml->StartTime);
        }

        if (isset($xml->EndTime)) {
            $this->endTime = strval($xml->EndTime);
        }

        if (isset($xml->RemoteAddr)) {
            $this->remoteAddr = strval($xml->RemoteAddr);
        }
    }

    public function parseFromXml($strXml)
    {
        $xml = simplexml_load_string($strXml);
        $this->parseFromXmlNode($xml);
    }

    public function serializeToXml()
    {
        throw new OssException('Not implemented.');
    }

    private $startTime;
    private $endTime;
    private $remoteAddr;
}
