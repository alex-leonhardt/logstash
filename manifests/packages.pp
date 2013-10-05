
# logstash::packages

#
# install required dependencies
#

class logstash::packages {

  $packages = [
                "${logstash::java_pkg_version}",
                'gcc',
                'make',
                'wget',
              ]

  package { $packages: ensure => installed  }


}


