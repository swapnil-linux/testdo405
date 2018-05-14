user { 'jane':
  ensure           => 'present',
  comment          => 'jane smith',
  groups           => ['wheel','root'],
  home             => '/home/jane',
  shell            => '/bin/sh',
  uid              => '1100',
  managehome	=> true,
}

File { 
  ensure   => 'file',
  mode     => '640',
  owner    => '1100',
  require => User['jane']
}

file { '/home/jane/test.txt':
  content  => "This is a test file\n",
}

file { '/home/jane/test1.txt':
  content  => "This is a test1 file\n",
  mode => 600,
}


notify {'usercreated':
  message => "User jane created successfully",

}





