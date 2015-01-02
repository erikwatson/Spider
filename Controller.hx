package spider;

import php.Lib;

class Controller
{
	public function new(){
		
	}

	public function doIndex():Void {
		Lib.println("Index");
	}

	public function doDefault(d:haxe.web.Dispatch):Void {
		Lib.println("Default");
		trace(d.parts);
	}
}