/* REGEXP_REPLACE - cleaning blank spaces */
SELECT REGEXP_REPLACE('and    in   conclusion,   2/3rds of our   revenue','( ){2,}', ' ')  TEXT_LINE
  FROM DUAL;

