/* DEPRECATED OUTER JOIN SYNTAX */
SELECT SHIP_ID, SHIP_NAME, PORT_NAME
  FROM SHIPS, PORTS
 WHERE HOME_PORT_ID = PORT_ID(+) 
ORDER BY SHIP_ID;

The plus sign defines this query as a LEFT OUTER JOIN. The plus sign is on the right side in order to define a LEFT OUTER JOIN.