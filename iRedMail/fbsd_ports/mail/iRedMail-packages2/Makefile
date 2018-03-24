PORTNAME=	iRedMail-packages2
PORTVERSION=	1.0
CATEGORIES=	mail

MAINTAINER=	cattelan@digitalelves.com
COMMENT=	Stuff

PREFERRED_OPENLDAP_VER=24
PREFERRED_PHP_VER=71
PREFERRED_PGSQL_VER=95
PREFERRED_MYSQL_VER=57

MY_DEPENDS += \
	postgresql${PREFERRED_PGSQL_VER}-client>=0:${PORTSDIR}/databases/postgresql${PREFERRED_PGSQL_VER}-client \
	postgresql${PREFERRED_PGSQL_VER}-contrib>=0:${PORTSDIR}/databases/postgresql${PREFERRED_PGSQL_VER}-contrib \
	postgresql${PREFERRED_PGSQL_VER}-server>=0:${PORTSDIR}/databases/postgresql${PREFERRED_PGSQL_VER}-server \
	sope3>=3:${PORTSDIR}/devel/sope3 \
	curl>=0:${PORTSDIR}/ftp/curl \
	spamassassin>=3:${PORTSDIR}/mail/spamassassin \
	dovecot>=0:${PORTSDIR}/mail/dovecot \
	dovecot-pigeonhole>=0:${PORTSDIR}/mail/dovecot-pigeonhole \
	postfix>=0:${PORTSDIR}/mail/postfix \
	roundcube>=0:${PORTSDIR}/mail/roundcube \
	amavisd-new>=2:${PORTSDIR}/security/amavisd-new \
	ca_root_nss>=0:${PORTSDIR}/security/ca_root_nss \
	clamav>=0:${PORTSDIR}/security/clamav \
	cyrus-sasl>=2:${PORTSDIR}/security/cyrus-sasl2 \
	gnupg>=0:${PORTSDIR}/security/gnupg \
	nginx>=0:${PORTSDIR}/www/nginx \
	sogo3>=0:${PORTSDIR}/www/sogo3 \
	bash:${PORTSDIR}/shells/bash-static \
	mysql${PREFERRED_MYSQL_VER}-server>=5.7:${PORTSDIR}/databases/mysql${PREFERRED_MYSQL_VER}-server \
	mysql${PREFERRED_MYSQL_VER}-client>=5.7:${PORTSDIR}/databases/mysql${PREFERRED_MYSQL_VER}-client \
	uwsgi>0:${PORTSDIR}/www/uwsgi \
	webpy>0:${PORTSDIR}/www/webpy \
	python27>0:${PORTSDIR}/lang/python27 \

RUN_DEPENDS = ${MY_DEPENDS}

USES=		metaport

.include <bsd.port.mk>
