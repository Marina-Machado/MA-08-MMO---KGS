/* 
Pour executer ce script, il faut d'abord exectuer de "IF DB_ID('DB_MMORPG') IS NULL" jusqua "END"

seulement apr�s vous pouvez tout executer sans aucun soucis
*/

IF DB_ID('DB_MMORPG') IS NULL
BEGIN

CREATE DATABASE DB_MMORPG;

END

USE DB_MMORPG;

--table "guilds"
CREATE TABLE guilds(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	nbPlayers int NOT NULL,
	level int CHECK (level >= 10) NOT NULL,
	UNIQUE (name)
);

--table "classes"
CREATE TABLE classes(
	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name)
);

--table "races"
CREATE TABLE races(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name)

);

--table "players"
CREATE TABLE players (

	id int NOT NULL Primary Key Identity (1,1),
	surname VARCHAR(20) NOT NULL,
	password VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	birthday DATE NOT NULL,
	level int NOT NULL ,
	UNIQUE (email),
	guilds_id int FOREIGN KEY REFERENCES guilds(id),
	classes_id int FOREIGN KEY REFERENCES classes(id),
	races_id int FOREIGN KEY REFERENCES races(id)



);


--table "spells"
CREATE TABLE spells(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	cost int NOT NULL,
	cooldown int NOT NULL,
	level int NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name)
);

--table "NPCs"
CREATE TABLE NPCs(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	interaction BIT NOT NULL,
	UNIQUE (name)

);


--table "quests"
CREATE TABLE quests(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NULL,
	ExperienceGained int CHECK(ExperienceGained >= 10) NOT NULL,
	UNIQUE (name),
	players_id int FOREIGN KEY REFERENCES players(id)

);

--table "worlds"
CREATE TABLE worlds(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(100) NOT NULL,
	UNIQUE (name)

);


--table "areas"
CREATE TABLE areas(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	nbPlayers VARCHAR(45) NOT NULL,
	UNIQUE (name),
	worlds_id int FOREIGN KEY REFERENCES worlds(id)

);




--table "servers"
CREATE TABLE servers(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	nbPlayer int NOT NULL,
	UNIQUE (name),
	worlds_id int FOREIGN KEY REFERENCES worlds(id),
	players_id int FOREIGN KEY REFERENCES players(id)
	

);

--table "categories"
CREATE TABLE categories(

	id int NOT NULL Primary Key Identity (1,1),
	type VARCHAR(45) NOT NULL,
	UNIQUE (type)

);

--table "items"
CREATE TABLE items(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	UNIQUE (name),
	categories_id int FOREIGN KEY REFERENCES categories(id)

);




--table "types"
CREATE TABLE types(

	id int NOT NULL Primary Key Identity (1,1),
	type VARCHAR(45) NOT NULL,
	UNIQUE (type)

);

--table "ennemies"
CREATE TABLE ennemies(

	id int NOT NULL Primary Key Identity (1,1),
	name VARCHAR(45) NOT NULL,
	level int NOT NULL,
	description VARCHAR(255) NULL,
	UNIQUE (name),
	types_id int FOREIGN KEY REFERENCES types(id)

);


----------------------------------------------------TABLES INTERMEDIAIRES--------------------------------------


--table "players_has_spells"
CREATE TABLE players_has_spells( 
players_id int FOREIGN KEY REFERENCES players(id),
spells_id int FOREIGN KEY REFERENCES spells(id)
);


--table "players_has_items"
CREATE TABLE players_has_items( 
players_id int FOREIGN KEY REFERENCES players(id),
items_id int FOREIGN KEY REFERENCES items(id)
);
 
 --table "players_has_quests"
CREATE TABLE players_has_quests( 
players_id int FOREIGN KEY REFERENCES players(id),
quests_id int FOREIGN KEY REFERENCES quests(id)
);
--table "players_has_worlds"
CREATE TABLE players_has_worlds( 
players_id int FOREIGN KEY REFERENCES players(id),
worlds_id int FOREIGN KEY REFERENCES worlds(id)
);

--table "ennemies_has_quests"
CREATE TABLE ennemies_has_quests( 
ennemies_id int FOREIGN KEY REFERENCES ennemies(id),
quests_id int FOREIGN KEY REFERENCES quests(id)
);

--table "guilds_has_quests"
CREATE TABLE guilds_has_quests( 
guilds_id int FOREIGN KEY REFERENCES guilds(id),
quests_id int FOREIGN KEY REFERENCES quests(id)
);

--table "areas_has_NPCs"
CREATE TABLE areas_has_NPCs( 
areas_id int FOREIGN KEY REFERENCES areas(id),
NPCs_id int FOREIGN KEY REFERENCES NPCs(id)
);

--table "areas_has_ennemies"
CREATE TABLE areas_has_ennemies( 
areas_id int FOREIGN KEY REFERENCES areas(id),
ennemies_id int FOREIGN KEY REFERENCES ennemies(id)
);

