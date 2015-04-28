package spider;

// system stuff 
import sys.db.Connection;
import sys.db.Object;
import sys.db.Manager;

// php stuff
import php.db.PDO;
import php.Web;

import spider.Config;
import spider.Log;

class DB
{

	public var connected(get, null):Bool;
	private var isConnected:Bool = false;

	private var dbConnect:Connection;

	public function new(){
		
	}

	public function connect():Void {

		if(!isConnected) {

			if(Spider.config.dbType != null) {
				switch (Spider.config.dbType) {
					case DBType.MySQL:
						connectMySQL();
						Manager.cnx = dbConnect;
						Manager.initialize();
						
					case DBType.SQLite3:
						connectSQLite();
						Manager.cnx = dbConnect;
						Manager.initialize();

					default:
						Log.add("**Error:** Unexpected DB Type.");
				}
			} else {
				Log.add("**Error:** DB Type can not be null.");
			}
		}
	}

	private function connectMySQL():Void {
		if(Spider.config.dbHost == null || Spider.config.dbPort == null || Spider.config.dbUser == null || Spider.config.dbPass == null || Spider.config.dbName == null) {
			Log.add("**Error:** There is a problem with your MySQL Connection settings.");
		} else {
			dbConnect = sys.db.Mysql.connect(
				{
					host : Spider.config.dbHost,
					port : Spider.config.dbPort,
					user : Spider.config.dbUser,
					pass : Spider.config.dbPass,
					socket: Spider.config.dbSocket,
					database : Spider.config.dbName
				}
			);

			isConnected = true;
		}
	}

	private function connectSQLite():Void {
		var path = Spider.config.dbLocation;

		path += Spider.config.dbName;
		path += ".db";

		if(path == null) {
			throw "**Error:** Database Connection Error!";
		} else {
			dbConnect = sys.db.Sqlite.open(path);
			isConnected = true;
		}
	}

	public function close():Void {
		if(isConnected) {
			dbConnect.close();
		}
	}

	public function get_connected():Bool {
		return isConnected;
	}

}