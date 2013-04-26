class emacs {
  include apt

  apt::ppa { "ppa:cassou/emacs": }

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    before => Apt::Ppa["ppa:cassou/emacs"],
  }

  exec { 'apt-get update 2':
    command => '/usr/bin/apt-get update',
    require => [ Apt::Ppa["ppa:cassou/emacs"] ],
  }

  package { ["emacs-snapshot", "emacs-snapshot-el", "emacs-snapshot-bin-common"]:
    ensure => present,
    require => Exec["apt-get update 2"],
  }

  exec { 'apt-get update 2':
    command => '/usr/bin/apt-get update',
    require => [ Apt::Ppa["ppa:cassou/emacs"] ],
  }

  exec { 'basic config':
    command => 'curl -L https://raw.github.com/exu/emacs.d/master/micro.emacs.el > .emacs',
    require => [ Apt::Ppa["ppa:cassou/emacs"] ],
  }


}
