package spider;

import php.Web;
import php.Session;

class Spider
{
	public var routes:RouteCollection = new RouteCollection();

	private var database:DB = new DB();

	public static var IP(get, null):String;
	public static var URI(get, null):String;
	public static var method(get, null):String;
	public static var secure(get, null):Bool;
	public static var AJAX(get, null):Bool;
	public static var loggedIn(get, null):Bool;

	public function new(){
		
	}

	// override this before you call run() 
	public function setupTables():Void {

	}

	public function run(url:String):Void {
		if(Config.sitewideSSL == true && secure == false) {
			makeSecure();
		}

		Session.start();

		database.connect();

		setupTables();
		routes.run(url);

		Session.close();

		Log.sayIt();
	}

	public function redirectToHome():Void {
		Web.redirect(Config.homeURL);
	}

	public function redirectToLost():Void {
		Web.redirect(Config.lostURL);
	}

	public function redirectToLogin():Void {
		Web.redirect(Config.loginURL);
	}

	public function redirectToLogout():Void {
		Web.redirect(Config.logoutURL);
	}

	public function redirectToError():Void {
		Web.redirect(Config.errorURL);
	}

	public function hashPassword(password:String, salt:String):String {
		return "";
	}

	public function generateSalt():String {
		return "";
	}

	public function makeSecure():Void {

	}

	public function sendEmails(emails:Map<String, String>):Void {
		
	}

	public function sendEmail(address:String, message:String):Void {

	}

	public function isIPAddress(address:String):Bool {
		return false;
	}

	public function isEmail(email:String):Bool {
		return false;
	}

	public function isURL(url:String):Bool {
		return false;
	}

	/*
	 * 	Getters and Setters 
	 */

	private static function get_URI():String {
		return Web.getURI();
	}

	private static function get_method():String {
		return Web.getMethod();
	}

	private static function get_IP():String {
		return Web.getClientIP();
	}

	private static function get_secure():Bool {
		return false;
	}

	private static function get_AJAX():Bool {
		return false;
	}

	private static function get_loggedIn():Bool {
		return false;
	}
}