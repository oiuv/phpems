<?php

//本类主要用于生成各种SQL语句

class sql
{
	public $G;
	public $tablepre = DTH;

    public function __construct(&$G)
    {
    	$this->G = $G;
    	$this->ev = $this->G->make('ev');
    }

	public function __destruct()
	{
		return true;
	}

	//建表
	public function createTable($table,$fields,$indexs = false)
	{
		$sql = "CREATE TABLE IF NOT EXISTS `".$this->tablepre."{$table}` (";
		foreach($fields as $field)
		{
			$sql .= "\n`{$field['name']}` ";
			if($field['type'])
			$sql .= "{$field['type']} ";
			if($field['length'])
			$sql .= "( {$field['length']} ) ";
			if($field['charset'] == 'utf8')
			$sql .= "CHARACTERSET {$field['charset']} COLLATE utf8_general_ci ";
			elseif($field['charset'] == 'gbk')
			$sql .= "CHARACTERSET {$field['charset']} COLLATE gbk_chinese_ci ";
			/**
			if($field['default'])
			{
				$sql .= "NOT NULL DEFAULT '{$field['default']}' ";
			}
			else
			**/
			$sql .= "NOT NULL ";

			if($field['comment'])
			$sql .= "COMMENT '{$field['comment']}' ";
			$sql .= ",";
		}
		if($indexs)
		{
			foreach($indexs as $index)
			{
				$sql .= "\n";
				$sql .= $index['type']."( `{$index['field']}` ) ";
				$sql .= ",";
			}
		}
		$sql = trim($sql,", ");
		/**
		if($field['charset'] == 'utf8')
		$sql .= "\n) ENGINE=MYISAM CHARACTERSET utf8  COLLATE utf8_general_ci";
		else
		$sql .= "\n) ENGINE=MYISAM CHARACTERSET gbk  COLLATE gbk_chinese_ci";
		**/
		$sql .= "\n)";
		return $sql;
	}

	//清空表内数据
	public function clearTableData($table)
	{
		if(is_array($table))
		{
			$tsql = "TRUNCATE TABLE ";
			foreach($table as $t)
			{
				$tsql .= "`$this->tablepre`.`$t`,";
			}
			return trim($tsql,",");
		}
		else
		return "TRUNCATE TABLE `{$table}`";
	}

	//删除表
	public function delTable($table)
	{
		if(is_array($table))
		{
			$tsql = "TRUNCATE TABLE ";
			foreach($table as $t)
			{
				$tsql .= "`$this->tablepre`.`$t`,";
			}
			return trim($tsql,",");
		}
		else
		return "DROP TABLE `{$table}`";
	}

	//修改字段
	public function modifyField($field,$table)
	{
		if($table)
		{
			if(is_array($field))
			{
				$sql = "ALTER TABLE `".$this->tablepre."{$table}` ";
				if($field['field'])
				{
					$sql .= "CHANGE `{$field['field']}` `{$field['field']}`";
					if($field['fieldtype'])
					$sql .= "{$field['fieldtype']} ";
					if($field['fieldlength'])
					$sql .= "( {$field['fieldlength']} )";
					else
					{
						if($field['fieldtype'] == 'VARCHAR')$sql .= "( 120 )";
						elseif($field['fieldtype'] == 'DECIMAL')$sql .= "( 10,2 )";
					}
					if(strtoupper($field['fieldtype']) == 'VARCHAR' || strtoupper($field['fieldtype']) == 'TEXT')
					{
						if($field['fieldcharset'] == 'gbk')
						$sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE gbk_chinese_ci ";
						else
						$sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE utf8_general_ci ";
					}
					/**
					if($field['default'])
					{
						$sql .= "NOT NULL DEFAULT '{$field['default']}' ";
					}
					else
					**/
					$sql .= "NOT NULL ";

					if($field['fieldindextype'])
					$sql .= ", ADD {$field['fieldindextype']} ( `{$field['field']}` ) ";

					return $sql;
				}
				else return false;
			}
			else return false;
		}
		else return false;
	}

