package spider;

import sys.io.File;
import sys.FileSystem;
import sys.io.FileInput;
import sys.io.FileOutput;

// Blocking IP Addresses with a Black List

class BlackList {

    public var location( get, null ):String;
    public var dir( get, null ):String;

    private var contents:Array<String> = [];

    public function new() { readFile(); }

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
    public function blockThese( addresses:Array<String> ) {
        readFile();
    }

    // unblock this ip address
    public function unblockThis() {
        readFile();
    }

    public function unblockThese( addresses:Array<String> ) {
        readFile();
    }

    // populate the contents of BlackList
    // for now, we will just call this every time we modify the block list
    // to make sure we're up to date, dumb but effective
    private function readFile() {
        var file_output:FileOutput;
        var file_input:FileInput;

        contents = []; // clear the contents first

        // check and ensure the dir exists before accessing the file
        if( !FileSystem.isDirectory( dir ) ) { FileSystem.createDirectory( dir ); }
        if( !FileSystem.isDirectory( dir ) ) { return false; }

        // make the file if it doesn't exist
        if( !FileSystem.exists( location ) ) {
            file_output = File.write( location, false );
            file_output.close();
        }
        if( !FileSystem.exists( location ) ) { return false; }

        // open it now that we are sure it exists
        // loop through every line of the file and add each line to the contents array
        file_input = File.read( this.location, false );
        try {
            var line_number = 0;
            while( true ) {
                var line_contents = file_input.readLine();
                contents.push( 'Line ${line_number}: ${line_contents}' );
                line_number ++;
            }
        } catch(e:Dynamic) {
            file_input.close();
            return false;
        }
    }

    /*

        Getters and Setters

    */

    private function get_location():String { return "${dir}blacklist.txt"; }
    private function get_dir():String { return Spider.config.blacklistLocation; }

}
