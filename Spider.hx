package spider;

class Spider
{

	public var routes:RouteCollection = new RouteCollection();

	public function new(){
		setupTables();
		this.routes.check("/");
	}

	public function setupTables():Void {

	}
}