
# logstash::packages

#
# install required dependencies
#

class logstash::packages {

  $packages = [
                "${logstash::java_pkg_version}",
                'wget',
                'gcc',
                'make',
              ]

  package { $packages: ensure => installed  } ->
  class {'logstash::redis': } ->
  class {'logstash::elasticsearch': }


}


