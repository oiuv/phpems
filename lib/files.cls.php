<?php

class files
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	//创建文件夹
	public function mdir($path)
	{
		if(!file_exists($path))
		{
			$this->mdir(dirname($path));
			mkdir($path,0777);
		}
	}

	//列出文件夹下的文件
	public function listDir($target)
	{
		$target = rtrim($target,'/');
		if(!is_dir($target))return false;
		$handle = dir($target);
		$elem = array();
		while(false !== ($entry = $handle->read()))
		{
		  	if(($entry!='.')&&($entry!='..'))
		  	{
		  		if(is_file($target.'/'.$entry))
		  		$elem['file'][] = array('name'=>$entry,'path'=>$target.'/'.$entry,'modify'=>filemtime($target.'/'.$entry),'size'=>filesize($target.'/'.$entry));
		  		elseif(is_dir($target.'/'.$entry))
		  		$elem['dir'][] = array('name'=>$entry,'path'=>$target.'/'.$entry,'modify'=>filemtime($target.'/'.$entry));
		  	}
		}
		return $elem;
	}

	//复制文件夹
	public function copyDir($source,$destination,$child)
	{
		if(!is_dir($destination))mkdir($destination,0777);
		$handle = dir($source);
		while($entry=$handle->read())
		{
		  	if(($entry!='.')&&($entry!='..'))
		  	{
		  		if(is_dir($source.'/'.$entry))
		  		{
		  			if($child)xCopy($source.'/'.$entry,$destination.'/'.$entry,$child);
		  		}
		  		else
		  		{
		  			if(file_exists($destination.'/'.$entry))unlink($destination.'/'.$entry);
		  			if(!copy($source.'/'.$entry,$destination.'/'.$entry))return false;
		  		}
		  	}
		}
		return true;
	}

	//删除文件夹
	public function delDir($dir)
	{
		$dh=opendir($dir);
		while ($file=readdir($dh))
		{
			if($file!='.' && $file!='..')
			{
				$fullpath=$dir.'/'.$file;
				if(!is_dir($fullpath))
				{
					$this->delDir($fullpath);
				}
  				else
				{
					unlink($fullpath);
				}
			}
		}
		closedir($dh);
		rmdir($dir);
	}

	//写入文件
	public function writeFile($out,$content='')
    {
		$t = dirname($out);
		if(!is_dir($t))
		$this->mdir($t);
		$fp = fopen($out,'w');
		flock($fp, LOCK_EX);
		$wp = fwrite($fp,$content);
		flock($fp, LOCK_UN);
		fclose($fp);
    }

    //删除文件
    public function delFile($file)
    {
    	if(file_exists($file))unlink($file);
    }

	//读取文件
	public function readFile($file)
    {
		if(function_exists('file_get_contents'))
		{
			$content = file_get_contents($file);
		}
		else
		{
			$ay = file($file);
			if(!$ay)return false;
			foreach($ay as $tmp)
			{
				$content .= $tmp;
			}
		}
		return $content;
    }

	//向文件追加内容
	public function appendFile($file,$content = '',$seek = -1)
	{
		$fp = fopen($file,'a');
		if($seek >= 0)fseek($fp, $seek);
		flock($fp, LOCK_EX);
		fwrite($fp, $content);
		flock($fp, LOCK_UN);
		fclose($fp);
	}

	//上传文件
	public function uploadFile($file,$updir,$sExtension = NULL,$name = NULL)
	{
		if(!$sExtension)$sExtension = $this->getFileExtName($file['name']);
		if(!$name)$name = time().rand(1000,9999);
		if(!file_exists($updir))$this->mdir($updir);
		$url = $updir.$name.'.'.$sExtension;
		if(file_exists($url))unlink($url);
		move_uploaded_file( $file['tmp_name'], $url ) ;
		if (file_exists($url))
		{
			$oldumask = umask(0) ;
			chmod( $url, 0777 ) ;
			umask( $oldumask ) ;
		}
		return $url;
	}

	//获取文件扩展名
	public function getFileExtName($filename)
	{
		$filename = strtolower($filename);
		$exts = explode('.',$filename);
		$ext = $exts[count($exts)-1];
		if(strpos($ext,'?') >= 0)
		{
			$ext = explode('?',$ext);
			return $ext[0];
		}
		else
		return $ext;
	}

	//通过网络下载一个文件
	public function wGetFiles($url,$updir)
	{
		$sExtension = $this->getFileExtName($url);
		$name = time().rand(1000,9999);
		if(!file_exists($updir))$this->mdir($updir);
		$path = $updir.$sExtension.'/'.date("Ymd",TIME).'/'.$name.'.'.$sExtension;
		if(file_exists($path))unlink($path);
		$this->writeFile($path,$this->readFile($url));
		if (file_exists($path))
		{
			$oldumask = umask(0) ;
			chmod( $url, 0777 ) ;
			umask( $oldumask ) ;
		}
		return $path;
	}

	//检测文件夹是否可写
	public function dirWriteAble($dir)
	{
		if(!is_dir($dir)) {
			$this->mdir($dir);
		}
		if(is_dir($dir)) {
			$writeable = $this->fileWriteAble("$dir/.test.tmp",1);
		}
		return $writeable;
	}

	//检测文件是否可写
	public function fileWriteAble($file,$delTestFile = 0)
	{
		if($fp = @fopen($file, 'w'))
		{
			fclose($fp);
			if($delTestFile)@unlink($file);
			$writeable = 1;
		}
		else
		{
			$writeable = 0;
		}
		return $writeable;
	}

	public function outCsv($fname,$r)
	{
		if($this->dirWriteAble(dirname($fname)))
		{
			$fp = fopen($fname, 'w');
			foreach ($r as $line) {
			    fputcsv($fp, $line);
			}
			fclose($fp);
			return $fname;
		}
		else
		return false;
	}

	//生成缩略图
	public function thumb($source,$target,$width,$height,$isresize = 1,$isstream = false)
    {
		list($swidth,$sheight) = getimagesize($source);
    	if(!$width)$width = $swidth;
    	if(!$height)$height = $sheight;
		if($isresize)
		{
	    	$w = $swidth/$width;
	    	$h = $sheight/$height;
	    	if($w>$h)$height = $sheight/$w;
	    	else $width = $swidth/$h;
		}
		$tmp_pic = imagecreatetruecolor($width, $height);
		$ext = $this->getFileExtName($source);
		$s_pic = $this->createImage($source,$ext);
		if(!$s_pic)return false;
		if(function_exists('imagecopyresampled'))imagecopyresampled($tmp_pic, $s_pic, 0, 0, 0, 0, $width, $height, $swidth, $sheight);
		else imagecopyresized($tmp_pic, $s_pic, 0, 0, 0, 0, $width, $height, $swidth, $sheight);
		if($isstream)$target = NULL;
		if($this->writeImage($tmp_pic, $target, 100, 'png'))return true;
    	else return false;
    }

	//生成水印
	public function waterMark($source,$logo,$alpha = 50,$isstream = false)
    {
    	list($swidth,$sheight) = getimagesize($source);
    	list($width,$height) = getimagesize($logo);
    	$ext = $this->getFileExtName($source,false);
    	$ext2 = $this->getFileExtName($logo,false);
    	$s_pic = $this->createImage($source,$ext);
    	imagealphablending($s_pic, true);
    	$l_pic = $this->createImage($logo,$ext2);
    	imagecopymergegray($s_pic, $l_pic, intval($swidth-$width), intval($sheight-$height), 0 , 0 ,$width, $height,$alpha);
    	if($this->writeImage($s_pic, $source, 100,$ext))return true;
    	else return false;
    }

	//创建一个图片文件
	public function createImage($source,$ext)
    {
		switch($ext)
		{
			case 'jpg':
			if(function_exists('imagecreatefromjpeg'))return imagecreatefromjpeg($source);
			else return false;
			break;

			case 'gif':
			if(function_exists('imagecreatefromgif'))return imagecreatefromgif($source);
			else return false;
			break;

			case 'png':
			if(function_exists('imagecreatefrompng'))return imagecreatefrompng($source);
			else return false;
			break;

			default:
			return false;
			break;
		}
    }

	//写入图片文件图像信息
	public function writeImage($source,$target,$alpha,$ext)
    {
    	switch ($ext)
    	{
			case 'jpg':
			if(imagejpeg($source, $target, $alpha))return true;
			else return false;
			break;

			case 'gif':
			if(imagejpeg($source, $target, $alpha))return true;
			else return false;
			break;

			case 'png':
			if(imagejpeg($source, $target, $alpha))return true;
			else return false;
			break;

			default:
			return false;
			break;
		}
    }

    //创建随即验证码图片
    public function createRandImage($randCode = NULL,$width = 60, $height = 24,$mix = 50)
    {
    	$par = intval($width/4);
    	$randCode = strval($randCode);
    	$image = imagecreatetruecolor($width,$height);
    	$gray = ImageColorAllocate($image,55,55,55);
    	imagefill($image,0,0,$gray);
    	for($i = 0;$i<4;$i++)
    	{
	    	$text_color = imagecolorallocate($image, rand(128,255), rand(128,255), rand(128,255));
			imagettftext($image,14,intval(rand(0,60)),10+$i*$par,23+rand(3,8), $text_color,'files/public/font/Symbola.ttf',$randCode[$i]);
    	}
    	for($i=0;$i<250;$i++)
		{
			$randcolor = ImageColorallocate($image,rand(0,255),rand(0,255),rand(0,255));
			imagesetpixel($image, rand(1,$width) , rand(1,$height) , $randcolor);
		}
    	imagepng($image);
		imagedestroy($image);
		return $randCode;
    }
}
?>