package spider.options;

import spider.Config.DBType;
import spider.DatabaseDetails;

typedef SpiderOptions = {
	@:optional var name:String;
	@:optional var sitewideSSL:Bool;

	@:optional var passwordIterations:Int;
	@:optional var saltLength:Int;

	@:optional var localDatabase:DatabaseDetails;
	@:optional var liveDatabase:DatabaseDetails;

	@:optional var setupTables:Void->Void;
};