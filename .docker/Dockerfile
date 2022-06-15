ARG CENTOS_VERSION

FROM centos:${CENTOS_VERSION:+${CENTOS_VERSION}}
ARG COMPOSER_VERSION
ARG PHP_VERSION

LABEL maintainer="George Barbu"
LABEL version="1.x"
LABEL description="Development environment for the joy and pleasure of web developers"

# Set working directory
WORKDIR /src/fast-track

RUN test -d /usr/share/pki/ca-trust-source/anchors && echo 'It Exists'

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN yum install -y epel-release
RUN yum install -y yum-utils

RUN yum-config-manager --disable remi-php54
RUN yum-config-manager --enable remi-php${PHP_VERSION}

RUN yum install -y openssl php php-common php-cli php-zip wget unzip php-pear php-devel

RUN yum -y install librdkafka-devel
RUN pecl install rdkafka
COPY 20-rdkafka.ini /etc/php.d/20-rdkafka.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION}

RUN yum install -y ca-certificates
COPY dercert2019.pem /usr/share/pki/ca-trust-source/anchors/dercert2019.pem
RUN update-ca-trust force-enable
RUN update-ca-trust extract

COPY 20-php.ini /etc/php.d/20-php.ini
COPY ft_events.service /etc/systemd/system/ft_events.service