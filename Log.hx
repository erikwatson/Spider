package spider;

import sys.io.File;
import sys.FileSystem;
import sys.io.FileOutput;

import spider.Spider;
import spider.Config;
import spider.Utils;

// Easily output Error messages, etc to a log file

class Log
{

	private static var output:String = "";
	private static var somethingToSay(get, null):Bool;

	public static function message(str:String) {
		var messageOutput:String = "";

		messageOutput += Utils.getTimeFormatted();
		messageOutput += " : ";
		messageOutput += str;
		messageOutput += "\n \n";

		output += messageOutput;

		sayIt();
	}

	// same as a message but with different formatting
	public static function warning(str:String) {
		var messageOutput:String = "";

		messageOutput += Utils.getTimeFormatted();
		messageOutput += " : ";
		messageOutput += "**Warning : **";
		messageOutput += str;
		messageOutput += "\n \n";

		output += messageOutput;

		sayIt();
	}

	// same as a message but with different formatting 
	public static function error(str:String) {
		var messageOutput:String = "";

		messageOutput += Utils.getTimeFormatted();
		messageOutput += " : ";
		messageOutput += "**Error : **";
		messageOutput += str;
		messageOutput += "\n \n";

		output += messageOutput;

		sayIt();

		throw messageOutput;
	}

	// TODO: Clean this up a bit 
	private static function sayIt():Void {
		if(somethingToSay && Spider.config.logging){

			var filePath:String = '${Spider.config.logLocation}';
			var fileExtension:String = ".md";

			filePath += Utils.getUKDateFormat();
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