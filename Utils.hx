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

	public static function generateSalt(length:Int = 32):String {
		return "";
	}

	public static function sendEmails(emails:Map<String, String>):Void {
		
	}

	public static function sendEmail(address:String, message:String):Void {

	}

	public static function isIPAddress(address:String):Bool {
		return false;
	}

	public static function isEmail(email:String):Bool {
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
}