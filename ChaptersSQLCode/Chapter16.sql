/* Example */
SELECT LEVEL, EMPLOYEE_ID, TITLE
  FROM EMPLOYEE_CHART
START WITH EMPLOYEE_ID = 1
CONNECT BY REPORTS_TO = PRIOR EMPLOYEE_ID;

-- PRIOR is placed before the EMPLOYEE_ID reference
-- This indicates that for each row in the EMPLOYEE_CHART table, SQL will go find
-- the next row in the hierarchy by locating a row with a REPORTS_TO value that is equal to the PRIOR row's EMPLOYEE_ID value