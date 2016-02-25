#FROM centos:6
FROM jdeathe/centos-ssh
MAINTAINER NILANJAN email: roy.nilanjan@gmail.com

# First time need to update the box with repo
RUN yum update -y

# wget is required to update repo with apache 2.4
RUN yum install wget -y

# Install my favourite editor.
RUN yum install vim-X11.x86_64 vim-common.x86_64 vim-enhanced.x86_64 vim-minimal.x86_64 -y
# Building repo

# For apache Centos -7/RHEL 7
#RUN cd /etc/yum.repos.d/ ; wget https://copr-fe.cloud.fedoraproject.org/coprs/rhscl/httpd24/repo/epel-7/rhscl-httpd24-epel-7.repo

# For PHP below provides from remi or webtatic, although above distro of docker IUS already have updated versions.
#RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm ; rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

# For MySQL
#RUN rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
# Building repo ends here


# Installation of the LAMP packages.

# Apache Installation.

#RUN yum --disablerepo="*" --enablerepo="ius" install apr15u.x86_64 apr15u-util.x86_64 -y
RUN yum --enablerepo="base" install apr.x86_64 apr-util.x86_64 -y

# Dependency resolved for apache need to fix.
RUN yum install mailcap redhat-logos-60.0.14-12.el6.centos.noarch -y
#RUN yum --disablerepo="*" --enablerepo="ius" install httpd24u.x86_64 httpd24u-tools.x86_64 -y 
RUN yum --enablerepo="updates" install httpd.x86_64  httpd-tools.x86_64 -y

# PHP Installation

RUN yum  install mod_php70u.x86_64 php70u-common.x86_64 php70u-cli.x86_64 php70u-mysqlnd.x86_64 php70u-pdo.x86_64 php70u-pear.noarch php70u-gd.x86_64 php70u-fpm.x86_64 php70u-mcrypt.x86_64 php70u-mbstring.x86_64 php70u-json.x86_64 php70u-opcache.x86_64 php70u-xml.x86_64 php70u-xmlrpc.x86_64 php70u-bcmath.x86_64 php70u-pgsql.x86_64 php70u-ldap.x86_64 -y

# Composer Installation
RUN curl -sS https://getcomposer.org/installer | php

# Create a softlink
RUN cd /usr/bin ; ln -s /composer.phar composer
RUN cd /opt ; composer require drush/drush
# End of Installation of LAMP packages
