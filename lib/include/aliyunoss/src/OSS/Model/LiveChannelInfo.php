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
 * Class LiveChannelInfo.
 */
class LiveChannelInfo implements XmlConfig
{
    public function __construct($name = null, $description = null)
    {
        $this->name = $name;
        $this->description = $description;
        $this->publishUrls = [];
        $this->playUrls = [];
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getPublishUrls()
    {
        return $this->publishUrls;
    }

    public function getPlayUrls()
    {
        return $this->playUrls;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getLastModified()
    {
        return $this->lastModified;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setDescription($description)
    {
        $this->description = $description;
    }

    public function parseFromXmlNode($xml)
    {
        if (isset($xml->Name)) {
            $this->name = strval($xml->Name);
        }

        if (isset($xml->Description)) {
            $this->description = strval($xml->Description);
        }

        if (isset($xml->Status)) {
            $this->status = strval($xml->Status);
        }

        if (isset($xml->LastModified)) {
            $this->lastModified = strval($xml->LastModified);
        }

        if (isset($xml->PublishUrls)) {
            foreach ($xml->PublishUrls as $url) {
                $this->publishUrls[] = strval($url->Url);
            }
        }

        if (isset($xml->PlayUrls)) {
            foreach ($xml->PlayUrls as $url) {
                $this->playUrls[] = strval($url->Url);
            }
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

    private $name;
    private $description;
    private $publishUrls;
    private $playUrls;
    private $status;
    private $lastModified;
}
