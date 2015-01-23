/* USING DDL STATEMENTS TO CREATE AND MANAGE TABLES*/

CREATE USER MORB1D IDENTIFIED BY oracle;

GRANT CREATE SESSION TO morb1d;
GRANT UNLIMITED TABLESPACE TO morb1d;
GRANT CREATE TABLE TO morb1d;

CREATE TABLE work_schedule (
work_schedule_id NUMBER,
start_date		 DATE,
end_date		 DATE);

/* TESTING OUT NAMING CONVENTIONS AND DOUBLE QUOTING */
CREATE TABLE "test" (
a 	NUMBER,
"b" VARCHAR(20));

CREATE TABLE cruises (
cruise_id	NUMBER,
cruise_type_id NUMBER,
cruise_name VARCHAR2(20),
captain_id NUMBER NOT NULL,
start_date	DATE,
end_date	DATE,
status	VARCHAR2(5) DEFAULT 'DOCK',
CONSTRAINT cruise_pk PRIMARY KEY (cruise_id));

CREATE TABLE cruise_notes (
cruise_notes_id NUMBER,
cruise_notes	CLOB);


