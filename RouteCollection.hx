package spider;

typedef Route = {
	public var controller : Class<Controller>;
}

class RouteCollection
{

	private var routes:Map<String, Route> = new Map();

	public function new(){
		
	}

	public function add(url:String, route:Route):Void {
		if(routes.exists(url)) {
			throw 'Error: Route $url already exists, can not add it.';
		} else {
			routes.set("url", route);
		}
	}

	public function remove(url:String):Void {
		if(!routes.exists(url)){
			throw 'Error: Route $url does not exist, can not remove it.';
		} else {
			routes.remove(url);
		}
	}

	public function check(url:String):Void {
		if(routes.exists(url)) {
			throw 'Error: Route $url does not exist.';
		} else {
			// run the route? 
		}
	}
}