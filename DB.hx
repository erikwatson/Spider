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
			if(Spider.config.database.dbType != null) {
				switch (Spider.config.database.dbType) {
					case DBType.MySQL:
						connectMySQL();
						Manager.cnx = dbConnect;
						Manager.initialize();

					case DBType.SQLite3:
						connectSQLite();
						Manager.cnx = dbConnect;
						Manager.initialize();

					default:
						Log.error("Unexpected DB Type.");
				}
			} else {
				Log.error("DB Type can not be null.");
			}
		}
	}

	private function connectMySQL():Void {
		if(
			Spider.config.database.dbHost == null ||
		    Spider.config.database.dbPort == null ||
		    Spider.config.database.dbUser == null ||
		    Spider.config.database.dbPass == null ||
		    Spider.config.database.dbName == null
		) {
			Log.error("There is a problem with your MySQL Connection settings.");
		} else {
			dbConnect = sys.db.Mysql.connect(
				{
					host 	 : Spider.config.database.dbHost,
					port	 : Spider.config.database.dbPort,
					user	 : Spider.config.database.dbUser,
					pass 	 : Spider.config.database.dbPass,
					socket	 : Spider.config.database.dbSocket,
					database : Spider.config.database.dbName
				}
			);

			isConnected = true;
		}
	}

	private function connectSQLite():Void {
		var path = Spider.config.dbLocation;

		path += Spider.config.database.dbName;
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
