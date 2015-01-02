package spider;

class Spider
{
	public function new(){
		haxe.web.Dispatch.run( 
			"index2", 
			new haxe.ds.StringMap(), 
			new spider.Controller()
		);
	}
}