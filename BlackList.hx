package spider;

// Blocking IP Addresses with a Black List

class BlackList {

    public var location(get, null):String;
    private var contents:Array<String> = [];

    public function new() {  }

    // check to see if a single IP Address is blocked or not
    public function isBlocked() {  }

    // check to see if ALL of these ip addresses are blocked
    public function areBlocked() {  }

    // check to see if ANY of these ip addresses are blocked
    public function anyBlocked() {  }

    // block this IP Address
    public function blockThis() {
        readFile();
    }

    // block this IP Address
    public function blockThese(addresses:Array<String>) {
        readFile();
    }

    // unblock this ip address
    public function unblockThis() {
        readFile();
    }

    public function unblockThese(addresses:Array<String>) {
        readfile();
    }

    // populate the contents of BlackList
    // for now, we will just call this every time we modify the block list
    // to make sure we're up to date, dumb but effective
    private function readFile() {
        contents = []; // clear the contents first
        // does the blacklist exist?
        // if not, create it
        // open it now that we are sure it exists
        // loop through every line of the file and add each line to the contents array
    }

    /*

        Getters and Setters

    */

    private function get_location():String { return Spider.config.blacklistLocation; }

}
