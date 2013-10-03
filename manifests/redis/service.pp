# logstash::redis::service

class logstash::redis::service {

  service { 'redis':
    ensure  => running,
    start   => "${logstash::redis_basedir}/bin/redis-server /opt/redis/redis.conf",
    stop    => 'killall redis-server',
    status  => 'killall -0 redis-server',
    require => [Exec['install_redis'], Exec['conf_redis_1'], Exec['conf_redis_2']],
  }

}
