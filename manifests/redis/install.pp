# logstash::redis::install

class logstash::redis::install {

  file { '/opt/redis':
    ensure  => directory,
  } ->
  exec { 'download_redis':
    command => "wget ${logstash::redis_pkg_version} -O /tmp/redis.tgz",
    creates => '/tmp/redis.tgz',
  } ->
  exec { 'untar_redis':
    command => 'tar -zxf redis.tgz',
    cwd     => '/tmp',
    creates => "/tmp/redis-${logstash::redis_pkg_version}",
  } ->
  exec { 'make_redis':
    command => 'make',
    cwd     => "/tmp/redis-${logstash::redis_pkg_version}",
    creates => "/tmp/redis-${logstash::redis_pkg_version}/src/redis-server",
  } ->
  exec { 'install_redis':
    command => "make PREFIX=${logstash::redis_basedir} install",
    cwd     => "/tmp/redis-${logstash::redis_pkg_version}",
    creates => "${logstash::redis_basedir}/redis-server",
  }

}

