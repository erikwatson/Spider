package spider;

// Draws a list of pages and a page full of items 
// The page can be in List or Table format 

class Paginator
{

	public var data:Array<String>;
	public var perPage:Int;
	public var currentPage:Int = 1;
	public var pageType:PageType = PageType.UnorderedList;

	public function new(data:Array<String>, perPage:Int = 10){
		this.data = data;
		this.perPage = perPage;
	}

	public function page():String {
		var output:String = null;

		switch(pageType){
			case PageType.Table:
				output = drawTable();

			case PageType.UnorderedList:
				output = drawList();
		}

		return output;
	}

	public function navigation():String {
		var output:String = "";
		var totalPages:Int = Math.ceil(data.length / perPage);

		output += "<div class='paginator_nav'>\n";

		output += "\t<div class = 'paginator_prev'>Back</div>\n";
		output += "\t<div class = 'paginator_pages'><ul> \n";

		for(i in 0...totalPages){
			output += '\t\t<li>${data[i]}</li>\n';
		}

		output += "\t</ul></div> \n";
		output += "\t<div class = 'paginator_next'>Next</div>\n";

		output += "</div>\n";

		return output;
	}

	private function drawList():String {
		var output:String = "";
		var position:Int = perPage * (currentPage - 1);

		output += "<div class='paginator_list'> \n";
		output += "<ul> \n";

		for(i in position...position+perPage){
			if(data[i] != null){
				output += '\t<li>${data[i]}</li> \n';
			} else {
				break;
			}
		}

		output += "</ul> \n";
		output += "</div> \n";

		return output;
	}

	// Should use the Table Class 
	private function drawTable():String {
		return "";
	}

}

enum PageType
{
	UnorderedList;
	Table;
}