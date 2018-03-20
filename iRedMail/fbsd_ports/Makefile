PORTNAME=	iRedMail-packages
PORTVERSION=	1.0
CATEGORIES=	mail

MAINTAINER=	cattelan@digitalelves.com
COMMENT=	Stuff

PREFERRED_OPENLDAP_VER=24
PREFERRED_PHP_VER=71
PREFERRED_PGSQL_VER=95
PREFERRED_MYSQL_VER=57

MY_DEPENDS = \
        py27-MySQLdb>0:${PORTSDIR}/databases/py-MySQLdb

MY_DEPENDS += \
	jpeg>0:${PORTSDIR}/graphics/jpeg \
	libgd>2:${PORTSDIR}/graphics/gd

MY_DEPENDS += \
	arj>=0:${PORTSDIR}/archivers/arj \
	p5-Archive-Tar>=0:${PORTSDIR}/archivers/p5-Archive-Tar \
	p7zip>=0:${PORTSDIR}/archivers/p7zip \
	rar>=0:${PORTSDIR}/archivers/rar \
	libiconv>=0:${PORTSDIR}/converters/libiconv \
	postgresql${PREFERRED_PGSQL_VER}-client>=0:${PORTSDIR}/databases/postgresql${PREFERRED_PGSQL_VER}-client \
	postgresql${PREFERRED_PGSQL_VER}-contrib>=0:${PORTSDIR}/databases/postgresql${PREFERRED_PGSQL_VER}-contrib \
	postgresql${PREFERRED_PGSQL_VER}-server>=0:${PORTSDIR}/databases/postgresql${PREFERRED_PGSQL_VER}-server \
	py27-sqlalchemy10>=1.0:${PORTSDIR}/databases/py-sqlalchemy10 \
	apr>=1:${PORTSDIR}/devel/apr1 \
	dbus>=0:${PORTSDIR}/devel/dbus \
	m4>=0:${PORTSDIR}/devel/m4 \
	py27-Jinja2>=0:${PORTSDIR}/devel/py-Jinja2 \
	py27-Babel>=0:${PORTSDIR}/devel/py-babel \
	sope3>=3:${PORTSDIR}/devel/sope3 \
	p5-Net-DNS>=0:${PORTSDIR}/dns/p5-Net-DNS \
	py27-dnspython>=0:${PORTSDIR}/dns/py-dnspython \
	curl>=0:${PORTSDIR}/ftp/curl \
	spamassassin>=3:${PORTSDIR}/mail/spamassassin \
	perl5.26>=0:${PORTSDIR}/lang/perl5.26 \
	php${PREFERRED_PHP_VER}>=7.1:${PORTSDIR}/lang/php${PREFERRED_PHP_VER} \
	php${PREFERRED_PHP_VER}-extensions>=1:${PORTSDIR}/lang/php${PREFERRED_PHP_VER}-extensions \
	mod_php${PREFERRED_PHP_VER}>=7.1:${PORTSDIR}/www/mod_php${PREFERRED_PHP_VER} \
	php${PREFERRED_PHP_VER}-gd>=7.1:${PORTSDIR}/graphics/php${PREFERRED_PHP_VER}-gd \
	cairo>=0:${PORTSDIR}/graphics/cairo \
	python27>=0:${PORTSDIR}/lang/python27 \
	dovecot>=0:${PORTSDIR}/mail/dovecot \
	postfix>=0:${PORTSDIR}/mail/postfix \
	roundcube>=0:${PORTSDIR}/mail/roundcube \
	openldap-sasl-client>=2.4:${PORTSDIR}/net/openldap${PREFERRED_OPENLDAP_VER}-sasl-client \
	openldap-server>=0:${PORTSDIR}/net/openldap${PREFERRED_OPENLDAP_VER}-server \
	openslp>=0:${PORTSDIR}/net/openslp \
	py27-ldap>=2:${PORTSDIR}/net/py-ldap \
	amavisd-new>=2:${PORTSDIR}/security/amavisd-new \
	ca_root_nss>=0:${PORTSDIR}/security/ca_root_nss \
	clamav>=0:${PORTSDIR}/security/clamav \
	cyrus-sasl>=2:${PORTSDIR}/security/cyrus-sasl2 \
	gnupg>=0:${PORTSDIR}/security/gnupg \
	libssh2>=0:${PORTSDIR}/security/libssh2 \
	p5-Authen-SASL>=0:${PORTSDIR}/security/p5-Authen-SASL \
	p5-IO-Socket-SSL>=0:${PORTSDIR}/security/p5-IO-Socket-SSL \
	nginx>=0:${PORTSDIR}/www/nginx \
	sogo3>=0:${PORTSDIR}/www/sogo3 \
	bash:${PORTSDIR}/shells/bash-static \

MY_DEPENDS += \
	mysql${PREFERRED_MYSQL_VER}-server>=5.7:${PORTSDIR}/databases/mysql${PREFERRED_MYSQL_VER}-server \
	mysql${PREFERRED_MYSQL_VER}-client>=5.7:${PORTSDIR}/databases/mysql${PREFERRED_MYSQL_VER}-client

RUN_DEPENDS = ${MY_DEPENDS}


USES=		metaport

.include <bsd.port.mk>
