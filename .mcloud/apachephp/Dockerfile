FROM ubuntu:12.04

RUN apt-get dist-upgrade
RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common

RUN cat /etc/apt/sources.list

RUN apt-get install -y python-software-properties && \
    add-apt-repository ppa:ondrej/php5-oldstable && \
    apt-get update -y && \
    apt-cache policy php5 && \
    apt-get install -y php5 \
                       php5-mysql \
                       php5-mcrypt \
                       php5-curl \
                       php5-gd \
                       php5-xsl

RUN apt-get install -y openssh-server

RUN  echo "    IdentityFile /.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN  echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN  echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config
ADD id_rsa /.ssh/id_rsa
RUN chmod go-rwx -R /.ssh

RUN apt-get install -y apache2 libapache2-mod-php5

RUN sed -i -e"s/;date.timezone =/date.timezone = Europe\/Tallinn/g" /etc/php5/apache2/php.ini
RUN sed -i -e"s/;date.timezone =/date.timezone = Europe\/Tallinn/g" /etc/php5/apache2/php.ini

ADD default /etc/apache2/sites-available/

# enable mod rewrite
RUN a2enmod rewrite

RUN apt-get install -y cron curl mysql-client openssh-client git wget zip imagemagick

RUN cd /tmp && \
    wget --no-check-certificate http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip -O pkg.zip && \
    unzip pkg.zip && \
    cd ioncube && \
    mkdir /usr/ioncube && \
    cp -rf ./ioncube_loader_lin_5.4.so /usr/ioncube/ && \
    rm -rf /tmp/*

RUN echo "zend_extension = '/usr/ioncube/ioncube_loader_lin_5.4.so'" >> /etc/php5/apache2/php.ini

VOLUME ["/var/www"]

EXPOSE 80
WORKDIR /var/www



