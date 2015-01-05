package spider;

// system stuff 
import sys.db.Connection;
import sys.db.Object;
import sys.db.Manager;

// php stuff
import php.db.PDO;

import spider.Config;

class DB
{

	public var connected(get, null):Bool;
	private var isConnected:Bool = false;

	private var dbConnect:Connection;

	public function new(){
		
	}

	public function connect():Void {

		try {
			if(!isConnected) {

				if(Config.dbType != null) {
					switch (Config.dbType) {
						case DBType.MySQL:
							connectMySQL();
							Manager.cnx = dbConnect;
							Manager.initialize();

						case DBType.SQLite3:
							connectSQLite();
							Manager.cnx = dbConnect;
							Manager.initialize();

						default:
							throw "Error: Database Connection Error!";
					}
				} else {
					throw "Error: Database Connection Error!";
				}
			}
		} catch(e:String) {
			trace(e);
		}
	}

	private function connectMySQL():Void {
		if(Config.dbHost == null || Config.dbPort == null || Config.dbUser == null || Config.dbPass == null || Config.dbName == null) {
			throw "Error: Database Connection Error!";
		} else {
			dbConnect = sys.db.Mysql.connect(
				{
					host : Config.dbHost,
					port : Config.dbPort,
					user : Config.dbUser,
					pass : Config.dbPass,
					socket: Config.dbSocket,
					database : Config.dbName
				}
			);

			isConnected = true;
		}
	}

	private function connectSQLite():Void {
		var path = Config.dbLocation += Config.dbName += ".db";

		trace(path);

		if(path == null) {
			throw "Error: Database Connection Error!";
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