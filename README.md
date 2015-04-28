Spider
======

Spider is a tiny, easy to use Web Framework for Haxe targeting PHP.

With Spider, I'm not trying to do everything for you. Just enough to get you moving in your own direction. 


## Features

* Clearn URLs and URL Routing.
* MySQL or SQLite3 database connectivity and modeling. 
* Templates.
* Error logging.
* Password hashing with salt.
* File uploads. 
* A bunch of nice little features, too small to mention here. 


## Requirements

* [Haxe 3.2](http://haxe.org)


## Usage

Don't bother yet. Very much a work in progress / learning exercise. 

```haxe
public function new() {
	var site = new Spider({
		// config options 
		siteName : "My Awesome Site!",
		setupTables : setupTables
	});

	site.run("/");
}

private function setupTables() {
	// create your tables with the SPOD models here 
}
```


## License

This is [free software](https://www.gnu.org/philosophy/free-sw.html) made available under the GPL V3 Licence.


## Who do I talk to?

* [Erik on Twitter](https://twitter.com/championchap)
* [ErikWatson.me](http://erikwatson.me)
