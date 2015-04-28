package spider;

import sys.io.File;
import sys.FileSystem;
import sys.io.FileOutput;

import spider.Spider;
import spider.Config;

// Easily output Error messages, etc to a log file

class Log
{

	private static var output:String = "";
	private static var somethingToSay(get, null):Bool;

	public static function message(str:String) {
		var messageOutput:String = "";

		messageOutput += getTime();
		messageOutput += " : ";
		messageOutput += str;
		messageOutput += "\n \n";

		output += messageOutput;

		sayIt();
	}

	// same as a message but with different formatting
	public static function warning(str:String) {
		var messageOutput:String = "";

		messageOutput += getTime();
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

		messageOutput += getTime();
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

			filePath += getUKDateFormat();
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

	private static function getUKDateFormat():String {
		var output = "";

		var day:Int;
		var month:Int;
		var year:Int;

		day = Date.now().getDate();
		month = Date.now().getMonth() + 1;
		year = Date.now().getFullYear();

		if(day < 10) {
			output += '0$day';
		} else {
			output += '$day';
		}

		output += "-";

		if(month < 10) {
			output += '0$month';
		} else {
			output += '$month';
		}

		output += "-";

		if(year < 10) {
			output += '0$year';
		} else {
			output += '$year';
		}

		return output;
	}

	private static function getTime():String {
		var output = "";
		var now = Date.now();

		var hours;
		var minutes;
		var seconds;

		if(now.getHours() < 10){
			hours = '0${now.getHours()}';
		} else {
			hours = '${now.getHours()}';
		}

		if(now.getMinutes() < 10){
			minutes = '0${now.getMinutes()}';
		} else {
			minutes = '${now.getMinutes()}';
		}

		if(now.getSeconds() < 10){
			seconds = '0${now.getSeconds()}';
		} else {
			seconds = '${now.getSeconds()}';
		}



		output = '$hours:$minutes:$seconds';

		return output;
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