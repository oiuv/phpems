<?php
/*
 * Created on 2011-10-29
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class editor
{
	const version = '3.6.2';
	const timestamp = 'B8DJ5M3';
	public $basePath = 'files/public/ckeditor/';
	public $config = array();
	public $initialized = false;
	public $returnOutput = true;
	public $textareaAttributes = array( "rows" => 8, "cols" => 60 );
	public $timestamp = "B8DJ5M3";
	private $events = array();
	private $globalEvents = array();
	public function __construct($basePath = null) {
		if ($basePath) {
			$this->basePath = $basePath;
		}
		$this->basePath = 'files/public/ckeditor/';
	}

	//生成ckeditor编辑器
	public function editor($name, $value = "", $config = array(), $events = array())
	{
		$attr = "";
		foreach ($this->textareaAttributes as $key => $val) {
			$attr.= " " . $key . '="' . str_replace('"', '&quot;', $val) . '"';
		}
		$out = "<textarea name=\"args[" . $name . "]\"" . $attr . ">" . htmlspecialchars($value) . "</textarea>\n";
		if (!$this->initialized) {
			$out .= $this->init();
		}

		$_config = $this->configSettings($config, $events);

		$js = $this->returnGlobalEvents();
		if (!empty($_config))
			$js .= "CKEDITOR.replace('args[".$name."]', ".$this->jsEncode($_config).");";
		else
			$js .= "CKEDITOR.replace('args[".$name."]');";

		$out .= $this->script($js);

		if (!$this->returnOutput) {
			print $out;
			$out = "";
		}

		return $out;
	}

	public function replace($id, $config = array(), $events = array())
	{
		$out = "";
		if (!$this->initialized) {
			$out .= $this->init();
		}

		$_config = $this->configSettings($config, $events);

		$js = $this->returnGlobalEvents();
		if (!empty($_config)) {
			$js .= "CKEDITOR.replace('".$id."', ".$this->jsEncode($_config).");";
		}
		else {
			$js .= "CKEDITOR.replace('".$id."');";
		}
		$out .= $this->script($js);

		if (!$this->returnOutput) {
			print $out;
			$out = "";
		}

		return $out;
	}

	public function replaceAll($className = null)
	{
		$out = "";
		if (!$this->initialized) {
			$out .= $this->init();
		}

		$_config = $this->configSettings();

		$js = $this->returnGlobalEvents();
		if (empty($_config)) {
			if (empty($className)) {
				$js .= "CKEDITOR.replaceAll();";
			}
			else {
				$js .= "CKEDITOR.replaceAll('".$className."');";
			}
		}
		else {
			$classDetection = "";
			$js .= "CKEDITOR.replaceAll( function(textarea, config) {\n";
			if (!empty($className)) {
				$js .= "	var classRegex = new RegExp('(?:^| )' + '". $className ."' + '(?:$| )');\n";
				$js .= "	if (!classRegex.test(textarea.className))\n";
				$js .= "		return false;\n";
			}
			$js .= "	CKEDITOR.tools.extend(config, ". $this->jsEncode($_config) .", true);";
			$js .= "} );";

		}

		$out .= $this->script($js);

		if (!$this->returnOutput) {
			print $out;
			$out = "";
		}

		return $out;
	}

	public function addEventHandler($event, $javascriptCode)
	{
		if (!isset($this->events[$event])) {
			$this->events[$event] = array();
		}
		// Avoid duplicates.
		if (!in_array($javascriptCode, $this->events[$event])) {
			$this->events[$event][] = $javascriptCode;
		}
	}

	public function clearEventHandlers($event = null)
	{
		if (!empty($event)) {
			$this->events[$event] = array();
		}
		else {
			$this->events = array();
		}
	}

	public function addGlobalEventHandler($event, $javascriptCode)
	{
		if (!isset($this->globalEvents[$event])) {
			$this->globalEvents[$event] = array();
		}
		// Avoid duplicates.
		if (!in_array($javascriptCode, $this->globalEvents[$event])) {
			$this->globalEvents[$event][] = $javascriptCode;
		}
	}

	public function clearGlobalEventHandlers($event = null)
	{
		if (!empty($event)) {
			$this->globalEvents[$event] = array();
		}
		else {
			$this->globalEvents = array();
		}
	}

	private function script($js)
	{
		$out = "<script type=\"text/javascript\">";
		$out .= "//<![CDATA[\n";
		$out .= $js;
		$out .= "\n//]]>";
		$out .= "</script>\n";

		return $out;
	}

	private function configSettings($config = array(), $events = array())
	{
		$_config = $this->config;
		$_events = $this->events;

		if (is_array($config) && !empty($config)) {
			$_config = array_merge($_config, $config);
		}

		if (is_array($events) && !empty($events)) {
			foreach ($events as $eventName => $code) {
				if (!isset($_events[$eventName])) {
					$_events[$eventName] = array();
				}
				if (!in_array($code, $_events[$eventName])) {
					$_events[$eventName][] = $code;
				}
			}
		}

		if (!empty($_events)) {
			foreach($_events as $eventName => $handlers) {
				if (empty($handlers)) {
					continue;
				}
				else if (count($handlers) == 1) {
					$_config['on'][$eventName] = '@@'.$handlers[0];
				}
				else {
					$_config['on'][$eventName] = '@@function (ev){';
					foreach ($handlers as $handler => $code) {
						$_config['on'][$eventName] .= '('.$code.')(ev);';
					}
					$_config['on'][$eventName] .= '}';
				}
			}
		}

		return $_config;
	}

	private function returnGlobalEvents()
	{
		static $returnedEvents;
		$out = "";

		if (!isset($returnedEvents)) {
			$returnedEvents = array();
		}

		if (!empty($this->globalEvents)) {
			foreach ($this->globalEvents as $eventName => $handlers) {
				foreach ($handlers as $handler => $code) {
					if (!isset($returnedEvents[$eventName])) {
						$returnedEvents[$eventName] = array();
					}
					// Return only new events
					if (!in_array($code, $returnedEvents[$eventName])) {
						$out .= ($code ? "\n" : "") . "CKEDITOR.on('". $eventName ."', $code);";
						$returnedEvents[$eventName][] = $code;
					}
				}
			}
		}

		return $out;
	}

	private function init()
	{
		static $initComplete;
		$out = "";

		if (!empty($initComplete)) {
			return "";
		}

		if ($this->initialized) {
			$initComplete = true;
			return "";
		}

		$args = "";
		$ckeditorPath = $this->ckeditorPath();

		if (!empty($this->timestamp) && $this->timestamp != "%"."TIMESTAMP%") {
			$args = '?t=' . $this->timestamp;
		}

		// Skip relative paths...
		if (strpos($ckeditorPath, '..') !== 0) {
			$out .= $this->script("window.CKEDITOR_BASEPATH='". $ckeditorPath ."';");
		}

		$out .= "<script type=\"text/javascript\" src=\"" . $ckeditorPath . 'ckeditor.js' . $args . "\"></script>\n";

		$extraCode = "";
		if ($this->timestamp != self::timestamp) {
			$extraCode .= ($extraCode ? "\n" : "") . "CKEDITOR.timestamp = '". $this->timestamp ."';";
		}
		if ($extraCode) {
			$out .= $this->script($extraCode);
		}

		$initComplete = $this->initialized = true;

		return $out;
	}

	/**
	 * Return path to ckeditor.js.
	 */
	private function ckeditorPath()
	{
		if (!empty($this->basePath)) {
			return $this->basePath;
		}

		/**
		 * The absolute pathname of the currently executing script.
		 * Note: If a script is executed with the CLI, as a relative path, such as file.php or ../file.php,
		 * $_SERVER['SCRIPT_FILENAME'] will contain the relative path specified by the user.
		 */
		if (isset($_SERVER['SCRIPT_FILENAME'])) {
			$realPath = dirname($_SERVER['SCRIPT_FILENAME']);
		}
		else {
			/**
			 * realpath - Returns canonicalized absolute pathname
			 */
			$realPath = realpath( './' ) ;
		}

		/**
		 * The filename of the currently executing script, relative to the document root.
		 * For instance, $_SERVER['PHP_SELF'] in a script at the address http://example.com/test.php/foo.bar
		 * would be /test.php/foo.bar.
		 */
		$selfPath = dirname($_SERVER['PHP_SELF']);
		$file = str_replace("\\", "/", __FILE__);

		if (!$selfPath || !$realPath || !$file) {
			return "/ckeditor/";
		}

		$documentRoot = substr($realPath, 0, strlen($realPath) - strlen($selfPath));
		$fileUrl = substr($file, strlen($documentRoot));
		$ckeditorUrl = str_replace("ckeditor_php5.php", "", $fileUrl);

		return $ckeditorUrl;
	}

	/**
	 * This little function provides a basic JSON support.
	 *
	 * @param mixed $val
	 * @return string
	 */
	private function jsEncode($val)
	{
		if (is_null($val)) {
			return 'null';
		}
		if (is_bool($val)) {
			return $val ? 'true' : 'false';
		}
		if (is_int($val)) {
			return $val;
		}
		if (is_float($val)) {
			return str_replace(',', '.', $val);
		}
		if (is_array($val) || is_object($val)) {
			if (is_array($val) && (array_keys($val) === range(0,count($val)-1))) {
				return '[' . implode(',', array_map(array($this, 'jsEncode'), $val)) . ']';
			}
			$temp = array();
			foreach ($val as $k => $v){
				$temp[] = $this->jsEncode("{$k}") . ':' . $this->jsEncode($v);
			}
			return '{' . implode(',', $temp) . '}';
		}
		// String otherwise
		if (strpos($val, '@@') === 0)
			return substr($val, 2);
		if (strtoupper(substr($val, 0, 9)) == 'CKEDITOR.')
			return $val;

		return '"' . str_replace(array("\\", "/", "\n", "\t", "\r", "\x08", "\x0c", '"'), array('\\\\', '\\/', '\\n', '\\t', '\\r', '\\b', '\\f', '\"'), $val) . '"';
	}
}
?>
