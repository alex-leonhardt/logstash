
# logstash::config

class logstash::config {

  user { 'logstash':
    ensure  => present,
    home    => "${logstash::basedir}",
  } ->
  file { "${logstash::basedir}":
    ensure  => directory,
    owner   => "${logstash::user}",
    group   => "${logstash::user}",
    mode    => '0644',
  } ->
  exec { 'download_logstash_jar':
    command   => "/usr/bin/wget ${logstash::download} -O ${logstash::basedir}/logstash-${logstash::pkg_version}.jar",
    creates   => "${logstash::basedir}/logstash-${logstash::pkg_version}.jar",
  } ->
  file { "${logstash::basedir}/logstash-${logstash::pkg_version}.jar":
    owner   => 'logstash',
    group   => 'logstash',
    mode    => '0664',
  }

  $conf_file = $logstash::server_type ? {
    'shipper' => "${logstash::shipper_conf}",
    'indexer' => "${logstash::indexer_conf}",
    default   => "${logstash::shipper_conf}"
  }

  file { "${logstash::basedir}/${logstash::config::conf_file}":
    ensure  => present,
    owner   => 'logstash',
    group   => 'logstash',
    mode    => '0644',
    content => template("${module_name}/${logstash::server_type}.conf.erb"),
    require => File["${logstash::basedir}"],
  }

  file { '/etc/init.d/logstash':
    ensure  => present,
    mode    => '0755',
    content => template("${module_name}/logstash.init.erb"),
    notify  => Service['logstash']
  }

}

