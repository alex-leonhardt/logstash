# logstash::elasticsearch

class logstash::elasticsearch {

  class { 'logstash::elasticsearch::install': } ->
  class { 'logstash::elasticsearch::service': }

}

