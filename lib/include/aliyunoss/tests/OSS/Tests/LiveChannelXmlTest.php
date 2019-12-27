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

namespace OSS\Tests;

require_once __DIR__.'/Common.php';

use OSS\Model\GetLiveChannelHistory;
use OSS\Model\GetLiveChannelStatus;
use OSS\Model\LiveChannelConfig;
use OSS\Model\LiveChannelInfo;
use OSS\Model\LiveChannelListInfo;

class LiveChannelXmlTest extends \PHPUnit_Framework_TestCase
{
    private $config = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<LiveChannelConfiguration>
  <Description>xxx</Description>
  <Status>enabled</Status>
  <Target>
     <Type>hls</Type>
     <FragDuration>1000</FragDuration>
     <FragCount>5</FragCount>
     <PlayListName>hello.m3u8</PlayListName>
  </Target>
</LiveChannelConfiguration>
BBBB;

    private $info = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<CreateLiveChannelResult>
  <Name>live-1</Name>
  <Description>xxx</Description>
  <PublishUrls>
    <Url>rtmp://bucket.oss-cn-hangzhou.aliyuncs.com/live/213443245345</Url>
  </PublishUrls>
  <PlayUrls>
    <Url>http://bucket.oss-cn-hangzhou.aliyuncs.com/213443245345/播放列表.m3u8</Url>
  </PlayUrls>
  <Status>enabled</Status>
  <LastModified>2015-11-24T14:25:31.000Z</LastModified>
</CreateLiveChannelResult>
BBBB;

    private $list = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<ListLiveChannelResult>
<Prefix>xxx</Prefix>
  <Marker>yyy</Marker>
  <MaxKeys>100</MaxKeys>
  <IsTruncated>false</IsTruncated>
  <NextMarker>121312132</NextMarker>
  <LiveChannel>
    <Name>12123214323431</Name>
    <Description>xxx</Description>
    <PublishUrls>
      <Url>rtmp://bucket.oss-cn-hangzhou.aliyuncs.com/live/1</Url>
    </PublishUrls>
    <PlayUrls>
      <Url>http://bucket.oss-cn-hangzhou.aliyuncs.com/1/播放列表.m3u8</Url>
    </PlayUrls>
    <Status>enabled</Status>
    <LastModified>2015-11-24T14:25:31.000Z</LastModified>
  </LiveChannel>
  <LiveChannel>
    <Name>432423432423</Name>
    <Description>yyy</Description>
    <PublishUrls>
      <Url>rtmp://bucket.oss-cn-hangzhou.aliyuncs.com/live/2</Url>
    </PublishUrls>
    <PlayUrls>
      <Url>http://bucket.oss-cn-hangzhou.aliyuncs.com/2/播放列表.m3u8</Url>
    </PlayUrls>
    <Status>enabled</Status>
    <LastModified>2016-11-24T14:25:31.000Z</LastModified>
  </LiveChannel>
</ListLiveChannelResult>
BBBB;

    private $status = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<LiveChannelStat>
    <Status>Live</Status>
    <ConnectedTime>2016-10-20T14:25:31.000Z</ConnectedTime>
    <RemoteAddr>10.1.2.4:47745</RemoteAddr>
    <Video>
        <Width>1280</Width>
        <Height>536</Height>
        <FrameRate>24</FrameRate>
        <Bandwidth>72513</Bandwidth>
        <Codec>H264</Codec>
    </Video>
        <Audio>
        <Bandwidth>6519</Bandwidth>
        <SampleRate>44100</SampleRate>
        <Codec>AAC</Codec>
    </Audio>
</LiveChannelStat>
BBBB;

    private $history = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<LiveChannelHistory>
    <LiveRecord>
        <StartTime>2013-11-24T14:25:31.000Z</StartTime>
        <EndTime>2013-11-24T15:25:31.000Z</EndTime>
        <RemoteAddr>10.101.194.148:56861</RemoteAddr>
    </LiveRecord>
    <LiveRecord>
        <StartTime>2014-11-24T14:25:31.000Z</StartTime>
        <EndTime>2014-11-24T15:25:31.000Z</EndTime>
        <RemoteAddr>10.101.194.148:56862</RemoteAddr>
    </LiveRecord>
    <LiveRecord>
        <StartTime>2015-11-24T14:25:31.000Z</StartTime>
        <EndTime>2015-11-24T15:25:31.000Z</EndTime>
        <RemoteAddr>10.101.194.148:56863</RemoteAddr>
    </LiveRecord>
</LiveChannelHistory>
BBBB;

    public function testLiveChannelStatus()
    {
        $stat = new GetLiveChannelStatus();
        $stat->parseFromXml($this->status);

        $this->assertSame('Live', $stat->getStatus());
        $this->assertSame('2016-10-20T14:25:31.000Z', $stat->getConnectedTime());
        $this->assertSame('10.1.2.4:47745', $stat->getRemoteAddr());

        $this->assertSame(1280, $stat->getVideoWidth());
        $this->assertSame(536, $stat->getVideoHeight());
        $this->assertSame(24, $stat->getVideoFrameRate());
        $this->assertSame(72513, $stat->getVideoBandwidth());
        $this->assertSame('H264', $stat->getVideoCodec());
        $this->assertSame(6519, $stat->getAudioBandwidth());
        $this->assertSame(44100, $stat->getAudioSampleRate());
        $this->assertSame('AAC', $stat->getAudioCodec());
    }

