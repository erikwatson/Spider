package spider;

typedef Route = {
	var location : String;
	var controller : String;
	@:optional var action : String;
	@:optional var before : Void->Void;
	@:optional var after : Void->Void;
};