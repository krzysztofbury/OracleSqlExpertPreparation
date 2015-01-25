/* ALTER TABLE WITH NOT NULL */
ALTER TABLE TEST 
	ADD TEST_A VARCHA2(5) NOT NULL;

Results: This query may fail if TEST table already has some rows.

Rewrited:
ALTER TABLE TEST 
	ADD TEST_A VARCHA2(5) 
	DEFAULT 'YES'
	NOT NULL;

/* CREATE TABLE USING INDEC */
Example 1:
CREATE TABLE INVOICES (
	INVOICE_ID NUMBER(11) CONSTRAINT PK_INVOICE_ID PRIMARY KEY
						  USING INDEX (CREATE INDEX IX_INVOICES ON INVOICES(INVOICE_ID)),
	INVOICE_DATE DATE						
);

Example 2:
CREATE TABLE INVOICES (
	INVOICE_ID NUMBER(11),
	INVOICE_DATE DATE,
	CONSTRAINT UN_INVOICES_INVOICE_ID UNIQUE (INVOICE_IDm INVOICE_DATE)
		USING INDEX (CREATE INDEX IX_INVOICES ON INVOICES (INVOICE_ID, INVOICE_DATE))
)

/* EXTERNAL TABLE EXAMPLE */
CREATE TABLE INVOICES_EXTERNAL ( 
	INVOICE_ID CHAR(3),
  	INVOICE_DATE CHAR(9),
	ACCOUNT_NUMBER CHAR(13)
)
ORGANIZATION EXTERNAL
(
	TYPE ORACLE_LOADER
	DEFAULT DIRECTORY INVOICE_FILES
	ACCESS PARAMETERS
	(RECORDS DELIMITED BY NEWLINE
	 SKIP 2
	 FIELDS (INVOICE_ID CHAR(3),
			 INVOICE_DATE CHAR(9),
			 ACCOUNT_NUMBER CHAR(13))
	)
	LOCATION ('INVOICE_DATA.TXT')
);