/* Retrieving Data Using the SQL SELECT statement */
create table ships (
	ship_id number,
	ship_name varchar2(30)
);

insert into ships values (1,'ship1');
insert into ships values (2,'ship2');
insert into ships values (3,'aship');

select rownum, ship_id 
  from ships
order by ship_name

ROWNUM	SHIP_ID
3		3
1		1
2		2

ROWNUM is applicated first to result than it is being sorted (ordered)!!!