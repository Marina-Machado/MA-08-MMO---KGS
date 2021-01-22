/*
Ici vous trouverez plusieurs requetes SELECT pour plusieurs tables pour montrer quelques exemples de manipulation des données
*/

--areas 
--ici on sélectionne tout ce qui se trouve dans cette en mettant en ordre croissant les nombre de joueurs dans les zone existantes
select areas.nbPlayers, areas.name from areas
order by areas.nbPlayers;

--categories
--ici on selectionne toutes les catégories
select * from categories
order by categories.id;

--classes
--ici on selectionne toutes les classes

select * from classes
order by classes.id;

--ennemies
--ici on selectinne tous les ennemies avec a une jointure de la table type pour pouvoir afficher les differents nom, on expose les diffents level des ennmies superieur ou egal a 10.
--Cela sera assez semblade pour les autres tables mis à part quelques differences. Comme par exemples des conditions qui seront diffentes de table à autres.

select ennemies.name,ennemies.level, types.type from ennemies
inner join types on ennemies.types_id = types.id
where ennemies.level <= 10
order by ennemies.level;

--guilds

select guilds.name, guilds.nbPlayers, guilds.level from guilds 
WHERE guilds.name LIKE ('S%')
order by guilds.level;

--items

select items.name, categories.type from items 
inner join categories on items.categories_id = categories.id
where items.id <= 10
order by categories.type ASC;

--players

select players.surname, players.email, players.level, guilds.name, classes.name, races.name from players
inner join guilds on players.guilds_id = guilds.id
inner join classes on players.classes_id = classes.id
inner join races on players.races_id = races.id
where classes.name IN ('Saber') 
order by level;
--quests

select quests.name, quests.description, quests.ExperienceGained from quests 
inner join players on quests.players_id = players.id
order by quests.ExperienceGained;

--races

select races.name, races.description from races
order by races.name ASC;

--serveurs

select servers.name, worlds.name, servers.nbPlayer from servers 
inner join worlds on servers.worlds_id = worlds.id
order by servers.nbPlayer ;

--spells

select spells.name,spells.level, spells.cost, spells.cooldown from spells
where spells.name LIKE ('M%')
order by spells.level;
--types

select types.type from types
order by types.type ASC;

--worlds

select worlds.name from worlds;

------------------------------------------------------------------TABLES INTERMEDIAIRES--------------------------------------------------------------------

--areas_has_ennemies

select areas.name AS zones, ennemies.name AS ennemis from areas_has_ennemies
inner join areas on areas_has_ennemies.areas_id = areas.id
inner join ennemies on areas_has_ennemies.ennemies_id = ennemies.id

order by areas.name ASC;

--areas_has_NPCs

select areas.name AS zones, NPCs.name AS PNJ from areas_has_NPCs
inner join areas on areas_has_NPCs.areas_id = areas.id
inner join NPCs on areas_has_NPCs.NPCs_id = NPCs.id

order by areas.name ASC;

--ennemies_has_quests

select ennemies.name AS ennemis, quests.name AS quêtes from ennemies_has_quests
inner join ennemies on ennemies_has_quests.ennemies_id = ennemies.id
inner join quests on ennemies_has_quests.quests_id = quests.id

order by quests.name ASC;

-----TO DO

--guilds_has_quests

select guilds.name AS guildes, quests.name AS quêtes from guilds_has_quests
inner join guilds on guilds_has_quests.guilds_id = guilds.id
inner join quests on guilds_has_quests.quests_id = quests.id

order by quests.name ASC;

--players_has_items

select players.surname AS joueurs, items.name AS objets from players_has_items
inner join players on players_has_items.players_id = players.id
inner join items on players_has_items.items_id = items.id

order by players.surname ASC;

--players_has_quests

select players.surname AS joueurs, quests.name AS quêtes from players_has_quests
inner join players on players_has_quests.players_id = players.id
inner join quests on players_has_quests.quests_id = quests.id

order by quests.name ASC;

--players_has_spells

select players.surname AS joueurs, spells.name AS sorts from players_has_spells
inner join players on players_has_spells.players_id = players.id
inner join spells on players_has_spells.spells_id = spells.id

order by players.surname ASC;

--players_has_worlds

select players.surname AS joueurs, worlds.name AS mondes from players_has_worlds
inner join players on players_has_worlds.players_id = players.id
inner join worlds on players_has_worlds.worlds_id = worlds.id
where players.surname LIKE ('f%') 
order by players.surname ASC;