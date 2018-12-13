# ArcLight Prototype Application

This repository contains a minimal [ArcLight](https://github.com/sul-dlss/arclight)
Rails application. It was created using the Arclight generator, as described in
[Getting started: creating a new ArcLight app](https://github.com/sul-dlss/arclight/wiki/Creating,-installing,-and-running-your-ArcLight-application).

## Running in Vagrant

Clone the repo and start up the Vagrant box:

```
git clone git@github.com:peichman-umd/arclight-prototype.git
cd arclight-prototype
vagrant up
```

Start Solr:

```
vagrant ssh
cd /vagrant
solr_wrapper
```

In a separate terminal, start the ArcLight Rails app:

```
vagrant ssh
cd /vagrant
rails s
```

## Running in Docker

Clone the repo and build the Docker image:

```
git clone git@github.com:peichman-umd/arclight-prototype.git
cd arclight-prototype
docker build . -t arclight
```

Start a Docker container from this image:

```
docker run --rm -p 3000:3000 -p 8983:8983 --name arclight -it arclight
```

To connect to the running container and start a bash session:

```
docker exec -it arclight /bin/bash
```

It may also be helpful to connect via a Rails console:

```
docker exec -it arclight rails c
```

**Note:** There is currently no persistence of data from one container to another.
That is, every time you run `docker run` it will create a fresh, empty Solr core.

## Application URLs

For both the Vagrant and Docker methods of running this application, the
default URLs are:

* Solr: <http://localhost:8983>
* ArcLight App: <http://localhost:3000>


