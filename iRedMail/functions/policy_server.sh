#!/usr/bin/env bash

# Author:   Zhang Huangbin (zhb@iredmail.org)

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

openbsd_spamd_config()
{
    # Enable PF, spamd, spamlogd.
    cat >> ${RC_CONF_LOCAL} <<EOF
pf=YES
spamd_flags=''
spamlogd_flags=''
EOF

    # Whitelists in file
    touch /etc/mail/nospamd

    # Enable spamd-setup in cron
    perl -pi -e 's/#(.*spamd-setup.*)/#${1}/' ${CRON_SPOOL_DIR}/root
}

policy_server_config()
{
    if [ X"${USE_CLUEBRINGER}" == X'YES' ]; then
        . ${FUNCTIONS_DIR}/cluebringer.sh

        ECHO_INFO "Configure Cluebringer (postfix policy server)."
        check_status_before_run cluebringer_user
        check_status_before_run cluebringer_config

        if [ X"${DISTRO}" == X'SUSE' ]; then
            # openSUSE-12.3 doesn't have Apache module mod_auth_mysql & mod_auth_pgsql.
            :
        elif [ X"${DISTRO}" == X"DEBIAN" -o X"${DISTRO}" == X"UBUNTU" ]; then
            # Ubuntu 13.10 doesn't ship libapache2-mod-auth-mysql/pgsql
            if [ X"${DISTRO_CODENAME}" == X'wheezy' \
                -o X"${DISTRO_CODENAME}" == X'precise' \
                -o X"${DISTRO_CODENAME}" == X'raring' ]; then
                check_status_before_run cluebringer_webui_config
            else
                :
            fi
        else
            check_status_before_run cluebringer_webui_config
        fi
    fi

    # OpenBSD special
    if [ X"${USE_SPAMD}" == X'YES' ]; then
        check_status_before_run openbsd_spamd_config
    fi

    echo 'export status_policy_server_config="DONE"' >> ${STATUS_FILE}
}
