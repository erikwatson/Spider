package spider;

// Class for making a standard Breadcrumb Trail navigation feature 

class Breadcrumb
{

	private var home:String;
	private var separator:String;

	// map.set(Name, URL)
	public function new(home:String = "Home", separator:String = " / "){
		this.home = home;
		this.separator = separator;
	}

	public function drawCrumbs():String {
		var output:String = '<div class="breadcrumb"><a href="/">$home</a>$separator';
		var list = navList();

		for(element in list) {
			if(element != "") {
				output += '<a href="#">${Utils.firstCharToUpper(element)}</a>$separator';
			}
		}

		output += "</div>";

		return output;
	}

	public function drawCrumbsAsList():String {
		var output:String = '$home$separator';
		var list = navList();

		for(element in list) {
			output += '$element$separator';
		}

		return output;
	}

	private function navList():Array<String> {
		return Spider.request.URI.split("/");
	}
}