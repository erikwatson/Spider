package spider;

import spider.Config;
import sys.io.File;
import sys.FileSystem;

// Easily output Error messages, etc to a log file
// Might be cool to have it expect Markdown, so we can make a nice on-site log viewer. 

class Log
{

	private static var output:String = "";
	private static var somethingToSay(get, null):Bool;

	public static function add(message:String) {
		var messageOutput:String = "";

		messageOutput += Date.now().toString();
		messageOutput += ": ";
		messageOutput += message;
		messageOutput += "\n";

		output += messageOutput;
	}

	public static function sayIt():Void {
		Log.add("Error: Test Message");
		Log.add("Error: Test Message2");

		if(somethingToSay){

			// write to a different log file for every day 
			var day:Int;
			var month:Int;
			var year:Int;

			var filePath:String = '${Config.logLocation}';
			var fileExtension:String = ".md";

			day = Date.now().getDate();
			month = Date.now().getMonth() + 1;
			year = Date.now().getFullYear();

			if(year < 10) {
				filePath += '0$year';
			} else {
				filePath += '$year';
			}

			filePath += "-";

			if(month < 10) {
				filePath += '0$month';
			} else {
				filePath += '$month';
			}

			filePath += "-";

			if(day < 10) {
				filePath += '0$day';
			} else {
				filePath += '$day';
			}

			filePath += fileExtension;

			if(FileSystem.exists(filePath)) {
				//trace("Yup");
			} else {
				//trace("Nope");
			}

			// if a File already exists at filePath then open it
			// otherwise, make a new File there

			// change the File contents

			// save the file 

			output = "";
		}
	}

	/*
	 *	Getters and Setters
	 */

	private static function get_somethingToSay():Bool {
		if(output != ""){
			return true;
		} else {
			return false;
		}
	}
}