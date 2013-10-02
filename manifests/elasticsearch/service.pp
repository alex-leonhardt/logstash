# logstash::elasticsearch::service

class logstash::elasticsearch::service {

  service { 'logstash':
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
    require     => Package['elasticsearch'],
  }

}

