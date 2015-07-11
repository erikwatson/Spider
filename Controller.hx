package spider;

import php.Lib;
import php.Web;
import haxe.Template;
import sys.io.File;
import haxe.Json;
import haxe.PosInfos;
import haxe.crypto.Md5;

import spider.Spider;
import spider.PasswordDetails;

class Controller
{

	private var pageTitle:String = "";
	private var name(get, null):String;
	private var forceSSL(default, set):Bool = false; // for this whole controller

	private var header:Header;

	public function new(){
		header = new Header();
	}


	/*

		Pages 
	
	*/

	public function doDefault() {
		view({  });
	}

	
	/*

		Redirects

		Very commonly used redirects that it is expected most applications will make use of.
	
	*/

	public inline function redirectToHome():Void {
		Spider.url = Spider.config.homeURL;
	}

	public inline function redirectToLost():Void {
		Spider.url = Spider.config.lostURL;
	}

	public inline function redirectToLogin():Void {
		Spider.url = Spider.config.loginURL;
	}

	public inline function redirectToLogout():Void {
		Spider.url = Spider.config.logoutURL;
	}

	public inline function redirectToError():Void {
		Spider.url = Spider.config.errorURL;
	}


	/*

		Output

		Stuff for spitting out pages and views and stuff. 
	
	*/

	private function drawTemplate(path:String, options:{}):String {
		var s:String = File.getContent(path);
		var t:Template = new Template(s);

		return t.execute( options );
	}

	// draw the current view with these properties
	private function view(obj:{}, ?pos:PosInfos) {
		header.set(Header.contentType, Header.html);

		// figure out the location of the template
		var simpleName = StringTools.replace(name, "controller", "");
		var simpleMethod = Utils.firstCharToLower(StringTools.replace(pos.methodName, "do", ""));
		var viewPath = '${Spider.config.viewLocation}${simpleName}/${simpleMethod}.mtt';

		// try to execute the template
		try {
			var f = File.getContent(viewPath);
			var t = new Template(f);

			Lib.print(t.execute(obj));
		} catch(e:String) {
			Lib.print('No Template found at $viewPath.');
		}
	}

	// output this object as a json file
	private function json(obj:{}) {
		header.set(Header.contentType, Header.json);
		Lib.print(Json.stringify(obj));
	}


	// output this object as an xml file
	private function xml(obj:{}) {
		header.set(Header.contentType, Header.xml);
		// TODO
	}

	// output this object as an atom feed
	private function atom(obj:{}) {
		header.set(Header.contentType, Header.atom);
		// TODO
	}

	// output this object as an rss feed
	private function rss(obj:{}) {
		header.set(Header.contentType, Header.rss);
		// TODO
	}


	/*

		Password Hashing Stuff 
	
	*/

	private function salt():String {
		return Md5.encode(Std.string(Math.random()));
	}

	private function hashPassword(deets:PasswordDetails, ?numBytes:Int = 64):String {
		return PBKDF2.encode(deets.password, deets.salt, deets.iterations, numBytes);
	}

	private function checkPasswordsMatch(deets:PasswordDetails, hashedPassword:String):Bool {
		if(hashPassword(deets) == hashedPassword) {
			return true;
		}

		return false;
	}


	/*

		Helpers 
	
	*/

	private function isEmpty(s:String):Bool {
		if(s == "" || s == null) {
			return true;
		}

		return false;
	}


	/*

		Getters and Setters 

		These get and set things, just a little heads up. 
	
	*/

	private function set_forceSSL(ssl:Bool):Bool {
		if(ssl) {
			Spider.makeSecure();
		}

		return ssl;
	}

	private function get_name():String {
		var classParts = Type.getClassName(Type.getClass(this)).split(".");
		return classParts[classParts.length - 1].toLowerCase();
	}
}
