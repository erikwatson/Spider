package spider;

// Blocking IP Addresses with a Black List

class BlackList {

    public var location(get, null):String;

    public function new() {  }

    // check to see if a single IP Address is blocked or not
    public function isBlocked() {  }

    // check to see if ALL of these ip addresses are blocked
    public function areBlocked() {  }

    // check to see if ANY of these ip addresses are blocked
    public function anyBlocked() {  }

    // block this IP Address
    public function block() {  }

    // unblock this ip address
    public function unblock() {  }

    /*

        Getters and Setters

    */
    
    private function get_location():String { return Spider.config.blacklistLocation; }

}
