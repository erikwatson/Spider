package spider;

import spider.Config.DBType;

typedef DatabaseDetails = {
	public var dbType:DBType;
	
	public var dbHost:String;
	public var dbPort:Int;
	public var dbName:String; // used by MySQL and SQLite3
	public var dbSocket:String;
	public var dbUser:String;
	public var dbPass:String;
};