
# logstash::repos

#
# install required repositories
#

class logstash::repos {

  yumrepo { 'epel':
    baseurl   => 'http://dl.fedoraproject.org/pub/epel/6/$basearch/',
    descr     => 'EPEL',
    enabled   => 1,
    gpgcheck  => 1
  }

}

