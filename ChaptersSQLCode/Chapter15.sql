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
-- * ALL is the default and may be omitted
-- * FIRST indicates that the only set of INTO clauses that will execute are those that follow the first WHEN clause that evaluates to TRUE
-- each WHEN condition is followed by one or more INTO clauses