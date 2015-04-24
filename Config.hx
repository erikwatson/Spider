package spider;

class Config
{
	public static inline var siteName:String = "Spider Web";

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
	public static inline var dbLocation:String = "../private/data/"; // used by SQLite Only 
	public static inline var viewLocation:String = "../private/views/";
	public static inline var logLocation:String = "../private/logs/";

	// Common Redirects 
	public static inline var homeURL:String = "/";
	public static inline var lostURL:String = "/lost/";
	public static inline var loginURL:String = "/login/";
	public static inline var logoutURL:String = "/logout/";
	public static inline var errorURL:String = "/error/";

	// How many iterations should PBKDF2 work on new Passwords? 
	public static var passwordIterations:Int = 10000;

	// Session variable names
	public static inline var isLoggedIn:String = "is_logged_in";
}

enum DBType
{
	None;
	MySQL;
	SQLite3;
}