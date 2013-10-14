logstash
========                                 

Logstash Puppet module to install and configure a all-in-one logstash server + shipper. 

---
This module is designed to get a quick and easy POC setup. It is currently limited to CentOS/RedHat 6.x only. In a production environment, you'd be using separate elasticsearch and redis modules on hopefully separate hosts. 


# Pre-requisites
  
Repositories:

- [EPEL6](http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html)
    
Puppet Modules:

- [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib) 

General:

- Access to the internet to download redis, elasticsearch, logstash packages/jars

# Usage
    
## Install the indexer                   
```
  class { 'logstash':                    
    server_type => 'indexer'
  }
```

## Install the shipper (on nodes/servers)                                                                                                                                                                                       
```
  class { 'logstash':
    redis_server_ip => '<logstash_indexer_ip_goes_here_or_configure_via_hiera>'
  }
```

# Notes

### Redis

Redis has been left with its default configuration, for a POC or DEV install, this should be OK. However, for production use, do use a separate redis server/infrastructure. 

### ElasticSearch

ES has been left with its default configuration, for a POC or DEV install, this should be OK. However, for production use, you will need to consider a ES cluster setup instead of a standalone default local installation.

