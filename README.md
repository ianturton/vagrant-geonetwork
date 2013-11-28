GeoNetwork VM
==================

A Vagrant VM to build GeoNetwork from source for the purpose of GeoNetwork development on Ubuntu 12.04 (Precise Pangolin, 32-bit)

Cookbooks used:

* [apt](https://github.com/opscode-cookbooks/apt)
* [ark](https://github.com/opscode-cookbooks/ark)
* [java](https://github.com/opscode-cookbooks/java)
* [ant](https://github.com/opscode-cookbooks/ant)
* [maven](https://github.com/opscode-cookbooks/maven)
* [python](https://github.com/opscode-cookbooks/python)

## Dependencies

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://vagrantup.com/)
* [Vagrant Librarian-Chef plugin](https://github.com/jimmycuadra/vagrant-librarian-chef)
* [Your own fork of core-geonetwork](https://github.com/geonetwork/core-geonetwork)

## Getting Started

Make sure VirtualBox and Vagrant have installed correctly then clone this repository.

```bash
$ git clone https://github.com/lushc/vagrant-geonetwork geonetwork-vm
$ cd geonetwork-vm
```

If you've got a local Maven 2 repository and want to use it (to avoid re-downloading all the GeoNetwork dependencies if you've got them already) then edit the Vagrantfile and change the *M2_HOME* variable to point to the correct path. Or you could just symlink the .m2 folder.

Clone core-geonetwork (remember to clone your own fork)

```bash
$ cd src
$ git clone https://github.com/<username>/core-geonetwork
$ cd core-geonetwork
$ git remote add upstream https://github.com/geonetwork/core-geonetwork
$ git submodule update --init --recursive
```

Next install the Librarian-Chef plugin and boot up the VM.

```bash
$ cd ../../vagrant
$ vagrant plugin install vagrant-librarian-chef
$ vagrant up
$ vagrant ssh
```

Time to build GeoNetwork! (this might take awhile so grab something to eat/drink)

```bash
$ cd ~/src/core-geonetwork
$ mvn clean install -Dclosure.path=/usr/local/closure-library
```

You can then run GeoNetwork using the embedded Jetty server.

```bash
$ cd web
$ mvn jetty:run
```

## Help!

### GeoNetwork

Always check the [latest documentation for GeoNetwork software development](https://github.com/geonetwork/core-geonetwork/tree/develop/software_development), the build process described in this README might have become out of sync (e.g. the inclusion of a path to a closure library is a relatively new addition with 2.11.x)

### Vagrant

Made a change to the Vagrantfile? ```vagrant reload```

Added a cookbook or changed provision.sh? ```vagrant provision```

Want to shutdown the VM but keep its state intact? ```vagrant suspend```

Want to destroy the VM entirely? ```vagrant destroy```