package spider;

import php.Web;
import haxe.ds.StringMap;

// A place to access all of the information about the current page request 

class Request
{

	public var host(get, null):String;
	public var method(get, null):String;
	public var params(get, null):StringMap<Int>;
	public var URI(get, null):String;
	public var ajax(get, null):Bool;
	public var IP(get, null):String;
	public var timeOfRequest(get, null):Date;
	public var browser(get, null):String;
	public var OS(get, null):String;
	public var language(get, null):String;

	private var now:Date;

	public function new(){
		now = Date.now();
	}

	/*
	 *	Getters & Setters 
	 */

	private function get_host():String {
		return Web.getHostName();
	}

	private function get_method():String {
		return Web.getMethod();
	}

	private function get_params():StringMap<Int> {
		return Web.getParams();
	}

	private function get_URI():String {
		return Web.getURI();
	}

	private function get_ajax():Bool {
		var result = false;

		untyped __php__("
			if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
				$result = true;
			}
		");

		return result;
	}

	private function get_IP():String {
		return Web.getClientIP();
	}

	private function get_timeOfRequest():Date {
		return now;
	}

	// TODO
	private function get_browser():String {
		return "";
	}

	// TODO
	private function get_OS():String {
		return "";
	}

	// TODO
	private function get_language():String {
		return "";
	}
}