class symfony2 {

  include php-cli

  exec {
    "composer install":
      command => "curl -s http://getcomposer.org/installer | php",
      cwd => "/home/vagrant",
      user => "vagrant",
      path    => "/usr/bin/:/bin/",
      logoutput => true,
      require => Package[php5-cli],
  }

  exec {
    "create project":
      command => "php composer.phar --prefer-source create-project symfony/framework-standard-edition vagrant.dev",
      cwd => "/home/vagrant",
      user => "vagrant",
      path    => "/usr/bin/:/bin/",
      require => Exec["composer install"],
      logoutput => true,
      timeout => 600,
  }

  exec {
    "change permissions":
      command => "setfacl -R -m u:www-data:rwx app/cache app/logs; setfacl -R -d -m u:www-data:rwx app/cache app/logs; setfacl -R -m u:vagrant:rwx app/cache app/logs; setfacl -R -d -m u:vagrant:rwx app/cache app/logs; setfacl -R -m mask:rwx app/cache app/logs; setfacl -R -d -m mask:rwx app/cache app/logs",
      cwd => "/home/vagrant/vagrant.dev",
      user => "vagrant",
      path    => "/usr/bin/:/bin/",
      require => Exec["create project"],
      logoutput => true,
  }

  exec {
    "controllers ip permissions":
      command => "sed -i 's/::1/10.0.100.1/' web/app_dev.php; sed -i 's/::1/10.0.100.1/' web/config.php",
      cwd => "/home/vagrant/vagrant.dev",
      user => "vagrant",
      path    => "/usr/bin/:/bin/",
      require => Exec["change permissions"],
      logoutput => true,
  }
}
