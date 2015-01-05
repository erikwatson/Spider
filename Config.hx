package spider;

class Config
{
	public var sitewideSSL:Bool = false;

	// Database Options 
	public var dbType:DBType;

	public var dbHost:String;
	public var dbPort:String;
	public var dbName:String = "spider"; // used by MySQL and SQLite3
	public var dbSocket:String;
	public var dbUser:String;
	public var dbPass:String;

	// Important Locations 
	public var dbLocation:String = "../protected/assets/data/";
	public var templatesLocation:String = "../protected/assets/templates/";
	public var logLocation:String = "../protected/assets/logs/";

	// Common Redirects 
	public var homeURL:String = "/";
	public var lostURL:String = "/lost";
	public var loginURL:String = "/login";
	public var logoutURL:String = "/logout";

	// How many iterations should PBKDF2 work on new Passwords? 
	public var passwordIterations:Int = 10000;

	public function new(){
		
	}
}

enum DBType
{
	MySQL;
	SQLite3;
}