/* SYNONYMS */
CREATE SYNONYM ACCT_01 FOR LAB_RESULTS;
CREATE PUBLIC SYNONYM ACCT_01 FOR CABINETS;
SELECT * FROM ACCT_01;

From what table will the data be selected?
RESULTS: LAB_RESULTS
DESCRIPTION: The priority of referencing objects goes first to local objects.