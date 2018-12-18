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
solr_wrapper --version 7.3.0
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

## Loading Sample Data

### Docker

1) On the host, access the terminal in the Docker container:

```
docker exec -it arclight /bin/bash
```

2) Create an "eads" directory:

```
mkdir eads
```

3) In a separate terminal, copy EAD files into a running Docker container, use:

```
docker cp <EAD FILE> arclight:~/eads
```

This will copy the file from the host to the ~/eads.

4) In the Docker container terminal, add the file:

```
FILE=./eads/<EAD_FILE_NAME> REPOSITORY_ID=umd bundle exec rake arclight:index
```

where <EAD_FILE_NAME> is the name of the file.

For example, if the EAD filename is "0037.LIT_20181213_170001_UTC__ead.xml" the
command would be:

```
FILE=./eads/0037.LIT_20181213_170001_UTC__ead.xml REPOSITORY_ID=umd bundle exec rake arclight:index
```