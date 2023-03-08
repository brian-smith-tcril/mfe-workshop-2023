# Local `devstack` Quickstart
## Install prerequisites
* [`make`](https://www.gnu.org/software/make/)
* [`python 3.x`](https://www.python.org/)
* [`pip`](https://pip.pypa.io/en/stable/)
* [`docker-compose`](https://docs.docker.com/compose/)
* [`git`](https://git-scm.com/)
* [`virtualenv`](https://virtualenv.pypa.io/en/stable/)

```sh
# In a debian-based environment:
$ sudo apt install make python docker-compose git python3-pip
$ pip install virtualenv
```

## Add user to the docker group
```sh
# In a debian-based environment:
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
```

**Note: You may need to log out/restart for group settings to take effect**

## Make/enter a parent directory for the virtualenv and all the repos
```sh
$ mkdir devstackworkspace
$ cd devstackworkspace
```

## Clone `devstack`
```sh
$ git clone https://github.com/openedx/devstack.git
```

## Make/activate a virtualenv
```sh
$ virtualenv devstack-venv
$ source devstack-venv/bin/activate
```

## Run makefile steps in devstack
```sh
$ cd devstack
$ make requirements
$ make dev.clone.https
$ make dev.pull.large-and-slow
$ make dev.provision
$ make dev.up.large-and-slow
```
