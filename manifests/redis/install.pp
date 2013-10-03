# logstash::redis::install

class logstash::redis::install {

  file { "${logstash::redis_basedir}":
    ensure  => directory,
  } ->
  exec { 'download_redis':
    command => "/usr/bin/wget ${logstash::redis_download} -O /tmp/redis.tgz",
    creates => '/tmp/redis.tgz',
  } ->
  exec { 'untar_redis':
    command => '/bin/tar -zxf redis.tgz',
    cwd     => '/tmp',
    creates => "/tmp/redis-${logstash::redis_pkg_version}",
  } ->
  exec { 'make_redis':
    command => '/usr/bin/make',
    cwd     => "/tmp/redis-${logstash::redis_pkg_version}",
    creates => "/tmp/redis-${logstash::redis_pkg_version}/src/redis-server",
  } ->
  exec { 'install_redis':
    command => "/usr/bin/make PREFIX=${logstash::redis_basedir} install",
    cwd     => "/tmp/redis-${logstash::redis_pkg_version}",
    creates => "${logstash::redis_basedir}/bin/redis-server",
  } ->
  exec { 'conf_redis_1':
    command => "/bin/sed -i s/^daemonize\\ no$/daemonize\\ yes/ig /tmp/redis-${logstash::redis_pkg_version}/redis.conf",
    cwd     => "/tmp/redis-${logstash::redis_pkg_version}",
    unless  => "/bin/ls -1 ${logstash::redis_basedir}/redis.conf",
  }->
  exec { 'conf_redis_2':
    command => "/bin/cp redis.conf ${logstash::redis_basedir}",
    cwd     => "/tmp/redis-${logstash::redis_pkg_version}",
    creates => "${logstash::redis_basedir}/redis.conf",
  }

}

