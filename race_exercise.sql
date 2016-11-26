/*drop tables if already exist*/
drop table if exists finish;
drop table if exists race_component;
drop table if exists race;
drop table if exists race_participation;
drop table if exists driver;
drop table if exists race_team;

create table race_team
(
	team_id  integer(10) NOT NULL,
	team_name varchar(20),
	team_manager varchar(20),

	PRIMARY KEY (team_id)
)ENGINE = InnoDB;

create table driver
(
	driver_id integer(10) NOT NULL,
	driver_age integer(3) NOT NULL,
	driver_name varchar (20),
	team_id_fk integer(10) NULL,

	PRIMARY KEY (driver_id),
	FOREIGN KEY (team_id_fk) REFERENCES race_team(team_id)

)ENGINE = InnoDB;

create table race_participation
(
	team_id_fk integer(10) NULL,
	driver_id_fk integer(10) NULL,
	points_earned integer(10),

	FOREIGN KEY (team_id_fk) REFERENCES team(team_id),
	FOREIGN KEY (driver_id_fk) REFERENCES driver(driver_id),
)ENGINE = InnoDB;

create table race
(
	race_id integer(10) NOT NULL,
	race_title varchar (10),
	race_location varchar (20),
	race_date date,

	PRIMARY KEY (race_id)
)ENGINE = InnoDB;

create table race_component
(
	rc_id integer(10) NOT NULL,
	rc_type varchar (10),
	race_id_fk integer(10) NULL,

	PRIMARY KEY (rc_id),
	FOREIGN KEY (race_id_fk) REFERENCES race(race_id)
)ENGINE = InnoDB;

create table race_finish
(
	driver_id_fk_overload integer(10) NULL,
	rc_id_fk_overload integer(10) NULL,
	position integer(30),
	result varchar(10),

	FOREIGN KEY (driver_id_fk_overload) REFERENCES driver(driver_id),
	FOREIGN KEY (rc_id_fk_overload) REFERENCES race_component(rc_id)

)ENGINE = InnoDB;
