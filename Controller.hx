package spider;

import haxe.web.Dispatch;
import php.Lib;

class Controller
{
	public function new(){
		
	}

	public function doIndex():Void {
		Lib.println("Index");
	}

	public function doDefault(d:Dispatch):Void {
		Lib.println("Default");
	}
}