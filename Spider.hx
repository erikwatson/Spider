package spider;

import app.controllers.*;

import haxe.web.Dispatch;

import php.Lib;
import php.Session;
import php.Web;

import spider.BlackList;
import spider.Config.DBType;
import spider.Log;
import spider.Request;
import spider.SpiderOptions;

import sys.FileSystem;

class Spider
{

	// Might be a better way to do this, dunno
	public static inline var version:Float = 0.01;

	private var database:DB = new DB();
	public var setupTables:Void->Void;

	public var blackList:BlackList = new BlackList();
	public static var config:Config = new Config();
	public static var url(get, set):String;

	public function new(options:SpiderOptions) {

		// pass the databases to the config
		if(options.database == null && options.localDatabase == null){
			config.database.dbType = DBType.None;
		}

		if(options.database != null) {
			config.liveDatabase = options.database;
		}

		if(options.localDatabase != null){
			config.localDatabase = options.localDatabase;
		}

		// connect
		try {

			// MySQL Connection
			if(options.database.dbType == DBType.MySQL) {
				if (
					options.database.dbName 	== null ||
					options.database.dbHost 	== null ||
					options.database.dbPass 	== null ||
					options.database.dbPort 	== null ||
					options.database.dbSocket 	== null ||
					options.database.dbUser 	== null
				){
					Log.error("Some MySQL options are missing.");
				} else {
					config.database.dbName 		= options.database.dbName;
					config.database.dbHost 		= options.database.dbHost;
					config.database.dbPass 		= options.database.dbPass;
					config.database.dbPort 		= options.database.dbPort;
					config.database.dbSocket 	= options.database.dbSocket;
					config.database.dbUser 		= options.database.dbUser;
				}
			}

			// SQLite3 Connection
			if(options.database.dbType == DBType.SQLite3) {
				if(options.database.dbName == null){
					Log.error("Must set a dbName when using SQLite3.");
				} else {
					config.database.dbName = options.database.dbName;
				}

				if(options.setupTables == null){
					Log.error("Must have a setupTables function when using a database.");
				} else {
					setupTables = options.setupTables;
				}
			}

			// No connection - left this here just in case we want to do
			// something here later on
			if(options.database.dbType == DBType.None) {

			}

		} catch(e:String) {
			Lib.println('$e <br />');
			Sys.exit(1);
		}
	}

	public function run():Void {
		Session.start();
		Request.start();

		// enforce ssl requirement
		if(config.sitewideSSL) {
			makeSecure();
		}

		// connect to and optionally set up the database
		if(config.database.dbType != DBType.None) {
			database.connect();

			if(setupTables != null){
				setupTables();
			} else {
				Log.error("setupTables can not be null!");
			}
		}

		// Run the Route
		try {
			Dispatch.run(
				url,
				new haxe.ds.StringMap(),
				new app.routes.Routes() // wanted this to be configurable, not sure I can with Type :(
			);
		} catch(e:Dynamic) { // I actually don't know what the real type of this error is but whatever, man!
			url = config.lostURL;
		}

		// Close Down
		if(config.database.dbType != DBType.None) {
			database.close();
		}

		for(line in blackList.contents) {
			trace(line);
		}

		Session.close();
	}

	public static function makeSecure():Void {
		if(!Request.isSecure) {
			Web.setHeader("Location", "https://" + Request.host + url);
			Sys.exit(0);
		}
	}

	public static function hasTrailingSlash(s:String):Bool {
		if(s.charAt(s.length - 1) == "/") {
			return true;
		}

		return false;
	}

	public static function removeTrailingSlash(s:String):String {
		return s.substr(0, s.length - 1);
	}



	// Getters and Setters

	private static function get_url():String {
		return Web.getURI();
	}

	private static function set_url(url:String):String {
		Web.redirect(url);
		Sys.exit(0);

		return url;
	}
}
