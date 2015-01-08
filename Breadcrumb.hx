package spider;

// Class for making a standard Breadcrumb Trail navigation feature 

class Breadcrumb
{

	private var trail:Map<String, String>;

	// map.set(Name, URL)
	public function new(trail:Map<String, String>){
		this.trail = trail;
	}

	public function drawTrail():String {
		var output:String = '';

		for(name in trail.keys()) {
			output += '<a href="${trail.get(name)}">$name</a> / ';
		}

		return output;
	}
}