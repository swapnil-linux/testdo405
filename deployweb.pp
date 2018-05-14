package {'httpd':
 ensure => latest,
}

file {'/tmp/test.conf':
   content => "This is a test file\n",
   notify => Service[httpd],

}

service { 'httpd':
  ensure => 'running',
  enable => 'true',
  require => Package['httpd'],

}

notify {'log':
  message => "web server deployed\n",

}
