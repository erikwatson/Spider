package spider.options;

import spider.Config.DBType;

typedef SpiderOptions = {
	@:optional var name:String;
	@:optional var sitewideSSL:Bool;

	@:optional var passwordIterations:Int;
	@:optional var saltLength:Int;

	@:optional var dbType:DBType;
	@:optional var dbHost:String;
	@:optional var dbPort:Int;
	@:optional var dbName:String;
	@:optional var dbSocket:String;
	@:optional var dbUser:String;
	@:optional var dbPass:String;

	@:optional var setupTables:Void->Void;
};