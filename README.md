
## The Basics

This is your new Play application
=================================

This file will be packaged with your application when using `activator dist`.

There are several demonstration files available in this template.

Controllers
===========

- HomeController.java:

  Shows how to handle simple HTTP requests.

- AsyncController.java:

  Shows how to do asynchronous programming when handling a request.

- CountController.java:

  Shows how to inject a component into a controller and use the component when
  handling requests.

Components
==========

- Module.java:

  Shows how to use Guice to bind all the components needed by your application.

- Counter.java:

  An example of a component that contains state, in this case a simple counter.

- ApplicationTimer.java:

  An example of a component that starts when the application starts and stops
  when the application stops.

Filters
=======

- Filters.java:

  Creates the list of HTTP filters used by your application.

- ExampleFilter.java

  A simple filter that adds a header to every response.

## The Extended

## Used Summary

* [Play Framework: 2.6.7](https://www.playframework.com/documentation/2.6.x/Home)
* [React: 16.2.0](https://reactjs.org/)
* [Create React App: 1.0.17](https://github.com/facebookincubator/create-react-app)

## How to use it? 

### Prerequisites

* [Node.js](https://nodejs.org/)
* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

### Let's get started,

* Used any of the following [SBT](http://www.scala-sbt.org/) commands which will intern trigger frontend associated npm/yarn scripts.

```
    sbt clean           # Clean existing build artifacts

    sbt stage           # Build your application from your project’s source directory

    sbt run             # Run both backend and frontend builds in watch mode

    sbt dist            # Build both backend and frontend sources into a single distribution artifact

    sbt test            # Run both backend and frontend unit tests
```

* This app is not using [scala play views](https://www.playframework.com/documentation/2.6.x/ScalaTemplates). All the views and frontend associated routes are served via [React](https://reactjs.org/) code base under `view` directory.

## Complete Directory Layout

```
├── /app/                                 # The backend source (controllers, models, services)
│     └── /controllers/                   # Backend controllers
│           └── FrontendController.scala  # Asset controller wrapper serving frontend assets and artifacts
├── /conf/                                # Configurations files and other non-compiled resources (on classpath)
│     ├── application.conf                # Play application configuratiion file.
│     ├── logback.xml                     # Logging configuration
│     └── routes                          # Routes definition file
├── /logs/                                # Log directory
│     └── application.log                 # Application log file
├── /project/                             # Contains project build configuration and plugins
│     ├── FrontendCommands.scala          # Frontend build command mapping configuration
│     ├── FrontendRunHook.scala           # Forntend build PlayRunHook (trigger frontend serve on sbt run)
│     ├── build.properties                # Marker for sbt project
│     └── plugins.sbt                     # SBT plugins declaration
├── /public/                              # Frontend build artifacts will be copied to this directory
├── /target/                              # Play project build artifact directory
│     ├── /universal/                     # Application packaging
│     └── /web/                           # Compiled web assets
├── /test/                                # Contains unit tests of backend sources
├── /view/                                # React frontend source (based on Create React App)
│     ├── /build/                         # `create-react-app` default prod build destinatination folder. In this setup build will be send to root dir. under `/public/view/`
│     ├── /config/                        # `create-react-app` scaffolding configuration for babel, webpack, env, path, pollyfill, and jest tests configs
│     ├── /node_modules/                  # 3rd-party frontend libraries and utilities
│     ├── /public/                        # Contains the index.html file
│     ├── /scripts/                       # NPM/YARN associated scripts
│     ├── /src/                           # The frontend source codebase of the application
│     ├── .editorconfig                   # Define and maintain consistent coding styles between different editors and IDEs
│     ├── .eslintrc                       # JavaScript linter configurations
│     ├── .gitignore                      # Contains ui files to be ignored when pushing to git
│     ├── package.json                    # NPM configuration of frontend source
│     ├── README.md                       # Contains all user guide details for the ui
│     └── yarn.lock                       # Yarn lock file
├── .gitignore                            # Contains files to be ignored when pushing to git
├── build.sbt                             # Play application SBT configuration
├── LICENSE                               # License Agreement file
├── README.md                             # Application user guide
└── ui-build.sbt                          # SBT command hooks associated with frontend npm/yarn scripts 
```

## What is new in here?

### FrontendCommands.scala

* Frontend build command mapping configuration.

```
    ├── /project/
    │     ├── FrontendCommands.scala
```


### FrontendRunHook.scala

* PlayRunHook implementation to trigger ``npm run start / yarn start`` on ``sbt run``.

```
    ├── /project/
    │     ├── FrontendRunHook.scala
```

### FrontendController.scala

* Asset controller wrapper serving frontend assets and artifacts.

```
    ├── /app/                                 
    │     └── /controllers/                   
    │           └── FrontendController.scala
```

### ui-build.sbt

* This file contains the build task hooks to trigger frontend npm/yarn scripts on sbt command execution.

### npm/yarn scripts

* New and modified npm/yarn scripts of [Create React App](https://github.com/facebookincubator/create-react-app) generated package.json.
* Check [UI README.md](./view/README.md) to see all available frontend build tasks.

```
├── /view/                       
│     ├── package.json          
```

## Routes

```
├── /conf/      
│     ├── routes
```

* The following route configuration map index.html to entry route (root). This should be placed as the initial route.

```
GET        /             controllers.FrontendController.index()
```

* All API routes should be prefixed with API prefix defined under ``application.conf`` (Default prefix ``apiPrefix = "smlp"``) 

Example API route:

```
GET        /smlp/summary  controllers.HomeController.appSummary
```

* The following route is being used to serve frontend associated build artifacts (css, js) and static assets (images, etc.). This should be placed as the final route.

```
GET        /*file        controllers.FrontendController.assetOrDefault(file)
```

**Note: _On production build all the front end React build artifacts will be copied to the `public` folder._**

## Can be used to implement any front end/ui build!

* Simply replace the ui i.e `the view dir. in this case` directory with the build of your choice
* Make output directory ROOT/public/
* Implement a proxy to localhost:9000 

## Acknowledgements on this setup and configuration assistance!!

https://github.com/yohangz
https://github.com/lahiruz
https://github.com/Arty26
