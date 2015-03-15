package spider;

import sys.FileSystem;

import php.Web;
import php.Session;

import spider.Config.DBType;
import spider.Request;

class Spider
{
	public var routes:RouteCollection = new RouteCollection();

	// public static var request:Request;

	private var database:DB = new DB();

	public var setupTables:Void->Void;

	public static var secure(get, null):Bool;
	public static var loggedIn(get, null):Bool;

	// Might be a better way to do this, dunno 
	public static inline var version:Float = 0.01;

	public function new(){
		
	}

	public function run(url:String):Void {

		Request.start();

		if(Config.sitewideSSL == true) {
			makeSecure();
		}

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

		if(!FileSystem.isDirectory(Config.viewLocation)) {
			FileSystem.createDirectory(Config.viewLocation);
		}
	}

	public static function makeSecure():Void {
		if(!secure) {
			Web.setHeader("Location", "https://" + Request.host + Request.URI);
		}
	}

	

	/*
	 * 	Getters and Setters 
	 */

	private static function get_loggedIn():Bool {
		return false;
	}

	private static function get_secure():Bool {
		if(Request.port == "443") {
			return true;
		} else {
			return false;
		}
	}
}