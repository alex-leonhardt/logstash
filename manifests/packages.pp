
# logstash::packages

#
# install required dependencies
#

class logstash::packages {


  $packages = [
                "${logstash::java_pkg_version}",
                'wget'
              ]

  package { $packages:
    ensure => installed,
  }


}