	//添加字段
	public function addField($field,$table)
	{
		if($table)
		{
			if(is_array($field))
			{
				$sql = "ALTER TABLE `".$this->tablepre."{$table}` ";
				if($field['field'])
				{
					$sql .= "ADD `{$field['field']}` ";
					$field['fieldtype'] = strtoupper($field['fieldtype']);
					if($field['fieldtype'])
					$sql .= "{$field['fieldtype']} ";
					if($field['fieldlength'])
					$sql .= "( {$field['fieldlength']} )";
					else
					{
						if($field['fieldtype'] == 'VARCHAR')$sql .= "( 120 )";
						elseif($field['fieldtype'] == 'DECIMAL')$sql .= "( 10,2 )";
					}
					if($field['fieldtype'] == 'VARCHAR' || $field['fieldtype'] == 'TEXT')
					{
						if($field['fieldcharset'] == 'gbk')
						$sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE gbk_chinese_ci ";
						else
						$sql .= "CHARACTER SET {$field['fieldcharset']} COLLATE utf8_general_ci ";
					}
					/**
					if($field['fielddefault'])
					{
						$sql .= "NOT NULL DEFAULT '{$field['fielddefault']}' ";
					}
					else
					**/
					$sql .= "NOT NULL ";

					if($field['fieldindextype'])
					$sql .= ", ADD {$field['fieldindextype']} ( `{$field['field']}` )";
					return $sql;
				}
				else return false;
			}
			else return false;
		}
		else return false;
	}

	//删除字段
	public function delField($field,$table)
	{
		$sql = "ALTER TABLE `".$this->tablepre."{$table}` DROP `{$field}`";
		return $sql;
	}

	//获取表内字段
	public function getFields($table,$database = false)
	{
		if($database)
		return "SHOW COLUMNS FROM `$database`.`$table`";
		else
		return "SHOW COLUMNS FROM `$table`";
	}

	//生成select sql
	public function makeSelect($selectors,$type = 1)
	{
		if(!is_array($selectors))return false;
		$sql = "SELECT ";
		if(!$selectors[0])$selectors[0] = "*";
		if(is_array($selectors[0]))
		{
			$sql .= rtrim(implode(',',$selectors[0]),',');
		}
		else $sql .= $selectors[0];
		$sql .= " FROM ";
		if(is_array($selectors[1]))
		{
			$tmp = NULL;
			foreach($selectors[1] as $p)
			{
				if($type)$tmp .= $this->tablepre.$p." AS ".$p.",";
				else
				$tmp .= $p." AS t ,";
			}

			$sql .= rtrim($tmp,',');
		}
		else
		{
			if($type)$sql .= $this->tablepre.$selectors[1]." AS ".$selectors[1];
			else
			$sql .= $selectors[1]." AS t";
		}
		$sql .= " WHERE ";
		if(!$selectors[2])$selectors[2] = 1;
		if(is_array($selectors[2]))
		{
			$sql .= rtrim(implode(' AND ',$selectors[2]),'AND ');
		}
		else $sql .= $selectors[2];
		if($selectors[3])
		{
			$sql .= " GROUP BY ";
			if(is_array($selectors[3]))
			{
				$sql .= rtrim(implode(',',$selectors[3]),',');
			}
			else $sql .= $selectors[3];
		}
		if($selectors[4])
		{
			$sql .= " ORDER BY ";
			if(is_array($selectors[4]))
			{
				$sql .= rtrim(implode(',',$selectors[4]),',');
			}
			else $sql .= $selectors[4];
		}
		if($selectors[5])
		{
			$sql .= " LIMIT ";
			if(is_array($selectors[5]))
			{
				$sql .= rtrim(implode(',',$selectors[5]),',');
			}
			else $sql .= $selectors[5];
		}
		elseif($selectors[5] !== false)
		{
			$sql .= " LIMIT 0,100";
		}
		return $sql;
	}

