/* CTAS - Create Table As Select */
CREATE TABLE CTAS_TEST 
AS 
SELECT
	Test1 as First_column,
	Test2 as Second_column
  FROM TEST_TABLE;

/* CTAS - Providing names in different way */
CREATE TABLE CTAS_TEST 2 (First_column, Second_column)
AS 
SELECT 
	Test1,
	Test2
  FROM TEST_TABLE;

/* INSERT with SubQuery */
INSERT INTO CTAS_TEST (First_column, Second_column)
	SELECT  
		Column1,
		Column2
	  FROM TEST_TABLE2;  

/* UPDATE with correlated sub-query */
UPDATE PORTS PT
   SET (TOT_SHIPS_ASSIGNED, TOT_SHIPS_ASGN_CAP) =
    (SELECT COUNT(S.SHIP_ID) TOTAL_SHIPS,
      SUM(S.CAPACITY) TOTAL_SHIP_CAPACITY
    FROM SHIPS S
   WHERE S.HOME_PORT_ID = PT.PORT_ID
  GROUP BY S.HOME_PORT_ID);
 
/* UNCONDITIONAL MULTITABLE INSERT */
INSERT ALL
	INTO tab1 VALUES (col_list1)
	INTO tab2 VALUES (col_list2)
	INTO tab3 VALUES (col_list3)
	...
SUBQUERY;

-- VALUES list is optional; if omitted, the select list from the subquery will be used

/* CONDITIONAL MULTITABLE INSERT */
INSERT option
	WHEN expression THEN
		INTO tab1 VALUES (col_list1)
		INTO tab4 VALUES (col_list4)
	WHEN expression THEN
		INTO tab2 VALUES (col_list2)
	...
	ELSE
		INTO tab3 VALUES (col_list3)
SUBQUERY;

-- option is one of two: ALL or FIRST
-- * ALL is the default and may be omitted, but only when WHEN expression is present, otherwise it will rise a syntax error
-- * FIRST indicates that the only set of INTO clauses that will execute are those that follow the first WHEN clause that evaluates to TRUE
-- each WHEN condition is followed by one or more INTO clauses

/* Multiple tables inserts - ALIASES! */
INSERT
 WHEN (B.MAX_SALARY - A.MAX_SALARY < 10000) THEN
 INTO SALARY_CHART (EMP_TITLE, SUPERIOR, EMP_INCOME, SUP_INCOME)
 VALUES     (A.POSITION, B.POSITION, A.MAX_SALARY, B.MAX_SALARY)
SELECT
 A.POSITION,
 B.POSITION,
 A.MAX_SALARY,
 B.MAX_SALARY
  FROM POSITIONS A
  JOIN POSITIONS B ON A.REPORTS_TO = B.POSITION_ID
 WHERE A.MAX_SALARY > 10000;

--Above SQL will result in an error as not ALIASES were specified for fields POSITION and MAX_SALARY.

/* MERGE STATEMENT */
MERGE INTO table
USING table / view / subquery
ON condition
WHEN MATCHED THEN UPDATE SET col = expression / DEFAULT
		where_clause
		DELETE where_clause
WHEN NOT MATCHED THEN INSERT (col, col2)
		VALUES (expr1, expr2 / DEFAULT)
		where_clause
WHERE condition;

-- DELETE clause only affects rows that are a result of the completed "UPDATE clause" and remain in the target table - which in this instance is WWA_INVOICES


/* FLASHBACK QUERY */
SELECT *
  FROM CHAT
 AS OF TIMESTAMP SYSTIMESTAMP - INTERVAL '0 0:01:30' DAY TO SECOND;
 
