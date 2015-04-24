package spider;

import haxe.web.Dispatch;
import php.Lib;
import php.Web;
import haxe.Template;
import sys.io.File;

import spider.Spider;

// TODO: The Controller should look in a default location for its View 

class Controller
{

	private var pageTitle:String = ""; // Inserted into the title bar of the page 
	private var name:String = ""; // Name of the current Controller

	public function new(){
		var classParts = Type.getClassName(Type.getClass(this)).split(".");
		name = classParts[classParts.length - 1].toLowerCase();
	}

	public function index():Void {
		Lib.println("Index");
	}

	public inline function redirectToHome():Void {
		Spider.redirect(Config.homeURL);
	}

	public inline function redirectToLost():Void {
		Spider.redirect(Config.lostURL);
	}

	public inline function redirectToLogin():Void {
		Spider.redirect(Config.loginURL);
	}

	public inline function redirectToLogout():Void {
		Spider.redirect(Config.logoutURL);
	}

	public inline function redirectToError():Void {
		Spider.redirect(Config.errorURL);
	}

	public function pageHead():String {
		return "";
	}

	public function pageFoot():String {
		return "";
	}

	private function drawTemplate(path:String, options:{}):String {
		var s:String = File.getContent(path);
		var t:Template = new Template(s);

		return t.execute( options );
	}

	// minor convenience function
	private inline function isSecure():Bool {
		return Spider.secure;
	}

	// minor convenience function
	private inline function makeSecure():Void {
		Spider.makeSecure();
	}

	// minor convenience function
	private inline function redirect(url:String):Void {
		Spider.redirect(url);
	}
	
}