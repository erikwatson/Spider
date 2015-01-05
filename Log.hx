package spider;

// Easily output Error messages, etc to a log file
// Might be cool to have it expect Markdown, so we can make a nice on-site log viewer. 

class Log
{

	private static var output:String = "";
	private static var somethingToSay(get, null):Bool;

	public static function add(message:String) {

	}

	public static function sayIt():Void {
		if(somethingToSay){
			// write the contents of output 
			// to a log file in Config.logLocation 

			// perhaps smarter to save in a database if available
			// then output to file and clear the db every hour or so? 

			// write to a different log file for every day 
		}
	}

	/*
	 *	Getters and Setters
	 */

	private static function get_somethingToSay():Bool {
		return false;
	}
}