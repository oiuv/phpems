<?php

class ca
{
	public $G;
	public $fl;
	public $path = 'data/cache/';

    public function __construct(&$G)
    {
    	$this->G = $G;
    	$this->fl = $this->G->make('files');
    }

    public function readCache($cache,$dir = 'system')
    {
		$f = $this->path.$dir.'/'.$cache.'.cache';
    	if(file_exists($f))return unserialize($this->fl->readFile($f));
    	else return false;
    }

    public function writeCache($cache,$content,$dir = 'system')
    {
    	if(is_dir($this->path.$dir))$this->fl->mdir($this->path.$dir);
		$f = $this->path.$dir.'/'.$cache.'.cache';
		return $this->fl->writeFile($f,serialize($content));
    }

	public function isTimeOut($cache,$time = 300,$dir = 'system')
	{
		if(!$time)return true;
		$f = $this->path.$dir.'/'.$cache.'.cache';
		if((!file_exists($f)) || (time() - filemtime($f) > $time))return true;
		else return false;
	}

	public function removeCache($cache,$dir = 'system')
	{
		$f = $this->path.$dir.'/'.$cache.'.cache';
		if((file_exists($f)))unlink($f);
	}

	public function removeCacheByDir($dir = 'system')
	{
		$this->fl->delDir( $this->path.$dir.'/');
		return true;
	}
}
?>