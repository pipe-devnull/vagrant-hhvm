###########################################
# HHVM stack
###########################################

###########################################
# Initialize environment
###########################################
class init {
  exec { 'apt-get updatec':
    command => '/usr/bin/apt-get update'
  }
}

###########################################
# Any basic utils I like having available 
###########################################
class util {

  package { "curl":
    ensure  => present,
  }

  package { "vim":
    ensure  => present,
  }

  package { "make":
    ensure  => present,
  }

}

###########################################
# Basic apache installation & VHOST setup 
# using vhost template file in vagrant-dev/conf.
#
# Setting this host up with profiler links
###########################################
class vhostsetup {

   apache::vhost { 'default':
      docroot             => '/vagrant/www',
      server_name         => 'lampdev',
      server_admin        => 'webmaster@locahost',
      docroot_create      => true,
      priority            => '',
      template            => '/vagrant/conf/main-vhost-template',
  }

}

include init
include apache
include mysql
include vhostsetup
include util