package spider;

import haxe.ds.StringMap;

import php.Web;

// A place to access all of the information about the current page request 

class Request
{

	public static var host(get, null):String;
	public static var method(get, null):String;
	public static var params(get, null):StringMap<Int>;
	public static var URI(get, null):String;
	public static var isAJAX(get, null):Bool;
	public static var IP(get, null):String;
	public static var port(get, null):String;
	public static var date(get, null):Date;
	public static var browser(get, null):String;
	public static var OS(get, null):String;
	public static var language(get, null):String;
	// public static var headers(get, null):String;

	private static var now:Date;

	public static function start():Void {
		now = Date.now();
	}

	/*
	 *	Getters & Setters 
	 */

	private static function get_host():String {
		return Web.getHostName();
	}

	private static function get_method():String {
		return Web.getMethod();
	}

	private static function get_params():StringMap<Int> {
		return Web.getParams();
	}

	private static function get_URI():String {
		return Web.getURI();
	}

	private static function get_isAJAX():Bool {
		var result = false;

		untyped __php__("
			if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
				$result = true;
			}
		");

		return result;
	}

	private static function get_IP():String {
		return Web.getClientIP();
	}

	public static function get_port():String {
		return untyped __var__('_SERVER', 'SERVER_PORT');
	}

	private static function get_date():Date {
		return now;
	}

	// TODO
	private static function get_browser():String {
		return "";
	}

	// TODO
	private static function get_OS():String {
		return "";
	}

	// TODO
	private static function get_language():String {
		var lang:String = untyped __php__("$_SERVER['HTTP_ACCEPT_LANGUAGE']");
		return lang.substr(0, 2);
	}
}