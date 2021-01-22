IF DB_ID('DB_MMORPG') IS NULL
BEGIN

CREATE DATABASE DB_MMORPG;

END

USE DB_MMORPG;

CREATE TABLE guilds(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	nbPlayers int NOT NULL,
	level int NOT NULL,
	UNIQUE (name)
);

CREATE TABLE classes(
	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name)
);


CREATE TABLE races(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name)

);

CREATE TABLE players (

	id int NOT NULL Primary Key Identity (1,1),
	surname VARCHAR(20) NOT NULL,
	password VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	birthday DATE NOT NULL,
	level int NOT NULL ,
<<<<<<< HEAD
=======
	jobs_id int NOT NULL,
>>>>>>> f9a0509f640c176865697047ab9f7d5bfca20864
	UNIQUE (email),
	guilds_id int FOREIGN KEY REFERENCES guilds(id),
	classes_id int FOREIGN KEY REFERENCES classes(id),
	races_id int FOREIGN KEY REFERENCES races(id)
);



CREATE TABLE spells(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	cost int NOT NULL,
	cooldown int NOT NULL,
	level int NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name)
);


CREATE TABLE NPCs(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	interaction BIT NOT NULL,
	UNIQUE (name)

);



CREATE TABLE quests(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NULL,
	ExperienceGained int NOT NULL,
	UNIQUE (name),
	players_id int FOREIGN KEY REFERENCES players(id)

);


CREATE TABLE worlds(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(100) NOT NULL,
	UNIQUE (name)

);



CREATE TABLE areas(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	nbPlayers VARCHAR(45) NOT NULL,
	UNIQUE (name),
	worlds_id int FOREIGN KEY REFERENCES worlds(id)

);





CREATE TABLE servers(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	nbPlayer int NOT NULL,
	UNIQUE (name),
	worlds_id int FOREIGN KEY REFERENCES worlds(id),
	players_id int FOREIGN KEY REFERENCES players(id)
	

);


CREATE TABLE categories( -- catégories table items

	id int NOT NULL Primary Key Identity (1,1),
	type VARCHAR(45) NOT NULL,
	UNIQUE (type)

);


CREATE TABLE items(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name),
	categories_id int FOREIGN KEY REFERENCES categories(id)

);





CREATE TABLE types(

	id int NOT NULL Primary Key Identity (1,1),
	type VARCHAR(45) NOT NULL,
	UNIQUE (type)

);

CREATE TABLE ennemies(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	level int NOT NULL,
	description VARCHAR(255) NULL,
	UNIQUE (name),
	types_id int FOREIGN KEY REFERENCES types(id)

);






CREATE TABLE players_has_spells( 
players_id int FOREIGN KEY REFERENCES players(id),
spells_id int FOREIGN KEY REFERENCES spells(id)
);


CREATE TABLE players_has_items( 
players_id int FOREIGN KEY REFERENCES players(id),
items_id int FOREIGN KEY REFERENCES items(id)
);
 
 
CREATE TABLE players_has_quests( 
players_id int FOREIGN KEY REFERENCES players(id),
quests_id int FOREIGN KEY REFERENCES quests(id)
);

CREATE TABLE players_has_worlds( 
players_id int FOREIGN KEY REFERENCES players(id),
worlds_id int FOREIGN KEY REFERENCES worlds(id)
);


CREATE TABLE ennemies_has_quests( 
ennemies_id int FOREIGN KEY REFERENCES ennemies(id),
quests_id int FOREIGN KEY REFERENCES quests(id)
);

CREATE TABLE guilds_has_quests( 
guilds_id int FOREIGN KEY REFERENCES guilds(id),
quests_id int FOREIGN KEY REFERENCES quests(id)
);

CREATE TABLE areas_has_NPCs( 
areas_id int FOREIGN KEY REFERENCES areas(id),
NPCs_id int FOREIGN KEY REFERENCES NPCs(id)
);

CREATE TABLE areas_has_ennemies( 
areas_id int FOREIGN KEY REFERENCES areas(id),
ennemies_id int FOREIGN KEY REFERENCES ennemies(id)
);

