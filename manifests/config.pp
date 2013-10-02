
# logstash::config

class logstash::config {

  user { 'logstash':
    ensure  => present,
    home    => "${logstash::basedir}",
  } ->
  file { '/opt/logstash':
    ensure  => directory,
    owner   => "${logstash::user}",
    group   => "${logstash::user}",
    mode    => '0644',
  } ->
  exec { 'download_logstash_jar':
    command   => "/usr/bin/wget ${logstash::jar_download} -O ${logstash::basedir}/logstash-${logstash::jar_version}.jar",
    creates   => "${logstash::basedir}/logstash-${logstash::jar_version}.jar",
  } ->
  file { "${logstash::logstash_basdir}/logstash-${logstash::jar_version}.jar":
    owner   => 'logstash',
    group   => 'logstash',
    mode    => '0664',
  }

  $conf_file = $logstash::server_type ? {
    'shipper' => "${logstash::shipper_conf}",
    'indexer' => "${logstash::indexer_conf}",
    default   => "${logstash::shipper_conf}"
  }

  # needs removing the file if it isnt set to be a indexer/etc.
  file { "${conf_file}":
    ensure  => present,
    owner   => 'logstash',
    group   => 'logstash',
    mode    => '0644',
    content => template("${module_name}/${logstash::server_type}.conf.erb"),
    require => File['/opt/logstash'],
  }

}


