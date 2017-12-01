############################################################
# DO NOT TOUCH THIS LINE.
from libs.default_settings import *
############################################################

# Listen address and port
listen_address = 'PH_MLMMJ_ADMIN_BIND_HOST'
listen_port = PH_MLMMJ_ADMIN_LISTEN_PORT

# Run as a non-privileged user/group.
run_as_user = 'PH_MLMMJ_USER_NAME'
run_as_group = 'PH_MLMMJ_GROUP_NAME'

# Pid file
pid_file = 'PH_MLMMJ_ADMIN_PID_FILE'

# Log level: info, debug.
log_level = 'info'

# Specify the backend used to query/update meta data stored in SQL/LDAP.
#
# - `backend_api` is used when accessing RESTful API.
# - `backend_cli` is used when you're managing mailing list account with
#                 command line tool like `tools/maillist_admin.py`.
#
# Different backends may require different parameters in settings.py, please
# read the comment lines in `backends/bk_*.py`.
#
# Available backends:
#
#   - bk_iredmail_ldap: for iRedMail with LDAP backends (OpenLDAP, OpenBSD ldapd)
#   - bk_iredmail_sql: for iRedMail with SQL backends (MySQL, MariaDB, PostgreSQL)
#   - bk_none: pure mlmmj, no SQL/LDAP database.
#
# WARNING: For iRedMail users, if you don't have iRedAdmin-Pro, please enable
# proper backend below so that mlmmj-admin will store mailing list accounts in
# SQL/LDAP database.
backend_api = 'bk_none'
backend_cli = 'bk_none'

# A list of API AUTH tokens (secret strings) used for authentication.
# It's strong recommended to use a long string as auth token, program will log
# first 8 characters to help you identity the client.
api_auth_tokens = ['PH_MLMMJ_ADMIN_API_AUTH_TOKEN']

# SQL database which stores meta data of mailing list accounts.
# Required by backend `bk_iredmail_sql`.
iredmail_sql_db_type = 'mysql'
iredmail_sql_db_server = 'mysql_server_address'
iredmail_sql_db_port = 3306
iredmail_sql_db_name = 'vmail'
iredmail_sql_db_user = 'vmailadmin'
iredmail_sql_db_password = '{{ vmail_db_admin_password }}'

MLMMJ_SPOOL_DIR = 'PH_MLMMJ_SPOOL_DIR'
MLMMJ_ARCHIVE_DIR = 'PH_MLMMJ_ARCHIVE_DIR'
MLMMJ_SKEL_DIR = 'PH_MLMMJ_SKEL_DIR'
MLMMJ_DEFAULT_PROFILE_SETTINGS.update({'smtp_port': PH_AMAVISD_MLMMJ_PORT})
