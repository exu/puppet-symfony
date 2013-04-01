class vim {
  if ($operatingsystem == "Ubuntu") or ($operatingsystem == "Debian") {
    package { "vim-nox":
      ensure => present,
    }
  }
  File { ignore => '.git' }
  file {"/home/vagrant/.vimrc":
     content => template("vim/vimrc.erb"),
  }
  file {"/home/vagrant/.vim":
    source  => "puppet:///modules/vim",
    recurse => true,
    mode    => 664,
    require => File["/home/vagrant/.vimrc"]
  }
}
