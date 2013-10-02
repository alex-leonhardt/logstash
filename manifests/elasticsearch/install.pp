# logstash::elasticsearch::install

class logstash::elasticsearch::install {

# download the rpm
  exec { 'download_elasticsearch':
    command => "wget ${logstash::elasticsearch_download} -O /tmp/elasticsearch.rpm",
  } ->
  package { '/tmp/elasticsearch.rpm':
    ensure => installed,
  }

}

