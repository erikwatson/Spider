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


## License

This is [free software](https://www.gnu.org/philosophy/free-sw.html) made available under the GPL V3 Licence.


## Who do I talk to?

* [Erik on Twitter](https://twitter.com/championchap)
* [ErikWatson.me](http://erikwatson.me)


## Usage

Don't bother yet. Very much a work in progress / learning exercise.

This is what it's like to start a new project that connects to a database.

```haxe
public function new() {
	var site = new Spider({
		// config options
		siteName : "My Awesome Site!",
		dbName : "spider",
		dbType : DBType.SQLite3,
		setupTables : setupTables
	});

	site.run("/"); // basic home page exists by default
}

private function setupTables() {
	// create your tables with the SPOD models here
	if(!TableCreate.exists(User.manager)) {
		TableCreate.create(User.manager);
	}
}
```

By default "/" calls the doIndex method of the HomeController class.

In this case, we are calling view(), which is a clever function that automatically looks in the location ../private/views/controller/method.mtt for a template, that it then executes.

Pass properties to the view through an anonymous object.


```haxe
class HomeController extends Controller {
	public function new() {
		super();
	}

	public function doIndex() {
		view({
			page_title : "Hello World.dev",
			page_content : "Hello World!"
		});
	}
}
```

If you want to output some json with the correct mime-type instead of executing a template, just call json() with an anonymous object instead of view().

```haxe
public function doIndex() {
	json({
		page_title : "Hello World.dev",
		page_content : "Hello World!"
	});
}
```
