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
 * Class GetLiveChannelHistory.
 */
class GetLiveChannelHistory implements XmlConfig
{
    public function getLiveRecordList()
    {
        return $this->liveRecordList;
    }

    public function parseFromXml($strXml)
    {
        $xml = simplexml_load_string($strXml);

        if (isset($xml->LiveRecord)) {
            foreach ($xml->LiveRecord as $record) {
                $liveRecord = new LiveChannelHistory();
                $liveRecord->parseFromXmlNode($record);
                $this->liveRecordList[] = $liveRecord;
            }
        }
    }

    public function serializeToXml()
    {
        throw new OssException('Not implemented.');
    }

    private $liveRecordList = [];
}
