package spider;

import php.Web;

class Spider
{

	public var config:Config = new Config();
	public var routes:RouteCollection = new RouteCollection();

	public function new(){
		
	}

	public function run(url:String):Void {
		setupTables();
		routes.run(url);
	}

	public function setupTables():Void {

	}

	public function redirectToLost():Void {
		Web.redirect(config.lostURL);
	}

	public function redirectToLogin():Void {
		Web.redirect(config.loginURL);
	}
}