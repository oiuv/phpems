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
 * Class RefererConfig.
 *
 * @see http://help.aliyun.com/document_detail/oss/api-reference/bucket/PutBucketReferer.html
 */
class RefererConfig implements XmlConfig
{
    /**
     * @param string $strXml
     *
     * @return null
     */
    public function parseFromXml($strXml)
    {
        $xml = simplexml_load_string($strXml);
        if (!isset($xml->AllowEmptyReferer)) {
            return;
        }
        if (!isset($xml->RefererList)) {
            return;
        }
        $this->allowEmptyReferer =
            ('TRUE' === strval($xml->AllowEmptyReferer) || 'true' === strval($xml->AllowEmptyReferer)) ? true : false;

        foreach ($xml->RefererList->Referer as $key => $refer) {
            $this->refererList[] = strval($refer);
        }
    }

    /**
     * serialize the RefererConfig object into xml string.
     *
     * @return string
     */
    public function serializeToXml()
    {
        $xml = new \SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><RefererConfiguration></RefererConfiguration>');
        if ($this->allowEmptyReferer) {
            $xml->addChild('AllowEmptyReferer', 'true');
        } else {
            $xml->addChild('AllowEmptyReferer', 'false');
        }
        $refererList = $xml->addChild('RefererList');
        foreach ($this->refererList as $referer) {
            $refererList->addChild('Referer', $referer);
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
     * @param bool $allowEmptyReferer
     */
    public function setAllowEmptyReferer($allowEmptyReferer)
    {
        $this->allowEmptyReferer = $allowEmptyReferer;
    }

    /**
     * @param string $referer
     */
    public function addReferer($referer)
    {
        $this->refererList[] = $referer;
    }

    /**
     * @return bool
     */
    public function isAllowEmptyReferer()
    {
        return $this->allowEmptyReferer;
    }

    /**
     * @return array
     */
    public function getRefererList()
    {
        return $this->refererList;
    }

    private $allowEmptyReferer = true;
    private $refererList = [];
}
