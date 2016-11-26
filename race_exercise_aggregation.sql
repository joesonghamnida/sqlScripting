/*drop tables if already exist. will recreate tables in script below*/
drop table if exists finish;
drop table if exists race_component;
drop table if exists race;
drop table if exists participation;
drop table if exists driver;
drop table if exists team;

/*create tables and attributes*/

create table finish
(
	driver_id integer (10),
	rc_id integer (10),
	position integer (30),
	result varchar(10),

	FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
	FOREIGN KEY (rc_id) REFERENCES race_component(rc_id)

)ENGINE = InnoDB;
/*end of finish table*/

create table race_component
(
	rc_id integer (10),
	rc_type varchar (10),
	race_id integer (10),

	PRIMARY KEY (rc_id),
	FOREIGN KEY (race_id) REFERENCES race(race_id)
)ENGINE = InnoDB; 
/*end race component table*/

create table race
(
	race_id integer (10),
	race_title varchar (10),
	race_location varchar (20),
	race_date date,

PRIMARY KEY (race_id)
)ENGINE = InnoDB; 
/*end race table*/

create table participation
(
	team_id integer(10),
	driver_id integer(10),
	points_earned integer(10),

	FOREIGN KEY (team_id) REFERENCES team(team_id),
	FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
)ENGINE = InnoDB;
/*end participation table*/

create table driver
(
	driver_id integer (10),
	driver_age integer (3),
	driver_name varchar (20),
	team_id integer (10),

	PRIMARY KEY (driver_id),
	FOREIGN KEY (team_id) REFERENCES team(team_id)

)ENGINE = InnoDB;
/*end of driver table*/

create table team
(
	team_id  integer(10),
	team_name varchar(20),
	team_manager varchar(20),

	PRIMARY KEY (team_id)
)ENGINE = InnoDB;
/*end of team table*/

