# logstash::redis::service

class logstash::redis::service {

  service { 'redis':
    ensure  => running,
    start   => "${logstash::redis_basedir}/redis-server /opt/redis/redis.conf",
    stop    => 'killall redis-server',
    timeout => 30,
    require => Exec['install_redis'],
  }

}
