
# logstash::redis

class logstash::redis {

  class { 'logstash::redis::install': } ->
  class { 'logstash::redis::service': }

}

