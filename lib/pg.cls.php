<?php

class pg
{
	public $G;
	public $pre = '<li>';
	public $end = '</li>';
	public $number;

	public function __construct(&$G)
    {
    	$this->G = $G;
    	$this->ev = $this->G->make('ev');
    }

    public function setUrlTarget($target)
    {
    	$this->target = $target;
    }

    public function setBlock($pre,$end)
    {
    	$this->pre = $pre;
    	$this->end = $end;
    }

	//获取总页数
	public function getPagesNumber($number,$sepnumber = PN)
	{
		if(!$sepnumber)$sepnumber = PN;
		$this->number = $number;
		if($number % $sepnumber)
		return intval($number/$sepnumber)+1;
		else
		return intval($number/$sepnumber);
	}

	public function outPhonePage($pages,$cpage,$url = false,$separate = "&page=")
	{
		if($pages <2)
		{
			return false;
		}
		if(!$url)
		{
			$url = 'index.php?'.$_SERVER['QUERY_STRING'];
			$url = str_replace('&page='.$cpage,'',$url);
			if(is_array($this->ev->post('search')))
			{
				foreach($this->ev->post('search') as $key => $p)
				{
					if(strlen($p) < 1024)
					$url .= '&search['.$key.']='.$p;
				}
			}
		}
		if($cpage > 1)
		{
			$pageString = $this->pre.'<a '.$this->target.' href="'.$url.$separate.'1">'.'第一页'.'</a>'.$this->end;
			$pageString .= $this->pre.'<a '.$this->target.' href="'.$url.$separate.intval($cpage - 1).'">'.'上一页'.'</a>'.$this->end;
		}
		else
		$pageString = $this->pre.'<a class="current">'.'第一页'.'</a>'.$this->end;
		$pageString .= $this->pre.'<a>共'.$this->number.'条数据</a>'.$this->end;
		if($cpage < $pages)
		{
			$pageString .= $this->pre.'<a '.$this->target.' href="'.$url.$separate.intval($cpage + 1).'">'.'下一页'.'</a>'.$this->end;
			$pageString .= $this->pre.'<a '.$this->target.' href="'.$url.$separate.$pages.'">'.'末页'.'</a>'.$this->end;
		}
		else
		$pageString .= $this->pre.'<a>'.'末页'.'</a>'.$this->end;
		return $pageString;
	}
	//生成分页HTML
	public function outPage($pages,$cpage,$url = false,$separate = "&page=")
	{
		if($this->isPhone)return $this->outPhonePage($pages,$cpage,$url,$separate);
		if(!$url)
		{
			$url = 'index.php?'.$_SERVER['QUERY_STRING'];
			$url = str_replace('&page='.$cpage,'',$url);
			if(is_array($this->ev->post('search')))
			{
				foreach($this->ev->post('search') as $key => $p)
				{
					if(strlen($p) < 1024)
					$url .= '&search['.$key.']='.$p;
				}
			}
		}
		$pageString = '';
		if($pages <2)
		{
			return false;
		}
		elseif($pages <= 10)
		{
			for($p = 1; $p <= $pages; $p++)
			{
				if($p == $cpage)$t = $this->pre.'<a href="#" class="current">'.$p.'</a>'.$this->end;
				else $t = $this->pre.'<a target="'.$this->target.'" href="'.$url.$separate.$p.'">'.$p.'</a>'.$this->end;
				$pageString .= $t;
			}
			$pageString .= $this->pre.'<a>共'.$this->number.'条数据</a>'.$this->end;
			return $pageString;
		}else
		{
			$pageString = $this->pre.'<a target="'.$this->target.'" href="'.$url.$separate.'1">|&lsaquo;</a>'.$this->end;
			if($cpage <= 5)
			{
				$start = 1;
				$end = 10;
				$endString = $this->pre.'<a target="'.$this->target.'" href="'.$url.$separate.'11"> >> </a>'.$this->end;
			}
			else
			{
				$start = $cpage - 5;
				if($start>1)$startString = $this->pre.'<a target="'.$this->target.'" href="'.$url.$separate.intval($start-1).'"> << </a>'.$this->end;
				if($pages - $cpage >= 5)
				{
					$end = $cpage + 4;
					$endString = $this->pre.'<a target="'.$this->target.'" href="'.$url.$separate.intval($end+1).'"> >> </a>'.$this->end;
				}
				else
				{
					$start = $pages - 9;
					$end = $pages;
				}
			}
			if(isset($startString))$pageString .= $startString;
			for($start;$start<=$end;$start++)
			{
				if($start == $cpage)$t = $this->pre.'<a href="#" class="current">'.$start.'</a>'.$this->end;
				else $t = $this->pre.'<a target="'.$this->target.'" href="'.$url.$separate.$start.'">'.$start.'</a>'.$this->end;
				$pageString .= $t;
			}
			if(isset($endString))$pageString .= $endString;
			$pageString .= $this->pre.'<a target="'.$this->target.'" href="'.$url.$separate.$pages.'">&rsaquo;|</a>'.$this->end;
			$pageString .= $this->pre.'<a>共'.$this->number.'条数据</a>'.$this->end;
			return $pageString;
		}
	}
}
?>