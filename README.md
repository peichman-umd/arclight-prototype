# ArcLight Prototype Application

Clone and start up the Vagrant box:

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
