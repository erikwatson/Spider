package spider;

import haxe.web.Dispatch;
import php.Lib;
import php.Web;

import spider.Spider;

class Controller
{

	private var pageTitle:String = "";

	public function new(){
		
	}

	public function doIndex():Void {
		Lib.println("Index");
	}

	public function doDefault(d:Dispatch):Void {
		Lib.println("Default");
	}

	public function redirectToHome():Void {
		Web.redirect(Config.homeURL);
	}

	public function redirectToLost():Void {
		Web.redirect(Config.lostURL);
	}

	public function redirectToLogin():Void {
		Web.redirect(Config.loginURL);
	}

	public function redirectToLogout():Void {
		Web.redirect(Config.logoutURL);
	}

	public function redirectToError():Void {
		Web.redirect(Config.errorURL);
	}

	public function pageHead():String {
		return "";
	}

	public function pageFoot():String {
		return "";
	}

	// minor convenience function
	private function isSecure():Bool {
		return Spider.secure;
	}

	// minor convenience function
	private function makeSecure():Void {
		Spider.makeSecure();
	}
	
}