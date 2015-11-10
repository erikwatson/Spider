package spider;

import php.Web;

class Header {
	// headers 
	public static inline var contentType = "Content-Type";

	// values for some useful mime types 
	public static inline var atom 		= "application/atom+xml";
	public static inline var avi 		= "";
	public static inline var bin 		= "application/octet-stream";
	public static inline var bmp 		= "image/bmp";
	public static inline var css 		= "text/css";
	public static inline var deb 		= "application/x-debian-package";
	public static inline var epub 		= "application/epub+zip";
	public static inline var exe 		= "application/x-msdownload";
	public static inline var flv 		= "video/x-flv";
	public static inline var gif 		= "";
	public static inline var html 		= "text/html";
	public static inline var js 		= "text/javascript";
	public static inline var jpeg 		= "image/jpeg";
	public static inline var json 		= "application/json";
	public static inline var m3u 		= "audio/x-mpegurl";
	public static inline var mp4 		= "";
	public static inline var pdf 		= "application/pdf";
	public static inline var png 		= "image/png";
	public static inline var rss 		= "application/rss+xml";
	public static inline var svg		= "";
	public static inline var swf 		= "application/x-shockwave-flash";
	public static inline var text 		= "text/plain";
	public static inline var torrent 	= "application/x-bittorrent";
	public static inline var wav 		= "audio/x-wav";
	public static inline var webm		= "";
	public static inline var xml 		= "text/xml";

	// copy and paste this one 
	public static inline var eggs = "";

	public function new() {

	}

	public function set(h:String, v:String) {
		Web.setHeader(h, v);
	}
}