class utility {
  define file_copy($source, $destination) {
    file { $destination:
      ensure => file,
      source => $source,
    }
  }
  define file_remove($path) {
    file { $path:
      ensure => absent,
    }
  }
  define directory_create($path) {
    file { $path:
      ensure => directory,
    }
  }
  define package_install($name) {
    package { $name:
      ensure => installed,
    }
  }
  define service_manage($name, $ensure = 'running') {
    service { $name:
      ensure => $ensure,
      enable => true,
    }
  }
  define user_manage($name, $home) {
    user { $name:
      ensure => present,
      home => $home,
    }
  }
  define template_apply($source, $destination) {
    file { $destination:
      ensure => file,
      content => template($source),
    }
  }
  define cron_job($title, $command, $user) {
    cron { $title:
      command => $command,
      user => $user,
    }
  }
  define exec_run($command) {
    exec { $command:
      command => $command,
      path => '/usr/bin',
    }
  }
  define archive_extract($source, $destination) {
    exec { 'extract_archive':
      command => "tar -xzf ${source} -C ${destination}",
      path => '/usr/bin',
    }
  }
  define log_message($message) {
    exec { 'log_message':
      command => "echo '${message}' >> /var/log/puppet.log",
      path => '/bin',
    }
  }
}
