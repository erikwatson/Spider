package spider;

// Easily output Error messages, etc to a log file
// Might be cool to have it expect Markdown, so we can make a nice on-site log viewer. 

class Log
{

	private var output:String = "";
	public var isEmpty(get, null):Bool;

	public function new(){
		
	}

	public function add(message:String) {

	}

	public function write():Void {
		if(isEmpty == false){
			// write the contents of output 
			// to a log file in config.logLocation 

			// write to a different log file for every day 
		}
	}

	/*
	 *	Getters and Setters
	 */

	private function get_isEmpty():Bool {
		return false;
	}
}