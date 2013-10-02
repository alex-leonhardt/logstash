# logstash puppet module


class logstash (
  $java_pkg_version   = hiera('logstash::java_pkg_version','java-1.6.0-openjdk'),
  $java_maxheap       = hiera('logstash::java_maxheap','256m'),
  $java_opts          = hiera('logstash::java_opts', undef),
  $download           = hiera('logstash::download','http://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar'),
  $pkg_version        = hiera('logstash::pkg_version','1.2.1-flatjar'),
  $user               = hiera('logstash::user','logstash'),
  $basedir            = hiera('logstash::basedir','/opt/logstash'),
  $server_type        = hiera('logstash::server_type','shipper'),
  $indexer_conf       = hiera('logstash::indexer_conf','indexer.conf'),
  $shipper_conf       = hiera('logstash::shipper_conf','shipper.conf'),
  $redis_download     = hiera('logstash::redis_download','http://download.redis.io/releases/redis-2.6.16.tar.gz'),
  $redis_pkg_version  = hiera('logstash::redis_pkg_version','2.6.16'),
  $redis_basedir          = hiera('logstash::redis_basedir','/opt/redis'),
  $elasticsearch_download = hiera('logstash::elasticsearch_download','http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.5.noarch.rpm'),
) {

#  notify { "type is ${server_type}": }

  stage { 'repos':
    before => Stage['main'],
  }

  class { 'logstash::repos':
    stage => 'repos',
  }

  anchor { 'logstash::begin': } ->
  class { 'logstash::packages': } ->
  class { 'logstash::config': } ->
  class { 'logstash::service': } ->
  class { 'logstash::monitoring': } ->
  anchor { 'logstash::end': }

}

