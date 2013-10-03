
# logstash::service

#
# start the service
#

class logstash::service {

  service { 'logstash':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => File['/etc/init.d/logstash'],
  }

}