	//生成update sql
	public function makeUpdate($updaters)
	{
		if(!is_array($updaters))return false;
		$sql = "UPDATE ";
		if(is_array($updaters[0]))
		{
			$tmp = NULL;
			foreach($updaters[0] as $p)
			$tmp .= $this->tablepre.$p." AS ".$p.",";
			$sql .= rtrim($tmp,',');
		}
		else $sql .= $this->tablepre.$updaters[0]." AS ".$updaters[0];
		if(is_array($updaters[1]) && count($updaters[1]))
		{
			$sql .= " SET ";
			$tmp = NULL;
			foreach($updaters[1] as $id => $p)
			if(is_array($p))
			//$tmp .= '`'.$id."` = '".implode(',',$p)."',";
			$tmp .= '`'.$id."` = '".$this->ev->addSlashes(serialize($p))."',";
			else
			$tmp .= '`'.$id."` = '".$p."',";
			$sql .= rtrim($tmp,',');
		}
		else return false;

		$sql .= " WHERE ";
		if(!$updaters[2])$updaters[2] = 1;
		if(is_array($updaters[2]))
		{
			$sql .= rtrim(implode(' AND ',$updaters[2]),'AND ');
		}
		else $sql .= $updaters[2];

		if($updaters[3])
		{
			$sql .= " LIMIT ";
			if(is_array($updaters[3]))
			{
				$sql .= rtrim(implode(',',$updaters[3]),',');
			}
			else $sql .= $updaters[3];
		}
		return $sql;
	}

	//生成delete sql
	public function makeDelete($deletes)
	{
		if(!is_array($deletes))return false;
		$sql = "DELETE FROM ";
		if(is_array($deletes[0]))
		{
			$tmp = NULL;
			foreach($deletes[0] as $p)
			$tmp .= $this->tablepre.$p." AS ".$p.",";
			$sql .= rtrim($tmp,',');
		}
		else $sql .= $this->tablepre.$deletes[0];

		$sql .= " WHERE ";
		if(!$deletes[1])$deletes[1] = 1;
		if(is_array($deletes[1]))
		{
			$sql .= rtrim(implode(' AND ',$deletes[1]),'AND ');
		}
		else $sql .= $deletes[1];

		if($deletes[2])
		{
			$sql .= " ORDER BY ";
			if(is_array($deletes[2]))
			{
				$sql .= rtrim(implode(',',$deletes[2]),',');
			}
			else $sql .= $deletes[2];
		}

		if($deletes[3])
		{
			$sql .= " LIMIT ";
			if(is_array($deletes[3]))
			{
				$sql .= rtrim(implode(',',$deletes[3]),',');
			}
			else $sql .= $deletes[3];
		}
		return $sql;
	}

	/**
	 * 生成insert sql
	 * 0 => table
	 * 1 => data
	 */

	public function makeInsert($inserts)
	{
		if(!is_array($inserts))return false;
		$sql = "INSERT INTO ";
		if(is_array($inserts[0]))
		{
			$tmp = NULL;
			foreach($inserts[0] as $p)
			$tmp .= $this->tablepre.$p." AS ".$p.",";
			$sql .= rtrim($tmp,',');
		}
		else $sql .= $this->tablepre.$inserts[0];
		$sql .= " ";
		if(is_array($inserts[1]))
		{
			ksort($inserts[1]);
			$key = "";
			$value = "";
			foreach($inserts[1] as $id => $p)
			{
				$key .= "`".$id."`,";
				if(is_array($p))
				//$value .= "'".rtrim(implode(',',$p),',')."',";
				$value .= "'".$this->ev->addSlashes(serialize($p))."',";
				else
				$value .= "'".$p."',";
			}
			$sql .= '('.rtrim($key,',').') VALUES ('.rtrim($value,',').')';
		}
		else return false;
		return $sql;
	}

	//生成replace sql
	public function makeReplace($replace)
	{
		if(!is_array($replace))return false;
		$sql = "REPLACE INTO ";
		if(is_array($replace[0]))
		{
			$tmp = NULL;
			foreach($replace[0] as $p)
			$tmp .= $this->tablepre.$p." AS ".$p.",";
			$sql .= rtrim($tmp,',');
		}
		else $sql .= $this->tablepre.$replace[0];
		$sql .= " ";

		if(is_array($replace[1]))
		{
			$key = "";
			$value = "";
			foreach($replace[1] as $id => $p)
			{
				$key .= "`".$id."`,";
				$value .= "'".$p."',";
			}
			if(is_array($value))
			$sql .= '('.rtrim($key,',').') VALUES ('.rtrim(implode(',',$value),',').')';
			else
			$sql .= '('.rtrim($key,',').') VALUES ('.rtrim($value,',').')';
		}
		else return false;
		return $sql;
	}

	//数据库内表列表
	public function makeShowTables($database = false)
	{
		if($database)return 'SHOW TABLES FROM '.$database;
		else return 'SHOW TABLES';
	}
}

?>
