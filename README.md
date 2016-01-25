Spider
======

Spider is a tiny, easy to use Web Framework for Haxe targeting PHP.

With Spider, I'm not trying to do everything for you. Just enough to get you moving in your own direction.


## WARNING

Spider is currently in a state of flux. Every part of the codebase is likely to be touched and changed.

Ultimately this will be for the better, but do not use it yet.


## Features

* Clean URLs and easy URL Routing.
* MySQL or SQLite3 database connectivity + abstraction
* Templating.
* Logging to file, for errors, etc.
* Strong Password hashing with salt.
* File uploads.
* Blacklisting IP Addresses
* [SpiderTools](https://github.com/championchap/SpiderTools), a convenient command line utility.
* and more!


## Requirements

* [Haxe 3.2](http://haxe.org)


## Usage

__Don't bother yet.__ I'll update this when it's ready to be played with.

This is what it's like to start a new project that connects to an SQLite3 database. Connecting to a database is optional, but you'll probably want one.

```haxe
public function new() {
	var db:DatabaseDetails = { dbName : "spider", dbType : DBType.SQLite3 };

	var site = new Spider({
		name 		: "My Awesome Site!",
		database 	: db,
		setupTables : setupTables
	});

	site.run(); // Home Page exists by default
}

// db stuff is all handled with SPOD
private function setupTables() {
	if(!TableCreate.exists(User.manager)) {
		TableCreate.create(User.manager);
	}
}
```

By default the doDefault method of the HomeController is called, this is your index page.

In this case, we are calling view(), which is a clever function that automatically looks in the location ../private/views/controller/method.mtt for a template, that it then executes.

Pass properties to the view through an anonymous object.

```haxe
class HomeController extends Controller {
	public function new() {
		super();
	}

	public function doDefault() {
		view({
			title : "Hello World.dev",
			description : "Meta Description Here!",
			content : "Hello World!"
		});
	}
}
```

Redirects are super easy, just change the URL!

```haxe
Spider.url = "/about/";
```

Routes are defined in the Routes Class in your app, at the moment we are just using the Haxe Dispatcher. We might write our own one in the future though, perhaps even using Macros.

```haxe
class Routes {
	public function new() {  }

	public function doDefault(d:Dispatch){
		d.dispatch( new HomeController() );
	}

	public function doAbout(d:Dispatch){
		d.dispatch( new AboutController() );
	}
}
```

We are just using the built in Haxe templates for the time being. They're pretty simple.

```html
<div>
	<p>::some_value_here::</p>
	<div>::if flag:: OK ! ::else:: FAILED ! ::end::</div>
	<div>
		<ul>
		::foreach users::
		    <li>::name::</li>
		::end::
		</ul>
	</div>
</div>
```

## License

This is [free software](https://www.gnu.org/philosophy/free-sw.html) made available under the GPL V3 Licence.


## Who do I talk to?

* [Erik on Twitter](https://twitter.com/championchap)
* [ErikWatson.me](http://erikwatson.me)
