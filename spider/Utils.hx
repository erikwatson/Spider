package spider;

// I don't like this being as global as it is 
// also it only holds date/time stuff at the moment, so even the name is dumb 

class Utils {

	public static function getUKDateFormat():String {
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

	public static function getUSDateFormat():String {
		var output = "";

		var day:Int;
		var month:Int;
		var year:Int;

		day = Date.now().getDate();
		month = Date.now().getMonth() + 1;
		year = Date.now().getFullYear();

		if(month < 10) {
			output += '0$month';
		} else {
			output += '$month';
		}

		output += "-";

		if(day < 10) {
			output += '0$day';
		} else {
			output += '$day';
		}

		output += "-";

		if(year < 10) {
			output += '0$year';
		} else {
			output += '$year';
		}

		return output;
	}

	public static function getTimeFormatted():String {
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
}