    public function testLiveChannelHistory()
    {
        $history = new GetLiveChannelHistory();
        $history->parseFromXml($this->history);

        $recordList = $history->getLiveRecordList();
        $this->assertSame(3, count($recordList));

        $list0 = $recordList[0];
        $this->assertSame('2013-11-24T14:25:31.000Z', $list0->getStartTime());
        $this->assertSame('2013-11-24T15:25:31.000Z', $list0->getEndTime());
        $this->assertSame('10.101.194.148:56861', $list0->getRemoteAddr());

        $list1 = $recordList[1];
        $this->assertSame('2014-11-24T14:25:31.000Z', $list1->getStartTime());
        $this->assertSame('2014-11-24T15:25:31.000Z', $list1->getEndTime());
        $this->assertSame('10.101.194.148:56862', $list1->getRemoteAddr());

        $list2 = $recordList[2];
        $this->assertSame('2015-11-24T14:25:31.000Z', $list2->getStartTime());
        $this->assertSame('2015-11-24T15:25:31.000Z', $list2->getEndTime());
        $this->assertSame('10.101.194.148:56863', $list2->getRemoteAddr());
    }

    public function testLiveChannelConfig()
    {
        $config = new LiveChannelConfig(['name' => 'live-1']);
        $config->parseFromXml($this->config);

        $this->assertSame('xxx', $config->getDescription());
        $this->assertSame('enabled', $config->getStatus());
        $this->assertSame('hls', $config->getType());
        $this->assertSame(1000, $config->getFragDuration());
        $this->assertSame(5, $config->getFragCount());
        $this->assertSame('hello.m3u8', $config->getPlayListName());

        $xml = $config->serializeToXml();
        $config2 = new LiveChannelConfig(['name' => 'live-2']);
        $config2->parseFromXml($xml);
        $this->assertSame('xxx', $config2->getDescription());
        $this->assertSame('enabled', $config2->getStatus());
        $this->assertSame('hls', $config2->getType());
        $this->assertSame(1000, $config2->getFragDuration());
        $this->assertSame(5, $config2->getFragCount());
        $this->assertSame('hello.m3u8', $config2->getPlayListName());
    }

    public function testLiveChannelInfo()
    {
        $info = new LiveChannelInfo(['name' => 'live-1']);
        $info->parseFromXml($this->info);

        $this->assertSame('live-1', $info->getName());
        $this->assertSame('xxx', $info->getDescription());
        $this->assertSame('enabled', $info->getStatus());
        $this->assertSame('2015-11-24T14:25:31.000Z', $info->getLastModified());
        $pubs = $info->getPublishUrls();
        $this->assertSame(1, count($pubs));
        $this->assertSame('rtmp://bucket.oss-cn-hangzhou.aliyuncs.com/live/213443245345', $pubs[0]);

        $plays = $info->getPlayUrls();
        $this->assertSame(1, count($plays));
        $this->assertSame('http://bucket.oss-cn-hangzhou.aliyuncs.com/213443245345/播放列表.m3u8', $plays[0]);
    }

    public function testLiveChannelList()
    {
        $list = new LiveChannelListInfo();
        $list->parseFromXml($this->list);

        $this->assertSame('xxx', $list->getPrefix());
        $this->assertSame('yyy', $list->getMarker());
        $this->assertSame(100, $list->getMaxKeys());
        $this->assertFalse($list->getIsTruncated());
        $this->assertSame('121312132', $list->getNextMarker());

        $channels = $list->getChannelList();
        $this->assertSame(2, count($channels));

        $chan1 = $channels[0];
        $this->assertSame('12123214323431', $chan1->getName());
        $this->assertSame('xxx', $chan1->getDescription());
        $this->assertSame('enabled', $chan1->getStatus());
        $this->assertSame('2015-11-24T14:25:31.000Z', $chan1->getLastModified());
        $pubs = $chan1->getPublishUrls();
        $this->assertSame(1, count($pubs));
        $this->assertSame('rtmp://bucket.oss-cn-hangzhou.aliyuncs.com/live/1', $pubs[0]);

        $plays = $chan1->getPlayUrls();
        $this->assertSame(1, count($plays));
        $this->assertSame('http://bucket.oss-cn-hangzhou.aliyuncs.com/1/播放列表.m3u8', $plays[0]);

        $chan2 = $channels[1];
        $this->assertSame('432423432423', $chan2->getName());
        $this->assertSame('yyy', $chan2->getDescription());
        $this->assertSame('enabled', $chan2->getStatus());
        $this->assertSame('2016-11-24T14:25:31.000Z', $chan2->getLastModified());
        $pubs = $chan2->getPublishUrls();
        $this->assertSame(1, count($pubs));
        $this->assertSame('rtmp://bucket.oss-cn-hangzhou.aliyuncs.com/live/2', $pubs[0]);

        $plays = $chan2->getPlayUrls();
        $this->assertSame(1, count($plays));
        $this->assertSame('http://bucket.oss-cn-hangzhou.aliyuncs.com/2/播放列表.m3u8', $plays[0]);
    }
}
