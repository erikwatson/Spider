package spider;

import sys.FileSystem;

import haxe.web.Dispatch;

import php.Web;
import php.Session;
import php.Lib;

import spider.Config.DBType;
import spider.Request;
import spider.options.SpiderOptions;
import spider.Log;

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

	public function new(options:SpiderOptions) {
		try {

			if(options.dbType == DBType.MySQL) {
				if (options.dbName == null ||
					options.dbHost == null ||
					options.dbPass == null ||
					options.dbPort == null ||
					options.dbSocket == null ||
					options.dbUser == null)
				{
					Log.error("Some MySQL options are missing.");
				} else {
					config.dbName = options.dbName;
					config.dbHost = options.dbHost;
					config.dbPass = options.dbPass;
					config.dbPort = options.dbPort;
					config.dbSocket = options.dbSocket;
					config.dbUser = options.dbUser;
				}
			}

			if(options.dbType == DBType.SQLite3) {
				if(options.dbName == null){
					Log.error("Must set a dbName when using SQLite3.");
				} else {
					config.dbName = options.dbName;
				}

				if(options.setupTables == null){
					Log.error("Must have a setupTables function when using a database.");
				} else {
					setupTables = options.setupTables;
				}
			}

			if(options.dbType == DBType.None) {

			}

		} catch(e:String) {
			Lib.println('$e <br />');
			Sys.exit(1);
		}
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

	// apply a list of filters to a list of routes
	public function filter(routes:Array<Dynamic>, filters:Array<Dynamic>) {
		// TODO
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

	private static function get_secure():Bool {
		var result = false;

		untyped __php__("
			if (isset($_SERVER['HTTPS'])){
				$result = true;
			}
		");

		if(result == false){
			if(Request.port == "443") {
				result = true;
			}
		}

		return result;
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
