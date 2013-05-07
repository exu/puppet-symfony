Puppet modules for Symfony development with Vagrant
===================================================

Quick start
-----------

### Install vagrant and puppet

- Vagrant - installed it from http://downloads.vagrantup.com/tags/v1.2.2
- Puppet - installed from `gem install puppet`

### Clone the puppet modules and manifests into your project:

```bash
cd your-project
git clone git://github.com/exu/puppet-symfony.git .puppet
```

### Copy Vagrantfile

```bash
cp .puppet/Vagrantfile .
```

### Boot your virtual machine:

```bash
vagrant up
```

ssh into it once it boots:

```bash
vagrant ssh
```

### Symfony Standard Edition

Base project will be installed in `/home/vagrant/vagrant.dev` directory


### Networking details

- VMs network is configured in host-only mode to handle IP `10.0.100.110`.
- Your client accessing it with IP: `10.0.100.1`.
- You can `ssh vagrant@10.0.100.110` (default password is `vagrant`)
