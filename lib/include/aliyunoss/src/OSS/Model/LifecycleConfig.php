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

use OSS\Core\OssException;

/**
 * Class BucketLifecycleConfig.
 *
 * @see http://help.aliyun.com/document_detail/oss/api-reference/bucket/PutBucketLifecycle.html
 */
class LifecycleConfig implements XmlConfig
{
    /**
     * Parse the xml into this object.
     *
     * @param string $strXml
     *
     * @throws OssException
     *
     * @return null
     */
    public function parseFromXml($strXml)
    {
        $this->rules = [];
        $xml = simplexml_load_string($strXml);
        if (!isset($xml->Rule)) {
            return;
        }
        $this->rules = [];
        foreach ($xml->Rule as $rule) {
            $id = strval($rule->ID);
            $prefix = strval($rule->Prefix);
            $status = strval($rule->Status);
            $actions = [];
            foreach ($rule as $key => $value) {
                if ('ID' === $key || 'Prefix' === $key || 'Status' === $key) {
                    continue;
                }
                $action = $key;
                $timeSpec = null;
                $timeValue = null;
                foreach ($value as $timeSpecKey => $timeValueValue) {
                    $timeSpec = $timeSpecKey;
                    $timeValue = strval($timeValueValue);
                }
                $actions[] = new LifecycleAction($action, $timeSpec, $timeValue);
            }
            $this->rules[] = new LifecycleRule($id, $prefix, $status, $actions);
        }
    }

    /**
     * Serialize the object to xml.
     *
     * @return string
     */
    public function serializeToXml()
    {
        $xml = new \SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><LifecycleConfiguration></LifecycleConfiguration>');
        foreach ($this->rules as $rule) {
            $xmlRule = $xml->addChild('Rule');
            $rule->appendToXml($xmlRule);
        }

        return $xml->asXML();
    }

    /**
     * Add a LifecycleRule.
     *
     * @param LifecycleRule $lifecycleRule
     *
     * @throws OssException
     */
    public function addRule($lifecycleRule)
    {
        if (!isset($lifecycleRule)) {
            throw new OssException('lifecycleRule is null');
        }
        $this->rules[] = $lifecycleRule;
    }

    /**
     *  Serialize the object into xml string.
     *
     * @return string
     */
    public function __toString()
    {
        return $this->serializeToXml();
    }

    /**
     * Get all lifecycle rules.
     *
     * @return LifecycleRule[]
     */
    public function getRules()
    {
        return $this->rules;
    }

    /**
     * @var LifecycleRule[]
     */
    private $rules;
}
