package spider;

class Config
{
	public static var siteName:String = "Spider Web";

	public static var sitewideSSL:Bool = false;
	public static var logging:Bool = true;

	// Database Options 
	public static var dbType:DBType = DBType.None;

	public static var dbHost:String;
	public static var dbPort:Int;
	public static var dbName:String = "spider"; // used by MySQL and SQLite3
	public static var dbSocket:String;
	public static var dbUser:String;
	public static var dbPass:String;

	// Important Locations 
	public static var dbLocation:String = "../protected/data/";
	public static var viewLocation:String = "../protected/views/";
	public static var logLocation:String = "../protected/logs/";

	// Common Redirects 
	public static var homeURL:String = "/";
	public static var lostURL:String = "/lost/";
	public static var loginURL:String = "/login/";
	public static var logoutURL:String = "/logout/";
	public static var errorURL:String = "/error/";

	// How many iterations should PBKDF2 work on new Passwords? 
	public static var passwordIterations:Int = 10000;
}

enum DBType
{
	None;
	MySQL;
	SQLite3;
}