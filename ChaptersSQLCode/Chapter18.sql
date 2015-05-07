/* Current User Account Privileges */
SELECT PRIVILEGE, ADMIN_OPTION
  FROM USER_SYS_PRIVS
ORDER BY PRIVILEGE;

-- DBA_SYS_PRIBS will provide informations for other users

