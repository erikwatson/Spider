package spider;

typedef SpiderOptions = {
	@:optional var name:String;
	@:optional var sitewideSSL:Bool;

	@:optional var passwordIterations:Int;
	@:optional var saltLength:Int;

	@:optional var localDatabase:DatabaseDetails;
	@:optional var database:DatabaseDetails;

	@:optional var setupTables:Void->Void;
};