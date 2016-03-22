class memcached {
            
            file { '/etc/sysconfig/memcached':
              ensure => file,
              owner  => 'root',
              group  => 'root',
              mode   => '0644',
              source => 'puppet:///modules/memcached/memcached.cfg',
              notify => Service['memcached'],
            }
            
            service { 'memcached':
              ensure => running,
              enable => true,
            }
            
            package { 'memcached':
              ensure => present,
              before => File['/etc/sysconfig/memcached.conf'],
            }
}
