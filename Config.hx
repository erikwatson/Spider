package spider;

// might want to move this to the app dir in the end
// leave it here for now or it'll get removed from the repo 

class Config
{
	public var siteName:String = "Spider Web";

	public var sitewideSSL:Bool = false;
	public var logging:Bool = true;

	// Database Options 
	public var dbType:DBType = DBType.None;

	public var dbHost:String;
	public var dbPort:Int;
	public var dbName:String = "spider"; // used by MySQL and SQLite3
	public var dbSocket:String;
	public var dbUser:String;
	public var dbPass:String;

	// Important Locations 
	public var dbLocation:String = "../private/data/"; // used by SQLite Only 
	public var viewLocation:String = "../private/views/";
	public var logLocation:String = "../private/logs/";

	// Common Redirects 
	public var homeURL:String = "/";
	public var lostURL:String = "/lost/";
	public var loginURL:String = "/login/";
	public var logoutURL:String = "/logout/";
	public var errorURL:String = "/error/";

	// How many iterations should PBKDF2 work on new Passwords? 
	public var passwordIterations:Int = 10000;
	public var saltLength:Int = 32;

	// Session variable names
	public var isLoggedIn:String = "is_logged_in";
}

enum DBType
{
	None;
	MySQL;
	SQLite3;
}