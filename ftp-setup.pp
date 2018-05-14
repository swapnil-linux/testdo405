package { 'vsftpd':
  ensure  => 'present',
  allow_virtual => true,
}

user { 'ftpadmin':
  ensure  => 'present',
  home    => '/var/ftp',
  shell   => '/bin/bash',
  require => Package['vsftpd'],
  managehome => true,
}

user {'jane':
   ensure => present,
}


file { '/var/ftp/pub':
  ensure  => 'directory',
  owner   => 'ftpadmin',
  mode    => '0755',
  require =>  User['ftpadmin'],
}

service { 'vsftpd':
  ensure  => 'running',
  enable  => 'true',
  require =>  [User['ftpadmin','jane'],Package['vsftpd']],
  
}

