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

# --------------------------------------------
# ClamAV.
# --------------------------------------------

clamav_config()
{
    ECHO_INFO "Configure ClamAV (anti-virus toolkit)."
    backup_file ${CLAMD_CONF} ${FRESHCLAM_CONF}

    if [ X"${DISTRO}" == X'OPENBSD' ]; then
        perl -pi -e 's/^(Example)/#${1}/' ${CLAMD_CONF} ${FRESHCLAM_CONF}
        mkdir /var/log/clamav
        chown ${CLAMAV_USER}:${CLAMAV_GROUP} /var/log/clamav
    fi

    export CLAMD_LOCAL_SOCKET CLAMD_BIND_HOST
    ECHO_DEBUG "Configure ClamAV: ${CLAMD_CONF}."
    perl -pi -e 's/^(TCPSocket .*)/#${1}/' ${CLAMD_CONF}
    perl -pi -e 's#^(TCPAddr ).*#${1} $ENV{CLAMD_BIND_HOST}#' ${CLAMD_CONF}

    # Disable log file
    perl -pi -e 's/^(LogFile.*)/#${1}/' ${CLAMD_CONF}

    # Set CLAMD_LOCAL_SOCKET
    perl -pi -e 's/^(LocalSocket ).*/${1}$ENV{CLAMD_LOCAL_SOCKET}/' ${CLAMD_CONF}
    perl -pi -e 's/^#(LocalSocket ).*/${1}$ENV{CLAMD_LOCAL_SOCKET}/' ${CLAMD_CONF}

    ECHO_DEBUG "Configure freshclam: ${FRESHCLAM_CONF}."
    perl -pi -e 's#^(UpdateLogFile ).*#${1}$ENV{FRESHCLAM_LOGFILE}#' ${CLAMD_CONF}
    perl -pi -e 's/^#(UpdateLogFile ).*/${1}$ENV{FRESHCLAM_LOGFILE}/' ${CLAMD_CONF}

    # Official database only
    perl -pi -e 's/^#(OfficialDatabaseOnly ).*/${1} yes/' ${CLAMD_CONF}

    if [ X"${DISTRO}" == X"RHEL" ]; then
        ECHO_DEBUG "Add clamav user to amavid group."
        usermod ${CLAMAV_USER} -G ${AMAVISD_SYS_GROUP}

        ECHO_DEBUG "Set permission to 750: ${AMAVISD_TEMPDIR}, ${AMAVISD_QUARANTINEDIR},"
        chmod -R 750 ${AMAVISD_TEMPDIR} ${AMAVISD_QUARANTINEDIR}

        #ECHO_DEBUG "Copy freshclam init startup script and enable it."
        #cp -f ${FRESHCLAM_INIT_FILE_SAMPLE} /etc/rc.d/init.d/freshclam
        #chmod +x /etc/rc.d/init.d/freshclam
        #eval ${enable_service} freshclam
        #export ENABLED_SERVICES="${ENABLED_SERVICES} freshclam"
    elif [ X"${DISTRO}" == X"FREEBSD" ]; then
        ECHO_DEBUG "Add clamav user to amavid group."
        pw usermod ${CLAMAV_USER} -G ${AMAVISD_SYS_GROUP}
    fi

    # FreeBSD: Start clamd & freshclamd when system start up.
    freebsd_enable_service_in_rc_conf 'clamav_clamd_enable' 'YES'
    freebsd_enable_service_in_rc_conf 'clamav_freshclam_enable' 'YES'

    # Add user alias in Postfix
    add_postfix_alias ${CLAMAV_USER} ${SYS_ROOT_USER}

    cat >> ${TIP_FILE} <<EOF
ClamAV:
    * Configuration files:
        - ${CLAMD_CONF}
        - ${FRESHCLAM_CONF}
        - /etc/logrotate.d/clamav
    * RC scripts:
            + ${DIR_RC_SCRIPTS}/${CLAMAV_CLAMD_RC_SCRIPT_NAME}
            + ${DIR_RC_SCRIPTS}/${CLAMAV_FRESHCLAMD_RC_SCRIPT_NAME}
    * Log files:
        - ${CLAMD_LOGFILE}
        - ${FRESHCLAM_LOGFILE}

EOF

    echo 'export status_clamav_config="DONE"' >> ${STATUS_FILE}
}
