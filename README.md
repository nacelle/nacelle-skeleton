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


## Installing Docker
***

### Linux

Docker is best supported on Linux, you can probably find packages for your
preferred distribution [here][docker_install].

**Note:** Please don't run docker as root (or with sudo), it'll cause files
created within the container to be owned by root on the host system. This will
prevent you from editing/deleting the files using your regular user account.

Adding your user to the `docker` group will allow to run docker without root
privileges. Running `sudo gpasswd -a $USER docker` and logging out/in again
should do the trick.

### OSX

Installing and configuring Docker on OSX isn't quite as straightforward as it
is on Linux (yet). The [boot2docker][boot2docker] project provides a
lightweight Linux VM that acts as a (mostly) transparent way to run docker on
OSX.

First, install Docker and boot2docker following the instructions on
[this page][docker_osx_install]. Once you've installed Docker and launched
`boot2docker` for the first time, you need to stop it again so we can make
further modifications: `boot2docker stop`.

Since Docker on OSX is technically running inside a virtual machine and not
directly on the host OS, any volumes mounted will be on the VM's filesystem
and any bound ports will be exposed only to the boot2docker VM. We can work
around these limitations with a few tweaks to our setup.

In order to mount folders from your host OS into the boot2docker VM you'll
need to download a version of the boot2docker iso with Virtualbox's Guest
Additions installed:

    $ mkdir -p ~/.boot2docker
    $ wget http://static.dockerfiles.io/boot2docker-v1.1.2-virtualbox-guest-additions-v4.3.12.iso -O ~/.boot2docker/boot2docker.iso

Next, you need to tell Virtualbox to mount your `/Users` directory inside the
VM:

    $ VBoxManage sharedfolder add boot2docker-vm -name home -hostpath /Users

And that should be it. Let’s verify:

    $ boot2docker up
    $ boot2docker ssh "ls /Users"

You should see a list of all user's home folders from your host OS. Next, we
need to forward the appropriate ports so that we can reach the running
appengine development server directly from the host OS:

    $ VBoxManage controlvm boot2docker-vm natpf1 "aesdk,tcp,127.0.0.1,8080,,8080"
    $ VBoxManage controlvm boot2docker-vm natpf1 "aesdkadmin,tcp,127.0.0.1,8000,,8000"

And you should be ready to go, just follow the rest of the setup guide.


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


[boot2docker]: http://boot2docker.io/  "boot2docker"
[docker]: https://docker.io  "Docker"
[docker_install]: https://docs.docker.com/installation/  "Docker Installation"
[docker_osx_install]: https://docs.docker.com/installation/mac/  "Docker Installation OSX"
[nacelle]: http://github.org/nacelle/nacelle  "nacelle"
[pipdl]: http://www.pip-installer.org/en/latest/installing.html  "Pip download"
[pypi]: https://pypi.python.org/pypi/nacelle  "nacelle on PyPI"
[sdkdl]: https://developers.google.com/appengine/downloads  "Appengine SDK"
[thrdprty]: https://developers.google.com/appengine/docs/python/tools/libraries27  "Appengine third-party libraries"
