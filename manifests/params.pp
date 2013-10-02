
# logstash::params

#
# logstash parameters / configuration variables, etc. 
#

class logstash::params {

  $java_pkg_version       = "java-1.6.0-openjdk"
  $logstash_jar_download  = "http://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar"
  $logstash_jar_version   = "1.2.1-flatjar"
  $logstash_user          = "logstash"
  $logstash_basedir       = "/opt/logstash"
  $logstash_server_type   = "shpper"
  $logstash_indexer_conf  = "/opt/logstash/indexer.conf"
  $logstash_shipper_conf  = "/opt/logstash/shipper.conf"
  $logstash_java_maxheap  = "256m"
  $logstash_java_opts     = ""

}


