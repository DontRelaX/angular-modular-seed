# angular-modular-seed - Scalable seed for angular project

This project is an application skeleton for a typical [AngularJS](http://angularjs.org/) web app.
You can use it to quickly bootstrap your angular webapp projects and dev environment for these
projects.

In difference to [angular-scalable-seed](https://github.com/angular/angular-seed) this seed
have strong modular structure. It allow to save all files regarding single module
(js, html, scss, images and etc) into single directory.

This seed don't support amd structure because we build all sources into one file.
It can be critical if you will have a lot of megabytes of javascript. But for medium size
projects this approach is better because browser perform single request to get all js.

### Directory Layout
```
+-root
  +-bower.json //bower config
  +-package.json //dependencies for brunch
  +-config.coffee //brunch config
  +-app //source root
    +-first-module //Split modules into separate dirs
      +-module.js //define module and configure it
      +-controllers //dir with controllers
        +-first-controller //every contoller have own dir
          +-images
            +-image-name.jpg
          +-first-controller.js //controller code
          +-first-controller.html //controller template
          +-first-controller.scss //controller styles
        +-second-controller
          +-second-controller.js
          +-second-controller.html
          +-second-controller.scss
      +-directives //dir with directives
        +-first-directive //every directive have own dir
          +-first-directive.js //directive code
          +-first-directive.html //directive template
          +-first-directive.scss //diretive styles
      +-services //dir with services
        +-first-service.js //service code. It don't need any template/styles.
        +-second-service.js
    +-second-module
    +-third-module
  +-index.html //application html that consumes assets data
  +-bower_components //created by bower, ignored in git
  +-node_modules //created by npm, ignored in git
  +-assets //compiled sources, ignored in git
```

### Dependencies

Seed have only single dependency from angular.

### Development environment setup:

1. Setup needed soft like: npm, bower, brunch, ruby (for scss compilation):
```
sudo apt-get install npm
sudo npm install -g bower
sudo npm install -g brunch
sudo apt-get install nodejs-legacy
sudo apt-get install ruby
sudo gem install sass
```

2. Go to project folder and execute:
```
npm install (may be you will need superuser rights)
bower install
```

3. Build assets from source code:
```
brunch build
brunch build -P (to build sources for production. js and css code will be minificated)
brunch watch (to build each time when you change source code)
```

4. Start web server for example using python (you need to install it first)
```
python -m SimpleHTTPServer
```

### Running the App in Production:

You need only files under asset folder and index.html. All other files can be omitted.