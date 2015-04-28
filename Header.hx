package spider;

import php.Web;

class Header {
	// headers 
	public static inline var contentType = "Content-Type";

	// values 
	public static inline var atom = "application/atom+xml";
	public static inline var css = "text/css";
	public static inline var html = "text/html";
	public static inline var js = "text/javascript";
	public static inline var jpeg = "image/jpeg";
	public static inline var json = "application/json";
	public static inline var pdf = "application/pdf";
	public static inline var rss = "application/rss+xml";
	public static inline var text = "text/plain";
	public static inline var xml = "text/xml";

	public function new() {

	}

	public function set(h:String, v:String) {
		Web.setHeader(h, v);
	}
}