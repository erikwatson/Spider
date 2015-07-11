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

import app.controllers.*;

class Spider
{

	// Might be a better way to do this, dunno
	public static inline var version:Float = 0.01;

	private var database:DB = new DB();
	public var setupTables:Void->Void;

	public static var config:Config = new Config();
	public static var url(get, set):String;

	public function new(options:SpiderOptions) {
		try {

			if(options.dbType == DBType.MySQL) {
				if (options.dbName 		== null ||
					options.dbHost 		== null ||
					options.dbPass 		== null ||
					options.dbPort 		== null ||
					options.dbSocket 	== null ||
					options.dbUser 		== null )
				{
					Log.error("Some MySQL options are missing.");
				} else {
					config.database.dbName 	= options.dbName;
					config.database.dbHost 	= options.dbHost;
					config.database.dbPass 	= options.dbPass;
					config.database.dbPort 	= options.dbPort;
					config.database.dbSocket = options.dbSocket;
					config.database.dbUser 	= options.dbUser;
				}
			}

			if(options.dbType == DBType.SQLite3) {
				if(options.dbName == null){
					Log.error("Must set a dbName when using SQLite3.");
				} else {
					config.database.dbName = options.dbName;
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

	public function run():Void {
		Session.start();
		Request.start();

		// enforce ssl requirement
		if(config.sitewideSSL) {
			makeSecure();
		}

		// remove trailing slashes from the url
		// because Dispatch doesn't seem to like them very much 
		// this works but i'm turning it off for now, doesn't seem like a good idea :( 
		if(hasTrailingSlash(url)) {
			// url = removeTrailingSlash(url);
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

		try {
			Dispatch.run(
				url,
				new haxe.ds.StringMap(),
				new app.routes.Routes() // wanted this to be configurable, not sure I can with Type :( 
			);
		} catch(e:Dynamic) { // i actually don't know what the real type of this error is but whatever, man! 
			// should probably log the error here 
			url = config.lostURL;
		}

		// close stuff
		if(config.database.dbType != DBType.None) {
			database.close();
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
