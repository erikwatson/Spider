package spider;

// Class for making a standard Breadcrumb Trail navigation feature 

class Breadcrumb
{

	private var trail:Map<String, String>;
	private var separator:String;

	// map.set(Name, URL)
	public function new(trail:Map<String, String>, separator:String = "/"){
		this.trail = trail;
		this.separator = separator;
	}

	public function drawTrail():String {
		var output:String = '';

		for(name in trail.keys()) {
			output += '<a href="${trail.get(name)}">$name</a> $separator ';
		}

		return output;
	}
}