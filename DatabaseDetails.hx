package spider;

import spider.Config.DBType;

typedef DatabaseDetails = {
	public var dbType:DBType;
	public var dbName:String; // used by MySQL and SQLite3

	@:optional public var dbHost:String;
	@:optional public var dbPort:Int;
	@:optional public var dbSocket:String;
	@:optional public var dbUser:String;
	@:optional public var dbPass:String;
};