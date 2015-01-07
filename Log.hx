package spider;

import sys.io.File;
import sys.FileSystem;
import sys.io.FileOutput;

import spider.Spider;
import spider.Config;

// Easily output Error messages, etc to a log file
// Might be cool to have it expect Markdown, so we can make a nice on-site log viewer. 

class Log
{

	private static var output:String = "";
	private static var somethingToSay(get, null):Bool;

	public static function add(message:String) {
		var messageOutput:String = "";

		messageOutput += Spider.request.timeOfRequest.toString();
		messageOutput += ": ";
		messageOutput += message;
		messageOutput += "\n \n";

		output += messageOutput;
	}

	// TODO: Clean this up a bit 
	public static function sayIt():Void {
		if(somethingToSay == true && Config.logging == true){

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

			var file;

			if(FileSystem.exists(filePath)) {
				file = File.append(filePath, false);
			} else {
				file = File.write(filePath, false);
			}

			file.writeString(output);

			file.close();

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