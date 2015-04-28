package spider;

// miscellaneous helper functions 

class Utils
{
	public static function passwordsMatch(password:String, hash:String):Bool {
		return false;
	}

	public static function hashPassword(password:String, salt:String):String {
		return "";
	}

	public static function generateSalt():String {
		// use Spider.config.saltLength
		return "";
	}

	public static function sendEmails(emails:Map<String, String>):Void {
		
	}

	public static function sendEmail(address:String, message:String):Void {

	}

	public static function isIPAddress(address:String):Bool {
		return false;
	}

	public static function isEmailAddress(email:String):Bool {
		return false;
	}

	public static function isURL(url:String):Bool {
		return false;
	}

	public static function firstCharToUpper(text:String):String {
		var output = "";

		output += text.charAt(0).toUpperCase();
		output += text.substr(1);

		return output;
	}

	public static function firstCharToLower(text:String):String {
		var output = "";

		output += text.charAt(0).toLowerCase();
		output += text.substr(1);

		return output;
	}
}