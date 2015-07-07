package spider;

import php.Lib;
import php.Web;
import haxe.Template;
import sys.io.File;
import haxe.Json;
import haxe.PosInfos;

import spider.Spider;

class Controller
{

	private var pageTitle:String = "";
	private var name(get, null):String;
	private var forceSSL(default, set):Bool = false; // for this whole controller

	private var header:Header;

	public function new(){
		header = new Header();
	}

	public function doDefault() {
		view({  });
	}

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

	private function drawTemplate(path:String, options:{}):String {
		var s:String = File.getContent(path);
		var t:Template = new Template(s);

		return t.execute( options );
	}

	private function login(username:String, password:String):Void {
		// TODO
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

	private function filter(filters:Array<Dynamic>) {
		trace("array is dynamic");
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


	// Getters and Setters

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
