# logstash puppet module


class logstash (
  $java_pkg_version   = hiera('logstash::java_pkg_version','java-1.6.0-openjdk'),
  $java_maxheap       = hiera('logstash::java_maxheap','256m'),
  $java_opts          = hiera('logstash::java_opts', undef),
  $jar_download       = hiera('logstash::jar_download','http://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar'),
  $jar_version        = hiera('logstash::jar_version','1.2.1-flatjar'),
  $user               = hiera('logstash::user','logstash'),
  $basedir            = hiera('logstash::basedir','/opt/logstash'),
  $server_type        = hiera('logstash::server_type','shipper'),
  $indexer_conf       = hiera('logstash::indexer_conf','/opt/logstash/indexer.conf'),
  $shipper_conf       = hiera('logstash::shipper_conf','/opt/logstash/shipper.conf'),
) {

  notify { "type is ${server_type}": }

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

