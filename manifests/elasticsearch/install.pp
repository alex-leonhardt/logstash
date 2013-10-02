# logstash::elasticsearch::install

class logstash::elasticsearch::install {

# download the rpm
  exec { 'download_elasticsearch':
    command => "/usr/bin/wget ${logstash::elasticsearch_download} -O /tmp/elasticsearch.rpm",
    creates => '/tmp/elasticsearch.rpm',
    unless  => '/bin/ls -1 /etc/elasticearch/elasticsearch.yml',
  } ->
  package { 'elasticsearch':
    ensure    => installed,
    source    => '/tmp/elasticsearch.rpm',
    provider  => 'rpm',
  }

}

