package spider;

import sys.FileSystem;

import haxe.web.Dispatch;

import php.Web;
import php.Session;

import spider.Config.DBType;
import spider.Request;

class Spider
{

	public static var config:Config = new Config();

	public static var url(get, set):String;

	private var database:DB = new DB();
	public var setupTables:Void->Void;

	public static var secure(get, null):Bool;
	public static var loggedIn(get, null):Bool;

	// Might be a better way to do this, dunno 
	public static inline var version:Float = 0.01;

	public function new(){
		
	}

	public function run(url:String):Void {
		Session.start();
		Request.start();

		// enforce ssl requirement
		if(config.sitewideSSL) {
			makeSecure();
		}

		// connect to and optionally set up the database 
		if(config.dbType != DBType.None) {
			database.connect();

			if(setupTables != null){
				setupTables();
			} else {
				Log.error("setupTables can not be null!");
			}
		}

		// run the current route 
		Dispatch.run(url, new haxe.ds.StringMap(), new app.controllers.HomeController());

		// close stuff
		if(config.dbType != DBType.None) {
			database.close();
		}

		Session.close();
	}

	public static function makeSecure():Void {
		if(!secure) {
			Web.setHeader("Location", "https://" + Request.host + url);
			Sys.exit(0);
		}
	}
	


	// Getters and Setters 

	private static function get_loggedIn():Bool {
		var loggedIn = true;
		var sv = Session.get(Spider.config.isLoggedIn);

		if(sv != true){
			loggedIn = false;
		}

		return loggedIn;
	}

	// TODO: This isn't reliable
	private static function get_secure():Bool {
		if(Request.port == "443") {
			return true;
		} else {
			return false;
		}
	}

	private static function get_url():String {
		return Web.getURI();
	}

	private static function set_url(url:String):String {
		Web.redirect(url);
		Sys.exit(0);

		return url;
	}
}