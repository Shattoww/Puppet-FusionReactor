# == Class: fusionreactor 
# #
# # Installs fusionreactor it on target hosts. Included in the ::security:: profile.
# #
# # === Authors
# #
# # Brian Woodard <bwoodard@globalcashcard.com>
# #
# # === Copyright
# #
# # Copyright 2014 Global Cash Card, unless otherwise noted.

class fusionreactor {
  if $::frinstalled == false {
    file { '/tmp/FusionReactor_linux-x64_5_2_7.sh':
      ensure => 'present',
      source => 'puppet:///modules/fusionreactor/FusionReactor_linux-x64_5_2_7.sh',
      mode   => '0755',
      owner  => 'root',
      group  => 'wheel',
    }
    file { '/tmp/response.varfile':
      ensure => 'present',
      source => 'puppet:///modules/fusionreactor/response.varfile',
      mode   => '0755',
      owner  => 'root',
      group  => 'wheel',
    }
    exec { 'fr_install':
      command   => 'bash FusionReactor_linux-x64_5_2_7.sh -q -varfile response.varfile',
      require   => [ File[/tmp/FusionReactor_linux-x64_5_2_7.sh],
                      File[/tmp/response.varfile]
                      ]
      creates   => '/opt/fusionreactor/',
      logoutput => true,
    }
  }
}
