<?php

class sphinx
{
	public $G;
	public $sphinxapi;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->connectSphinx(SPHIP,SPHPORT,SPHUNAME,SPHUPASS);
	}

	private function connectSphinx($ip,$port,$uname,$upass)
	{
		if(!$this->sphinxapi)
		{
			include "lib/include/sphinxapi.php";
			$this->sphinxapi = new SphinxClient ();
			$this->sphinxapi->SetServer ($ip,$port);
			$this->setMatchMode();
		}
	}

	public function setLimits($start,$number = 20)
	{
		$this->sphinxapi->SetLimits($start,$number);
	}

	public function setMode($mode,$value)
	{
		$this->sphinxapi->$mode($value);
	}

	public function setFilter($mode)
	{
		$this->sphinxapi->SetFilter($mode);
	}

	public function setSortMode($mode)
	{
		$this->sphinxapi->SetSortMode($mode);
	}

	public function setMatchMode($mode = 'SPH_MATCH_ANY')
	{
		$this->sphinxapi->SetMatchMode($mode);
	}

	public function query($keyword,$type="*")
	{
		return $this->sphinxapi->Query($keyword,$type);
	}
}

?>
