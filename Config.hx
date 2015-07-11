package spider;

// might want to move this to the app dir in the end
// leave it here for now or it'll get removed from the repo

class Config
{

	public var siteName:String = "Spider Web";
	public var siteEnabled:Bool = true;
	public var sitewideSSL:Bool = false;
	public var logging:Bool = true;

	// Database Options
	public var database(get, null):DatabaseDetails;
	public var localDatabase:DatabaseDetails;
	public var liveDatabase:DatabaseDetails;

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

	public function new() {
		
	}

	public function get_database():DatabaseDetails {
		if(Request.isLocal) {
			if(localDatabase == null){
				return liveDatabase;
			}
			
			return localDatabase;
		}

		return liveDatabase;
	}
}

enum DBType
{
	None;
	MySQL;
	SQLite3;
}
