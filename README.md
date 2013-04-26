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

Create a Vagrantfile and configure manifests and module paths. You can use
provided example:

```bash
cat .puppet/Vagrantfile |
    sed -e 's/manifests_path = "manifests"/manifests_path = ".puppet\/manifests"/g' |
    sed -e 's/module_path = "modules"/module_path = ".puppet\/modules"/g' > Vagrantfile
```

### Boot your virtual machine:

```bash
vagrant up
```

ssh into it once it boots:

```bash
vagrant ssh
```

Symfony Standard Edition
------------------------

Base project installed in `vagrant.dev` directory
