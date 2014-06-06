#!/usr/bin/env bash

# Author:   Zhang Huangbin (zhb _at_ iredmail.org)

#---------------------------------------------------------------------
# This file is part of iRedMail, which is an open source mail server
# solution for Red Hat(R) Enterprise Linux, CentOS, Debian and Ubuntu.
#
# iRedMail is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# iRedMail is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with iRedMail.  If not, see <http://www.gnu.org/licenses/>.
#---------------------------------------------------------------------

# -------------------------------------------------------
# ------------------- Nginx -----------------------------
# -------------------------------------------------------

nginx_config()
{
    ECHO_INFO "Configure Nginx web server."

    backup_file ${NGINX_CONF} ${NGINX_CONF_DEFAULT}

    # Copy sample config files
    [ ! -d ${NGINX_CONF_DIR} ] && mkdir -p ${NGINX_CONF_DIR}
    cp ${SAMPLE_DIR}/nginx/nginx.conf ${NGINX_CONF}
    cp ${SAMPLE_DIR}/nginx/default.conf ${NGINX_CONF_DEFAULT}

    # nginx.conf
    perl -pi -e 's#PH_HTTPD_USER#$ENV{HTTPD_USER}#g' ${NGINX_CONF}

    perl -pi -e 's#PH_NGINX_LOG_ERRORLOG#$ENV{NGINX_LOG_ERRORLOG}#g' ${NGINX_CONF}
    perl -pi -e 's#PH_NGINX_LOG_ACCESSLOG#$ENV{NGINX_LOG_ACCESSLOG}#g' ${NGINX_CONF} ${NGINX_CONF_DEFAULT}
    perl -pi -e 's#PH_NGINX_PID#$ENV{NGINX_PID}#g' ${NGINX_CONF}

    perl -pi -e 's#PH_NGINX_MIME_TYPES#$ENV{NGINX_MIME_TYPES}#g' ${NGINX_CONF}
    perl -pi -e 's#PH_NGINX_CONF_DIR#$ENV{NGINX_CONF_DIR}#g' ${NGINX_CONF}

    # default server
    perl -pi -e 's#PH_HTTPD_PORT#$ENV{HTTPD_PORT}#g' ${NGINX_CONF_DEFAULT}
    perl -pi -e 's#PH_HTTPD_SERVERROOT#$ENV{HTTPD_SERVERROOT}#g' ${NGINX_CONF_DEFAULT}
    perl -pi -e 's#PH_HTTPD_DOCUMENTROOT#$ENV{HTTPD_DOCUMENTROOT}#g' ${NGINX_CONF_DEFAULT}
    perl -pi -e 's#PH_FASTCGI_PASS#$ENV{FASTCGI_PASS}#g' ${NGINX_CONF_DEFAULT}

    # ssl
    perl -pi -e 's#PH_HTTPS_PORT#$ENV{HTTPS_PORT}#g' ${NGINX_CONF_DEFAULT}
    perl -pi -e 's#PH_SSL_CERT_FILE#$ENV{SSL_CERT_FILE}#g' ${NGINX_CONF_DEFAULT}
    perl -pi -e 's#PH_SSL_KEY_FILE#$ENV{SSL_KEY_FILE}#g' ${NGINX_CONF_DEFAULT}

    # Roundcube
    perl -pi -e 's#PH_RCM_HTTPD_ROOT_SYMBOL_LINK#$ENV{RCM_HTTPD_ROOT_SYMBOL_LINK}#g' ${NGINX_CONF_DEFAULT}
    # phpLDAPadmin
    perl -pi -e 's#PH_PLA_HTTPD_ROOT_SYMBOL_LINK#$ENV{PLA_HTTPD_ROOT_SYMBOL_LINK}#g' ${NGINX_CONF_DEFAULT}
    # phpMyAdmin
    perl -pi -e 's#PH_PHPMYADMIN_HTTPD_ROOT_SYMBOL_LINK#$ENV{PHPMYADMIN_HTTPD_ROOT_SYMBOL_LINK}#g' ${NGINX_CONF_DEFAULT}

    cat >> ${TIP_FILE} <<EOF
Nginx:
    * Configuration files:
        - ${NGINX_CONF}
        - ${NGINX_CONF_DEFAULT}
    * Directories:
        - ${NGINX_CONF_ROOT}
        - ${HTTPD_DOCUMENTROOT}
    * See also:
        - ${HTTPD_DOCUMENTROOT}/index.html

EOF

    echo 'export status_nginx_config="DONE"' >> ${STATUS_FILE}
}
