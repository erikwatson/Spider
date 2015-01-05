package spider;

import haxe.web.Dispatch;

typedef Route = {
	public var controller : Class<Controller>;
}

class RouteCollection
{

	public var routes:Map<String, Route> = new Map();

	public function new(){
		
	}

	public function add(url:String, route:Route):Void {
		if(routes.exists(url)) {
			throw 'Error: Route $url already exists, can not add it.';
		} else {
			routes.set(url, route);
		}
	}

	public function remove(url:String):Void {
		if(!routes.exists(url)){
			throw 'Error: Route $url does not exist, can not remove it.';
		} else {
			routes.remove(url);
		}
	}

	public function run(url:String):Void {
		if(!routes.exists(url)) {
			throw 'Error: Route $url does not exist.';
		} else {
			// run the route
			Dispatch.run(url, new haxe.ds.StringMap(), new controllers.Fart());
		}
	}
}