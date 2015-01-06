package spider;

import sys.FileSystem;

import php.Web;
import php.Session;

import spider.Config.DBType;
import spider.Request;

class Spider
{
	public var routes:RouteCollection = new RouteCollection();

	public static var request:Request;

	private var database:DB = new DB();

	public var setupTables:Void->Void;

	public static var secure(get, null):Bool;
	public static var loggedIn(get, null):Bool;

	public function new(){
		
	}

	public function run(url:String):Void {
		// SSL is important, do this first! 
		if(Config.sitewideSSL == true && secure == false) {
			makeSecure();
		}

		request = new Request();

		// probably shouldn't be running this on every request? 
		createDirectories();

		Session.start();

		if(Config.dbType != DBType.None) {
			database.connect();

			if(setupTables != null){
				setupTables();
			} else {
				Log.add("**Error:** setupTables can not be null!");
			}
		}

		routes.run(url);

		if(Config.dbType != DBType.None) {
			database.close();
		}

		Session.close();

		Log.sayIt();
	}

	// create the directory structure if it doesn't already exist 
	private function createDirectories():Void {
		if(!FileSystem.isDirectory(Config.logLocation)) {
			FileSystem.createDirectory(Config.logLocation);
		}

		if(!FileSystem.isDirectory(Config.dbLocation)) {
			FileSystem.createDirectory(Config.dbLocation);
		}

		if(!FileSystem.isDirectory(Config.templatesLocation)) {
			FileSystem.createDirectory(Config.templatesLocation);
		}
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

	private static function get_loggedIn():Bool {
		return false;
	}

	private static function get_secure():Bool {
		return false;
	}
}