package spider;

class Config
{

	public var dbType:DBType;
	public var dbUser:String;
	public var dbPass:String;
	public var dbLocation:String = "../protected/assets/data/spider.db";
	public var templatesLocation:String = "../protected/assets/templates/";

	public var lostURL:String = "/lost";
	public var loginURL:String = "/login";

	public function new(){
		
	}
}

enum DBType
{
	MySQL;
	SQLite3;
}