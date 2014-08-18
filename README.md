# nacelle-skeleton

This repository provides an opinionated skeleton/template for building Python
applications on Google Appengine with the [nacelle framework][nacelle].

***

This skeleton aims to make it as easy as possible to get started with [nacelle]
[nacelle], providing a full application template including example handlers,
routes and tests. An example makefile is provided, containing sensible defaults
for management commands (running the development server, tests, deploying,
etc.).

This template uses [Docker][docker] to provide a standard development
environment for all developers on a project, this is the preferred method of
installation/development. Whilst using [Docker][docker] makes the setup process
relatively painless, this skeleton is perfectly usable on any system on which
the Appengine SDK will run (you'll just need to ensure you install the
application's dependencies manually).


## Getting the skeleton
***

Whether you're running with Docker or have installed the Appengine SDK locally,
the first thing you'll need to do is get the code. This part is easy with
`git`:

    $ git clone https://github.com/nacelle/nacelle-skeleton.git

Or without `git`:

    $ wget https://github.com/nacelle/nacelle-skeleton/archive/master.zip
    $ unzip master.zip


## Getting a recent copy of nacelle
***

Once you've downloaded the skeleton code, you'll need a recent copy of nacelle
to go with it. To install nacelle (with a recent version of `pip`), from the
root of the repository:

    $ pip install nacelle -t app/vendor/
    
Alternatively, you can download the archive direct from [PyPI][pypi] and unpack
the module in the `app/vendor/` directory manually.


## Using the skeleton with Docker
***

The easiest way to use this skeleton is with [Docker][docker]. With Docker
installed, running your application should be as simple as:

    $ make run
    
To run your application's tests, use the command:

    $ make test

Visit the running application [http://localhost:8080](http://localhost:8080)

Check out the `Makefile` in the repository root for all available commands.


## Using the skeleton without Docker
***

Whilst the preferred method of using the skeleton is with Docker, it's possible
to use it in the normal manner, with the Appengine SDK installed on your host
OS.

First, ensure you've installed the [Appengine Python SDK][sdkdl]. You'll need
python 2.7 and [pip 1.4 or later][pipdl] installed too.

Run this project locally from the command line:

   ```
   $ cd app/
   $ make run
   ```

Visit the running application [http://localhost:8080](http://localhost:8080)

Check out the `Makefile` in the `app/` folder for all available commands.


### Installing Libraries
***

See the [Third party libraries][thrdprty] page for libraries that are already
included in the SDK.  To include SDK libraries, add them in your `app.yaml`
file. Other than libraries included in the SDK, only pure python libraries may
be added to an App Engine project.

Any third-party Python modules added to the `app/vendor/` directory will be
added to Python's `sys.path` at runtime.


## Licensing
***

See [LICENSE](LICENSE)


[docker]: https://docker.io  "Docker"
[nacelle]: http://github.org/nacelle/nacelle  "nacelle"
[pipdl]: http://www.pip-installer.org/en/latest/installing.html  "Pip download"
[pypi]: https://pypi.python.org/pypi/nacelle  "nacelle on PyPI"
[sdkdl]: https://developers.google.com/appengine/downloads  "Appengine SDK"
[thrdprty]: https://developers.google.com/appengine/docs/python/tools/libraries27  "Appengine third-party libraries"
