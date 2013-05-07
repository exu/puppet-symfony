Puppet modules for Symfony development with Vagrant
===================================================

Quick start
-----------

#### Install vagrant and puppet

- Vagrant - installed it from http://downloads.vagrantup.com/tags/v1.2.2
- Puppet - installed from `gem install puppet`


#### TLDR-mode script

```
git clone git://github.com/exu/puppet-symfony.git .puppet
ln -s .puppet/Vagrantfile ./Vagrantfile
vagrant up
sudo sh -c 'echo "10.0.100.110 vagrant.dev" >> /etc/hosts'
vagrant ssh
```

OR

#### Clone the puppet modules and manifests into your project:

```bash
cd your-project
git clone git://github.com/exu/puppet-symfony.git .puppet
```

#### Copy Vagrantfile

```bash
ln -s .puppet/Vagrantfile ./Vagrantfile
```

#### Boot your virtual machine:

```bash
vagrant up
```

ssh into it once it boots:

```bash
vagrant ssh
```

#### Symfony Standard Edition

Base project will be installed in `/home/vagrant/vagrant.dev` directory

#### To gain access to your project from Web browser you'll need to add [vagrant.dev](http://vagrant.dev) host

```bash
sudo sh -c 'echo "10.0.100.110 vagrant.dev" >> /etc/hosts'
```

### Networking details

- VMs network is configured in host-only mode to handle IP `10.0.100.110`.
- Your client accessing it with IP: `10.0.100.1`.
- You can `ssh vagrant@10.0.100.110` (default password is `vagrant`)

### Editing files on VM

```
sshfs vagrant@10.0.100.110:/home/vagrant/vagrant.dev /home/exu/Training
```

If you don't want to enter your password you can execute ```ssh-copy-id vagrant@10.0.100.110``` first.
