# Koelkast

A front end application to communicate with the Tap API.
Built with:
* React
* Coffeescript
* SASS
* Jade

### Installation

You need Gulp installed globally:

```sh
$ npm i -g gulp
```

After cloning the repo, install the node modules. This could take a while.
```sh
$ npm i -d
```

Using gulp, build the files for your app.
```sh
$ gulp build
```

This will give you a `build` directory, with some temporary files,
and a `public` directory. In here you'll find an `index.html`, a `bundle.css`, a `bundle.js` and a `font` directory with some fonts.

### Development

Start the server (inside `public`).
```sh
$ python3 -m http.server
```

Use gulp to build your app, and watch for changes. Let this run in the background.
```sh
$ gulp 
```

Once this is setup, you can start building components and use them.
