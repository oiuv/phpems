<?php

class db2
{
	private $queryid = 0;
	private $linkid = 0;
	public $q = 1;
	public $debug = 1;
	public $G;

    public function __construct(&$G)
    {
    	$this->G = $G;
    	$this->sql = $this->G->make('sql');
    }

	//获取MYSQL版本信息
	public function getVersion()
	{
		return mysql_get_server_info($this->linkid);
	}

	//连接MYSQL
	public function connect($host = DH,$dbuser = DU,$password = DP,$dbname = DB,$dbcode = HE)
    {
            $dbcode = str_replace("-","",$dbcode);
            if(!$this->linkid)
            {
            	$this->linkid = mysql_connect($host, $dbuser, $password) or die('Mysql数据库连接失败，请检查数据库用户名和密码是否正确！');
            }
            $version = $this->getVersion();

            if($version >= '4.0.1')
            {
            	mysql_query("SET character_set_connection='{$dbcode}', character_set_results='{$dbcode}', character_set_client=binary", $this->linkid);
				if($version >= '5.0.1')
				{
					mysql_query("SET sql_mode=''", $this->linkid);
				}
            }
			else die('Mysql版本过低，请更换5.0以上版本！');
			mysql_select_db($dbname, $this->linkid);
    }

    //执行SQL非查询语句
    public function exec($sql)
    {
    	$this->query($sql);
    	return mysql_affected_rows($this->linkid);
    }

    //执行select
    public function query($sql)
    {
    	if(!$sql)return false;
    	if(!$this->linkid)$this->connect();
		$this->q++;
    	$this->queryid = mysql_query($sql);
		if(mysql_errno($this->linkid) && $this->debug)
		{
			exit('ERRO:'.$sql.':'.mysql_error());
			return false;
		}
    }

    public function _fetch($sql = false,$type = 1,$position = 0)
    {
    	if($sql)$this->query($sql);
    	if(!mysql_num_rows($this->queryid))return false;
    	if($position)mysql_data_seek($this->queryid, $position);
    	if($type == 1)return mysql_fetch_assoc($this->queryid);
    	else if($type == 2) return mysql_fetch_object($this->queryid);
    	else return mysql_fetch_array($this->queryid);
    }

    //获取单条记录
    public function fetch($sql = NULL,$unserialize = false,$type = 1,$position = 0)
    {
    	$tmp = $this->_fetch($sql,$type);
    	if($tmp)
    	{
	    	if($unserialize)
			{
				if(is_array($unserialize))
				{
					foreach($unserialize as $value)
					{
						$tmp[$value] = unserialize($tmp[$value]);
					}
				}
				else $tmp[$unserialize] = unserialize($tmp[$unserialize]);
			}
    	}
		return $tmp;
    }

    //获取多条符合查询结果的记录
    public function fetchAll($sql = NULL,$key = false,$unserialize = false,$type = 1,$keytype = 0)
    {
    	$rs = array();
    	if($sql)$this->query($sql);
    	while($tmp = $this->_fetch(false,$type))
    	{
    		if($unserialize)
    		{
    			if(is_array($unserialize))
    			{
    				foreach($unserialize as $value)
    				{
    					$tmp[$value] = unserialize($tmp[$value]);
    				}
    			}
    			else $tmp[$unserialize] = unserialize($tmp[$unserialize]);
    		}
    		if($key)
    		{
    			if($keytype)
    			$rs[$tmp[$key]][] = $tmp;
    			else
    			$rs[$tmp[$key]] = $tmp;
    		}
    		else
    		$rs[] = $tmp;
    	}
    	if(count($rs))
    	return $rs;
    	else
    	return false;
    }

    //返回受影响的记录数
    public function affectedRows()
    {
    	return mysql_affected_rows($this->linkid);
    }

    //返回插入的记录的ID
    public function lastInsertId()
    {
    	return mysql_insert_id($this->linkid);
    }

    //列出数据
    public function listElements($page,$number = 20,$args,$type = 1)
	{
		if(!is_array($args))return false;
		$pg = $this->G->make('pg');
		$page = $page > 0?$page:1;
		$r = array();
		$data = array($args['select'],$args['table'],$args['query'],$args['groupby'],$args['orderby'],array(intval($page-1)*$number,$number));
		$sql = $this->sql->makeSelect($data,$type);
		$r['data'] = $this->fetchAll($sql,$args['index'],$args['serial']);
		if($type)
		$data = array('count(*) AS number',$args['table'],$args['query']);
		else
		{
			$data = array(false,$args['table'],$args['query'],$args['groupby']);
			$sql = $this->sql->makeSelect($data,$type);
			$data = array("count(*) AS number","(".$sql.")",1);
		}
		$sql = $this->sql->makeSelect($data,$type);
		$t = $this->fetch($sql);
		$pages = $pg->outPage($pg->getPagesNumber($t['number'],$number),$page);
		$r['pages'] = $pages;
		$r['number'] = $t['number'];
		return $r;
	}

	//插入记录
	public function insertElement($args)
	{
		$data = array($args['table'],$args['query']);
		$sql = $this->sql->makeInsert($data);
		$this->exec($sql);
		return $this->lastInsertId();
	}

	//删除记录
	public function delElement($args)
	{
		$data = array($args['table'],$args['query'],$args['orderby'],$args['limit']);
		$sql = $this->sql->makeDelete($data);
		$this->exec($sql);
		return $this->affectedRows();
	}

	//更新记录
	public function updateElement($args)
	{
		$data = array($args['table'],$args['value'],$args['query'],$args['limit']);
		$sql = $this->sql->makeUpdate($data);
		$this->exec($sql);
		return $this->affectedRows();
	}
}

?>