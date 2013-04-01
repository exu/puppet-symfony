class php-dev::install {
    package { 'php5-xdebug':
        ensure => installed,
        require => Class['php-cli']
    }
    package { 'php5-gd':
        ensure => installed,
        require => Class['php-cli']
    }
    exec { 'pear-auto-discover':
        path => '/usr/bin:/usr/sbin:/bin',
        onlyif => 'test "`pear config-get auto_discover`" = "0"',
        command => 'pear config-set auto_discover 1 system',
        require => Class['php-cli']
    }
}

class php-dev {
    include php-dev::install
}
